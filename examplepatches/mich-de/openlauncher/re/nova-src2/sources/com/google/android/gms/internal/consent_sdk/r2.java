package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class r2 extends x5 {
    private static final r2 zzb;
    private int zzd;
    private q2 zze;
    private m2 zzf;

    static {
        r2 r2Var = new r2();
        zzb = r2Var;
        x5.l(r2.class, r2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new r2();
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
