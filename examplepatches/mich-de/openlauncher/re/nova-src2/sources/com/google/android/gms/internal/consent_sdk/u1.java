package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class u1 extends x5 {
    private static final u1 zzb;
    private int zzd;
    private int zze;
    private int zzf;

    static {
        u1 u1Var = new u1();
        zzb = u1Var;
        x5.l(u1.class, u1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzd", "zze", y0.f32293a, "zzf", y0.f32294b});
        }
        if (i11 == 3) {
            return new u1();
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
