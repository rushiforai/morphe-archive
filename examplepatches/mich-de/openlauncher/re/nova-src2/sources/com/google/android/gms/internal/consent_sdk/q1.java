package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class q1 extends x5 {
    private static final q1 zzb;

    static {
        q1 q1Var = new q1();
        zzb = q1Var;
        x5.l(q1.class, q1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0000", null);
        }
        if (i11 == 3) {
            return new q1();
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
