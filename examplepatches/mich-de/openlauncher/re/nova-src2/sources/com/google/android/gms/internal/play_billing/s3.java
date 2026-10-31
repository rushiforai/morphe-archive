package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class s3 implements x3 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f33522a;

    /* renamed from: b, reason: collision with root package name */
    public final u2 f33523b;

    public s3(u2 u2Var, g2 g2Var) {
        u2 u2Var2 = q2.f33496a;
        this.f33523b = u2Var;
        this.f33522a = g2Var;
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final boolean a(Object obj) {
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final void b(Object obj) {
        this.f33523b.getClass();
        e4 e4Var = ((x2) obj).zzc;
        if (e4Var.f33392e) {
            e4Var.f33392e = false;
        }
        u2 u2Var = q2.f33496a;
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final void c(Object obj, k3 k3Var) {
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final int d(x2 x2Var) {
        return x2Var.zzc.hashCode();
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final boolean e(x2 x2Var, x2 x2Var2) {
        return x2Var.zzc.equals(x2Var2.zzc);
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final void f(Object obj, byte[] bArr, int i5, int i11, com.google.android.gms.internal.measurement.q0 q0Var) {
        x2 x2Var = (x2) obj;
        if (x2Var.zzc == e4.f33387f) {
            x2Var.zzc = e4.b();
        }
        throw b.u4.d(obj);
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final int g(g2 g2Var) {
        e4 e4Var = ((x2) g2Var).zzc;
        int i5 = e4Var.f33391d;
        if (i5 != -1) {
            return i5;
        }
        int iA = 0;
        for (int i11 = 0; i11 < e4Var.f33388a; i11++) {
            int i12 = e4Var.f33389b[i11] >>> 3;
            l2 l2Var = (l2) e4Var.f33390c[i11];
            int iD0 = n2.D0(8);
            int iD02 = n2.D0(i12) + n2.D0(16);
            int iD03 = n2.D0(24);
            int iF = l2Var.f();
            iA += iD0 + iD0 + iD02 + com.google.android.gms.internal.measurement.k2.A(iF, iF, iD03);
        }
        e4Var.f33391d = iA;
        return iA;
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final x2 zze() {
        g2 g2Var = this.f33522a;
        return g2Var instanceof x2 ? (x2) ((x2) g2Var).j(4) : ((v2) ((x2) g2Var).j(5)).c();
    }

    @Override // com.google.android.gms.internal.play_billing.x3
    public final void zzg(Object obj, Object obj2) {
        y3.p(obj, obj2);
    }
}
