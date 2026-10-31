package com.facebook.ads.redexgen.X;

import android.app.ActivityManager;
import android.content.Context;
import android.content.IntentFilter;
import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Environment;
import android.os.StatFs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.lp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2136lp {
    public static Sensor A00;
    public static Sensor A01;
    public static SensorEventListener A02;
    public static SensorEventListener A03;
    public static SensorManager A04;
    public static byte[] A05;
    public static String[] A06 = {"b6J5OF3acjfDP5XdyeFWlX714gZNNS0V", "bvdY52fd394YA8DHF2AacKmBhwZUhhl0", "30Yy9fi50QmMl9Boio33GGJ", "ecsdrzPzIBVEjJjtjF1fiRSY0Jbv5jtj", "QghajC4mni0N20aoGlTyG9Kdg8iFV0DW", "aGbfNp7N5f3KMLUY6R1I1ytOxUov95yg", b.f42142b, b.f42142b};
    public static final Map<String, String> A07;
    public static final AtomicReference<String> A08;
    public static final String[] A09;
    public static volatile float[] A0A;
    public static volatile float[] A0B;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 78);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A05 = new byte[]{-97, -12, -16, -14, -14, -12, -5, -12, 1, -2, -4, -12, 3, -12, 1, -18, -67, -65, -48, -59, -46, -59, -48, -43, 41, 54, 44, 58, 55, 49, 44, -10, 49, 54, 60, 45, 54, 60, -10, 41, 43, 60, 49, 55, 54, -10, 10, 9, 28, 28, 13, 26, 33, 39, 11, 16, 9, 22, 15, 13, 12, 23, 44, 23, 31, 34, 23, 24, 34, 27, 21, 35, 27, 35, 37, 40, 47, 33, 32, 51, 51, 36, 49, 56, -4, 1, -6, 11, 0, 2, 7, 0, 35, 47, 34, 34, 28, 48, 45, 30, 32, 34, -18, -20, -11, -20, -7, -16, -22, 19, 12, 29, 12, 19, -60, -63, -58, -77, -58, -69, -63, -64, -79, -60, -76, -78, -67, -74, 4, -10, -1, 4, 0, 3, 8, 9, -10, 9, 10, 8, 45, 40, 45, 26, 37, 24, 38, 30, 38, 40, 43, 50, 16, 17, -49};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 6 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static void A08(Context context) {
        StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
        String strValueOf = String.valueOf(statFs.getAvailableBlocks() * statFs.getBlockSize());
        A08.set(strValueOf);
        A07.put(A01(92, 10, 111), strValueOf);
    }

    static {
        A03();
        A04 = null;
        A00 = null;
        A01 = null;
        A07 = new ConcurrentHashMap();
        A09 = new String[]{A01(152, 1, 74), A01(153, 1, 74), A01(154, 1, 7)};
        A08 = new AtomicReference<>();
    }

    public static String A00() {
        return A08.get();
    }

    public static Map<String, String> A02() {
        HashMap map = new HashMap();
        Map<String, String> currentAnalogInfo = A07;
        map.putAll(currentAnalogInfo);
        A0C(map);
        return map;
    }

    public static synchronized void A06() {
        if (A04 != null) {
            A04.unregisterListener(A02);
        }
        A02 = null;
    }

    public static synchronized void A07() {
        if (A04 != null) {
            A04.unregisterListener(A03);
        }
        A03 = null;
    }

    public static void A09(Context context) {
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        ((ActivityManager) YQ.A00((ActivityManager) context.getSystemService(A01(16, 8, 14)))).getMemoryInfo(memoryInfo);
        A07.put(A01(61, 16, 104), String.valueOf(memoryInfo.availMem));
        A07.put(A01(140, 12, 107), String.valueOf(memoryInfo.totalMem));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v0, types: [android.content.Context, com.facebook.ads.redexgen.X.lA] */
    /* JADX WARN: Type inference failed for: r6v1, types: [com.facebook.ads.redexgen.X.lA] */
    /* JADX WARN: Type inference failed for: r6v2, types: [android.content.Intent] */
    public static void A0A(C2095lA c2095lA) {
        try {
            c2095lA = AbstractC2350pO.A00(c2095lA, null, new IntentFilter(A01(24, 37, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)));
            if (c2095lA == 0) {
                return;
            }
            int intExtra = c2095lA.getIntExtra(A01(109, 5, 89), -1);
            int scale = c2095lA.getIntExtra(A01(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 5, 3), -1);
            int level = c2095lA.getIntExtra(A01(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 6, 71), -1);
            boolean z11 = level == 2 || level == 5;
            float f11 = 0.0f;
            String[] strArr = A06;
            if (strArr[0].charAt(26) != strArr[1].charAt(26)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[5] = "GHijperGL49tDJqi3Nx4WNVKDHMQfhGE";
            strArr2[3] = "9fIc9CBmAIH6SFr3nVJHHtzAM5Z6ICxj";
            if (scale > 0) {
                f11 = (intExtra / scale) * 100.0f;
            }
            A07.put(A01(77, 7, 113), String.valueOf(f11));
            A07.put(A01(84, 8, 75), z11 ? A01(1, 1, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) : A01(0, 1, 33));
        } catch (IllegalArgumentException e3) {
            c2095lA.A08().ABz(A01(102, 7, 57), AbstractC2126lf.A1T, new C2127lg(e3));
        }
    }

    public static synchronized void A0B(C2095lA c2095lA) {
        A09(c2095lA);
        A0A(c2095lA);
        if (A04 == null) {
            A04 = (SensorManager) c2095lA.getSystemService(A01(128, 6, 67));
            if (A04 == null) {
                return;
            }
        }
        if (A00 == null) {
            A00 = A04.getDefaultSensor(1);
        }
        if (A01 == null) {
            A01 = A04.getDefaultSensor(4);
        }
        C2133lm c2133lm = null;
        if (A02 == null) {
            A02 = new C2134ln();
            if (A00 != null) {
                A04.registerListener(A02, A00, 3);
            }
        }
        if (A03 == null) {
            A03 = new C2135lo();
            if (A01 != null) {
                A04.registerListener(A03, A01, 3);
            }
        }
    }

    public static void A0C(Map<String, String> map) {
        float[] fArr = A0A;
        float[] fArr2 = A0B;
        if (fArr != null) {
            int iMin = Math.min(A09.length, fArr.length);
            for (int i5 = 0; i5 < iMin; i5++) {
                map.put(A01(2, 14, 65) + A09[i5], String.valueOf(fArr[i5]));
            }
        }
        if (fArr2 != null) {
            int iMin2 = Math.min(A09.length, fArr2.length);
            for (int i11 = 0; i11 < iMin2; i11++) {
                map.put(A01(114, 9, 4) + A09[i11], String.valueOf(fArr2[i11]));
            }
        }
    }
}
