package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class s1 extends x5 {
    private static final s1 zzb;
    private int zzd;
    private int zze;

    static {
        s1 s1Var = new s1();
        zzb = s1Var;
        x5.l(s1.class, s1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", y0.f32298f});
        }
        if (i11 == 3) {
            return new s1();
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
