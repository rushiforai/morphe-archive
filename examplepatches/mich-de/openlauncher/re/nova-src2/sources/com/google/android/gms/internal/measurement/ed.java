package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ed extends hd {

    /* renamed from: e, reason: collision with root package name */
    public volatile double f32501e;

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object a() {
        return Double.valueOf(-3.0d);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object b(String str) {
        return Double.valueOf(Double.parseDouble(str));
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object c(Object obj) {
        return (Double) obj;
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ Object d() {
        return Double.valueOf(this.f32501e);
    }

    @Override // com.google.android.gms.internal.measurement.hd
    public final /* synthetic */ void e(Object obj) {
        this.f32501e = ((Double) obj).doubleValue();
    }
}
