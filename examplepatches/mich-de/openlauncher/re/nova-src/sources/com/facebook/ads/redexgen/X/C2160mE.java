package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.os.Build;
import com.facebook.ads.internal.util.process.ProcessUtils;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.facebook.ads.redexgen.X.mE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2160mE {
    public static String A00;
    public static EnumC2381pt A01;
    public static byte[] A02;
    public static String[] A03 = {"pgH9SdtSFWTXX0l", "vxegEtvJMZ23RgjyHpc", "ulS7n8X7nNx1Irtm69lPCCFagtwQ2KXJ", "SMp4Mt4DU3EtKobKtaKcK4J1Rc2yK13N", "2t39yg7rltV6biRCRlaAvBIZnsjhSKww", "tY1PV27PV17ox8mww3so5aazg5RDJQQX", "2fotvTqtzlir49zwNSe", "KHZMFPmOyKnxl7a"};
    public static final Map<String, Integer> A04;
    public static final AtomicInteger A05;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A02 = new byte[]{-87, -56, -51, -41};
    }

    static {
        A05();
        A00 = null;
        A05 = new AtomicInteger(0);
        A04 = new HashMap();
    }

    public static synchronized EnumC2381pt A00(C2095lA c2095lA) {
        if (A01 == null) {
            A01 = AbstractC2382pu.A00(c2095lA);
        }
        return A01;
    }

    public static Integer A01(String str) {
        synchronized (A04) {
            Integer num = A04.get(str);
            if (num == null) {
                return 0;
            }
            return num;
        }
    }

    public static void A06(C2095lA c2095lA, String str, Map<String, String> params) {
        String strA03;
        if (A0A(c2095lA)) {
            strA03 = C2330p1.A03(str);
        } else {
            strA03 = A00;
        }
        if (strA03 != null) {
            String fingerprint = A02(1, 3, 55);
            params.put(fingerprint, strA03);
        }
    }

    public static void A07(C2095lA c2095lA, boolean z11) throws Exception {
        if (!A05.compareAndSet(0, 1)) {
            return;
        }
        A00(c2095lA);
        try {
            SharedPreferences sharedPreferencesA00 = AbstractC2297oU.A00(c2095lA);
            C2137lq c2137lq = new C2137lq(c2095lA);
            String str = Build.FINGERPRINT + A02(0, 1, 30) + c2137lq.A06();
            A00 = sharedPreferencesA00.getString(str, null);
            FutureTask futureTask = new FutureTask(new CallableC2159mD(c2095lA, c2137lq, sharedPreferencesA00, str));
            Executors.newSingleThreadExecutor().submit(futureTask);
            if (z11) {
                futureTask.get();
            }
        } catch (Exception unused) {
            AtomicInteger atomicInteger = A05;
            String[] strArr = A03;
            if (strArr[1].length() != strArr[6].length()) {
                Exception e3 = new RuntimeException();
                throw e3;
            }
            String[] strArr2 = A03;
            strArr2[7] = "qnCKfAZ4ZrzI6TW";
            strArr2[0] = "3RwSqq6UclGHbC0";
            atomicInteger.set(0);
        }
    }

    public static void A08(C2095lA c2095lA, boolean z11, String str) throws Exception {
        if (A0A(c2095lA)) {
            A09(c2095lA, z11, str);
        } else {
            A07(c2095lA, z11);
        }
    }

    public static void A09(C2095lA c2095lA, boolean z11, String str) throws ExecutionException, InterruptedException {
        if (str == null) {
            str = c2095lA.getPackageName();
        }
        if (A0B(str)) {
            return;
        }
        A00(c2095lA);
        C2330p1 c2330p1 = new C2330p1(c2095lA, str);
        try {
            c2330p1.A06();
            FutureTask futureTask = new FutureTask(new CallableC2158mC(c2330p1, str));
            Executors.newSingleThreadExecutor().submit(futureTask);
            if (z11) {
                futureTask.get();
            }
        } catch (Exception unused) {
            synchronized (A04) {
                A04.put(str, 0);
            }
        }
    }

    public static boolean A0A(C2095lA c2095lA) {
        return ProcessUtils.isRemoteRenderingProcess() || C2203mv.A2w(c2095lA);
    }

    public static boolean A0B(String str) {
        synchronized (A04) {
            int status = A01(str).intValue();
            if (status != 0) {
                return true;
            }
            A04.put(str, 1);
            return false;
        }
    }
}
