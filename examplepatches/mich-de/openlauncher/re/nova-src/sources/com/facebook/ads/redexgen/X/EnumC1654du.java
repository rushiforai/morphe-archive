package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.du, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1654du {
    A05,
    A04,
    A03;

    public static byte[] A00;
    public static String[] A01 = {"7GN8MrenydislHWBBPReIB", "P5", "QDtKUFo4Pv7jZ7qumv108KMzWf6HrSMn", "iim9AI0VqZedzbhMlrV0qDo4YMl61NlV", "LtGcJkDv8PpKzGxu4pknm0pyAahoAI9h", "Z7tecEc8tS2JrzNmQM0R9CjEnjCb6ksC", "JuvL09EyJViLP4nPFPxPBzJM00GhcqAu", "kQTCJlS50BSCbahTVqCDmy8LW1L9RVvG"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{66, 69, 64, 65, 91, 75, 81, 80, 91, 75, 74, 91, 84, 72, 69, 93, 101, 98, 122, AbstractJsonLexerKt.TC_INVALID, 101, 110, 96, 105, 5, 26, 0, 26, 17, 31, 22};
    }

    static {
        A01();
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    public static EnumC1654du[] valuesCustom() throws CloneNotSupportedException {
        Object objClone = values().clone();
        String[] strArr = A01;
        if (strArr[1].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        A01[3] = "fXviZ9AMoZT5h2KBZwjslTMVyIobOTux";
        return (EnumC1654du[]) objClone;
    }
}
