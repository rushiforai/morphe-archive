package app.morphe.extension.youtube.bilibilidanmaku;

import static org.junit.Assert.*;

import org.junit.Test;

public class BilibiliDanmakuAuthTest {
    @Test public void correspondPathIsHexOfRsaOaepCiphertext() throws Exception {
        String first = BilibiliDanmakuAuth.correspondPath(1684466082562L);
        String second = BilibiliDanmakuAuth.correspondPath(1684466082562L);
        // 1024-bit RSA key: 128 byte ciphertext, lower-case hex, randomised by OAEP padding.
        assertEquals(256, first.length());
        assertTrue(first.matches("[0-9a-f]{256}"));
        assertNotEquals(first, second);
    }

    @Test public void appLinkWrapsAuthorisationPage() {
        String link = BilibiliDanmakuAuth.appAuthorisationLink(
                "https://account.bilibili.com/h5/account-h5/auth/scan-web?navhide=1&qrcode_key=abc");
        assertTrue(link.startsWith("bilibili://browser?url=https%3A%2F%2Faccount.bilibili.com"));
        assertFalse(link.substring("bilibili://browser?url=".length()).contains("&"));
    }

    @Test public void cookieValuesRejectHeaderInjection() {
        assertTrue(BilibiliDanmakuSession.validCookieValue("abc123%2C1767225600%2Cdef45*b1"));
        assertFalse(BilibiliDanmakuSession.validCookieValue("abc; Path=/"));
        assertFalse(BilibiliDanmakuSession.validCookieValue("abc\r\nX: y"));
        assertFalse(BilibiliDanmakuSession.validCookieValue(""));
    }
}
