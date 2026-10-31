package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class l2 extends x5 {
    private static final l2 zzb;
    private int zzd;
    private k2 zze;
    private long zzf;

    static {
        l2 l2Var = new l2();
        zzb = l2Var;
        x5.l(l2.class, l2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဂ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new l2();
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
