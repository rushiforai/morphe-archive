package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class r4 extends x2 {
    private static final r4 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private int zzg;
    private x4 zzh;
    private int zzi;

    static {
        r4 r4Var = new r4();
        zzb = r4Var;
        x2.f(r4.class, r4Var);
    }

    public static /* synthetic */ void q(r4 r4Var, i5 i5Var) {
        r4Var.zzf = i5Var;
        r4Var.zze = 7;
    }

    public static /* synthetic */ void r(r4 r4Var, q5 q5Var) {
        r4Var.zzf = q5Var;
        r4Var.zze = 6;
    }

    public static /* synthetic */ void s(r4 r4Var, int i5) {
        r4Var.zzg = i5 - 1;
        r4Var.zzd |= 1;
    }

    public static q4 t() {
        return (q4) zzb.k();
    }

    public static r4 u(byte[] bArr) {
        return (r4) x2.n(zzb, bArr);
    }

    public static void w(r4 r4Var, z4 z4Var) {
        r4Var.zzi = z4Var.f33676a;
        r4Var.zzd |= 4;
    }

    public static /* synthetic */ void x(r4 r4Var, x4 x4Var) {
        r4Var.zzh = x4Var;
        r4Var.zzd |= 2;
    }

    public static /* synthetic */ void y(r4 r4Var, f5 f5Var) {
        r4Var.zzf = f5Var;
        r4Var.zze = 4;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0006\u0001\u0001\u0001\u0007\u0006\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001\u0004<\u0000\u0005᠌\u0002\u0006<\u0000\u0007<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", f2.f33394c, "zzh", f5.class, "zzi", f2.f33396e, q5.class, i5.class});
        }
        if (i11 == 3) {
            return new r4();
        }
        if (i11 == 4) {
            return new q4(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }

    public final i5 v() {
        return this.zze == 7 ? (i5) this.zzf : i5.q();
    }
}
