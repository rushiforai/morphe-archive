package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class i3 extends x5 {
    private static final i3 zzb;

    static {
        i3 i3Var = new i3();
        zzb = i3Var;
        x5.l(i3.class, i3Var);
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
            return new i3();
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
