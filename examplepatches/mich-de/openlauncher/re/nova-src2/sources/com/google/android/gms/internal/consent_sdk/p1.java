package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class p1 extends x5 {
    private static final p1 zzb;
    private int zzd;
    private int zze;

    static {
        p1 p1Var = new p1();
        zzb = p1Var;
        x5.l(p1.class, p1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", y0.f32297e});
        }
        if (i11 == 3) {
            return new p1();
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
