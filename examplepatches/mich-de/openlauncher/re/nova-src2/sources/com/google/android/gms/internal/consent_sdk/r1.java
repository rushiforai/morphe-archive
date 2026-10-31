package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class r1 extends x5 {
    private static final r1 zzb;
    private int zzd;
    private u1 zze;
    private boolean zzf;

    static {
        r1 r1Var = new r1();
        zzb = r1Var;
        x5.l(r1.class, r1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဇ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new r1();
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
