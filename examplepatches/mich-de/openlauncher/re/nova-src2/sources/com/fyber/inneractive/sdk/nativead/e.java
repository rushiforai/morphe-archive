package com.fyber.inneractive.sdk.nativead;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.fyber.inneractive.sdk.factories.j;
import com.fyber.inneractive.sdk.factories.k;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.s;

/* loaded from: classes.dex */
public final class e extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        b bVar = b.f28680f;
        Context applicationContext = context.getApplicationContext();
        if (applicationContext == null) {
            bVar.getClass();
            IAlog.f("context is null, would not start the native cache.", new Object[0]);
        } else if (!bVar.f28683c || !s.a()) {
            bVar.f28681a = applicationContext;
            new Thread(bVar.f28685e, "NativeCache").start();
        }
        com.fyber.inneractive.sdk.factories.d.f28022a.a(com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_NATIVE, new c());
        k kVar = j.f28026a;
        kVar.f28027a.add(new d());
    }
}
