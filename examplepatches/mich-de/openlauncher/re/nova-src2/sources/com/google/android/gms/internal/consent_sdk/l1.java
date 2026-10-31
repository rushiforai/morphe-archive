package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class l1 extends x5 {
    private static final l1 zzb;
    private int zzd;
    private boolean zze;

    static {
        l1 l1Var = new l1();
        zzb = l1Var;
        x5.l(l1.class, l1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဇ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new l1();
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
