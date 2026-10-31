package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class fd extends hd {

    /* renamed from: e, reason: collision with root package name */
    public volatile long f32535e;

    /* renamed from: f, reason: collision with root package name */
    public final long f32536f;

    public fd(String str, td tdVar, long j11) {
        super(str, tdVar);
        this.f32536f = j11;
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object a() {
        return Long.valueOf(this.f32536f);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object b(String str) {
        return Long.valueOf(Long.parseLong(str));
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object c(Object obj) {
        return (Long) obj;
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object d() {
        return Long.valueOf(this.f32535e);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ void e(Object obj) {
        this.f32535e = ((Long) obj).longValue();
    }
}
