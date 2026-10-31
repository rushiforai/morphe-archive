package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class u4 extends x2 {
    private static final u4 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private int zzg;
    private int zzh;

    static {
        u4 u4Var = new u4();
        zzb = u4Var;
        x2.f(u4.class, u4Var);
    }

    public static /* synthetic */ void q(u4 u4Var, int i5) {
        u4Var.zzg = i5 - 1;
        u4Var.zzd |= 1;
    }

    public static s4 r() {
        return (s4) zzb.k();
    }

    public static void t(u4 u4Var, z4 z4Var) {
        u4Var.zzh = z4Var.f33676a;
        u4Var.zzd |= 2;
    }

    public static /* synthetic */ void u(u4 u4Var, f5 f5Var) {
        u4Var.zzf = f5Var;
        u4Var.zze = 2;
    }

    public static /* synthetic */ void v(u4 u4Var, i5 i5Var) {
        u4Var.zzf = i5Var;
        u4Var.zze = 4;
    }

    public static /* synthetic */ void w(u4 u4Var, q5 q5Var) {
        u4Var.zzf = q5Var;
        u4Var.zze = 3;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0005\u0001\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001᠌\u0000\u0002<\u0000\u0003<\u0000\u0004<\u0000\u0005᠌\u0001", new Object[]{"zzf", "zze", "zzd", "zzg", f2.f33394c, f5.class, q5.class, i5.class, "zzh", f2.f33396e});
        }
        if (i11 == 3) {
            return new u4();
        }
        if (i11 == 4) {
            return new s4(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }

    public final i5 s() {
        return this.zze == 4 ? (i5) this.zzf : i5.q();
    }
}
