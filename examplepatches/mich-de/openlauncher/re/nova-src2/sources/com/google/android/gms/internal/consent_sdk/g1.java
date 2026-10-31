package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class g1 extends x5 {
    private static final g1 zzb;
    private int zzd;
    private int zze;
    private int zzf;

    static {
        g1 g1Var = new g1();
        zzb = g1Var;
        x5.l(g1.class, g1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဋ\u0001", new Object[]{"zzd", "zze", y0.f32295c, "zzf"});
        }
        if (i11 == 3) {
            return new g1();
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
