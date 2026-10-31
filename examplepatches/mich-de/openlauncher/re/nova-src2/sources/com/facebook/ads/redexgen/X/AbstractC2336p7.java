package com.facebook.ads.redexgen.X;

import android.app.Activity;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.p7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2336p7 {
    public static byte[] A00;
    public static String[] A01 = {"xZfMamQuDxA6bTypucZ197RYNE4mvlcN", "WM0zVtm2JGvaa9vSTXp0h2YRnQYxQrEK", "zqBzoL42qzu0Qf2lHCAA6YBTmmWkuand", "YX", "FDV889hBrMc5nJiB7wS69W2fLt8zA89o", "6y0uOKezMm2TBG2XREAais4zy5M1tLxd", "BNfVr0yjl5IIjo2JSDZlUi53002WU8UZ", "l8KF2ZVrYmK9QbzsZWlXvJRb7XPAUhEH"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 8
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static Activity A01() throws IllegalAccessException, NoSuchFieldException, NoSuchMethodException, ClassNotFoundException, IllegalArgumentException, InvocationTargetException {
        Class<?> cls = Class.forName(A02(8, 26, 42));
        Object objInvoke = cls.getMethod(A02(34, 21, 81), new Class[0]).invoke(null, new Object[0]);
        String[] strArr = A01;
        if (strArr[5].charAt(1) == strArr[0].charAt(1)) {
            throw new RuntimeException();
        }
        A01[3] = "txwguCj";
        Field declaredField = cls.getDeclaredField(A02(55, 11, 68));
        declaredField.setAccessible(true);
        Map map = (Map) declaredField.get(objInvoke);
        if (map == null) {
            return null;
        }
        for (Object obj : map.values()) {
            Class<?> cls2 = obj.getClass();
            Field declaredField2 = cls2.getDeclaredField(A02(66, 6, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
            declaredField2.setAccessible(true);
            if (!declaredField2.getBoolean(obj)) {
                Field declaredField3 = cls2.getDeclaredField(A02(0, 8, 94));
                declaredField3.setAccessible(true);
                return (Activity) declaredField3.get(obj);
            }
        }
        return null;
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 27);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-38, -36, -19, -30, -17, -30, -19, -14, -90, -77, -87, -73, -76, -82, -87, 115, -90, -75, -75, 115, -122, -88, -71, -82, -69, -82, -71, -66, -103, -83, -73, -86, -90, -87, -49, -31, -34, -34, -47, -38, -32, -83, -49, -32, -43, -30, -43, -32, -27, -64, -44, -34, -47, -51, -48, -52, -96, -62, -45, -56, -43, -56, -45, -56, -60, -46, 7, -8, 12, 10, -4, -5};
    }

    static {
        A03();
    }

    public static Activity A00() {
        try {
            return A01();
        } catch (Exception unused) {
            return null;
        }
    }
}
