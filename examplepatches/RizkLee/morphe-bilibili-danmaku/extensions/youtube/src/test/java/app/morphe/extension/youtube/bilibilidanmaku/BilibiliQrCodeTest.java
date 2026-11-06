package app.morphe.extension.youtube.bilibilidanmaku;

import static org.junit.Assert.*;

import org.junit.Test;

/** The login QR encoder was cross-checked against the Python "qrcode" reference for versions 1-21 and all masks. */
public class BilibiliQrCodeTest {
    private static final String[] HELLO_MASK0 = {
            "111111100110001111111", "100000101100001000001", "101110100101101011101",
            "101110100011001011101", "101110101100101011101", "100000100000101000001",
            "111111101010101111111", "000000000011100000000", "101010100101000010010",
            "001011000010001000011", "010100101110100011111", "110010000000001000010",
            "011010110010101010000", "000000001111010100111", "111111100011011100111",
            "100000100011110110000", "101110101011011100011", "101110100100001100110",
            "101110101110100010101", "100000100100001010010", "111111101110101100011"};

    @Test public void matchesReferenceEncoder() {
        BilibiliQrCode code = BilibiliQrCode.encode("hello", 0);
        assertEquals(1, code.version);
        assertEquals(21, code.size);
        for (int y = 0; y < code.size; y++) {
            StringBuilder row = new StringBuilder();
            for (int x = 0; x < code.size; x++) row.append(code.get(x, y) ? '1' : '0');
            assertEquals("row " + y, HELLO_MASK0[y], row.toString());
        }
    }

    @Test public void loginLinkFitsAndHasFinderPatterns() {
        String url = "https://account.bilibili.com/h5/account-h5/auth/scan-web?navhide=1&callback=close"
                + "&qrcode_key=70f2e1d10f7d069089fd9e7b0b2be5ac&from=main-fe-header";
        BilibiliQrCode code = BilibiliQrCode.encode(url);
        assertEquals(8, code.version);
        assertTrue(code.mask >= 0 && code.mask < 8);
        int last = code.size - 1;
        for (int i = 0; i < 7; i++) {
            assertTrue(code.get(i, 0));
            assertTrue(code.get(last - i, 0));
            assertTrue(code.get(0, last - i));
        }
        assertFalse(code.get(1, 1));
        assertTrue(code.get(3, 3));
        assertTrue(code.get(8, code.size - 8)); // Dark module.
    }

    @Test public void dataCapacityMatchesSpecification() {
        assertEquals(16, BilibiliQrCode.dataCodewords(1));
        assertEquals(154, BilibiliQrCode.dataCodewords(8));
        assertEquals(2334, BilibiliQrCode.dataCodewords(40));
    }
}
