package com.fyber.inneractive.sdk.video;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.factories.h;
import com.fyber.inneractive.sdk.factories.i;
import com.fyber.inneractive.sdk.player.cache.n;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.s;
import com.fyber.inneractive.sdk.util.w;

/* loaded from: classes.dex */
public class IAVideoKit extends BroadcastReceiver {
    private static final w sProvider = new a();

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        w wVar = sProvider;
        IAConfigManager.Q.I.put(wVar.b(), wVar);
        n nVar = n.f28874f;
        Context applicationContext = context.getApplicationContext();
        if (applicationContext == null) {
            nVar.getClass();
            IAlog.f("context is null, would not start the video cache.", new Object[0]);
        } else if (!nVar.f28877c || !s.a()) {
            nVar.f28875a = applicationContext;
            new Thread(nVar.f28879e, "VideoCache").start();
        }
        IAlog.a("IAVideoKit: onReceive in package: %s", context.getApplicationContext().getPackageName());
        com.fyber.inneractive.sdk.factories.d.f28022a.a(com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_VAST, new b());
        i iVar = h.f28024a;
        iVar.f28025a.add(new c());
        com.fyber.inneractive.sdk.factories.c cVar = com.fyber.inneractive.sdk.factories.b.f28020a;
        cVar.f28021a.add(new d());
    }
}
