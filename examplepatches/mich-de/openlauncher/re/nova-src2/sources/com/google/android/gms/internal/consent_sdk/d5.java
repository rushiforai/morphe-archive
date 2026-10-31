package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class d5 extends x5 {
    private static final d5 zzb;
    private int zzd;
    private b5 zze;
    private z4 zzf;
    private c5 zzg;

    static {
        d5 d5Var = new d5();
        zzb = d5Var;
        x5.l(d5.class, d5Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဉ\u0002", new Object[]{"zzd", "zze", "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new d5();
        }
        if (i11 == 4) {
            return new y3(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
