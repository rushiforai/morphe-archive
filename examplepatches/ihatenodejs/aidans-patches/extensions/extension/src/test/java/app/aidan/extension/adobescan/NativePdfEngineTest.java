package app.aidan.extension.adobescan;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class NativePdfEngineTest {

    @Test
    public void testOperationConstants() {
        assertEquals(1, NativePdfEngine.COMPRESS);
        assertEquals(2, NativePdfEngine.PROTECT);
        assertEquals(3, NativePdfEngine.UNPROTECT);
        assertEquals(4, NativePdfEngine.COMBINE);
        assertEquals(5, NativePdfEngine.EXPORT_DOCX);
        assertEquals(6, NativePdfEngine.EXPORT_XLSX);
        assertEquals(7, NativePdfEngine.EXPORT_PPTX);
    }

    @Test
    public void testStatusConstants() {
        assertEquals(0, NativePdfEngine.OK);
        assertEquals(1, NativePdfEngine.NO_SAVINGS);
        assertEquals(2, NativePdfEngine.CANCELLED);
        assertEquals(3, NativePdfEngine.INVALID_PDF);
        assertEquals(4, NativePdfEngine.PASSWORD_REQUIRED);
        assertEquals(5, NativePdfEngine.WRONG_PASSWORD);
        assertEquals(6, NativePdfEngine.UNSUPPORTED_PDF);
        assertEquals(7, NativePdfEngine.IO_ERROR);
        assertEquals(8, NativePdfEngine.ENGINE_FAILURE);
        assertEquals(9, NativePdfEngine.ALREADY_UNPROTECTED);
    }

    @Test
    public void testCompressionLevelConstants() {
        assertEquals(0, NativePdfEngine.HIGH);
        assertEquals(1, NativePdfEngine.LOW);
    }
}
