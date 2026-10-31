package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class x2 extends x5 {
    private static final x2 zzb;

    static {
        x2 x2Var = new x2();
        zzb = x2Var;
        x5.l(x2.class, x2Var);
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
            return new x2();
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
