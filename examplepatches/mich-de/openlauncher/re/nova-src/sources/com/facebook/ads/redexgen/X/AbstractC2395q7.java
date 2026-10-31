package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.q7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2395q7 {
    public static byte[] A00;
    public static String[] A01 = {"ALJ1zZNxKg2cm5XBVz8Qvan3LdINNR", "FrhJoP4b8S8XNnYs", "E80rxgNI", "IclNy8kieg3vtyicoO1BFqMxHvI1x8Xz", "VOW9zI4C5aAHlLrFYMkK7GkI5vE3pxLD", "HFbodM1TM", "8DinB8eMfdaXiJmxwNrU", "5q4sG9SLRv9vF1YhmTWFZWswNdogaztK"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 126);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{9, 18, 22, 74, -29, -27, -27, 61, -5, -18};
    }

    static {
        A02();
    }

    public static String A01(long j11) {
        String string;
        String strA00 = A00(0, 0, 86);
        if (j11 < 1000) {
            string = j11 + strA00;
        } else {
            String strA002 = A00(0, 4, 102);
            if (j11 < 1000000) {
                StringBuilder sb2 = new StringBuilder();
                String formattedNumber = String.format(Locale.US, strA002, Double.valueOf(j11 / 1000.0d));
                StringBuilder sbAppend = sb2.append(formattedNumber);
                String formattedNumber2 = A00(8, 1, 50);
                string = sbAppend.append(formattedNumber2).toString();
            } else {
                String formattedNumber3 = A01[1];
                if (formattedNumber3.length() != 16) {
                    throw new RuntimeException();
                }
                A01[1] = "6iqYU8dOs8cCB24l";
                if (j11 < 1000000000) {
                    StringBuilder sb3 = new StringBuilder();
                    String formattedNumber4 = String.format(Locale.US, strA002, Double.valueOf(j11 / 1000000.0d));
                    StringBuilder sbAppend2 = sb3.append(formattedNumber4);
                    String formattedNumber5 = A00(9, 1, 35);
                    string = sbAppend2.append(formattedNumber5).toString();
                } else {
                    StringBuilder sb4 = new StringBuilder();
                    String formattedNumber6 = String.format(Locale.US, strA002, Double.valueOf(j11 / 1.0E9d));
                    StringBuilder sbAppend3 = sb4.append(formattedNumber6);
                    String formattedNumber7 = A00(7, 1, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                    string = sbAppend3.append(formattedNumber7).toString();
                }
            }
        }
        String strA003 = A00(4, 3, 55);
        if (string.contains(strA003)) {
            return string.replace(strA003, strA00);
        }
        return string;
    }
}
