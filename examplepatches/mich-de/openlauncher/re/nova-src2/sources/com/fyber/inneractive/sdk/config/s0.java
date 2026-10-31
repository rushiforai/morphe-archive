package com.fyber.inneractive.sdk.config;

import android.content.Context;
import com.fyber.inneractive.sdk.util.IAlog;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;

/* loaded from: classes.dex */
public abstract class s0 {
    /* JADX WARN: Removed duplicated region for block: B:23:0x004b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(Context context, z zVar) {
        boolean zIsLimitAdTrackingEnabled;
        AdvertisingIdClient.Info advertisingIdInfo;
        String id2 = null;
        try {
            advertisingIdInfo = AdvertisingIdClient.getAdvertisingIdInfo(context);
            zIsLimitAdTrackingEnabled = advertisingIdInfo.isLimitAdTrackingEnabled();
        } catch (Throwable th2) {
            th = th2;
            zIsLimitAdTrackingEnabled = false;
        }
        try {
            IAlog.e("limit ad tracking: %s", Boolean.valueOf(zIsLimitAdTrackingEnabled));
            if (zIsLimitAdTrackingEnabled) {
                IAlog.e("user has opt out of Ads Personalization. not accessing Advertising ID.", new Object[0]);
            } else {
                id2 = advertisingIdInfo.getId();
                IAlog.e("advertising id: %s", id2);
            }
        } catch (Throwable th3) {
            th = th3;
            IAlog.e("Handled Exception:", new Object[0]);
            IAlog.e(com.fyber.inneractive.sdk.util.v.b(th), new Object[0]);
            IAlog.c("Advertising ID is not available. Please add Google Play Services library to improve your ad targeting.", new Object[0]);
            synchronized (zVar) {
            }
        }
        synchronized (zVar) {
            y yVar = zVar.f27966b;
            yVar.f27951a = id2;
            yVar.f27952b = zIsLimitAdTrackingEnabled;
            yVar.f27953c = false;
        }
    }
}
