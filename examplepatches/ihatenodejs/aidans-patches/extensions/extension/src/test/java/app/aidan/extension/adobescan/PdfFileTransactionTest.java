package app.aidan.extension.adobescan;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PdfFileTransactionTest {

    private File tempDir;
    private File sourceFile;
    private static final byte[] ORIGINAL_BYTES = "%PDF-1.7\n1 0 obj\n<< /Type /Catalog >>\nendobj\ntrailer\n<<>>\n%%EOF".getBytes(StandardCharsets.UTF_8);
    private static final byte[] TRANSFORMED_BYTES = "%PDF-1.7\n1 0 obj\n<< /Type /Catalog /Encrypted true >>\nendobj\ntrailer\n<<>>\n%%EOF".getBytes(StandardCharsets.UTF_8);

    private static class MockScanFileAdapter extends ScanFileAdapter {
        long updatedDocId = -1;
        int updatedNewStatus = -1;
        long updatedNewSize = -1;
        int updatedOldStatus = -1;
        long updatedOldSize = -1;
        boolean updateCalled = false;
        boolean shouldThrowOnUpdate = false;

        @Override
        public void updateMetadata(
                final long databaseId,
                final int newProtectionStatus,
                final long newFileSize,
                final int expectedOldStatus,
                final long expectedOldSize) throws Exception {
            if (shouldThrowOnUpdate) {
                throw new RuntimeException("Simulated DB transaction failure");
            }
            this.updatedDocId = databaseId;
            this.updatedNewStatus = newProtectionStatus;
            this.updatedNewSize = newFileSize;
            this.updatedOldStatus = expectedOldStatus;
            this.updatedOldSize = expectedOldSize;
            this.updateCalled = true;
        }
    }

    @Before
    public void setUp() throws Exception {
        tempDir = File.createTempFile("pdf_tx_test_", "");
        tempDir.delete();
        tempDir.mkdirs();

        sourceFile = new File(tempDir, "test_document.pdf");
        try (FileOutputStream fos = new FileOutputStream(sourceFile)) {
            fos.write(ORIGINAL_BYTES);
            fos.flush();
        }
    }

    @After
    public void tearDown() {
        deleteRecursively(tempDir);
    }

    private void deleteRecursively(final File file) {
        if (file == null || !file.exists()) return;
        if (file.isDirectory()) {
            final File[] children = file.listFiles();
            if (children != null) {
                for (final File child : children) {
                    deleteRecursively(child);
                }
            }
        }
        file.delete();
    }

    @Test
    public void testBeginCreatesSnapshotAndPreparingJournal() throws Exception {
        final long opId = 1001L;
        final long docId = 42L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1, // oldStatus (unprotected)
                ORIGINAL_BYTES.length,
                2  // newStatus (protected)
        );

        assertNotNull(tx);
        final File snapshot = tx.getSnapshotFile();
        assertTrue("Snapshot file must exist", snapshot.exists());
        assertEquals("Snapshot length must match original", ORIGINAL_BYTES.length, snapshot.length());
        assertEquals("Snapshot hash must match source", PdfFileTransaction.sha256(sourceFile), PdfFileTransaction.sha256(snapshot));

        final File journal = new File(tempDir, opId + ".journal");
        assertTrue("Journal file must exist", journal.exists());
        assertEquals(PdfFileTransaction.PHASE_PREPARING, tx.getRecord().phase);
    }

    @Test
    public void testCommitSuccessfullyOverwritesSourceAndCleansUp() throws Exception {
        final long opId = 1002L;
        final long docId = 43L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.COMPRESS,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                1
        );

        // Simulate transformed output written to stage file
        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }

        final String outHash = PdfFileTransaction.sha256(stageFile);
        tx.markValidated(TRANSFORMED_BYTES.length, outHash);
        assertEquals(PdfFileTransaction.PHASE_VALIDATED, tx.getRecord().phase);

        tx.commit(adapter);

        // Verify source file has transformed bytes
        assertEquals(TRANSFORMED_BYTES.length, sourceFile.length());
        assertEquals(outHash, PdfFileTransaction.sha256(sourceFile));

        // Verify adapter was called with correct metadata
        assertTrue(adapter.updateCalled);
        assertEquals(docId, adapter.updatedDocId);
        assertEquals(TRANSFORMED_BYTES.length, adapter.updatedNewSize);
        assertEquals(ORIGINAL_BYTES.length, adapter.updatedOldSize);

        // Verify stage, snapshot, and journal files are cleaned up
        assertFalse("Stage file should be deleted", stageFile.exists());
        assertFalse("Snapshot file should be deleted", tx.getSnapshotFile().exists());
        assertFalse("Journal file should be deleted", new File(tempDir, opId + ".journal").exists());
    }

    @Test
    public void testCommitAbortsIfSourceFileModifiedExternally() throws Exception {
        final long opId = 1003L;
        final long docId = 44L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        tx.markValidated(TRANSFORMED_BYTES.length, PdfFileTransaction.sha256(stageFile));

        // Tamper with source file before commit
        try (FileOutputStream fos = new FileOutputStream(sourceFile)) {
            fos.write("corrupted content".getBytes(StandardCharsets.UTF_8));
            fos.flush();
        }

        try {
            tx.commit(adapter);
            fail("Commit should have thrown IOException due to modified source");
        } catch (final IOException expected) {
            // Expected
        }

        assertFalse("Adapter should not have been called", adapter.updateCalled);
    }

    @Test
    public void testRollbackRestoresSnapshotOverSourceAfterFileCommitted() throws Exception {
        final long opId = 1004L;
        final long docId = 45L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();
        adapter.shouldThrowOnUpdate = true; // DB update failure simulation

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        tx.markValidated(TRANSFORMED_BYTES.length, PdfFileTransaction.sha256(stageFile));

        try {
            tx.commit(adapter);
            fail("Commit should fail on DB update");
        } catch (final Exception expected) {
            // DB failed; now rollback
            adapter.shouldThrowOnUpdate = false;
            tx.rollback(adapter);
        }

        // Verify source file was restored from snapshot to original content
        assertEquals(ORIGINAL_BYTES.length, sourceFile.length());
        assertEquals(PdfFileTransaction.sha256(sourceFile), tx.getRecord().sourceSha256);

        // Verify journal deleted
        assertFalse(new File(tempDir, opId + ".journal").exists());
    }

    @Test
    public void testRecoveryCleansUncommittedPreparingJournal() throws Exception {
        final long opId = 1005L;
        final long docId = 46L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.COMPRESS,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                1
        );

        // Simulate crash right after begin (phase PREPARING)
        assertTrue(new File(tempDir, opId + ".journal").exists());
        assertTrue(tx.getSnapshotFile().exists());

        PdfFileTransaction.recover(tempDir, adapter);

        assertFalse("Journal should be cleaned up by recovery", new File(tempDir, opId + ".journal").exists());
        assertFalse("Snapshot should be cleaned up by recovery", tx.getSnapshotFile().exists());
        assertEquals(ORIGINAL_BYTES.length, sourceFile.length());
    }

    @Test
    public void testRecoveryFinalizesFileCommittedPhaseWhenOutputHashMatches() throws Exception {
        final long opId = 1006L;
        final long docId = 47L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        final String outHash = PdfFileTransaction.sha256(stageFile);
        tx.markValidated(TRANSFORMED_BYTES.length, outHash);

        // Simulate file move succeeded, recorded FILE_COMMITTED, then app died before DB
        PdfFileTransaction.atomicMove(stageFile, sourceFile);
        tx.getRecord().phase = PdfFileTransaction.PHASE_FILE_COMMITTED;

        // Save simulated FILE_COMMITTED journal
        final File journalFile = new File(tempDir, opId + ".journal");
        try (java.io.FileWriter fw = new java.io.FileWriter(journalFile)) {
            fw.write(tx.getRecord().toJson());
        }

        // Run recovery
        PdfFileTransaction.recover(tempDir, adapter);

        // DB update should have been applied
        assertTrue(adapter.updateCalled);
        assertEquals(2, adapter.updatedNewStatus);
        assertEquals(TRANSFORMED_BYTES.length, adapter.updatedNewSize);

        // Cleanup completed
        assertFalse(journalFile.exists());
        assertFalse(tx.getSnapshotFile().exists());
    }

    @Test
    public void testRecoveryValidatedPhaseWithOverwrittenSource() throws Exception {
        final long opId = 1007L;
        final long docId = 48L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        final String outHash = PdfFileTransaction.sha256(stageFile);
        tx.markValidated(TRANSFORMED_BYTES.length, outHash);

        // Simulate atomic move succeeded before FILE_COMMITTED journal entry was written
        PdfFileTransaction.atomicMove(stageFile, sourceFile);

        // The journal on disk is still in PHASE_VALIDATED
        final File journalFile = new File(tempDir, opId + ".journal");
        assertTrue(journalFile.exists());

        PdfFileTransaction.recover(tempDir, adapter);

        assertTrue("adapter.updateMetadata should have been called", adapter.updateCalled);
        assertEquals(docId, adapter.updatedDocId);
        assertEquals(2, adapter.updatedNewStatus);
        assertEquals(TRANSFORMED_BYTES.length, adapter.updatedNewSize);
        assertEquals(1, adapter.updatedOldStatus);
        assertEquals(ORIGINAL_BYTES.length, adapter.updatedOldSize);

        assertFalse("Journal file should be deleted on completion", journalFile.exists());
        assertFalse("Snapshot file should be deleted on completion", tx.getSnapshotFile().exists());
    }

    @Test
    public void testRecoveryPreservesJournalOnDatabaseFailure() throws Exception {
        final long opId = 1008L;
        final long docId = 49L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();
        adapter.shouldThrowOnUpdate = true;

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        final String outHash = PdfFileTransaction.sha256(stageFile);
        tx.markValidated(TRANSFORMED_BYTES.length, outHash);

        // Simulate file committed
        PdfFileTransaction.atomicMove(stageFile, sourceFile);
        tx.getRecord().phase = PdfFileTransaction.PHASE_FILE_COMMITTED;
        final File journalFile = new File(tempDir, opId + ".journal");
        try (java.io.FileWriter fw = new java.io.FileWriter(journalFile)) {
            fw.write(tx.getRecord().toJson());
        }

        PdfFileTransaction.recover(tempDir, adapter);

        assertTrue("Journal file should still exist on DB failure", journalFile.exists());
        assertTrue("Snapshot file should still exist on DB failure", tx.getSnapshotFile().exists());
    }

    @Test
    public void testFailedRollbackPreservesSnapshotFile() throws Exception {
        final long opId = 1009L;
        final long docId = 50L;
        final MockScanFileAdapter adapter = new MockScanFileAdapter();

        final PdfFileTransaction tx = PdfFileTransaction.begin(
                tempDir,
                opId,
                docId,
                NativePdfEngine.PROTECT,
                sourceFile,
                1,
                ORIGINAL_BYTES.length,
                2
        );

        final File stageFile = tx.getStageFile();
        try (FileOutputStream fos = new FileOutputStream(stageFile)) {
            fos.write(TRANSFORMED_BYTES);
            fos.flush();
        }
        tx.markValidated(TRANSFORMED_BYTES.length, PdfFileTransaction.sha256(stageFile));

        // Simulate move to source and file committed
        PdfFileTransaction.atomicMove(stageFile, sourceFile);
        tx.getRecord().phase = PdfFileTransaction.PHASE_FILE_COMMITTED;

        // Corrupt snapshot file hash so rollback fails
        try (FileOutputStream fos = new FileOutputStream(tx.getSnapshotFile())) {
            fos.write("corrupted snapshot bytes".getBytes(StandardCharsets.UTF_8));
            fos.flush();
        }

        tx.rollback(adapter);

        assertTrue("Snapshot file must be preserved on failed rollback", tx.getSnapshotFile().exists());
        assertTrue("Journal file must be preserved on failed rollback", new File(tempDir, opId + ".journal").exists());
    }
}
