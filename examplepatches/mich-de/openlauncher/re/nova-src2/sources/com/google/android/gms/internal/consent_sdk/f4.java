package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class f4 extends x5 {
    private static final f4 zzb;

    static {
        f4 f4Var = new f4();
        zzb = f4Var;
        x5.l(f4.class, f4Var);
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
            return new f4();
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
