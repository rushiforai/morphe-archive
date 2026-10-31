package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class q5 extends x2 {
    private static final q5 zzb;
    private int zzd;
    private int zze;
    private boolean zzf;
    private long zzg;
    private boolean zzh;
    private int zzi;
    private int zzj;

    static {
        q5 q5Var = new q5();
        zzb = q5Var;
        x2.f(q5.class, q5Var);
    }

    public static p5 q() {
        return (p5) zzb.k();
    }

    public static /* synthetic */ void r(q5 q5Var, boolean z11) {
        q5Var.zzd |= 8;
        q5Var.zzh = z11;
    }

    public static /* synthetic */ void s(q5 q5Var, int i5) {
        q5Var.zzd |= 16;
        q5Var.zzi = i5;
    }

    public static /* synthetic */ void t(q5 q5Var, long j11) {
        q5Var.zzd |= 4;
        q5Var.zzg = j11;
    }

    public static /* synthetic */ void u(q5 q5Var) {
        q5Var.zzd |= 32;
        q5Var.zzj = 0;
    }

    public static /* synthetic */ void v(q5 q5Var) {
        q5Var.zzd |= 2;
        q5Var.zzf = true;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ဇ\u0001\u0003ဂ\u0002\u0004ဇ\u0003\u0005င\u0004\u0006င\u0005", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new q5();
        }
        if (i11 == 4) {
            return new p5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
