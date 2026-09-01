package com.drew.metadata.iptc;

import java.nio.ByteBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class Iso2022Converter {
    private static final int DOT = 14844066;
    private static final byte DOT_SIGN = 46;
    private static final byte ESC = 27;
    private static final String ISO_8859_1 = "ISO-8859-1";
    private static final byte LATIN_CAPITAL_A = 65;
    private static final byte LATIN_CAPITAL_G = 71;
    private static final byte MINUS_SIGN = 45;
    private static final byte PERCENT_SIGN = 37;
    private static final String UTF_8 = "UTF-8";

    private Iso2022Converter() {
    }

    public static String convertISO2022CharsetToJavaCharset(byte[] bArr) {
        if (bArr.length > 2 && bArr[0] == 27 && bArr[1] == 37 && bArr[2] == 71) {
            return UTF_8;
        }
        if (bArr.length > 2 && bArr[0] == 27 && bArr[1] == 46 && bArr[2] == 65) {
            return ISO_8859_1;
        }
        if (bArr.length > 3 && bArr[0] == 27 && ((bArr[3] & 255) | ((bArr[2] & 255) << 8) | ((bArr[1] & 255) << 16)) == DOT && bArr[4] == 65) {
            return ISO_8859_1;
        }
        if (bArr.length > 2 && bArr[0] == 27 && bArr[1] == 45 && bArr[2] == 65) {
            return ISO_8859_1;
        }
        return null;
    }

    public static Charset guessCharSet(byte[] bArr) {
        String[] strArr = {UTF_8, System.getProperty("file.encoding"), ISO_8859_1};
        for (int i = 0; i < 3; i++) {
            Charset charsetForName = Charset.forName(strArr[i]);
            try {
                charsetForName.newDecoder().decode(ByteBuffer.wrap(bArr));
                return charsetForName;
            } catch (CharacterCodingException unused) {
            }
        }
        return null;
    }
}
