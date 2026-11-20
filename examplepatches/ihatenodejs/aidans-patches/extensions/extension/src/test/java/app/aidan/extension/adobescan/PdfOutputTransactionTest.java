package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class PdfOutputTransactionTest {

    private File tempDir;
    private File stagingDir;
    private File inputA;
    private File inputB;

    private static final byte[] BYTES_A = "%PDF-1.7\n1 0 obj Doc A\nendobj\n%%EOF".getBytes(StandardCharsets.UTF_8);
    private static final byte[] BYTES_B = "%PDF-1.7\n1 0 obj Doc B\nendobj\n%%EOF".getBytes(StandardCharsets.UTF_8);
    private static final byte[] COMBINED_BYTES = "%PDF-1.7\n1 0 obj Combined\nendobj\n%%EOF".getBytes(StandardCharsets.UTF_8);

    @Before
    public void setUp() throws Exception {
        tempDir = File.createTempFile("pdf_out_tx_test_", "");
        tempDir.delete();
        tempDir.mkdirs();

        stagingDir = new File(tempDir, "staging");
        stagingDir.mkdirs();

        inputA = new File(tempDir, "input_a.pdf");
        try (FileOutputStream fos = new FileOutputStream(inputA)) {
            fos.write(BYTES_A);
            fos.flush();
        }

        inputB = new File(tempDir, "input_b.pdf");
        try (FileOutputStream fos = new FileOutputStream(inputB)) {
            fos.write(BYTES_B);
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
    public void testSuccessfulCombineTransactionLifecycle() throws Exception {
        long opId = 1001L;
        PdfOutputTransaction tx = PdfOutputTransaction.begin(
                stagingDir,
                opId,
                NativePdfEngine.COMBINE,
                Arrays.asList(inputA, inputB),
                Arrays.asList(1L, 2L),
                "Combined Scan");

        assertNotNull(tx.getStageFile());
        assertEquals(PdfOutputTransaction.PHASE_PREPARING, tx.getRecord().phase);

        // Simulate worker writing stage file
        try (FileOutputStream fos = new FileOutputStream(tx.getStageFile())) {
            fos.write(COMBINED_BYTES);
            fos.flush();
        }

        assertTrue(tx.validateStageOutput());
        assertEquals(PdfOutputTransaction.PHASE_VALIDATED, tx.getRecord().phase);
        assertEquals(COMBINED_BYTES.length, tx.getRecord().outputSize);
        assertNotNull(tx.getRecord().outputSha256);

        assertTrue(tx.revalidateSources());

        File destinationFile = new File(tempDir, "combined_final.pdf");
        tx.markPublishing(destinationFile.getAbsolutePath(), "doc-123");
        assertEquals(PdfOutputTransaction.PHASE_PUBLISHING, tx.getRecord().phase);

        // Write destination file
        try (FileOutputStream fos = new FileOutputStream(destinationFile)) {
            fos.write(COMBINED_BYTES);
            fos.flush();
        }

        tx.markPublished();
        assertFalse(tx.getStageFile().exists());

        // Verify inputs remained unchanged
        assertEquals(BYTES_A.length, inputA.length());
        assertEquals(BYTES_B.length, inputB.length());
    }

    @Test
    public void testRevalidateSourcesFailsIfInputModified() throws Exception {
        long opId = 1002L;
        PdfOutputTransaction tx = PdfOutputTransaction.begin(
                stagingDir,
                opId,
                NativePdfEngine.COMBINE,
                Arrays.asList(inputA, inputB),
                Arrays.asList(1L, 2L),
                "Combined Scan");

        // Write stage file
        try (FileOutputStream fos = new FileOutputStream(tx.getStageFile())) {
            fos.write(COMBINED_BYTES);
            fos.flush();
        }
        assertTrue(tx.validateStageOutput());

        // Modify inputA
        try (FileOutputStream fos = new FileOutputStream(inputA)) {
            fos.write("Modified content".getBytes(StandardCharsets.UTF_8));
            fos.flush();
        }

        assertFalse(tx.revalidateSources());
        tx.abort();
        assertFalse(tx.getStageFile().exists());
    }

    @Test
    public void testRecoveryOfInterruptedPreparingCleansUp() throws Exception {
        long opId = 1003L;
        PdfOutputTransaction tx = PdfOutputTransaction.begin(
                stagingDir,
                opId,
                NativePdfEngine.COMBINE,
                Collections.singletonList(inputA),
                Collections.singletonList(1L),
                "Test Scan");

        // Staging file exists
        try (FileOutputStream fos = new FileOutputStream(tx.getStageFile())) {
            fos.write(COMBINED_BYTES);
            fos.flush();
        }
        assertTrue(tx.getStageFile().exists());

        // Simulate crash / restart: recoverAll
        PdfOutputTransaction.recoverAll(stagingDir);

        // Stage file and journal should be removed, inputs untouched
        assertFalse(tx.getStageFile().exists());
        assertTrue(inputA.exists());
        assertEquals(BYTES_A.length, inputA.length());
    }

    @Test
    public void testAbortCleansUpStaging() throws Exception {
        long opId = 1004L;
        PdfOutputTransaction tx = PdfOutputTransaction.begin(
                stagingDir,
                opId,
                NativePdfEngine.EXPORT_DOCX,
                Collections.singletonList(inputA),
                Collections.singletonList(1L),
                "Exported Doc");

        try (FileOutputStream fos = new FileOutputStream(tx.getStageFile())) {
            fos.write("DOCX STUFF".getBytes(StandardCharsets.UTF_8));
            fos.flush();
        }
        assertTrue(tx.getStageFile().exists());

        tx.abort();
        assertFalse(tx.getStageFile().exists());
        assertTrue(inputA.exists());
    }
}
