package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class w1 extends x2 {
    private static final w1 zzb;
    private int zzd;
    private e2 zze;
    private e2 zzf;
    private int zzg;

    static {
        w1 w1Var = new w1();
        zzb = w1Var;
        x2.f(w1.class, w1Var);
    }

    public static v1 q() {
        return (v1) zzb.k();
    }

    public static /* synthetic */ void r(w1 w1Var, e2 e2Var) {
        w1Var.zze = e2Var;
        w1Var.zzd |= 1;
    }

    public static /* synthetic */ void s(w1 w1Var, e2 e2Var) {
        w1Var.zzf = e2Var;
        w1Var.zzd |= 2;
    }

    public static /* synthetic */ void t(w1 w1Var, int i5) {
        w1Var.zzg = i5 - 1;
        w1Var.zzd |= 4;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003᠌\u0002", new Object[]{"zzd", "zze", "zzf", "zzg", f2.f33393b});
        }
        if (i11 == 3) {
            return new w1();
        }
        if (i11 == 4) {
            return new v1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
