package com.iab.omid.library.vungle.internal;

import android.annotation.SuppressLint;
import android.app.KeyguardManager;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import java.lang.ref.WeakReference;
import java.util.Iterator;

/* loaded from: classes3.dex */
public class k {

    /* renamed from: d, reason: collision with root package name */
    @SuppressLint({"StaticFieldLeak"})
    private static k f35229d = new k();

    /* renamed from: a, reason: collision with root package name */
    private WeakReference<Context> f35230a;

    /* renamed from: b, reason: collision with root package name */
    private boolean f35231b = false;

    /* renamed from: c, reason: collision with root package name */
    private boolean f35232c = false;

    public class a extends BroadcastReceiver {
        public a() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            k kVar;
            boolean z11;
            boolean z12;
            if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                kVar = k.this;
                z11 = kVar.f35232c;
                z12 = true;
            } else {
                if (!intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                    return;
                }
                kVar = k.this;
                z11 = kVar.f35232c;
                z12 = false;
            }
            kVar.a(z12, z11);
            k.this.f35231b = z12;
        }
    }

    public static k b() {
        return f35229d;
    }

    public void a() {
        KeyguardManager keyguardManager;
        Context context = this.f35230a.get();
        if (context == null || (keyguardManager = (KeyguardManager) context.getSystemService("keyguard")) == null) {
            return;
        }
        boolean zIsDeviceLocked = keyguardManager.isDeviceLocked();
        a(this.f35231b, zIsDeviceLocked);
        this.f35232c = zIsDeviceLocked;
    }

    public void a(Context context) {
        if (context == null) {
            return;
        }
        this.f35230a = new WeakReference<>(context);
        IntentFilter intentFilter = new IntentFilter("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        context.registerReceiver(new a(), intentFilter);
    }

    public void a(boolean z11, boolean z12) {
        if ((z12 || z11) == (this.f35232c || this.f35231b)) {
            return;
        }
        Iterator<com.iab.omid.library.vungle.adsession.a> it = c.c().b().iterator();
        while (it.hasNext()) {
            it.next().d().b(z12 || z11);
        }
    }
}
