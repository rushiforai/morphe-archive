package com.facebook.ads.redexgen.X;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.Arrays;
import org.checkerframework.checker.nullness.qual.EnsuresNonNull;

/* loaded from: assets/audience_network/classes.dex */
public final class XZ {
    public static Constructor<?> A00;
    public static Constructor<?> A01;
    public static Method A02;
    public static Method A03;
    public static Method A04;
    public static byte[] A05;
    public static String[] A06 = {"eu05oA", "WfEYyrkWKDczQQs6EpnQVx6r1PNsdBuZ", "6mDWkQ", "K9Z6hG9phcTLRo9VVn8qo09aG4zNy8oH", "9i09uX", "07ACxvvx6ucHgjW2fwcJ87I6TEHnGEba", "IwREdo", "Q8Or3ZDZqxr9uSZLNEJjFVWmMNJoCXAt"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A05 = new byte[]{-53, -34, -46, -43, -51, -48, -36, -38, -101, -45, -50, -48, -46, -49, -36, -36, -40, -101, -50, -47, -32, -101, -50, -37, -47, -33, -36, -42, -47, -27, -101, -38, -46, -47, -42, -50, -96, -101, -46, -27, -36, -35, -39, -50, -26, -46, -33, -101, -46, -45, -45, -46, -48, -31, -101, -79, -46, -45, -50, -30, -39, -31, -61, -42, -47, -46, -36, -77, -33, -50, -38, -46, -67, -33, -36, -48, -46, -32, -32, -36, -33, -111, -77, -50, -48, -31, -36, -33, -26, -111, -81, -30, -42, -39, -47, -46, -33, -35, -23, -25, -88, -32, -37, -35, -33, -36, -23, -23, -27, -88, -37, -34, -19, -88, -37, -24, -34, -20, -23, -29, -34, -14, -88, -25, -33, -34, -29, -37, -83, -88, -33, -14, -23, -22, -26, -37, -13, -33, -20, -88, -33, -32, -32, -33, -35, -18, -88, -51, -35, -37, -26, -33, -69, -24, -34, -52, -23, -18, -37, -18, -33, -50, -20, -37, -24, -19, -32, -23, -20, -25, -37, -18, -29, -23, -24, -98, -68, -17, -29, -26, -34, -33, -20, 54, 40, 55, 21, 50, 55, 36, 55, 44, 50, 49, 7, 40, 42, 53, 40, 40, 54};
    }

    static {
        A03();
    }

    public static M6 A00(float f11) throws Exception {
        A04();
        Object objNewInstance = A00.newInstance(new Object[0]);
        A04.invoke(objNewInstance, Float.valueOf(f11));
        Object builder = A02.invoke(objNewInstance, new Object[0]);
        AbstractC1062Ln.A01(builder);
        return null;
    }

    public static N3 A01() throws Exception {
        A04();
        Object builder = A03.invoke(A01.newInstance(new Object[0]), new Object[0]);
        AbstractC1062Ln.A01(builder);
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x005d  */
    @EnsuresNonNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A04() throws Exception {
        Constructor<?> constructor = A00;
        String strA02 = A02(0, 5, 30);
        String[] strArr = A06;
        if (strArr[0].length() != strArr[6].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[1] = "gyse3TwgdjTT9qQRFr8wU78EOVzUblV4";
        strArr2[5] = "qxnLeXUToHQSBEhPoOa1VGuM8Ct96GN6";
        if (constructor != null) {
            Method method = A04;
            String[] strArr3 = A06;
            if (strArr3[4].length() != strArr3[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr4 = A06;
            strArr4[1] = "7nBN6UpD5k1MY1LIXOsSDDGZY9iU4q4R";
            strArr4[5] = "XcRWRbcFW5xJRfg3Zi177agndEK16bFi";
            if (method == null || A02 == null) {
                Class<?> cls = Class.forName(A02(97, 86, 47));
                A00 = cls.getConstructor(new Class[0]);
                Class<?> scaleAndRotateTransformationBuilderClass = Float.TYPE;
                A04 = cls.getMethod(A02(183, 18, 120), scaleAndRotateTransformationBuilderClass);
                A02 = cls.getMethod(strA02, new Class[0]);
            }
        }
        if (A01 == null || A03 == null) {
            Class<?> cls2 = Class.forName(A02(5, 92, 34));
            A01 = cls2.getConstructor(new Class[0]);
            A03 = cls2.getMethod(strA02, new Class[0]);
        }
    }
}
