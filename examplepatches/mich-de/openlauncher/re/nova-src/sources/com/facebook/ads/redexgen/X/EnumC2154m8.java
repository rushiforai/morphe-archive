package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.m8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2154m8 {
    A0A,
    A09,
    A08,
    A07,
    A0B,
    A0C;

    public static byte[] A00;
    public static String[] A01 = {"oPqcTm20BoxIEQwqRq2w9mMrP", "3EkcZ4a0rGIsiHktRrpr81XlbmoCROuf", "AtD4bH5cXt4hw8G2t6Kd0osax7SQxJ2c", "gjl", "PUBpBHS6XmY5a3ZMXJuQoJxK0EDvtURf", "BvSssZJdK95GYCvUw8yv4pFiYtLUTAU", "lAq3CknrsRJ3LzBv8dUfjTxHcjpPifVj", "jJQg0mOA9ThJOW65gHBJqxZ17zJtti2b"};
    public static volatile long A02;
    public static volatile long A03;
    public static volatile EnumC2154m8 A04;
    public static volatile EnumC2154m8 A05;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 36);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {112, 101, 101, 116, 124, 97, 101, 116, 117, 110, 112, AbstractJsonLexerKt.TC_INVALID, 117, 110, 119, 112, 120, 125, 116, 117, 89, 76, 76, 93, 85, 72, 76, 93, 92, 71, 89, 86, 92, 71, 94, 93, 84, 84, 71, 90, 89, 91, 83, 71, 76, 87, 71, 84, 87, 91, 89, 84, 116, 97, 97, 112, 120, 101, 97, 112, 113, 106, 116, 123, 113, 106, 102, 96, 118, 118, 112, 112, 113, 112, 113, 119, 98, 98, 115, 123, 102, 98, AbstractJsonLexerKt.TC_INVALID, 120, 113, 56, 57, 34, 41, 51, 56, 55, 52, 58, 51, 50, 41, 63, 56, 41, 52, 63, 50, 41, 34, 57, 61, 51, 56, 104, 105, 114, 121, 99, 104, 103, 100, 106, 99, 98, 121, 105, 104, 121, 101, 106, 111, 99, 104, 114};
        if (A01[7].charAt(0) != 'j') {
            throw new RuntimeException();
        }
        A01[3] = "SHM";
        A00 = bArr;
    }

    static {
        A01();
    }

    public static synchronized void A02(EnumC2154m8 enumC2154m8) {
        A04 = enumC2154m8;
        A02 = System.currentTimeMillis();
    }

    public static synchronized void A03(EnumC2154m8 enumC2154m8) {
        A05 = enumC2154m8;
        A03 = System.currentTimeMillis();
    }

    public static synchronized boolean A04(EnumC2154m8 enumC2154m8, EnumC2154m8 enumC2154m82) {
        if (A04 != enumC2154m8) {
            return false;
        }
        A04 = enumC2154m82;
        A02 = System.currentTimeMillis();
        return true;
    }

    public static synchronized boolean A05(EnumC2154m8 enumC2154m8, EnumC2154m8 enumC2154m82) {
        if (A05 != enumC2154m8) {
            return false;
        }
        A05 = enumC2154m82;
        A03 = System.currentTimeMillis();
        return true;
    }
}
