package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.io.File;
import org.junit.Test;

public class ScanFileAdapterTest {

    public static class MockNameB {
        public String b = "Tax Return 2025";
        public String a = "Tax Return 2025.pdf";
    }

    public static class MockNameA {
        public String b = null;
        public String a = "Receipt Oct 2026.pdf";
    }

    public static class MockNameUrn {
        public String b = "urn:aaid:sc:US:63ba355e-1234";
        public String a = "urn:aaid:sc:US:63ba355e-1234.pdf";
    }

    public static class MockScanFileWithB {
        public MockNameB p() {
            return new MockNameB();
        }
    }

    public static class MockScanFileWithA {
        public MockNameA p() {
            return new MockNameA();
        }
    }

    public static class MockScanFileWithUrnAndFile {
        public MockNameUrn p() {
            return new MockNameUrn();
        }

        public File k() {
            return new File("/tmp/Valid Scan Name.pdf");
        }
    }

    public static class MockScanFileAllUrn {
        public MockNameUrn p() {
            return new MockNameUrn();
        }

        public File k() {
            return new File("/tmp/urn:aaid:sc:US:63ba355e-1234.pdf");
        }
    }

    @Test
    public void testNullReturnsScan() {
        assertEquals("Scan", ScanFileAdapter.getInstance().getDisplayName(null));
    }

    @Test
    public void testResolvesFieldB() {
        assertEquals("Tax Return 2025", ScanFileAdapter.getInstance().getDisplayName(new MockScanFileWithB()));
    }

    @Test
    public void testResolvesFieldAWhenBMissing() {
        assertEquals("Receipt Oct 2026", ScanFileAdapter.getInstance().getDisplayName(new MockScanFileWithA()));
    }

    @Test
    public void testRejectsUrnAndFallsBackToFile() {
        assertEquals("Valid Scan Name", ScanFileAdapter.getInstance().getDisplayName(new MockScanFileWithUrnAndFile()));
    }

    @Test
    public void testRejectsAllUrnsAndReturnsDefaultScan() {
        assertEquals("Scan", ScanFileAdapter.getInstance().getDisplayName(new MockScanFileAllUrn()));
    }

    @Test
    public void testCreateLocalDocumentRejectsInvalidFile() {
        assertNull(ScanFileAdapter.getInstance().createLocalDocument(null, "Test", 1));
        assertNull(ScanFileAdapter.getInstance().createLocalDocument(new File("/nonexistent/path/to/doc.pdf"), "Test", 1));
    }
}
