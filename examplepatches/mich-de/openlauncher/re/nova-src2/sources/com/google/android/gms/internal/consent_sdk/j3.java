package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class j3 extends x5 {
    private static final j3 zzb;
    private int zzd;
    private i3 zze;

    static {
        j3 j3Var = new j3();
        zzb = j3Var;
        x5.l(j3.class, j3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new j3();
        }
        if (i11 == 4) {
            return new n2(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
