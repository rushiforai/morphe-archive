package com.google.android.gms.internal.measurement;

import java.util.concurrent.atomic.AtomicReference;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class n extends r {

    /* renamed from: b, reason: collision with root package name */
    public static final n f32839b = new n(s.f33038a);

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f32840a;

    public n(r rVar) {
        this.f32840a = new AtomicReference(rVar);
    }

    @Override // com.google.android.gms.internal.measurement.r
    public final void a(String str, Level level, boolean z11) {
        ((r) this.f32840a.get()).a(str, level, z11);
    }

    @Override // com.google.android.gms.internal.measurement.r
    public final x b() {
        return ((r) this.f32840a.get()).b();
    }

    @Override // com.google.android.gms.internal.measurement.r
    public final h c() {
        return ((r) this.f32840a.get()).c();
    }
}
