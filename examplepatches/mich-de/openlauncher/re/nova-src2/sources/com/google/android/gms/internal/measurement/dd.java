package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class dd extends hd {

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f32469e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f32470f;

    public dd(String str, td tdVar, boolean z11) {
        super(str, tdVar);
        this.f32470f = z11;
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object a() {
        return Boolean.valueOf(this.f32470f);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object b(String str) {
        return Boolean.valueOf(Boolean.parseBoolean(str));
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object c(Object obj) {
        return (Boolean) obj;
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object d() {
        return Boolean.valueOf(this.f32469e);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ void e(Object obj) {
        this.f32469e = ((Boolean) obj).booleanValue();
    }
}
