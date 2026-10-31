package com.fyber.inneractive.sdk.util;

import android.os.Build;
import android.telephony.TelephonyManager;

/* loaded from: classes.dex */
public abstract class k extends o {
    public static String f() {
        try {
            return ((TelephonyManager) o.f31210a.getSystemService("phone")).getNetworkCountryIso();
        } catch (Exception unused) {
            return null;
        }
    }

    public static String g() {
        return Build.MANUFACTURER + " " + Build.MODEL;
    }

    public static int h() {
        try {
            if (o.a("android.permission.READ_PHONE_STATE")) {
                return ((TelephonyManager) o.f31210a.getSystemService("phone")).getDataNetworkType();
            }
            return 0;
        } catch (Throwable unused) {
            return 0;
        }
    }

    public static String i() {
        try {
            return o.f31210a.getPackageManager().getPackageInfo(o.f31210a.getPackageName(), 0).versionName;
        } catch (Exception unused) {
            return null;
        }
    }

    public static boolean j() {
        boolean z11 = (o.f31210a.getResources().getConfiguration().screenLayout & 15) == 4;
        IAlog.e("This device has a tablet resolution? %s", Boolean.valueOf(z11));
        return z11;
    }

    public static boolean k() {
        TelephonyManager telephonyManager = (TelephonyManager) o.f31210a.getSystemService("phone");
        return telephonyManager != null && telephonyManager.getSimState() == 5;
    }
}
