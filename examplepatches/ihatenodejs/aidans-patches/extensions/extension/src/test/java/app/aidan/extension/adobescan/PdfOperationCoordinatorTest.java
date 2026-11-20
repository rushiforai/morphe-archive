package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.AbstractExecutorService;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import org.junit.Test;

public class PdfOperationCoordinatorTest {

    @Test
    public void testErrorMessageMappings() {
        assertEquals(
                "This file cannot be compressed further.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.NO_SAVINGS));

        assertEquals(
                "This PDF has no password.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.ALREADY_UNPROTECTED));

        assertEquals(
                "Password required.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.PASSWORD_REQUIRED));

        assertEquals(
                "Incorrect password.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.WRONG_PASSWORD));

        assertEquals(
                "Unsupported or invalid PDF format.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.INVALID_PDF));

        assertEquals(
                "Unsupported or invalid PDF format.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.UNSUPPORTED_PDF));

        assertEquals(
                "PDF operation failed.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.IO_ERROR));

        assertEquals(
                "PDF operation failed.",
                PdfOperationCoordinator.getErrorMessageForStatus(NativePdfEngine.ENGINE_FAILURE));

        assertEquals(
                "PDF operation failed.",
                PdfOperationCoordinator.getErrorMessageForStatus(999));
    }

    @Test
    public void testCoordinatorInstantiation() {
        PdfOperationCoordinator coordinator = new PdfOperationCoordinator(null, false);
        assertEquals(null, coordinator.getActiveOperation());
    }

    @Test
    public void testRapidSubmissionsRejectSecondaryOperations() throws Exception {
        final File tempFile = File.createTempFile("test_scan", ".pdf");
        tempFile.deleteOnExit();

        final ScanFileAdapter originalAdapter = ScanFileAdapter.getInstance();
        try {
            ScanFileAdapter.setInstance(new ScanFileAdapter() {
                @Override
                public long getDatabaseId(final Object scanFileObj) {
                    return 42L;
                }

                @Override
                public File getFile(final Object scanFileObj) {
                    return tempFile;
                }

                @Override
                public long getFileSize(final Object scanFileObj) {
                    return 1024L;
                }

                @Override
                public int getProtectionStatus(final Object scanFileObj) {
                    return 1;
                }
            });

            final List<Runnable> queuedTasks = new ArrayList<>();
            final ExecutorService queueOnlyExecutor = new AbstractExecutorService() {
                private boolean shutdown = false;
                @Override public void shutdown() { shutdown = true; }
                @Override public List<Runnable> shutdownNow() { shutdown = true; return new ArrayList<>(queuedTasks); }
                @Override public boolean isShutdown() { return shutdown; }
                @Override public boolean isTerminated() { return shutdown; }
                @Override public boolean awaitTermination(long timeout, TimeUnit unit) { return true; }
                @Override public void execute(Runnable command) { queuedTasks.add(command); }
            };
            final PdfOperationCoordinator coordinator = new PdfOperationCoordinator(null, false, queueOnlyExecutor);
            final Activity activity = new Activity();
            final Object scanFileObj = new Object();
            final UUID launcherId1 = UUID.randomUUID();
            final UUID launcherId2 = UUID.randomUUID();

            coordinator.startCompression(activity, scanFileObj, 1, false, launcherId1);
            final PdfOperationCoordinator.ActiveOperation firstOp = coordinator.getActiveOperation();
            assertNotNull("First operation should be admitted", firstOp);
            assertEquals(42L, firstOp.documentId);
            assertFalse("First operation should be running", firstOp.isDone.get());

            // Rapid secondary submission while first operation is still active
            coordinator.startCompression(activity, scanFileObj, 2, false, launcherId2);
            final PdfOperationCoordinator.ActiveOperation currentOp = coordinator.getActiveOperation();
            assertEquals("Active operation should still be the first operation", firstOp.operationId, currentOp.operationId);
            assertEquals("Compression level should remain unchanged from first operation", 1, currentOp.compressionLevel);

            // Test cancellation transition
            coordinator.cancelCurrentOperation();
            assertTrue("First operation should now be marked as done", firstOp.isDone.get());

            // Second cancellation call should be safe (CAS idempotence)
            coordinator.cancelCurrentOperation();
            assertTrue(firstOp.isDone.get());

            // After cancellation, new operation can be admitted
            final UUID launcherId3 = UUID.randomUUID();
            coordinator.startCompression(activity, scanFileObj, 3, false, launcherId3);
            final PdfOperationCoordinator.ActiveOperation thirdOp = coordinator.getActiveOperation();
            assertNotNull("New operation should be admitted after previous operation completed", thirdOp);
            assertEquals(3, thirdOp.compressionLevel);

            // Test worker death handling
            coordinator.handleWorkerDeath("Process killed by OS");
            assertTrue("Third operation should be marked as done after worker death", thirdOp.isDone.get());
        } finally {
            ScanFileAdapter.setInstance(originalAdapter);
            tempFile.delete();
        }
    }

    @Test
    public void testCompressionBridgeConsumesFailureWhenDocumentUnavailable() {
        final Activity activity = new Activity();
        final android.content.Intent data = new android.content.Intent();
        data.putExtra("currentScanFileId", 9999L);
        final UUID launcherId = UUID.randomUUID();
        data.putExtra("launcherId", launcherId);

        final ScanFileAdapter originalAdapter = ScanFileAdapter.getInstance();
        try {
            ScanFileAdapter.setInstance(new ScanFileAdapter() {
                @Override
                public Object getScanFileById(final long databaseId) {
                    return null; // document unavailable
                }
            });

            final boolean consumed = PdfCompressionBridge.onCompressionResult(activity, Activity.RESULT_OK, data);
            assertTrue("Failure should be consumed (return true) to block Document Cloud fallback", consumed);
        } finally {
            ScanFileAdapter.setInstance(originalAdapter);
        }
    }

    @Test
    public void testRefreshSecurityCacheDoesNotBlockMainThread() {
        final ScanFileAdapter adapter = new ScanFileAdapter();
        final long start = System.currentTimeMillis();
        // Even if invoked with a dummy object, when Looper.myLooper() == Looper.getMainLooper()
        // it immediately branches to conservative cache and avoids latch.await(500ms)
        adapter.refreshSecurityCache(new Object(), true);
        final long elapsed = System.currentTimeMillis() - start;
        assertTrue("refreshSecurityCache should not block for 500ms latch on main thread", elapsed < 400);
    }

    @Test
    public void testStartExportAdmittedForProtectedScanWithPassword() throws Exception {
        final File tempFile = File.createTempFile("test_protected_export", ".pdf");
        tempFile.deleteOnExit();

        final ScanFileAdapter originalAdapter = ScanFileAdapter.getInstance();
        try {
            ScanFileAdapter.setInstance(new ScanFileAdapter() {
                @Override
                public long getDatabaseId(final Object scanFileObj) {
                    return 88L;
                }

                @Override
                public File getFile(final Object scanFileObj) {
                    return tempFile;
                }

                @Override
                public long getFileSize(final Object scanFileObj) {
                    return 2048L;
                }

                @Override
                public int getProtectionStatus(final Object scanFileObj) {
                    return 2;
                }

                @Override
                public boolean isProtected(final Object scanFileObj) {
                    return true;
                }
            });

            final List<Runnable> queuedTasks = new ArrayList<>();
            final ExecutorService queueOnlyExecutor = new AbstractExecutorService() {
                private boolean shutdown = false;
                @Override public void shutdown() { shutdown = true; }
                @Override public List<Runnable> shutdownNow() { shutdown = true; return new ArrayList<>(queuedTasks); }
                @Override public boolean isShutdown() { return shutdown; }
                @Override public boolean isTerminated() { return shutdown; }
                @Override public boolean awaitTermination(long timeout, TimeUnit unit) { return true; }
                @Override public void execute(Runnable command) { queuedTasks.add(command); }
            };

            final PdfOperationCoordinator coordinator = new PdfOperationCoordinator(null, false, queueOnlyExecutor);
            final Activity activity = new Activity();
            final Object scanFileObj = new Object();

            coordinator.startExport(activity, scanFileObj, NativePdfEngine.EXPORT_DOCX, "pass123");
            final PdfOperationCoordinator.ActiveOperation op = coordinator.getActiveOperation();
            assertNotNull("Export operation should be admitted when password is provided", op);
            assertEquals(88L, op.documentId);
            assertEquals(NativePdfEngine.EXPORT_DOCX, op.operation);
        } finally {
            ScanFileAdapter.setInstance(originalAdapter);
            tempFile.delete();
        }
    }
}
