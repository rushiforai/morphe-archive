package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.os.SystemClock;
import android.text.TextUtils;
import android.webkit.WebSettings;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.FutureTask;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.mM, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2168mM {
    public static String A00;
    public static byte[] A01;
    public static String[] A02 = {"Qr1EFu0kx1tI01867m6ODqfSZ9SwtWDI", "3TYgkAWbIjP9kMvunjr7VwfmqgOZ7ZQ4", "kyx9q1x7DLL5BxK3faNs604Sw4dxbCMr", "cJW9lkVABx2P1Kp63XktrUnlRFV2zQAL", "nhxLXaLaMxGTsXNVJcvnwyCHZZV2RS3H", "y9xLyKazRl3zNBUnfIZmAOMjGK0AXhl4", "DTEqb4TbXnNBCaxA5atVnYK0pSb9DMUi", "fZvghiN"};
    public static final AtomicReference<String> A03;
    public static final AtomicBoolean A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 19);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A01 = new byte[]{76, 55, 42, 46, 45, 34, 67, 45, 25, 8, 5, 9, 2, 15, 9, 34, 9, 24, 27, 3, 30, 7, 42, 3, 30, 45, 2, 8, 30, 3, 5, 8, 87, 42, 46, 63, 34, 67, 71, 87, 42, 46, 45, 58, 67, 81, 44, 40, 40, 60, 69, 101, 24, 28, 18, 29, 113, 30, 99, 103, 118, 115, 10, 32, 36, 39, 36, 73, 16, 20, 0, 5, 121, 94, 71, 81, 64, 91, 66, 66, 20, 47, 42, 47, 46, 54, 47, 1, 24, 20, 22, 85, 29, 26, 24, 30, 25, 20, 20, 16, 85, 26, 31, 8, 85, 18, 21, 15, 30, 9, 21, 26, 23, 85, 14, 26, 53, 55, 60, 55, 32, 59, 49, 49, 45, 45, 41, 119, 56, 62, 60, 55, 45, 38, 32, 54, 33, 12, 50, 52, 54, 61, 39, 60, 58, 44, 59, 22, 40, 46, 44, 39, 61, 22, 37, 40, 58, 61, 22, 59, 44, 47, 59, 44, 58, 33, 48, 34, 37, 24, 49, 46, 34, 48};
    }

    static {
        A07();
        A00 = A00(80, 7, 82);
        A04 = new AtomicBoolean();
        A03 = new AtomicReference<>();
    }

    public static String A01(C2095lA c2095lA) {
        return WebSettings.getDefaultUserAgent(c2095lA);
    }

    public static String A02(C2095lA c2095lA) {
        FutureTask futureTask = new FutureTask(new CallableC2167mL(c2095lA));
        for (int i5 = 0; i5 < 3; i5++) {
            ExecutorC2419qV.A00(futureTask);
            try {
                return (String) futureTask.get();
            } catch (Throwable th2) {
                A08(c2095lA, th2);
                SystemClock.sleep(500L);
            }
        }
        return null;
    }

    public static String A03(C2095lA c2095lA, C2137lq c2137lq) {
        String strA07 = c2137lq.A07();
        if (TextUtils.isEmpty(strA07)) {
            boolean andSet = A04.getAndSet(true);
            String[] strArr = A02;
            if (strArr[4].charAt(26) != strArr[3].charAt(26)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[1] = "SlGltdwaGCQXXY2U2bjZ1NfeES9SOW6r";
            strArr2[0] = "AnJMWH4pc3dV3Xqon1tLsffrk7nZCcYt";
            if (!andSet) {
                InterfaceC2125le interfaceC2125leA08 = c2095lA.A08();
                int i5 = AbstractC2126lf.A1Z;
                String bundle = A00(73, 7, 29);
                C2127lg c2127lg = new C2127lg(bundle);
                String bundle2 = A00(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 7, 65);
                interfaceC2125leA08.ABz(bundle2, i5, c2127lg);
            }
        }
        return strA07;
    }

    public static String A04(C2095lA c2095lA, boolean z11) throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        if (c2095lA == null) {
            return A00;
        }
        if (z11) {
            return System.getProperty(A00(Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE, 10, 74));
        }
        String str = A03.get();
        if (str != null) {
            return str;
        }
        long spUserAgentRefresh = AbstractC2201mt.A01(c2095lA);
        String strA00 = A00(143, 23, 90);
        String strA002 = A00(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, 10, 64);
        String strA003 = A00(88, 28, 104);
        if (spUserAgentRefresh > 0) {
            String browserUserAgent = ProcessUtils.getProcessSpecificName(strA003, c2095lA);
            SharedPreferences sharedPreferences = c2095lA.getSharedPreferences(browserUserAgent, 0);
            String string = sharedPreferences.getString(strA002, null);
            long j11 = sharedPreferences.getLong(strA00, 0L);
            if (!TextUtils.isEmpty(string) && System.currentTimeMillis() - j11 < spUserAgentRefresh) {
                A03.set(string);
                return string;
            }
        }
        String strA02 = null;
        try {
            strA02 = A01(c2095lA);
            A03.set(strA02);
        } catch (Throwable th2) {
            A08(c2095lA, th2);
        }
        if (strA02 == null) {
            strA02 = A02(c2095lA);
        }
        if (strA02 == null) {
            return A00;
        }
        String[] strArr = A02;
        String str2 = strArr[4];
        String browserUserAgent2 = strArr[3];
        if (str2.charAt(26) != browserUserAgent2.charAt(26)) {
            throw new RuntimeException();
        }
        A02[7] = "Kvz6zSF";
        if (spUserAgentRefresh > 0) {
            SharedPreferences sharedPreferences2 = c2095lA.getSharedPreferences(ProcessUtils.getProcessSpecificName(strA003, c2095lA), 0);
            sharedPreferences2.edit().putString(strA002, A03.get()).apply();
            sharedPreferences2.edit().putLong(strA00, System.currentTimeMillis()).apply();
        }
        return strA02;
    }

    public static String A05(C2137lq c2137lq, C2095lA c2095lA) {
        if (AbstractC2201mt.A04(c2095lA)) {
            return A00(63, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + A03(c2095lA, c2137lq) + A00(39, 6, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + c2137lq.A06() + A00(45, 6, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + c2137lq.A04() + A00(38, 1, 111);
        }
        return A00(0, 0, 40);
    }

    public static String A06(C2137lq c2137lq, C2095lA c2095lA, boolean z11) {
        return A04(c2095lA, z11) + A00(0, 38, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + c2095lA.A05().AA5() + A00(57, 6, 54) + C2137lq.A04 + A00(38, 1, 111) + A05(c2137lq, c2095lA) + A00(68, 5, 69) + c2095lA.A05().AA6() + A00(51, 6, 77) + Locale.getDefault().toString() + A00(87, 1, 79);
    }

    public static void A08(C2095lA c2095lA, Throwable th2) {
        c2095lA.A08().ABz(A00(166, 8, 84), AbstractC2126lf.A2i, new C2127lg(th2));
    }
}
