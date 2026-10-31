package com.google.android.gms.internal.consent_sdk;

import android.app.Activity;
import java.util.Queue;
import java.util.concurrent.Executor;

/* loaded from: classes.dex */
public final class c3 {

    /* renamed from: a, reason: collision with root package name */
    public final h f32005a;

    /* renamed from: b, reason: collision with root package name */
    public final d f32006b;

    /* renamed from: c, reason: collision with root package name */
    public final p f32007c;

    /* renamed from: f, reason: collision with root package name */
    public final d0 f32010f;

    /* renamed from: d, reason: collision with root package name */
    public final Object f32008d = new Object();

    /* renamed from: e, reason: collision with root package name */
    public final Object f32009e = new Object();

    /* renamed from: g, reason: collision with root package name */
    public boolean f32011g = false;

    /* renamed from: h, reason: collision with root package name */
    public boolean f32012h = false;

    /* renamed from: i, reason: collision with root package name */
    public o2.f f32013i = new o2.f(13);

    public c3(h hVar, d dVar, p pVar, d0 d0Var) {
        this.f32005a = hVar;
        this.f32006b = dVar;
        this.f32007c = pVar;
        this.f32010f = d0Var;
    }

    public final boolean a() {
        h hVar = this.f32005a;
        if (!hVar.f32082b.getBoolean("is_pub_misconfigured", false)) {
            int i5 = !d() ? 0 : hVar.f32082b.getInt("consent_status", 0);
            if (i5 != 1 && i5 != 3) {
                return false;
            }
        }
        return true;
    }

    public final int b() {
        if (d()) {
            return qm.e.b(this.f32005a.f32082b.getString("privacy_options_requirement_status", "UNKNOWN"));
        }
        return 1;
    }

    public final void c(Activity activity, o2.f fVar, uk.b bVar, uk.a aVar) {
        synchronized (this.f32008d) {
            this.f32011g = true;
        }
        this.f32013i = fVar;
        ((Queue) this.f32010f.f32040f.get()).add(Long.valueOf(System.currentTimeMillis()));
        d dVar = this.f32006b;
        dVar.getClass();
        ((Executor) dVar.f32028c).execute(new ai.s1(dVar, activity, fVar, bVar, aVar, 3));
    }

    public final boolean d() {
        boolean z11;
        synchronized (this.f32008d) {
            z11 = this.f32011g;
        }
        return z11;
    }
}
