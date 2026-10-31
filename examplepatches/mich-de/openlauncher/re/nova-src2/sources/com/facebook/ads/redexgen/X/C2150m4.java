package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.facebook.ads.AudienceNetworkActivity;
import com.facebook.ads.AudienceNetworkAds;
import com.facebook.ads.internal.api.BuildConfigApi;
import com.facebook.ads.internal.settings.AdInternalSettings;
import com.facebook.ads.internal.settings.MultithreadedBundleWrapper;
import com.facebook.ads.internal.util.activity.ActivityUtils;
import com.facebook.ads.internal.util.process.ProcessUtils;
import java.lang.Thread;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.m4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2150m4 {
    public static boolean A00;
    public static boolean A01;
    public static byte[] A02;
    public static String[] A03 = {"qrNp1wG", "4f9SKAEMWw8LBpPH9ClfYFaSVVluVAOE", "62aVnpwn360RV3u8SEcmxFYidJmBvefX", "Gce9ySP9MgoEln4cNVrEo5sJO8CSkBrv", "GAv6eBsy68sSiadtgyjEU9blJSusD372", "OMedkGV5dbFzDsS0dZcen", "wlEAAxVLaYYUt0VSnPi", "2B4l1t7rFez9Iyb0KdS6JKEUq9HBo8Fu"};
    public static final AtomicBoolean A04;
    public static final AtomicBoolean A05;
    public static final AtomicBoolean A06;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A03[1].charAt(3) == 'A') {
                throw new RuntimeException();
            }
            String[] strArr = A03;
            strArr[4] = "IDfTBPjSyvL4biEe7dLkbKSavqcQmadb";
            strArr[2] = "Oy3yacq1X2KDRnpIDSUXWs28RTZJmhMt";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 60);
            i13++;
        }
    }

    public static void A03() {
        A02 = new byte[]{-60, -57, -9, -7, -53, -12, -58, -8, -66, -70, -71, -19, -36, -31, -35, -26, -37, -35, -58, -35, -20, -17, -25, -22, -29, -62, -77, -70, -113, -40, -35, -40, -29, -40, -48, -37, -40, -23, -48, -29, -40, -34, -35, -113, -30, -29, -48, -31, -29, -44, -45, -60, -43, -36, -111, -24, -46, -28, -111, -46, -35, -29, -42, -46, -43, -22, -111, -38, -33, -38, -27, -38, -46, -35, -38, -21, -42, -43, -110, -111, -60, -36, -38, -31, -31, -38, -33, -40, -97, -62, -40, -34, -119, -51, -40, -41, -112, -35, -119, -52, -54, -43, -43, -119, -86, -34, -51, -46, -50, -41, -52, -50, -73, -50, -35, -32, -40, -37, -44, -86, -51, -36, -105, -46, -41, -46, -35, -46, -54, -43, -46, -29, -50, -111, -110, -105, -119, -68, -40, -42, -50, -119, -49, -34, -41, -52, -35, -46, -40, -41, -54, -43, -46, -35, -30, -119, -42, -54, -30, -119, -41, -40, -35, -119, -32, -40, -37, -44, -119, -39, -37, -40, -39, -50, -37, -43, -30, -105, -66, -51, -58, -31, -33, -24, -33, -20, -29, -35, -9, -4, -9, 2, -9, -17, -6, -9, 8, -13, 5, 10, 5, 16, 5, -3, 8, 5, 22, 1, -60, -59, -68, 10, 11, 16, -68, -1, -3, 8, 8, 1, 0, -54};
    }

    static {
        A03();
        A06 = new AtomicBoolean();
        A04 = new AtomicBoolean();
        A05 = new AtomicBoolean();
    }

    public static HS A00() {
        return new HS();
    }

    public static HR A01(C0957Hh c0957Hh) {
        return new HR(c0957Hh);
    }

    public static void A04(AudienceNetworkAds.InitListener initListener, AudienceNetworkAds.InitResult initResult) {
        ExecutorC2419qV.A01.execute(new HT(initListener, initResult));
    }

    public static void A06(C0957Hh c0957Hh) {
        if (AbstractC2205mx.A0P(c0957Hh) && !A05.getAndSet(true)) {
            try {
                Thread.UncaughtExceptionHandler defaultUncaughtExceptionHandler = new C2116lV(Thread.getDefaultUncaughtExceptionHandler(), c0957Hh, new HP());
                Thread.setDefaultUncaughtExceptionHandler(defaultUncaughtExceptionHandler);
            } catch (Exception e3) {
                c0957Hh.A08().ABz(A02(181, 7, 62), AbstractC2126lf.A1X, new C2127lg(e3));
            }
        }
    }

    public static void A07(C0957Hh c0957Hh) {
        A0G(c0957Hh, null, null, 3);
    }

    public static void A08(C0957Hh c0957Hh) {
        A0G(c0957Hh, null, null, 3);
    }

    public static void A09(C0957Hh c0957Hh) {
        if (C2203mv.A2P(c0957Hh)) {
            A0E(c0957Hh, 0);
        }
        if (C2203mv.A2Z(c0957Hh)) {
            A0B(c0957Hh);
        }
    }

    public static void A0A(C0957Hh c0957Hh) {
        if (C2203mv.A2Q(c0957Hh)) {
            A0F(c0957Hh, null, 3);
        }
    }

    public static void A0B(C0957Hh c0957Hh) {
        ExecutorC2431qh.A06.execute(new HU(c0957Hh));
    }

    public static void A0C(C0957Hh c0957Hh) {
        AbstractC1802gJ.A02(c0957Hh);
        C2120lZ.A0C(c0957Hh, new HO(c0957Hh), new HY(), BuildConfigApi.isDebug());
        c0957Hh.A0A();
    }

    public static void A0E(C0957Hh c0957Hh, int i5) {
        AbstractC2094l9.A01(c0957Hh);
        if (A04.getAndSet(true)) {
            return;
        }
        if (AdInternalSettings.isDebugBuild() || AdInternalSettings.isDebuggerOn()) {
            AbstractC2273o5.A02();
        }
        A06(c0957Hh);
        AbstractC2322ot.A00(C2203mv.A0p(c0957Hh), BuildConfigApi.isDebug(), A00(), A01(c0957Hh));
        C2071kk.A03(C2203mv.A02(c0957Hh));
        if (!ProcessUtils.isRemoteRenderingProcess()) {
            C1454af.A09(new HQ(c0957Hh));
        }
        if (i5 == 3) {
            Log.e(A02(8, 17, 60), A02(89, 89, 45));
            c0957Hh.A08().ACp(A02(178, 3, 33), AbstractC2126lf.A0R, new C2127lg(A02(198, 24, 96)));
        }
        ActivityUtils.A04(c0957Hh, AudienceNetworkActivity.class);
        ExecutorC2431qh.A05(c0957Hh);
        C2235nR.A05(c0957Hh);
        C1715eu.A01(c0957Hh);
        if (C2203mv.A15(c0957Hh)) {
            AbstractC1991jR.A00(c0957Hh);
        }
        if (C2203mv.A1z(c0957Hh)) {
            HG.A02().A9d(c0957Hh);
        }
    }

    public static void A0F(C0957Hh c0957Hh, AudienceNetworkAds.InitListener initListener, int i5) {
        AbstractC2094l9.A01(c0957Hh);
        boolean z11 = false;
        synchronized (C2150m4.class) {
            boolean execute = A00;
            if (!execute) {
                if (i5 != 1 && i5 != 2) {
                    if (i5 == 3) {
                        boolean execute2 = A01;
                        if (!execute2) {
                            A01 = true;
                            z11 = true;
                        }
                    }
                } else {
                    A00 = true;
                    z11 = true;
                }
            }
        }
        if (z11) {
            A0E(c0957Hh, i5);
            ExecutorC2431qh.A08.execute(new HV(c0957Hh, initListener));
        } else {
            if (i5 != 1) {
                return;
            }
            String strA02 = A02(51, 38, 53);
            if (initListener != null) {
                A04(initListener, new C2149m3(true, strA02));
            } else {
                Log.w(A02(8, 17, 60), strA02);
            }
        }
    }

    public static void A0G(C0957Hh c0957Hh, MultithreadedBundleWrapper multithreadedBundleWrapper, AudienceNetworkAds.InitListener initListener, int i5) {
        AbstractC2273o5.A05(A02(188, 10, 82), A02(25, 26, 51), A02(0, 8, 87));
        C1454af.A06();
        A0F(c0957Hh, initListener, i5);
    }

    public static synchronized boolean A0H() {
        return A00;
    }
}
