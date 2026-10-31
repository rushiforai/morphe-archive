package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class n1 extends x5 {
    private static final n1 zzb;
    private int zzd;
    private m1 zze;
    private c4 zzf;
    private int zzg;

    static {
        n1 n1Var = new n1();
        zzb = n1Var;
        x5.l(n1.class, n1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0004\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0003᠌\u0002\u0004ဉ\u0001", new Object[]{"zzd", "zze", "zzg", y0.f32304l, "zzf"});
        }
        if (i11 == 3) {
            return new n1();
        }
        if (i11 == 4) {
            return new z0(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
