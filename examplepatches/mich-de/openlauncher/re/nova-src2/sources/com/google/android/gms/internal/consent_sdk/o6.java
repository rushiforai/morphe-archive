package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class o6 implements t6 {

    /* renamed from: a, reason: collision with root package name */
    public final i5 f32204a;

    /* renamed from: b, reason: collision with root package name */
    public final z6 f32205b;

    public o6(z6 z6Var, i5 i5Var) {
        o4 o4Var = r5.f32223a;
        this.f32205b = z6Var;
        this.f32204a = i5Var;
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final int a(x5 x5Var) {
        x5Var.zzc.getClass();
        return 506991;
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final boolean b(x5 x5Var, x5 x5Var2) {
        return x5Var.zzc.equals(x5Var2.zzc);
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final void c(Object obj, h6 h6Var) {
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final int d(i5 i5Var) {
        y6 y6Var = ((x5) i5Var).zzc;
        int i5 = y6Var.f32324c;
        if (i5 != -1) {
            return i5;
        }
        y6Var.f32324c = 0;
        return 0;
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final x5 zzc() {
        i5 i5Var = this.f32204a;
        return i5Var instanceof x5 ? (x5) ((x5) i5Var).f(4) : ((v5) ((x5) i5Var).f(5)).c();
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final void zzd(Object obj) {
        this.f32205b.getClass();
        y6 y6Var = ((x5) obj).zzc;
        if (y6Var.f32325d) {
            y6Var.f32325d = false;
        }
        o4 o4Var = r5.f32223a;
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final void zze(Object obj, Object obj2) {
        u6.o(obj, obj2);
    }

    @Override // com.google.android.gms.internal.consent_sdk.t6
    public final boolean zzh(Object obj) {
        throw b.u4.d(obj);
    }
}
