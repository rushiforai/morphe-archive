package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.ContextWrapper;
import android.os.ParcelFileDescriptor;
import com.tom_roush.pdfbox.pdmodel.PDDocument;
import com.tom_roush.pdfbox.pdmodel.PDPage;
import com.tom_roush.pdfbox.pdmodel.encryption.AccessPermission;
import com.tom_roush.pdfbox.pdmodel.encryption.StandardProtectionPolicy;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

public class PdfOfficeExporterTest {

    @Rule
    public TemporaryFolder tempFolder = new TemporaryFolder();

    private static class TestParcelFileDescriptor extends ParcelFileDescriptor {
        private final FileDescriptor fd;
        private final File file;

        public TestParcelFileDescriptor(final FileDescriptor fd, final File file) {
            super((ParcelFileDescriptor) null);
            this.fd = fd;
            this.file = file;
        }

        @Override
        public FileDescriptor getFileDescriptor() {
            return fd;
        }

        @Override
        public long getStatSize() {
            return file != null ? file.length() : 0L;
        }
    }

    private File createTestPdf(final String text, final String password) throws Exception {
        final File file = tempFolder.newFile();
        try (final PDDocument doc = new PDDocument()) {
            final PDPage page = new PDPage();
            doc.addPage(page);


            if (password != null) {
                final AccessPermission ap = new AccessPermission();
                final StandardProtectionPolicy spp = new StandardProtectionPolicy(password + "_owner", password, ap);
                spp.setEncryptionKeyLength(128);
                doc.protect(spp);
            }

            doc.save(file);
        }
        return file;
    }

    @Test
    public void testExportProtectedPdfWithoutPasswordFailsWithPasswordRequired() throws Exception {
        final File inputFile = createTestPdf("Encrypted Content", "secret123");
        final File outputFile = tempFolder.newFile();

        final AtomicInteger resultStatus = new AtomicInteger(-1);
        final AtomicInteger resultPages = new AtomicInteger(-1);
        final AtomicLong resultBytes = new AtomicLong(-1);

        try (final RandomAccessFile inRaf = new RandomAccessFile(inputFile, "r");
             final RandomAccessFile outRaf = new RandomAccessFile(outputFile, "rw")) {

            final TestParcelFileDescriptor inPfd = new TestParcelFileDescriptor(inRaf.getFD(), inputFile);
            final TestParcelFileDescriptor outPfd = new TestParcelFileDescriptor(outRaf.getFD(), outputFile);

            PdfOfficeExporter.export(
                    new ContextWrapper(null),
                    inPfd,
                    outPfd,
                    NativePdfEngine.EXPORT_DOCX,
                    null,
                    null,
                    new PdfOfficeExporter.ExportCallback() {
                        @Override
                        public void onProgress(int percent) {}

                        @Override
                        public void onComplete(int status, int pageCount, long outputBytes) {
                            resultStatus.set(status);
                            resultPages.set(pageCount);
                            resultBytes.set(outputBytes);
                        }
                    });
        }

        assertEquals(NativePdfEngine.PASSWORD_REQUIRED, resultStatus.get());
    }

    @Test
    public void testExportProtectedPdfWithWrongPasswordFailsWithWrongPassword() throws Exception {
        final File inputFile = createTestPdf("Encrypted Content", "secret123");
        final File outputFile = tempFolder.newFile();

        final AtomicInteger resultStatus = new AtomicInteger(-1);

        try (final RandomAccessFile inRaf = new RandomAccessFile(inputFile, "r");
             final RandomAccessFile outRaf = new RandomAccessFile(outputFile, "rw")) {

            final TestParcelFileDescriptor inPfd = new TestParcelFileDescriptor(inRaf.getFD(), inputFile);
            final TestParcelFileDescriptor outPfd = new TestParcelFileDescriptor(outRaf.getFD(), outputFile);

            PdfOfficeExporter.export(
                    new ContextWrapper(null),
                    inPfd,
                    outPfd,
                    NativePdfEngine.EXPORT_DOCX,
                    null,
                    "wrongpass",
                    new PdfOfficeExporter.ExportCallback() {
                        @Override
                        public void onProgress(int percent) {}

                        @Override
                        public void onComplete(int status, int pageCount, long outputBytes) {
                            resultStatus.set(status);
                        }
                    });
        }

        assertEquals(NativePdfEngine.WRONG_PASSWORD, resultStatus.get());
    }

    @Test
    public void testExportProtectedPdfWithCorrectPasswordSucceeds() throws Exception {
        final File inputFile = createTestPdf("Encrypted Content", "secret123");
        final File outputFile = tempFolder.newFile();

        final AtomicInteger resultStatus = new AtomicInteger(-1);
        final AtomicInteger resultPages = new AtomicInteger(-1);
        final AtomicLong resultBytes = new AtomicLong(-1);

        try (final RandomAccessFile inRaf = new RandomAccessFile(inputFile, "r");
             final RandomAccessFile outRaf = new RandomAccessFile(outputFile, "rw")) {

            final TestParcelFileDescriptor inPfd = new TestParcelFileDescriptor(inRaf.getFD(), inputFile);
            final TestParcelFileDescriptor outPfd = new TestParcelFileDescriptor(outRaf.getFD(), outputFile);

            PdfOfficeExporter.export(
                    new ContextWrapper(null),
                    inPfd,
                    outPfd,
                    NativePdfEngine.EXPORT_DOCX,
                    null,
                    "secret123",
                    new PdfOfficeExporter.ExportCallback() {
                        @Override
                        public void onProgress(int percent) {}

                        @Override
                        public void onComplete(int status, int pageCount, long outputBytes) {
                            resultStatus.set(status);
                            resultPages.set(pageCount);
                            resultBytes.set(outputBytes);
                        }
                    });
        }

        assertEquals(NativePdfEngine.OK, resultStatus.get());
        assertEquals(1, resultPages.get());
        assertTrue(resultBytes.get() > 0);
        assertTrue(outputFile.length() > 0);
    }

    @Test
    public void testExportUnprotectedPdfSucceeds() throws Exception {
        final File inputFile = createTestPdf("Unprotected Content", null);
        final File outputFile = tempFolder.newFile();

        final AtomicInteger resultStatus = new AtomicInteger(-1);
        final AtomicInteger resultPages = new AtomicInteger(-1);

        try (final RandomAccessFile inRaf = new RandomAccessFile(inputFile, "r");
             final RandomAccessFile outRaf = new RandomAccessFile(outputFile, "rw")) {

            final TestParcelFileDescriptor inPfd = new TestParcelFileDescriptor(inRaf.getFD(), inputFile);
            final TestParcelFileDescriptor outPfd = new TestParcelFileDescriptor(outRaf.getFD(), outputFile);

            PdfOfficeExporter.export(
                    new ContextWrapper(null),
                    inPfd,
                    outPfd,
                    NativePdfEngine.EXPORT_DOCX,
                    null,
                    null,
                    new PdfOfficeExporter.ExportCallback() {
                        @Override
                        public void onProgress(int percent) {}

                        @Override
                        public void onComplete(int status, int pageCount, long outputBytes) {
                            resultStatus.set(status);
                            resultPages.set(pageCount);
                        }
                    });
        }

        assertEquals(NativePdfEngine.OK, resultStatus.get());
        assertEquals(1, resultPages.get());
        assertTrue(outputFile.length() > 0);
    }
}
