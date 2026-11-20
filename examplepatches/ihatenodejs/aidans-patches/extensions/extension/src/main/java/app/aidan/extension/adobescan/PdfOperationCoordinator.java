package app.aidan.extension.adobescan;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.RemoteException;
import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

public class PdfOperationCoordinator {

    private static final String TAG = "PdfOperationCoord";
    private static final Object OCR_EXTRACT_LOCK = new Object();
    private static final long EXPECTED_OCR_MODEL_SIZE = 4113088L;
    private static PdfOperationCoordinator sInstance;

    private final Application application;
    private final ExecutorService executor;
    private final Handler mainHandler = new Handler(Looper.getMainLooper());
    private final AtomicLong operationIdGenerator = new AtomicLong(System.currentTimeMillis());

    private WeakReference<Activity> currentActivityRef = new WeakReference<>(null);
    private boolean recoveryCompleted = false;

    private IPdfTransformService transformService;
    private boolean isBound = false;
    private final Object serviceLock = new Object();

    private volatile ActiveOperation activeOperation;

    static class ActiveOperation {
        final long operationId;
        final long documentId;
        final int operation; // 1=COMPRESS, 2=PROTECT, 3=UNPROTECT
        final int compressionLevel;
        final boolean compressAndShare;
        final UUID launcherId;
        final Object scanFileObj;
        final List<?> scanFiles;
        volatile PdfFileTransaction transaction;
        volatile PdfOutputTransaction outputTransaction;
        final AtomicBoolean isDone = new AtomicBoolean(false);

        ActiveOperation(
                final long operationId,
                final long documentId,
                final int operation,
                final int compressionLevel,
                final boolean compressAndShare,
                final UUID launcherId,
                final Object scanFileObj) {
            this(operationId, documentId, operation, compressionLevel, compressAndShare, launcherId, scanFileObj, null, null);
        }

        ActiveOperation(
                final long operationId,
                final long documentId,
                final int operation,
                final int compressionLevel,
                final boolean compressAndShare,
                final UUID launcherId,
                final Object scanFileObj,
                final List<?> scanFiles,
                final PdfFileTransaction transaction) {
            this.operationId = operationId;
            this.documentId = documentId;
            this.operation = operation;
            this.compressionLevel = compressionLevel;
            this.compressAndShare = compressAndShare;
            this.launcherId = launcherId;
            this.scanFileObj = scanFileObj;
            this.scanFiles = scanFiles;
            this.transaction = transaction;
        }
        ActiveOperation(
                final long operationId,
                final long documentId,
                final int operation,
                final int compressionLevel,
                final boolean compressAndShare,
                final UUID launcherId,
                final Object scanFileObj,
                final PdfFileTransaction transaction) {
            this(operationId, documentId, operation, compressionLevel, compressAndShare, launcherId, scanFileObj, null, transaction);
        }
    }

    private final ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(final ComponentName name, final IBinder service) {
            synchronized (serviceLock) {
                transformService = IPdfTransformService.Stub.asInterface(service);
                isBound = true;
                serviceLock.notifyAll();
            }
        }

