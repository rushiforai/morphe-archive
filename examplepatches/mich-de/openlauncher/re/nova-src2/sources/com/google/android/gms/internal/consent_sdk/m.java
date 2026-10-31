package com.google.android.gms.internal.consent_sdk;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.view.Window;
import java.util.Objects;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Application f32133a;

    /* renamed from: b, reason: collision with root package name */
    public final t f32134b;

    /* renamed from: c, reason: collision with root package name */
    public final h f32135c;

    /* renamed from: d, reason: collision with root package name */
    public final q f32136d;

    /* renamed from: e, reason: collision with root package name */
    public final e f32137e;

    /* renamed from: f, reason: collision with root package name */
    public final d0 f32138f;

    /* renamed from: g, reason: collision with root package name */
    public Dialog f32139g;

    /* renamed from: h, reason: collision with root package name */
    public s f32140h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicBoolean f32141i = new AtomicBoolean();

    /* renamed from: j, reason: collision with root package name */
    public final AtomicReference f32142j = new AtomicReference();

    /* renamed from: k, reason: collision with root package name */
    public final AtomicReference f32143k = new AtomicReference();

    /* renamed from: l, reason: collision with root package name */
    public final AtomicReference f32144l = new AtomicReference();

    /* renamed from: m, reason: collision with root package name */
    public boolean f32145m = false;
    public boolean n = false;

    public m(Application application, t tVar, h hVar, q qVar, e eVar, d0 d0Var) {
        this.f32133a = application;
        this.f32134b = tVar;
        this.f32135c = hVar;
        this.f32136d = qVar;
        this.f32137e = eVar;
        this.f32138f = d0Var;
    }

    public final void a(Activity activity, ox.r rVar) {
        i0.a();
        ((Queue) this.f32138f.f32042h.get()).add(Long.valueOf(System.currentTimeMillis()));
        if (!this.f32141i.compareAndSet(false, true)) {
            zzg zzgVar = new zzg(3, true != this.f32145m ? "ConsentForm#show can only be invoked once." : "Privacy options form is being loading. Please try again later.");
            d(zzgVar);
            rVar.a(zzgVar.a());
            return;
        }
        s sVar = this.f32140h;
        v vVar = sVar.f32230b;
        Objects.requireNonNull(vVar);
        sVar.f32229a.post(new r(vVar, 0));
        k kVar = new k(this, activity);
        this.f32133a.registerActivityLifecycleCallbacks(kVar);
        this.f32144l.set(kVar);
        this.f32134b.f32241a = activity;
        Dialog dialog = new Dialog(activity, 16973840);
        dialog.setContentView(this.f32140h);
        dialog.setCancelable(false);
        Window window = dialog.getWindow();
        if (window == null) {
            zzg zzgVar2 = new zzg(3, "Activity with null windows is passed in.");
            d(zzgVar2);
            rVar.a(zzgVar2.a());
            return;
        }
        window.setLayout(-1, -1);
        window.setBackgroundDrawable(new ColorDrawable(0));
        window.setFlags(16777216, 16777216);
        mk.v.P(window, false);
        this.f32143k.set(rVar);
        dialog.show();
        this.f32139g = dialog;
        this.f32140h.a("UMP_messagePresented", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        d(null);
    }

    public final void b(uk.d dVar, uk.c cVar) {
        e eVar = this.f32137e;
        t tVar = (t) ((k7) eVar.f32051a).zzb();
        Handler handler = i0.f32098a;
        c.a(handler);
        this.f32140h = new s(tVar, handler, ((bn.i) eVar.f32052b).zzb());
        boolean z11 = this.f32145m;
        d0 d0Var = this.f32138f;
        if (!z11) {
            ((Queue) d0Var.f32044j.get()).add(Long.valueOf(System.currentTimeMillis()));
        }
        s sVar = this.f32140h;
        sVar.setBackgroundColor(0);
        sVar.getSettings().setJavaScriptEnabled(true);
        sVar.getSettings().setAllowFileAccess(false);
        sVar.getSettings().setAllowContentAccess(false);
        sVar.setWebViewClient(new bz.a(sVar));
        if (!this.f32145m) {
            d0Var.a((Queue) d0Var.f32044j.get(), 3, 2, null);
        }
        this.f32142j.set(new l(dVar, cVar));
        s sVar2 = this.f32140h;
        q qVar = this.f32136d;
        sVar2.loadDataWithBaseURL(qVar.f32214a, qVar.f32215b, "text/html", "UTF-8", null);
        handler.postDelayed(new j(this, 0), com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
    }

    public final void c(zzg zzgVar) {
        l lVar = (l) this.f32142j.getAndSet(null);
        if (lVar == null) {
            return;
        }
        if (!this.f32145m) {
            String message = zzgVar.getMessage();
            boolean z11 = this.n;
            d0 d0Var = this.f32138f;
            if (z11) {
                d0Var.a((Queue) d0Var.f32043i.get(), 10, 11, message);
            } else {
                d0Var.a((Queue) d0Var.f32041g.get(), 4, 5, message);
            }
        }
        lVar.a(zzgVar.a());
    }

    public final void d(zzg zzgVar) {
        if (this.f32145m) {
            return;
        }
        String message = zzgVar == null ? null : zzgVar.getMessage();
        boolean z11 = this.n;
        d0 d0Var = this.f32138f;
        if (z11) {
            d0Var.a((Queue) d0Var.f32043i.get(), 10, 11, message);
        } else {
            d0Var.a((Queue) d0Var.f32042h.get(), 6, 7, message);
        }
    }
}
