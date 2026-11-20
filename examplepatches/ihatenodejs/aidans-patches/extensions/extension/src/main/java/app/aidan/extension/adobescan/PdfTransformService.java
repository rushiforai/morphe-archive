package app.aidan.extension.adobescan;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.RemoteException;
import android.util.Log;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

public class PdfTransformService extends Service {

    private static final String TAG = "PdfTransformService";
    private static final long SERVICE_DEADLINE_MS = 5 * 60 * 1000L; // 5 minutes
    private static final long CANCEL_WATCHDOG_MS = 5000L; // 5 seconds

    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private HandlerThread watchdogThread;
    private Handler watchdogHandler;

    private volatile long activeOperationId = -1;
    private final AtomicBoolean isTransformRunning = new AtomicBoolean(false);

    private final IPdfTransformService.Stub binder = new IPdfTransformService.Stub() {
        @Override
        public void transform(
                final long operationId,
                final ParcelFileDescriptor input,
                final ParcelFileDescriptor output,
                final int operation,
                final int compressionLevel,
                final byte[] passwordUtf8,
                final IPdfTransformCallback callback) {

            if (!isTransformRunning.compareAndSet(false, true)) {
                Log.w(TAG, "Transform already in progress; rejecting operation " + operationId);
                closePfdQuietly(input);
                closePfdQuietly(output);
                wipePassword(passwordUtf8);
                if (callback != null) {
                    try {
                        callback.onComplete(operationId, NativePdfEngine.ENGINE_FAILURE, 0, 0, false);
                    } catch (final RemoteException ignored) {
                    }
                }
                return;
            }

            activeOperationId = operationId;

            // Schedule 5-minute hard deadline watchdog
            final Runnable deadlineWatchdog = new Runnable() {
                @Override
                public void run() {
                    Log.e(TAG, "Operation " + operationId + " exceeded 5-minute deadline; killing worker process");
                    Process.killProcess(Process.myPid());
                }
            };
            watchdogHandler.postDelayed(deadlineWatchdog, SERVICE_DEADLINE_MS);

            executor.execute(new Runnable() {
                @Override
                public void run() {
                    final Integer[] capturedStatus = new Integer[1];
                    final int[] capturedPageCount = new int[1];
                    final long[] capturedOutputBytes = new long[1];
                    final boolean[] capturedEncrypted = new boolean[1];

                    try {
                        if (input == null || output == null || input.getFd() < 0 || output.getFd() < 0) {
                            Log.e(TAG, "Invalid file descriptors for operation " + operationId);
                            capturedStatus[0] = NativePdfEngine.IO_ERROR;
                            return;
                        }

                        final NativePdfEngine.NativeCallbacks nativeCallbacks = new NativePdfEngine.NativeCallbacks() {
                            @Override
                            public void onProgress(final int percent) {
                                if (callback != null) {
                                    try {
                                        callback.onProgress(operationId, percent);
                                    } catch (final RemoteException e) {
                                        Log.w(TAG, "RemoteException dispatching onProgress", e);
                                    }
                                }
                            }

                            @Override
                            public void onComplete(
                                    final int status,
                                    final int pageCount,
                                    final long outputBytes,
                                    final boolean encrypted) {
                                capturedStatus[0] = status;
                                capturedPageCount[0] = pageCount;
                                capturedOutputBytes[0] = outputBytes;
                                capturedEncrypted[0] = encrypted;
                            }
                        };

                        NativePdfEngine.transform(
                                input.getFd(),
                                output.getFd(),
                                operation,
                                compressionLevel,
                                passwordUtf8,
                                nativeCallbacks);

                    } catch (final Throwable t) {
                        Log.e(TAG, "Exception during native transform", t);
                        if (capturedStatus[0] == null) {
                            capturedStatus[0] = NativePdfEngine.ENGINE_FAILURE;
                        }
                    } finally {
                        watchdogHandler.removeCallbacks(deadlineWatchdog);
                        closePfdQuietly(input);
                        closePfdQuietly(output);
                        wipePassword(passwordUtf8);
                        activeOperationId = -1;
                        isTransformRunning.set(false);
                        // Publish callback AFTER releasing isTransformRunning state
                        if (callback != null && capturedStatus[0] != null) {
                            try {
                                callback.onComplete(
                                        operationId,
                                        capturedStatus[0],
                                        capturedPageCount[0],
                                        capturedOutputBytes[0],
                                        capturedEncrypted[0]);
                            } catch (final RemoteException e) {
                                Log.w(TAG, "RemoteException dispatching onComplete", e);
                            }
                        }
                    }
                }
            });
        }

        @Override
        public void createOutput(
                final long operationId,
                final ParcelFileDescriptor[] inputs,
                final ParcelFileDescriptor output,
                final int operation,
                final ParcelFileDescriptor ocrModel,
                final String[] passwords,
                final IPdfTransformCallback callback) {

            if (!isTransformRunning.compareAndSet(false, true)) {
                Log.w(TAG, "Transform already in progress; rejecting createOutput " + operationId);
                closePfdsQuietly(inputs);
                closePfdQuietly(output);
                closePfdQuietly(ocrModel);
                if (callback != null) {
                    try {
                        callback.onComplete(operationId, NativePdfEngine.ENGINE_FAILURE, 0, 0, false);
                    } catch (final RemoteException ignored) {
                    }
                }
                return;
            }

            activeOperationId = operationId;

            final Runnable deadlineWatchdog = new Runnable() {
                @Override
                public void run() {
                    Log.e(TAG, "Operation " + operationId + " exceeded 5-minute deadline; killing worker process");
                    Process.killProcess(Process.myPid());
                }
            };
            watchdogHandler.postDelayed(deadlineWatchdog, SERVICE_DEADLINE_MS);

            executor.execute(new Runnable() {
                @Override
                public void run() {
                    final Integer[] capturedStatus = new Integer[1];
                    final int[] capturedPageCount = new int[1];
                    final long[] capturedOutputBytes = new long[1];
                    final boolean[] capturedEncrypted = new boolean[1];

                    try {
                        if (inputs == null || output == null || output.getFd() < 0) {
                            Log.e(TAG, "Invalid file descriptors for createOutput " + operationId);
                            capturedStatus[0] = NativePdfEngine.IO_ERROR;
                            return;
                        }

                        if (operation == NativePdfEngine.COMBINE) {
                            if (inputs.length < 2) {
                                capturedStatus[0] = NativePdfEngine.INVALID_PDF;
                                return;
                            }
                            final int[] fds = new int[inputs.length];
                            for (int i = 0; i < inputs.length; i++) {
                                if (inputs[i] == null || inputs[i].getFd() < 0) {
                                    capturedStatus[0] = NativePdfEngine.IO_ERROR;
                                    return;
                                }
                                fds[i] = inputs[i].getFd();
                            }

                            final NativePdfEngine.NativeCallbacks nativeCallbacks = new NativePdfEngine.NativeCallbacks() {
                                @Override
                                public void onProgress(final int percent) {
                                    if (callback != null) {
                                        try {
                                            callback.onProgress(operationId, percent);
                                        } catch (final RemoteException e) {
                                            Log.w(TAG, "RemoteException dispatching onProgress", e);
                                        }
                                    }
                                }

                                @Override
                                public void onComplete(
                                        final int status,
                                        final int pageCount,
                                        final long outputBytes,
                                        final boolean encrypted) {
                                    capturedStatus[0] = status;
                                    capturedPageCount[0] = pageCount;
                                    capturedOutputBytes[0] = outputBytes;
                                    capturedEncrypted[0] = encrypted;
                                }
                            };
                            final byte[][] passwordsUtf8;
                            if (passwords != null) {
                                passwordsUtf8 = new byte[passwords.length][];
                                for (int i = 0; i < passwords.length; i++) {
                                    if (passwords[i] != null) {
                                        passwordsUtf8[i] = passwords[i].getBytes(StandardCharsets.UTF_8);
                                    }
                                }
                            } else {
                                passwordsUtf8 = null;
                            }
                            try {
                                NativePdfEngine.combine(fds, passwordsUtf8, output.getFd(), nativeCallbacks);
                            } finally {
                                wipePasswords(passwordsUtf8);
                            }
                        } else if (operation == NativePdfEngine.EXPORT_DOCX ||
                                   operation == NativePdfEngine.EXPORT_XLSX ||
                                   operation == NativePdfEngine.EXPORT_PPTX) {
                            if (inputs.length < 1 || inputs[0] == null || inputs[0].getFd() < 0) {
                                capturedStatus[0] = NativePdfEngine.IO_ERROR;
                                return;
                            }
                            final String password = (passwords != null && passwords.length > 0) ? passwords[0] : null;
                            PdfOfficeExporter.export(
                                    PdfTransformService.this,
                                    inputs[0],
                                    output,
                                    operation,
                                    ocrModel,
                                    password,
                                    new PdfOfficeExporter.ExportCallback() {
                                        @Override
                                        public void onProgress(int percent) {
                                            if (callback != null) {
                                                try {
                                                    callback.onProgress(operationId, percent);
                                                } catch (final RemoteException ignored) {}
                                            }
                                        }

                                        @Override
                                        public void onComplete(int status, int pageCount, long outputBytes) {
                                            capturedStatus[0] = status;
                                            capturedPageCount[0] = pageCount;
                                            capturedOutputBytes[0] = outputBytes;
                                            capturedEncrypted[0] = false;
                                        }
                                    });
                        } else {
                            capturedStatus[0] = NativePdfEngine.ENGINE_FAILURE;
                        }

                    } catch (final Throwable t) {
                        Log.e(TAG, "Exception during createOutput", t);
                        if (capturedStatus[0] == null) {
                            capturedStatus[0] = NativePdfEngine.ENGINE_FAILURE;
                        }
                    } finally {
                        watchdogHandler.removeCallbacks(deadlineWatchdog);
                        closePfdsQuietly(inputs);
                        closePfdQuietly(output);
                        closePfdQuietly(ocrModel);
                        wipePasswords(passwords);
                        activeOperationId = -1;
                        isTransformRunning.set(false);
                        if (callback != null && capturedStatus[0] != null) {
                            try {
                                callback.onComplete(
                                        operationId,
                                        capturedStatus[0],
                                        capturedPageCount[0],
                                        capturedOutputBytes[0],
                                        capturedEncrypted[0]);
                            } catch (final RemoteException e) {
                                Log.w(TAG, "RemoteException dispatching onComplete", e);
                            }
                        }
                    }
                }
            });
        }

        @Override
        public void cancel(final long operationId) {
            Log.i(TAG, "Cancel requested for operation " + operationId);
            if (activeOperationId == operationId) {
                // Arm 5-second cancel watchdog
                watchdogHandler.postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        if (activeOperationId == operationId) {
                            Log.w(TAG, "Cancel watchdog fired after 5s; killing worker process");
                            Process.killProcess(Process.myPid());
                        }
                    }
                }, CANCEL_WATCHDOG_MS);
            }
        }
    };

    @Override
    public void onCreate() {
        super.onCreate();
        watchdogThread = new HandlerThread("PdfTransformWatchdog");
        watchdogThread.start();
        watchdogHandler = new Handler(watchdogThread.getLooper());
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        executor.shutdownNow();
        if (watchdogThread != null) {
            watchdogThread.quitSafely();
        }
    }

    @Override
    public IBinder onBind(final Intent intent) {
        return binder;
    }

    private static void closePfdQuietly(final ParcelFileDescriptor pfd) {
        if (pfd != null) {
            try {
                pfd.close();
            } catch (final IOException ignored) {
            }
        }
    }

    private static void closePfdsQuietly(final ParcelFileDescriptor[] pfds) {
        if (pfds != null) {
            for (final ParcelFileDescriptor p : pfds) {
                closePfdQuietly(p);
            }
        }
    }

    private static void wipePassword(final byte[] passwordUtf8) {
        if (passwordUtf8 != null) {
            Arrays.fill(passwordUtf8, (byte) 0);
        }
    }

    private static void wipePasswords(final byte[][] passwordsUtf8) {
        if (passwordsUtf8 == null) return;
        for (int i = 0; i < passwordsUtf8.length; i++) {
            if (passwordsUtf8[i] != null) {
                Arrays.fill(passwordsUtf8[i], (byte) 0);
                passwordsUtf8[i] = null;
            }
        }
    }

    private static void wipePasswords(final String[] passwords) {
        if (passwords == null) return;
        for (int i = 0; i < passwords.length; i++) {
            passwords[i] = null;
        }
    }
}
