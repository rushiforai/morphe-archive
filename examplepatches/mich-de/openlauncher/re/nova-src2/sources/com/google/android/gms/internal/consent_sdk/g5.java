package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class g5 extends x5 {
    private static final g5 zzb;
    private int zzd;
    private int zze;
    private int zzf;
    private z5 zzg = y5.f32318e;

    static {
        g5 g5Var = new g5();
        zzb = g5Var;
        x5.l(g5.class, g5Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            o4 o4Var = o4.f32189p;
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001င\u0000\u0002ࠬ\u0003᠌\u0001", new Object[]{"zzd", "zze", "zzg", o4Var, "zzf", o4Var});
        }
        if (i11 == 3) {
            return new g5();
        }
        if (i11 == 4) {
            return new f5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
