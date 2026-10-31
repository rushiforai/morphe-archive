package com.fyber.inneractive.sdk.config;

import android.content.SharedPreferences;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class a0 implements Runnable {
    @Override // java.lang.Runnable
    public final void run() {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (!iAConfigManager.K.get() && iAConfigManager.f27748f == null) {
            IAlog.a("%sDropping event 10 when headers are null", IAlog.a(IAConfigManager.class));
            return;
        }
        SharedPreferences sharedPreferences = com.fyber.inneractive.sdk.util.o.f31210a.getSharedPreferences("IAConfigurationPreferences", 0);
        if (sharedPreferences == null || !sharedPreferences.contains("IAConfigFQE")) {
            IAConfigManager.f();
            new com.fyber.inneractive.sdk.network.w(com.fyber.inneractive.sdk.network.u.FIRST_OPENED, (InneractiveAdRequest) null, (com.fyber.inneractive.sdk.response.e) null).a((String) null);
        }
    }
}
