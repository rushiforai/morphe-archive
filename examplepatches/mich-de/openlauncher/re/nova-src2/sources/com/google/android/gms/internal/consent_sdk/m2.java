package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class m2 extends x5 {
    private static final m2 zzb;

    static {
        m2 m2Var = new m2();
        zzb = m2Var;
        x5.l(m2.class, m2Var);
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
            return new m2();
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
