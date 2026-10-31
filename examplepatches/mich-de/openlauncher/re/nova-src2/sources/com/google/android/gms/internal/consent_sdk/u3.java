package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class u3 extends x5 {
    private static final u3 zzb;
    private z5 zzd = y5.f32318e;

    static {
        u3 u3Var = new u3();
        zzb = u3Var;
        x5.l(u3.class, u3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001ࠬ", new Object[]{"zzd", y0.A});
        }
        if (i11 == 3) {
            return new u3();
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
