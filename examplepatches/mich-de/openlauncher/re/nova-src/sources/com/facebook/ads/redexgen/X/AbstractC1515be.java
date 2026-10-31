package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.be, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1515be {
    public static byte[] A00;
    public static String[] A01 = {"48XKwvEfJwcBdJlmydZ9q3zfkin", "6Eo7i0CZW1196XN", "aXowqGz1hBflQs7Fuf7fRoRGcNLFrTNx", "gAAFCtpqIzP3FTGJKsRiwumwgWIAbR0S", "PLtPm1eHapmuYi4h4OX7mFr2OXf", "6zIbnojHGkgqELK", "waa5U278dWyFSUddW0JUuxhgYdzAs96v", "yzz8W9jxPw0m7asRAapG6VLaofjK"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 26);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{83, 117, 113, 69, 100, 121, 124, 2, 58, 56, 33, 33, 56, 63, 54, 113, 35, 52, 60, 48, 56, 63, 53, 52, 35, 113, 62, 55, 113, 60, 48, 61, 55, 62, 35, 60, 52, 53, 113, 2, 20, 24, 113, 31, 16, 29, 113, 36, 63, 56, 37, AbstractJsonLexerKt.TC_INVALID};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 14 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static void A04(long j11, C1084Mk c1084Mk, ZP[] zpArr) {
        int iA0I = c1084Mk.A0I();
        if ((iA0I & 64) != 0) {
            c1084Mk.A0g(1);
            int i5 = (iA0I & 31) * 3;
            int iA09 = c1084Mk.A09();
            for (ZP zp2 : zpArr) {
                c1084Mk.A0f(iA09);
                zp2.AK9(c1084Mk, i5);
                zp2.AKC(j11, 1, i5, 0, null);
            }
        }
    }

    static {
        A02();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(C1084Mk c1084Mk) {
        int i5 = 0;
        while (value != 0) {
            int b11 = c1084Mk.A0I();
            i5 += b11;
            if (b11 != 255) {
                return i5;
            }
        }
        return -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0039  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A03(long j11, C1084Mk c1084Mk, ZP[] zpArr) {
        while (true) {
            if (c1084Mk.A07() > 1) {
                int iA00 = A00(c1084Mk);
                int nextPayloadPosition = A00(c1084Mk);
                int iA09 = c1084Mk.A09() + nextPayloadPosition;
                if (nextPayloadPosition != -1) {
                    int iA07 = c1084Mk.A07();
                    if (A01[6].charAt(29) != '9') {
                        throw new RuntimeException();
                    }
                    A01[7] = "BK517ofCJita5znccar4agPI4WAj";
                    if (nextPayloadPosition > iA07) {
                        MV.A07(A01(0, 7, 10), A01(7, 45, 75));
                        iA09 = c1084Mk.A0A();
                    } else if (iA00 == 4 && nextPayloadPosition >= 8) {
                        int userDataTypeCode = c1084Mk.A0I();
                        int iA0M = c1084Mk.A0M();
                        int userIdentifier = 0;
                        if (iA0M == 49) {
                            userIdentifier = c1084Mk.A0C();
                        }
                        int iA0I = c1084Mk.A0I();
                        if (iA0M == 47) {
                            c1084Mk.A0g(1);
                        }
                        int i5 = (userDataTypeCode == 181 && (iA0M == 49 || iA0M == 47) && iA0I == 3) ? 1 : 0;
                        if (iA0M == 49) {
                            int providerCode = userIdentifier != 1195456820 ? 0 : 1;
                            i5 &= providerCode;
                        }
                        if (i5 != 0) {
                            A04(j11, c1084Mk, zpArr);
                        }
                    }
                }
                c1084Mk.A0f(iA09);
            } else {
                return;
            }
        }
    }
}
