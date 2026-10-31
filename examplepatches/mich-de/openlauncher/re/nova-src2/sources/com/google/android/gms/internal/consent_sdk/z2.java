package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class z2 extends x5 {
    private static final z2 zzb;
    private int zzd;
    private int zze;
    private w2 zzf;
    private y2 zzg;

    static {
        z2 z2Var = new z2();
        zzb = z2Var;
        x5.l(z2.class, z2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001\u0003ဉ\u0002", new Object[]{"zzd", "zze", y0.f32305m, "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new z2();
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