        @Override
        public void onServiceDisconnected(final ComponentName name) {
            synchronized (serviceLock) {
                transformService = null;
                isBound = false;
                serviceLock.notifyAll();
            }
            handleWorkerDeath("Transform service disconnected unexpectedly");
        }
    };

    PdfOperationCoordinator(final Application application) {
        this(application, true, Executors.newSingleThreadExecutor());
    }

    PdfOperationCoordinator(final Application application, final boolean initAndroidServices) {
        this(application, initAndroidServices, Executors.newSingleThreadExecutor());
    }

    PdfOperationCoordinator(
            final Application application,
            final boolean initAndroidServices,
            final ExecutorService executor) {
        this.application = application;
        this.executor = executor != null ? executor : Executors.newSingleThreadExecutor();
        if (initAndroidServices && application != null) {
            registerLifecycleCallbacks();
            bindTransformService();
            runRecoveryAsync();
        }
    }

    static synchronized void setInstanceForTesting(final PdfOperationCoordinator coordinator) {
        sInstance = coordinator;
    }

    ActiveOperation getActiveOperation() {
        return activeOperation;
    }

    void handleWorkerDeath(final String reason) {
        final ActiveOperation op = activeOperation;
        if (op != null && op.isDone.compareAndSet(false, true)) {
            Log.e(TAG, "Worker died or disconnected: " + reason);
            dismissProgressAndSnackbar("PDF operation failed");
            if (op.launcherId != null) {
                PdfShareBridge.retireLauncher(op.launcherId);
            }
            executor.execute(new Runnable() {
                @Override
                public void run() {
                    if (op.transaction != null) {
                        op.transaction.rollback(ScanFileAdapter.getInstance());
                    }
                    if (op.outputTransaction != null) {
                        op.outputTransaction.abort();
                    }
                    clearActiveOperation(op.operationId);
                }
            });
        }
    }

    public static synchronized void initialize(final Application application) {
        if (PdfProcess.isWorkerProcess()) {
            return;
        }
        if (sInstance == null) {
            sInstance = new PdfOperationCoordinator(application);
        }
    }

    public static synchronized PdfOperationCoordinator getInstance() {
        return sInstance;
    }

    private void registerLifecycleCallbacks() {
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(final Activity activity) {
                currentActivityRef = new WeakReference<>(activity);
                if (recoveryCompleted) {
                    // Check if current activity needs refresh
                }
            }

            @Override
            public void onActivityPaused(final Activity activity) {
                if (currentActivityRef.get() == activity) {
                    currentActivityRef.clear();
                }
            }

            @Override
            public void onActivityCreated(final Activity activity, final Bundle savedInstanceState) {}
            @Override
            public void onActivityStarted(final Activity activity) {}
            @Override
            public void onActivityStopped(final Activity activity) {}
            @Override
            public void onActivitySaveInstanceState(final Activity activity, final Bundle outState) {}
            @Override
            public void onActivityDestroyed(final Activity activity) {
                if (currentActivityRef.get() == activity) {
                    currentActivityRef.clear();
                }
            }
        });
    }

    private void bindTransformService() {
        if (PdfProcess.isWorkerProcess()) {
            return;
        }
        final Intent intent = new Intent(application, PdfTransformService.class);
        application.bindService(intent, serviceConnection, Context.BIND_AUTO_CREATE);
    }

    private void runRecoveryAsync() {
        executor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    final File stagingDir = PdfFileTransaction.getStagingDir(application);
                    PdfFileTransaction.recover(stagingDir, ScanFileAdapter.getInstance());
                    final File outputStagingDir = PdfOutputTransaction.getStagingDir(application);
                    PdfOutputTransaction.recoverAll(outputStagingDir);
                } catch (final Throwable t) {
                    Log.e(TAG, "Exception during startup recovery", t);
                } finally {
                    recoveryCompleted = true;
                }
            }
        });
    }

    public void startCompression(
            final Activity activity,
            final Object scanFileObj,
            final int compressionLevel,
            final boolean compressAndShare,
            final UUID launcherId) {
        startCompression(activity, scanFileObj, compressionLevel, null, compressAndShare, launcherId);
    }

    public void startCompression(
            final Activity activity,
            final Object scanFileObj,
            final int compressionLevel,
            final String password,
            final boolean compressAndShare,
            final UUID launcherId) {
        startOperation(activity, scanFileObj, NativePdfEngine.COMPRESS, compressionLevel, password, compressAndShare, launcherId);
    }

    public void startProtection(
            final Activity activity,
            final Object scanFileObj,
            final String password) {
        startOperation(activity, scanFileObj, NativePdfEngine.PROTECT, NativePdfEngine.HIGH, password, false, null);
    }

    public void startUnprotection(
            final Activity activity,
            final Object scanFileObj,
            final String password) {
        startOperation(activity, scanFileObj, NativePdfEngine.UNPROTECT, NativePdfEngine.HIGH, password, false, null);
    }

    public void startCombine(
            final Activity activity,
            final List<?> scanFiles,
            final String displayName) {
        startCombine(activity, scanFiles, displayName, null);
    }

    public void startCombine(
            final Activity activity,
            final List<?> scanFiles,
            final String displayName,
            final List<String> passwords) {

        if (activity == null || scanFiles == null || scanFiles.size() < 2) {
            Log.e(TAG, "Cannot start combine: invalid arguments");
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final List<File> inputFiles = new ArrayList<>();
        final List<Long> docIds = new ArrayList<>();

        for (Object sf : scanFiles) {
            final File f = adapter.getFile(sf);
            if (f == null || !f.exists()) {
                PdfOperationUi.showSnackbar(activity, "A selected scan file was not found on disk");
                return;
            }
            inputFiles.add(f);
            docIds.add(adapter.getDatabaseId(sf));
        }

        final String[] passwordsArr = (passwords != null) ? passwords.toArray(new String[0]) : null;

        final long operationId = operationIdGenerator.incrementAndGet();
        final ActiveOperation op = new ActiveOperation(
                operationId,
                0L,
                NativePdfEngine.COMBINE,
                0,
                false,
                null,
                null,
                scanFiles,
                null);
        synchronized (this) {
            if (activeOperation != null && !activeOperation.isDone.get()) {
                PdfOperationUi.showSnackbar(activity, "Another PDF operation is in progress.");
                return;
            }
            activeOperation = op;
        }

        PdfOperationUi.showProgress(activity, "Combining files…", new Runnable() {
            @Override
            public void run() {
                cancelCurrentOperation();
            }
        });

        executor.execute(new Runnable() {
            @Override
            public void run() {
                PdfOutputTransaction tx = null;
                ParcelFileDescriptor[] inPfds = null;
                ParcelFileDescriptor outPfd = null;

                try {
                    if (op.isDone.get()) {
                        clearActiveOperation(operationId);
                        return;
                    }

                    final File stagingDir = PdfOutputTransaction.getStagingDir(application);
                    tx = PdfOutputTransaction.begin(
                            stagingDir,
                            operationId,
                            NativePdfEngine.COMBINE,
                            inputFiles,
                            docIds,
                            displayName);
                    op.outputTransaction = tx;

                    if (op.isDone.get()) {
                        tx.abort();
                        clearActiveOperation(operationId);
                        return;
                    }

                    long deadline = System.currentTimeMillis() + 10000;
                    IPdfTransformService service;
                    synchronized (serviceLock) {
                        while (transformService == null && System.currentTimeMillis() < deadline) {
                            if (op.isDone.get()) {
                                throw new IllegalStateException("Operation cancelled while waiting for service");
                            }
                            serviceLock.wait(500);
                        }
                        service = transformService;
                    }

                    if (service == null) {
                        throw new IllegalStateException("Transform service failed to bind within timeout");
                    }

                    inPfds = new ParcelFileDescriptor[inputFiles.size()];
                    for (int i = 0; i < inputFiles.size(); i++) {
                        inPfds[i] = ParcelFileDescriptor.open(inputFiles.get(i), ParcelFileDescriptor.MODE_READ_ONLY);
                    }
                    outPfd = ParcelFileDescriptor.open(
                            tx.getStageFile(),
                            ParcelFileDescriptor.MODE_READ_WRITE | ParcelFileDescriptor.MODE_CREATE);

                    final IPdfTransformCallback callback = new IPdfTransformCallback.Stub() {
                        @Override
                        public void onProgress(final long opId, final int percent) {}

                        @Override
                        public void onComplete(
                                final long opId,
                                final int status,
                                final int pageCount,
                                final long outputBytes,
                                final boolean encrypted) {
                            handleCombineComplete(op, status, pageCount, outputBytes);
                        }
                    };

                    service.createOutput(
                            operationId,
                            inPfds,
                            outPfd,
                            NativePdfEngine.COMBINE,
                            null,
                            passwordsArr,
                            callback);

                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to execute combine operation " + operationId, t);
                    if (op.isDone.compareAndSet(false, true)) {
                        if (tx != null) {
                            tx.abort();
                        }
                        dismissProgressAndSnackbar("Failed to combine scans");
                        clearActiveOperation(operationId);
                    }
                } finally {
                    if (inPfds != null) {
                        for (ParcelFileDescriptor p : inPfds) {
                            if (p != null) {
                                try { p.close(); } catch (IOException ignored) {}
                            }
                        }
                    }
                    if (outPfd != null) {
                        try { outPfd.close(); } catch (IOException ignored) {}
                    }
                }
            }
        });
    }

    private void handleCombineComplete(
            final ActiveOperation op,
            final int status,
            final int pageCount,
            final long outputBytes) {

        if (!op.isDone.compareAndSet(false, true)) {
            return;
        }

        final PdfOutputTransaction tx = op.outputTransaction;
        dismissProgressOnly();

        if (status == NativePdfEngine.OK && tx != null) {
            try {
                if (!tx.validateStageOutput()) {
                    throw new IOException("Stage output validation failed");
                }
                if (!tx.revalidateSources()) {
                    throw new IOException("Input files modified during combine");
                }

                final File docsDir = new File(application.getFilesDir(), "aidan-scan-documents");
                if (!docsDir.exists()) docsDir.mkdirs();
                final String docId = UUID.randomUUID().toString();
                final File destFile = new File(docsDir, docId + ".pdf");

                tx.markPublishing(destFile.getAbsolutePath(), docId);

                try (FileInputStream fis = new FileInputStream(tx.getStageFile());
                     FileOutputStream fos = new FileOutputStream(destFile)) {
                    byte[] buf = new byte[65536];
                    int r;
                    while ((r = fis.read(buf)) != -1) {
                        fos.write(buf, 0, r);
                    }
                    fos.flush();
                    fos.getFD().sync();
                }

                final Object newScan = ScanFileAdapter.getInstance().createLocalDocument(
                        destFile,
                        tx.getRecord().displayName,
                        pageCount);

                if (newScan == null) {
                    destFile.delete();
                    throw new IOException("Library registration failed for combined scan");
                }

                tx.markPublished();
                dismissProgressAndSnackbar("Combined scan saved");
                ScanFileAdapter.getInstance().refreshLibrary();

            } catch (final Throwable t) {
                Log.e(TAG, "Publication failed for combine operation " + op.operationId, t);
                if (tx != null) tx.abort();
                final String errDetail = (t.getMessage() != null && !t.getMessage().isEmpty())
                        ? ": " + t.getMessage()
                        : "";
                dismissProgressAndSnackbar("Failed to save combined scan" + errDetail);
            }
        } else {
            if (tx != null) tx.abort();
            final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
            final String msg;
            switch (status) {
                case NativePdfEngine.PASSWORD_REQUIRED: {
                    final String docName = (op.scanFiles != null && pageCount >= 0 && pageCount < op.scanFiles.size())
                            ? adapter.getDisplayName(op.scanFiles.get(pageCount))
                            : null;
                    msg = (docName != null)
                            ? "Password required for \"" + docName + "\"."
                            : "Password required to combine scans.";
                    break;
                }
                case NativePdfEngine.WRONG_PASSWORD: {
                    final String docName = (op.scanFiles != null && pageCount >= 0 && pageCount < op.scanFiles.size())
                            ? adapter.getDisplayName(op.scanFiles.get(pageCount))
                            : null;
                    msg = (docName != null)
                            ? "Incorrect password for \"" + docName + "\"."
                            : "Incorrect password for scan.";
                    break;
                }
                case NativePdfEngine.UNSUPPORTED_PDF:
                    msg = "Digitally signed scans cannot be combined.";
                    break;
                case NativePdfEngine.INVALID_PDF:
                    msg = "One or more scans are invalid or corrupted.";
                    break;
                default:
                    msg = "Combine failed.";
                    break;
            }
            dismissProgressAndSnackbar(msg);
        }

        clearActiveOperation(op.operationId);
    }

    public void startExport(
            final Activity activity,
            final Object scanFileObj,
            final int format) {
        startExport(activity, scanFileObj, format, null);
    }

    public void startExport(
            final Activity activity,
            final Object scanFileObj,
            final int format,
            final String password) {

        if (activity == null || scanFileObj == null) {
            Log.e(TAG, "Cannot start export: invalid arguments");
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final File sourceFile = adapter.getFile(scanFileObj);
        final String displayName = adapter.getDisplayName(scanFileObj);

        if (sourceFile == null || !sourceFile.exists()) {
            PdfOperationUi.showSnackbar(activity, "Target document file not found on disk");
            return;
        }
        if (password == null && (adapter.isProtected(scanFileObj) || adapter.getProtectionStatus(scanFileObj) == 2)) {
            PdfExportBridge.promptPasswordAndExport(activity, scanFileObj, format, false);
            return;
        }

        final long operationId = operationIdGenerator.incrementAndGet();
        final ActiveOperation op = new ActiveOperation(
                operationId,
                adapter.getDatabaseId(scanFileObj),
                format,
                0,
                false,
                null,
                scanFileObj);

        synchronized (this) {
            if (activeOperation != null && !activeOperation.isDone.get()) {
                PdfOperationUi.showSnackbar(activity, "Another PDF operation is in progress.");
                return;
            }
            activeOperation = op;
        }

        final String formatLabel = (format == NativePdfEngine.EXPORT_DOCX) ? "Word document"
                : (format == NativePdfEngine.EXPORT_XLSX) ? "Excel spreadsheet" : "PowerPoint presentation";
        PdfOperationUi.showProgress(activity, "Exporting " + formatLabel + "…", new Runnable() {
            @Override
            public void run() {
                cancelCurrentOperation();
            }
        });

        executor.execute(new Runnable() {
            @Override
            public void run() {
                PdfOutputTransaction tx = null;
                ParcelFileDescriptor inPfd = null;
                ParcelFileDescriptor outPfd = null;
                ParcelFileDescriptor modelPfd = null;

                try {
                    if (op.isDone.get()) {
                        clearActiveOperation(operationId);
                        return;
                    }

                    final File stagingDir = PdfOutputTransaction.getStagingDir(application);
                    tx = PdfOutputTransaction.begin(
                            stagingDir,
                            operationId,
                            format,
                            Collections.singletonList(sourceFile),
                            Collections.singletonList(adapter.getDatabaseId(scanFileObj)),
                            displayName);
                    op.outputTransaction = tx;

                    if (op.isDone.get()) {
                        tx.abort();
                        clearActiveOperation(operationId);
                        return;
                    }

                    long deadline = System.currentTimeMillis() + 10000;
                    IPdfTransformService service;
                    synchronized (serviceLock) {
                        while (transformService == null && System.currentTimeMillis() < deadline) {
                            if (op.isDone.get()) {
                                throw new IllegalStateException("Operation cancelled while waiting for service");
                            }
                            serviceLock.wait(500);
                        }
                        service = transformService;
                    }

                    if (service == null) {
                        throw new IllegalStateException("Transform service failed to bind within timeout");
                    }

                    inPfd = ParcelFileDescriptor.open(sourceFile, ParcelFileDescriptor.MODE_READ_ONLY);
                    outPfd = ParcelFileDescriptor.open(
                            tx.getStageFile(),
                            ParcelFileDescriptor.MODE_READ_WRITE | ParcelFileDescriptor.MODE_CREATE);
                    modelPfd = openOcrModelFd();

                    final IPdfTransformCallback callback = new IPdfTransformCallback.Stub() {
                        @Override
                        public void onProgress(final long opId, final int percent) {}

                        @Override
                        public void onComplete(
                                final long opId,
                                final int status,
                                final int pageCount,
                                 final long outputBytes,
                                final boolean encrypted) {
                            handleExportComplete(op, activity, status, displayName, format);
                        }
                    };

                    service.createOutput(
                            operationId,
                            new ParcelFileDescriptor[]{inPfd},
                            outPfd,
                            format,
                            modelPfd,
                            (password != null) ? new String[]{password} : null,
                            callback);

                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to start export operation " + operationId, t);
                    if (op.isDone.compareAndSet(false, true)) {
                        if (tx != null) tx.abort();
                        dismissProgressAndSnackbar("Export failed");
                        clearActiveOperation(operationId);
                    }
                } finally {
                    if (inPfd != null) {
                        try { inPfd.close(); } catch (IOException ignored) {}
                    }
                    if (outPfd != null) {
                        try { outPfd.close(); } catch (IOException ignored) {}
                    }
                    if (modelPfd != null) {
                        try { modelPfd.close(); } catch (IOException ignored) {}
                    }
                }
            }
        });
    }

    private ParcelFileDescriptor openOcrModelFd() {
        try {
            final File ocrDir = new File(application.getCacheDir(), "aidan-scan-pdf/ocr");
            if (!ocrDir.exists()) ocrDir.mkdirs();
            final File modelFile = new File(ocrDir, "eng.traineddata");
            synchronized (OCR_EXTRACT_LOCK) {
                if (!modelFile.exists() || modelFile.length() != EXPECTED_OCR_MODEL_SIZE) {
                    final File tmpFile = new File(ocrDir, "eng.traineddata.tmp." + System.currentTimeMillis());
                    try {
                        long total = 0;
                        try (InputStream is = application.getAssets().open("aidan-scan-pdf/ocr/eng.traineddata");
                             FileOutputStream fos = new FileOutputStream(tmpFile)) {
                            byte[] buf = new byte[65536];
                            int r;
                            while ((r = is.read(buf)) != -1) {
                                fos.write(buf, 0, r);
                                total += r;
                            }
                            fos.flush();
                            fos.getFD().sync();
                        }
                        if (total != EXPECTED_OCR_MODEL_SIZE || tmpFile.length() != EXPECTED_OCR_MODEL_SIZE) {
                            tmpFile.delete();
                            throw new IOException("Extracted OCR model size mismatch: " + total + " bytes");
                        }
                        if (!tmpFile.renameTo(modelFile)) {
                            if (modelFile.exists()) modelFile.delete();
                            if (!tmpFile.renameTo(modelFile)) {
                                tmpFile.delete();
                                throw new IOException("Failed to rename temporary OCR model file to " + modelFile.getAbsolutePath());
                            }
                        }
                    } finally {
                        if (tmpFile.exists()) {
                            tmpFile.delete();
                        }
                    }
                }
            }
            return ParcelFileDescriptor.open(modelFile, ParcelFileDescriptor.MODE_READ_ONLY);
        } catch (final Exception e) {
            Log.e(TAG, "Failed to open OCR model FD", e);
            return null;
        }
    }

    private void handleExportComplete(
            final ActiveOperation op,
            final Activity activity,
            final int status,
            final String displayName,
            final int format) {

        if (!op.isDone.compareAndSet(false, true)) {
            return;
        }

        final PdfOutputTransaction tx = op.outputTransaction;
        dismissProgressOnly();

        if (status == NativePdfEngine.OK && tx != null) {
            try {
                if (!tx.validateStageOutput()) {
                    throw new IOException("Stage output validation failed");
                }
                if (!tx.revalidateSources()) {
                    throw new IOException("Input file modified during export");
                }

                final String ext = (format == NativePdfEngine.EXPORT_DOCX) ? ".docx"
                        : (format == NativePdfEngine.EXPORT_XLSX) ? ".xlsx" : ".pptx";
                final String mimeType = (format == NativePdfEngine.EXPORT_DOCX)
                        ? "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                        : (format == NativePdfEngine.EXPORT_XLSX)
                        ? "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
                        : "application/vnd.openxmlformats-officedocument.presentationml.presentation";

                String rawBaseName = displayName != null ? displayName : "Export";
                if (rawBaseName.toLowerCase().endsWith(".pdf")) {
                    rawBaseName = rawBaseName.substring(0, rawBaseName.length() - 4);
                }
                rawBaseName = rawBaseName.replaceAll("[/\\\\\\x00-\\x1F\\x7F]", "_").trim();
                while (rawBaseName.startsWith(".") || rawBaseName.isEmpty()) {
                    rawBaseName = rawBaseName.isEmpty() ? "Export" : rawBaseName.substring(1).trim();
                }
                if (rawBaseName.isEmpty()) {
                    rawBaseName = "Export";
                }
                final String finalFileName = rawBaseName + ext;
                final File exportDir = new File(application.getCacheDir(), "aidan-scan-pdf/export-" + op.operationId);
                if (!exportDir.exists()) exportDir.mkdirs();
                final File exportedFile = new File(exportDir, finalFileName);
                tx.markPublishing(exportedFile.getAbsolutePath(), String.valueOf(op.operationId));

                try (FileInputStream fis = new FileInputStream(tx.getStageFile());
                     FileOutputStream fos = new FileOutputStream(exportedFile)) {
                    byte[] buf = new byte[65536];
                    int r;
                    while ((r = fis.read(buf)) != -1) {
                        fos.write(buf, 0, r);
                    }
                    fos.flush();
                    fos.getFD().sync();
                }

                tx.markPublished();

                final Activity targetActivity = (currentActivityRef.get() != null) ? currentActivityRef.get() : activity;
                mainHandler.post(new Runnable() {
                    @Override
                    public void run() {
                        PdfShareBridge.shareDocument(targetActivity, exportedFile, finalFileName, mimeType);
                    }
                });

            } catch (final Throwable t) {
                Log.e(TAG, "Publication failed for export operation " + op.operationId, t);
                if (tx != null) tx.abort();
                dismissProgressAndSnackbar("Failed to export document");
            }
        } else if (status == NativePdfEngine.PASSWORD_REQUIRED) {
            if (tx != null) tx.abort();
            dismissProgressOnly();
            final Activity targetActivity = (currentActivityRef.get() != null) ? currentActivityRef.get() : activity;
            mainHandler.post(new Runnable() {
                @Override
                public void run() {
                    PdfExportBridge.promptPasswordAndExport(targetActivity, op.scanFileObj, format, false);
                }
            });
        } else if (status == NativePdfEngine.WRONG_PASSWORD) {
            if (tx != null) tx.abort();
            dismissProgressOnly();
            final Activity targetActivity = (currentActivityRef.get() != null) ? currentActivityRef.get() : activity;
            mainHandler.post(new Runnable() {
                @Override
                public void run() {
                    PdfExportBridge.promptPasswordAndExport(targetActivity, op.scanFileObj, format, true);
                }
            });
        } else {
            if (tx != null) tx.abort();
            dismissProgressAndSnackbar(getErrorMessageForStatus(status));
        }

        clearActiveOperation(op.operationId);
    }

    private void startOperation(
            final Activity activity,
            final Object scanFileObj,
            final int operation,
            final int compressionLevel,
            final String password,
            final boolean compressAndShare,
            final UUID launcherId) {

        if (activity == null || scanFileObj == null) {
            Log.e(TAG, "Cannot start operation: invalid arguments");
            if (launcherId != null) PdfShareBridge.retireLauncher(launcherId);
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final long documentId = adapter.getDatabaseId(scanFileObj);
        final File sourceFile = adapter.getFile(scanFileObj);
        final long oldSize = adapter.getFileSize(scanFileObj);
        final int oldStatus = adapter.getProtectionStatus(scanFileObj);

        if (sourceFile == null || !sourceFile.exists()) {
            PdfOperationUi.showSnackbar(activity, "Target document file not found on disk");
            if (launcherId != null) PdfShareBridge.retireLauncher(launcherId);
            return;
        }

        final long operationId = operationIdGenerator.incrementAndGet();
        final int targetStatus = (operation == NativePdfEngine.PROTECT) ? 2
                : (operation == NativePdfEngine.UNPROTECT) ? 1 : oldStatus;

        final ActiveOperation op = new ActiveOperation(
                operationId,
                documentId,
                operation,
                compressionLevel,
                compressAndShare,
                launcherId,
                scanFileObj);

        synchronized (this) {
            if (activeOperation != null && !activeOperation.isDone.get()) {
                PdfOperationUi.showSnackbar(activity, "Another PDF operation is in progress.");
                if (launcherId != null) PdfShareBridge.retireLauncher(launcherId);
                return;
            }
            activeOperation = op;
        }

        showNativeProgress(activity, operation);

        executor.execute(new Runnable() {
            @Override
            public void run() {
                PdfFileTransaction tx = null;
                byte[] passwordBytes = null;
                ParcelFileDescriptor inPfd = null;
                ParcelFileDescriptor outPfd = null;

                try {
                    if (op.isDone.get()) {
                        clearActiveOperation(operationId);
                        return;
                    }

                    final File stagingDir = PdfFileTransaction.getStagingDir(application);
                    tx = PdfFileTransaction.begin(
                            stagingDir,
                            operationId,
                            documentId,
                            operation,
                            sourceFile,
                            oldStatus,
                            oldSize,
                            targetStatus);
                    op.transaction = tx;

                    if (op.isDone.get()) {
                        tx.rollback(adapter);
                        clearActiveOperation(operationId);
                        return;
                    }

                    // Bounded connection wait
                    long deadline = System.currentTimeMillis() + 10000;
                    IPdfTransformService service;
                    synchronized (serviceLock) {
                        while (transformService == null && System.currentTimeMillis() < deadline) {
                            if (op.isDone.get()) {
                                throw new IllegalStateException("Operation cancelled while waiting for service");
                            }
                            serviceLock.wait(500);
                        }
                        service = transformService;
                    }

                    if (service == null) {
                        throw new IllegalStateException("Transform service failed to bind within timeout");
                    }
                    inPfd = ParcelFileDescriptor.open(tx.getSnapshotFile(), ParcelFileDescriptor.MODE_READ_ONLY);
                    outPfd = ParcelFileDescriptor.open(
                            tx.getStageFile(),
                            ParcelFileDescriptor.MODE_READ_WRITE | ParcelFileDescriptor.MODE_CREATE);

                    if (password != null) {
                        passwordBytes = password.getBytes(StandardCharsets.UTF_8);
                    }

                    final IPdfTransformCallback callback = new IPdfTransformCallback.Stub() {
                        @Override
                        public void onProgress(final long opId, final int percent) {
                            // Can update indeterminate or determinate progress
                        }

                        @Override
                        public void onComplete(
                                final long opId,
                                final int status,
                                final int pageCount,
                                final long outputBytes,
                                final boolean encrypted) {
                            handleComplete(op, status, outputBytes, encrypted);
                        }
                    };

                    service.transform(
                            operationId,
                            inPfd,
                            outPfd,
                            operation,
                            compressionLevel,
                            passwordBytes,
                            callback);

                } catch (final Throwable t) {
                    Log.e(TAG, "Failed to start transform operation " + operationId, t);
                    if (op.isDone.compareAndSet(false, true)) {
                        if (tx != null) {
                            tx.rollback(adapter);
                        }
                        if (op.launcherId != null) {
                            PdfShareBridge.retireLauncher(op.launcherId);
                        }
                        dismissProgressAndSnackbar("PDF operation failed");
                        clearActiveOperation(operationId);
                    } else {
                        if (tx != null) {
                            tx.rollback(adapter);
                        }
                        clearActiveOperation(operationId);
                    }
                } finally {
                    if (inPfd != null) {
                        try {
                            inPfd.close();
                        } catch (final IOException ignored) {
                        }
                    }
                    if (outPfd != null) {
                        try {
                            outPfd.close();
                        } catch (final IOException ignored) {
                        }
                    }
                    if (passwordBytes != null) {
                        Arrays.fill(passwordBytes, (byte) 0);
                    }
                }
            }
        });
    }

    private void handleComplete(
            final ActiveOperation op,
            final int status,
            final long outputBytes,
            final boolean encrypted) {
        if (!op.isDone.compareAndSet(false, true)) {
            return;
        }

        executor.execute(new Runnable() {
            @Override
            public void run() {
                final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
                final PdfFileTransaction tx = op.transaction;
                boolean launcherHandedOff = false;

                try {
                    switch (status) {
                        case NativePdfEngine.OK: {
                            if (op.compressAndShare) {
                                // Stage file for sharing under cacheDir
                                final File cacheShareDir = new File(
                                        new File(application.getCacheDir(), "aidan-scan-pdf"),
                                        String.valueOf(op.operationId));
                                cacheShareDir.mkdirs();
                                final File source = new File(tx.getRecord().sourcePath);
                                final File shareFile = new File(cacheShareDir, source.getName());

                                PdfFileTransaction.copyFile(tx.getStageFile(), shareFile);
                                tx.cleanupOwnedFiles();
                                tx.deleteJournal();

                                mainHandler.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        final Activity act = currentActivityRef.get();
                                        PdfOperationUi.dismissProgress(act);
                                        if (act != null) {
                                            PdfShareBridge.shareValidated(
                                                    act, shareFile, source.getName(), op.launcherId);
                                        } else {
                                            PdfShareBridge.retireLauncher(op.launcherId);
                                        }
                                    }
                                });
                                launcherHandedOff = true;
                            } else {
                                final String outSha256 = PdfFileTransaction.sha256(tx.getStageFile());
                                final boolean isProtected = (op.operation == NativePdfEngine.PROTECT)
                                        || (op.operation != NativePdfEngine.UNPROTECT && encrypted);
                                final int finalStatus = isProtected ? 2 : (op.operation == NativePdfEngine.UNPROTECT ? 1 : tx.getRecord().newProtectionStatus);
                                tx.markValidated(outputBytes, outSha256, finalStatus);
                                tx.commit(adapter);

                                // Update in-memory ScanFile model and UI
                                adapter.updateModel(
                                        op.scanFileObj,
                                        finalStatus,
                                        tx.getRecord().newSize,
                                        isProtected);

                                final String msg = (op.operation == NativePdfEngine.COMPRESS) ? "PDF compressed"
                                        : (op.operation == NativePdfEngine.PROTECT) ? "Password set"
                                        : "Password removed";
                                dismissProgressAndSnackbar(msg);
                            }
                            break;
                        }

                        case NativePdfEngine.NO_SAVINGS:
                        case NativePdfEngine.ALREADY_UNPROTECTED: {
                            tx.rollback(adapter);
                            dismissProgressAndSnackbar(getErrorMessageForStatus(status));
                            break;
                        }

                        case NativePdfEngine.PASSWORD_REQUIRED: {
                            tx.rollback(adapter);
                            if (op.operation == NativePdfEngine.COMPRESS) {
                                dismissProgressOnly();
                                mainHandler.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        final Activity act = currentActivityRef.get();
                                        if (act != null) {
                                            PdfCompressionBridge.promptPasswordAndCompress(
                                                    act, op.scanFileObj, op.compressionLevel,
                                                    op.compressAndShare, op.launcherId, false);
                                        } else if (op.launcherId != null) {
                                            PdfShareBridge.retireLauncher(op.launcherId);
                                        }
                                    }
                                });
                                launcherHandedOff = true;
                            } else {
                                dismissProgressAndSnackbar(getErrorMessageForStatus(status));
                            }
                            break;
                        }

                        case NativePdfEngine.WRONG_PASSWORD: {
                            tx.rollback(adapter);
                            if (op.operation == NativePdfEngine.COMPRESS) {
                                dismissProgressOnly();
                                mainHandler.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        final Activity act = currentActivityRef.get();
                                        if (act != null) {
                                            PdfCompressionBridge.promptPasswordAndCompress(
                                                    act, op.scanFileObj, op.compressionLevel,
                                                    op.compressAndShare, op.launcherId, true);
                                        } else if (op.launcherId != null) {
                                            PdfShareBridge.retireLauncher(op.launcherId);
                                        }
                                    }
                                });
                                launcherHandedOff = true;
                            } else {
                                dismissProgressAndSnackbar(getErrorMessageForStatus(status));
                            }
                            break;
                        }

                        case NativePdfEngine.CANCELLED: {
                            tx.rollback(adapter);
                            dismissProgressOnly();
                            break;
                        }

                        case NativePdfEngine.INVALID_PDF:
                        case NativePdfEngine.UNSUPPORTED_PDF:
                        case NativePdfEngine.IO_ERROR:
                        case NativePdfEngine.ENGINE_FAILURE:
                        default: {
                            tx.rollback(adapter);
                            dismissProgressAndSnackbar(getErrorMessageForStatus(status));
                            break;
                        }
                    }
                } catch (final Throwable t) {
                    Log.e(TAG, "Error finalizing operation " + op.operationId, t);
                    tx.rollback(adapter);
                    dismissProgressAndSnackbar("PDF operation failed");
                } finally {
                    if (op.launcherId != null && !launcherHandedOff) {
                        PdfShareBridge.retireLauncher(op.launcherId);
                    }
                    clearActiveOperation(op.operationId);
                }
            }
        });
    }

    public static String getErrorMessageForStatus(final int status) {
        switch (status) {
            case NativePdfEngine.NO_SAVINGS:
                return "This file cannot be compressed further.";
            case NativePdfEngine.ALREADY_UNPROTECTED:
                return "This PDF has no password.";
            case NativePdfEngine.PASSWORD_REQUIRED:
                return "Password required.";
            case NativePdfEngine.WRONG_PASSWORD:
                return "Incorrect password.";
            case NativePdfEngine.INVALID_PDF:
            case NativePdfEngine.UNSUPPORTED_PDF:
                return "Unsupported or invalid PDF format.";
            case NativePdfEngine.IO_ERROR:
            case NativePdfEngine.ENGINE_FAILURE:
            default:
                return "PDF operation failed.";
        }
    }

    public void cancelCurrentOperation() {
        final ActiveOperation op = activeOperation;
        if (op != null && op.isDone.compareAndSet(false, true)) {
            synchronized (serviceLock) {
                if (transformService != null) {
                    try {
                        transformService.cancel(op.operationId);
                    } catch (final RemoteException ignored) {
                    }
                }
                serviceLock.notifyAll();
            }
            dismissProgressOnly();
            if (op.launcherId != null) {
                PdfShareBridge.retireLauncher(op.launcherId);
            }
            executor.execute(new Runnable() {
                @Override
                public void run() {
                    if (op.transaction != null) {
                        op.transaction.rollback(ScanFileAdapter.getInstance());
                    }
                    if (op.outputTransaction != null) {
                        op.outputTransaction.abort();
                    }
                    clearActiveOperation(op.operationId);
                }
            });
        }
    }

    private void showNativeProgress(final Activity activity, final int operation) {
        final String title = (operation == NativePdfEngine.COMPRESS) ? "Compressing PDF…"
                : (operation == NativePdfEngine.PROTECT) ? "Setting password…"
                : "Removing password…";

        PdfOperationUi.showProgress(activity, title, new Runnable() {
            @Override
            public void run() {
                cancelCurrentOperation();
            }
        });
    }

    private void dismissProgressAndSnackbar(final String message) {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                final Activity act = currentActivityRef.get();
                PdfOperationUi.dismissProgress(act);
                if (act != null && message != null) {
                    PdfOperationUi.showSnackbar(act, message);
                }
            }
        });
    }

    private void dismissProgressOnly() {
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                final Activity act = currentActivityRef.get();
                PdfOperationUi.dismissProgress(act);
            }
        });
    }

    private synchronized void clearActiveOperation(final long opId) {
        if (activeOperation != null && activeOperation.operationId == opId) {
            activeOperation = null;
        }
    }
}
