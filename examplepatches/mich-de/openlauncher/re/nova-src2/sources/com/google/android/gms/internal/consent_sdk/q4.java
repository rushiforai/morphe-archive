package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class q4 extends x5 {
    private static final q4 zzb;
    private int zzd;
    private int zze;

    static {
        q4 q4Var = new q4();
        zzb = q4Var;
        x5.l(q4.class, q4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", o4.f32179d});
        }
        if (i11 == 3) {
            return new q4();
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
