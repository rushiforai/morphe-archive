package com.tiktok.iap.billing.client;

import android.app.Application;
import android.content.SharedPreferences;
import com.tiktok.TikTokBusinessSdk;

/* loaded from: classes4.dex */
public final class BillCache {
    private static final long DEF_LAST = 1735660800000L;
    private static final String F_NAME = "com.tiktok.sdk.pay";
    private static final String K_INAPP_LAST = "inapp_last";
    private static final String K_SUBS_LAST = "subs_last";
    private static volatile BillCache sInstance;
    private SharedPreferences mSP = null;

    private BillCache() {
    }

    public static BillCache getInstance() {
        if (sInstance == null) {
            synchronized (BillCache.class) {
                try {
                    if (sInstance == null) {
                        sInstance = new BillCache();
                    }
                } finally {
                }
            }
        }
        return sInstance;
    }

    private SharedPreferences getSP() {
        Application applicationContext;
        try {
            if (this.mSP == null && (applicationContext = TikTokBusinessSdk.getApplicationContext()) != null) {
                this.mSP = applicationContext.getSharedPreferences(F_NAME, 0);
            }
        } catch (Throwable unused) {
        }
        return this.mSP;
    }

    public long getINAPPLast() {
        SharedPreferences sp2 = getSP();
        return sp2 != null ? sp2.getLong(K_INAPP_LAST, DEF_LAST) : DEF_LAST;
    }

    public long getSUBSLast() {
        SharedPreferences sp2 = getSP();
        return sp2 != null ? sp2.getLong(K_SUBS_LAST, DEF_LAST) : DEF_LAST;
    }

    public void saveINAPPLast(long j11) {
        if (j11 > 0) {
            try {
                SharedPreferences sp2 = getSP();
                if (sp2 != null) {
                    sp2.edit().putLong(K_INAPP_LAST, j11).apply();
                }
            } catch (Throwable unused) {
            }
        }
    }

    public void saveSUBSLast(long j11) {
        if (j11 > 0) {
            try {
                SharedPreferences sp2 = getSP();
                if (sp2 != null) {
                    sp2.edit().putLong(K_SUBS_LAST, j11).apply();
                }
            } catch (Throwable unused) {
            }
        }
    }
}
