package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class e1 extends x5 {
    private static final e1 zzb;

    static {
        e1 e1Var = new e1();
        zzb = e1Var;
        x5.l(e1.class, e1Var);
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
            return new e1();
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
