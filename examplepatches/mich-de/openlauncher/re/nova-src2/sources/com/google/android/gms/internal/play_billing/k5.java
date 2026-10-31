package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class k5 extends x2 {
    private static final k5 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private c5 zzg;
    private d5 zzh;

    static {
        k5 k5Var = new k5();
        zzb = k5Var;
        x2.f(k5.class, k5Var);
    }

    public static /* synthetic */ void q(k5 k5Var, o5 o5Var) {
        k5Var.zzf = o5Var;
        k5Var.zze = 4;
    }

    public static j5 r() {
        return (j5) zzb.k();
    }

    public static /* synthetic */ void s(k5 k5Var, r4 r4Var) {
        k5Var.zzf = r4Var;
        k5Var.zze = 2;
    }

    public static /* synthetic */ void t(k5 k5Var, u4 u4Var) {
        k5Var.zzf = u4Var;
        k5Var.zze = 3;
    }

    public static /* synthetic */ void u(k5 k5Var, y4 y4Var) {
        y4Var.getClass();
        k5Var.zzf = y4Var;
        k5Var.zze = 7;
    }

    public static /* synthetic */ void v(k5 k5Var, c5 c5Var) {
        c5Var.getClass();
        k5Var.zzg = c5Var;
        k5Var.zzd |= 1;
    }

    public static /* synthetic */ void w(k5 k5Var, n5 n5Var) {
        n5Var.getClass();
        k5Var.zzf = n5Var;
        k5Var.zze = 8;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\b\u0001\u0001\u0001\b\b\u0000\u0000\u0000\u0001ဉ\u0000\u0002<\u0000\u0003<\u0000\u0004<\u0000\u0005<\u0000\u0006ဉ\u0001\u0007<\u0000\b<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", r4.class, u4.class, o5.class, a5.class, "zzh", y4.class, n5.class});
        }
        if (i11 == 3) {
            return new k5();
        }
        if (i11 == 4) {
            return new j5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
