package com.facebook.ads.redexgen.X;

import android.view.Surface;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Xp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1354Xp {
    public static byte[] A00;
    public static String[] A01 = {"B9TJqklarPRFtfXsOo6I58cUd9q9Kscm", "6UePzNsgB1ds96rs0ndO", "DTygtfV4bhaTAO5ZiHdZxQ27teMVSSX9", "rXjWUYna41IY7pcXCJJndleKYuaPVeYl", "DNwhpvkHSCgdUOCUEQDdrRjWuet3YdvQ", "kqess2NDGK", "qown7fUHytRGu6mVFVqi7Yf48PkFWs5k", "OhNFnmzff46Kq9n7rk"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[5].length() != 10) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "urIJOIyy4aevi5vEN5";
            strArr[1] = "JLkAHhTV3YENb2sywu8n";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 86);
            i13++;
        }
    }

    public static void A01() {
        A00 = new byte[]{90, 125, 117, 112, 121, 120, 60, 104, 115, 60, AbstractJsonLexerKt.TC_INVALID, 125, 112, 112, 60, 79, 105, 110, 122, 125, AbstractJsonLexerKt.TC_INVALID, 121, 50, 111, 121, 104, 90, 110, 125, 113, 121, 78, 125, 104, 121, 52, 11, 6, 7, 13, 36, 16, 3, 15, 7, 48, 7, 14, 7, 3, 17, 7, 42, 7, 14, 18, 7, 16};
    }

    static {
        A01();
    }

    public static void A02(Surface surface, float f11) {
        int compatibility;
        if (f11 == 0.0f) {
            compatibility = 0;
        } else {
            compatibility = 1;
        }
        try {
            surface.setFrameRate(f11, compatibility);
        } catch (IllegalStateException e3) {
            MV.A08(A00(35, 23, 52), A00(0, 35, 74), e3);
        }
    }
}
