package com.bytedance.sdk.openadsdk.utils;

import android.content.res.Configuration;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public class rmf {

    /* renamed from: dj, reason: collision with root package name */
    private static volatile boolean f27161dj = true;
    private static String sya;
    private static String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static String f27162zb;

    public static class ycx extends com.bytedance.sdk.component.fby.zb.sya {
        public static AtomicBoolean ycx = new AtomicBoolean(false);

        /* renamed from: zb, reason: collision with root package name */
        private static final AtomicLong f27163zb = new AtomicLong(0);

        public ycx(String str, int i5) {
            super(str, i5);
        }

        public static void ycx() {
            if (ycx.get()) {
                return;
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            AtomicLong atomicLong = f27163zb;
            if (jCurrentTimeMillis - atomicLong.get() < TTAdConstant.AD_MAX_EVENT_TIME) {
                return;
            }
            atomicLong.set(jCurrentTimeMillis);
            yzp.sya((Runnable) new ycx("UpdateSimStatusTask", 5));
        }

        @Override // java.lang.Runnable
        public void run() {
            ycx.set(true);
            rmf.lud();
            ycx.set(false);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void lud() {
        String simOperatorName;
        String simOperator;
        String strSubstring;
        if (com.bytedance.sdk.openadsdk.core.pmi.ycx() == null) {
            return;
        }
        f27161dj = true;
        try {
            TelephonyManager telephonyManager = (TelephonyManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService("phone");
            try {
                int simState = telephonyManager.getSimState();
                if (simState == 0 || simState == 1) {
                    f27161dj = false;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "UuAkgQ==", 48);
                com.bytedance.sdk.component.utils.htf.sya("SimUtils", th2.getMessage());
            }
            String str = null;
            try {
                simOperatorName = telephonyManager.getSimOperatorName();
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "UuAkgQ==", 55);
                simOperatorName = null;
            }
            try {
                simOperator = telephonyManager.getNetworkOperator();
            } catch (Throwable th4) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "UuAkgQ==", 61);
                simOperator = null;
            }
            if (simOperator == null || simOperator.length() < 5) {
                try {
                    simOperator = telephonyManager.getSimOperator();
                } catch (Throwable th5) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th5, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "UuAkgQ==", 67);
                }
            }
            if (TextUtils.isEmpty(simOperator) || simOperator.length() <= 4) {
                strSubstring = null;
            } else {
                String strSubstring2 = simOperator.substring(0, 3);
                strSubstring = simOperator.substring(3);
                str = strSubstring2;
            }
            if (!TextUtils.isEmpty(simOperatorName)) {
                ycx = simOperatorName;
            }
            if (!TextUtils.isEmpty(str)) {
                f27162zb = str;
            }
            if (TextUtils.isEmpty(strSubstring)) {
                return;
            }
            sya = strSubstring;
        } catch (Throwable th6) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th6, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "UuAkgQ==", 87);
        }
    }

    public static String sya() {
        ycx.ycx();
        return sya;
    }

    public static String ycx() {
        ycx.ycx();
        return ycx;
    }

    public static String zb() {
        try {
            ycx.ycx();
            if (!f27161dj) {
                StringBuilder sb2 = new StringBuilder("getMCC");
                sb2.append(f27161dj ? "Have SIM card" : "No SIM card, MCC returns null");
                com.bytedance.sdk.component.utils.htf.sya("MCC", sb2.toString());
                return null;
            }
            Configuration configuration = com.bytedance.sdk.openadsdk.core.pmi.ycx().getResources().getConfiguration();
            int i5 = configuration.mcc;
            String strValueOf = i5 != 0 ? String.valueOf(i5) : f27162zb;
            com.bytedance.sdk.component.utils.htf.sya("MCC", "config=" + configuration.mcc + ",sMCC=" + f27162zb);
            return strValueOf;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "aOcgoBe1ZdQ=", "XOs5uCCf", 110);
            com.bytedance.sdk.component.utils.htf.sya("SimUtils", th2.getMessage());
            return null;
        }
    }
}
