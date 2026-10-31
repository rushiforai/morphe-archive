package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class w4 extends x5 {
    private static final w4 zzb;
    private z5 zzd = y5.f32318e;

    static {
        w4 w4Var = new w4();
        zzb = w4Var;
        x5.l(w4.class, w4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0000\u0001\u0001\u0001\u0000\u0001\u0000\u0001ࠬ", new Object[]{"zzd", o4.f32182g});
        }
        if (i11 == 3) {
            return new w4();
        }
        if (i11 == 4) {
            return new y3(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
