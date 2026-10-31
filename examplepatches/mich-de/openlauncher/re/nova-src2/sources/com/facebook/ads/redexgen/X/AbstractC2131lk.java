package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.lk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2131lk {
    public static byte[] A00;
    public static String[] A01 = {"a6IxlCkVmcf1QOD6ZYjDV7INHBfwC5pE", "pjHGmgbtiOqji60ouNqSwKm8iDwdL2il", "jT1wBn6CKnjHaXeX1", "64rNhN6ZFhDWGxpIQ", "ze8vByysvbBiliYVuotBM6Di85tpEUzv", "oRRmyqjSmqskFAvbDRZ10d57ZrKFDjEI", "44vbl6FfanMIMy7ytQNCDD1eXfOrnFTF", "rkbwsxy0OcV7GrP7ELmdkRDeQR2uGuGh"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            if (A01[1].charAt(1) == 'a') {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[4] = "1M2Y98BwTvEPUGLlCwxj254fliWahs1n";
            strArr[0] = "azYACSqPfJkxfvivKERNz1YXvsYHtm8K";
            bArrCopyOfRange[i13] = (byte) (i14 - 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{-47, -12, -20, -20, -18, -13, -20, -91, -45, -22, -7, -4, -12, -9, -16, -91, -54, -5, -22, -13, -7, -52, -35, -38, -55, -36, -47, -41, -42, 28, 41, 41, 38, 41, -9, 3, 3, -1, -18, 2, 3, -16, 3, 4, 2, -18, -14, -2, -13, -12, 22, 13, 28, 31, 23, 26, 19, -38, -53, -29, -42, -39, -53, -50, -55, -35, -45, -28, -49, 15, 16, -3, 14, 16, -5, 16, 5, 9, 1, -40, -45, -49, -46, -60, -57, -62, -42, -52, -35, -56};
    }

    static {
        A02();
    }

    public static JSONObject A01(C2095lA c2095lA, long j11, long j12, long j13, long j14, int i5, Exception exc) throws JSONException {
        String strA00;
        double d5;
        JSONObject jSONObject = new JSONObject();
        try {
            try {
                jSONObject.put(A00(69, 10, 88), j11);
                strA00 = A00(21, 8, 36);
                d5 = j12;
            } catch (JSONException e3) {
                e = e3;
            }
        } catch (JSONException e11) {
            e = e11;
        }
        if (A01[1].charAt(1) == 'a') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[5] = "jMg5lz9yrKYKrG7ow7Rg5ttUcJr1AiZd";
        strArr[6] = "pmFVBxkrFRXwpMq5qFraASgBsRnTrBpW";
        try {
            jSONObject.put(strA00, d5 / 1000.0d);
            try {
                jSONObject.put(A00(57, 12, 38), j13);
                try {
                    jSONObject.put(A00(79, 11, 31), j14);
                    try {
                        jSONObject.put(A00(34, 16, 75), i5);
                        if (exc != null) {
                            jSONObject.put(A00(29, 5, 115), exc.getMessage());
                        }
                    } catch (JSONException e12) {
                        e = e12;
                        c2095lA.A08().A4j(e);
                        return jSONObject;
                    }
                } catch (JSONException e13) {
                    e = e13;
                }
            } catch (JSONException e14) {
                e = e14;
            }
        } catch (JSONException e15) {
            e = e15;
        }
        return jSONObject;
    }

    public static void A03(C2095lA c2095lA, long j11, long j12, long j13, long j14, int i5, Exception exc) {
        C2127lg c2127lg = new C2127lg(A00(0, 21, 65));
        c2127lg.A05(1);
        c2127lg.A07(A01(c2095lA, j11, j12, j13, j14, i5, exc));
        c2095lA.A08().AD0(A00(50, 7, 100), AbstractC2126lf.A20, c2127lg);
    }
}
