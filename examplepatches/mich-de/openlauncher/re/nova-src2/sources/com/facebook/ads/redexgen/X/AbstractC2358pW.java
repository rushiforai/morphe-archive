package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import com.facebook.ads.internal.settings.AdInternalSettings;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.pW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2358pW {
    public static byte[] A00;
    public static final Handler A01;
    public static final Set<String> A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 118);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-60, -52, 8, 13, 23, 20, 16, 5, 29, 9, 8, -60, 10, 19, 22, -60, 24, 9, 23, 24, -60, 5, 8, 23, -60, 19, 18, 16, 29, -51, -4, 8, 6, -57, -1, -6, -4, -2, -5, 8, 8, 4, -57, 4, -6, 13, -6, 7, -6, 61, 73, 71, 8, 64, 59, 61, 63, 60, 73, 73, 69, 8, 81, 59, 69, 67, 84, 59, 77, 66, 67};
    }

    static {
        A03();
        A02 = new HashSet();
        A01 = new Handler(Looper.getMainLooper());
    }

    public static void A04(Context context, String str) {
        if (AdInternalSettings.isTestMode(context)) {
            String str2 = str + A01(0, 30, 46);
        }
    }

    public static void A05(C0957Hh c0957Hh, InterfaceC2396q8 interfaceC2396q8, String str) throws PackageManager.NameNotFoundException {
        if (str == null || A02.contains(str)) {
            return;
        }
        boolean isPackageInstalled = A08(c0957Hh.getPackageManager(), str);
        if (isPackageInstalled) {
            interfaceC2396q8.AGA(str);
            return;
        }
        A02.add(str);
        A01.removeCallbacksAndMessages(null);
        A01.postDelayed(new RunnableC2357pV(new int[]{0}, str, c0957Hh, interfaceC2396q8), 1000L);
    }

    public static void A06(C0957Hh c0957Hh, String str) throws RemoteException {
        boolean isWithinFB = c0957Hh.getPackageName().equals(A01(30, 19, 35)) || c0957Hh.getPackageName().equals(A01(49, 22, 100));
        if (isWithinFB) {
            A01.removeCallbacksAndMessages(null);
            A02.remove(str);
        } else {
            AbstractC1802gJ.A00(c0957Hh).A0K(str, null, 5);
        }
    }

    public static void A07(C0957Hh c0957Hh, String str, InterfaceC2396q8 interfaceC2396q8) throws PackageManager.NameNotFoundException, RemoteException {
        boolean isWithinFB = c0957Hh.getPackageName().equals(A01(30, 19, 35)) || c0957Hh.getPackageName().equals(A01(49, 22, 100));
        if (isWithinFB) {
            A05(c0957Hh, interfaceC2396q8, str);
        } else {
            AbstractC1802gJ.A00(c0957Hh).A0K(str, interfaceC2396q8, 4);
        }
    }

    public static boolean A08(PackageManager packageManager, String str) throws PackageManager.NameNotFoundException {
        if (packageManager == null) {
            return false;
        }
        try {
            packageManager.getPackageGids(str);
            return true;
        } catch (PackageManager.NameNotFoundException unused) {
            return false;
        }
    }
}
