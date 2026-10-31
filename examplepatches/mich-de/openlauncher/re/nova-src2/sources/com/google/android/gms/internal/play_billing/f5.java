package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class f5 extends x2 {
    private static final f5 zzb;
    private int zzd;
    private int zze;

    static {
        f5 f5Var = new f5();
        zzb = f5Var;
        x2.f(f5.class, f5Var);
    }

    public static e5 q() {
        return (e5) zzb.k();
    }

    public static /* synthetic */ void r(f5 f5Var, int i5) {
        f5Var.zze = i5 - 1;
        f5Var.zzd |= 1;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", f2.f33398g});
        }
        if (i11 == 3) {
            return new f5();
        }
        if (i11 == 4) {
            return new e5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
