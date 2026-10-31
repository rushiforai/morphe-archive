package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class n5 extends x2 {
    private static final n5 zzb;
    private int zzd;
    private x4 zze;
    private long zzf;

    static {
        n5 n5Var = new n5();
        zzb = n5Var;
        x2.f(n5.class, n5Var);
    }

    public static m5 q() {
        return (m5) zzb.k();
    }

    public static /* synthetic */ void r(n5 n5Var, x4 x4Var) {
        n5Var.zze = x4Var;
        n5Var.zzd |= 1;
    }

    public static /* synthetic */ void s(n5 n5Var, long j11) {
        n5Var.zzd |= 2;
        n5Var.zzf = j11;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new n5();
        }
        if (i11 == 4) {
            return new m5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
