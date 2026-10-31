package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class k3 extends x5 {
    private static final k3 zzb;
    private int zzd;
    private int zze;
    private j3 zzf;

    static {
        k3 k3Var = new k3();
        zzb = k3Var;
        x5.l(k3.class, k3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001", new Object[]{"zzd", "zze", y0.f32314x, "zzf"});
        }
        if (i11 == 3) {
            return new k3();
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
