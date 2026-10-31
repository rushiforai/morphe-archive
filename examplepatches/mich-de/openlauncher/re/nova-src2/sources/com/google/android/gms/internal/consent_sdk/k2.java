package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class k2 extends x5 {
    private static final k2 zzb;
    private int zzd = 0;
    private Object zze;

    static {
        k2 k2Var = new k2();
        zzb = k2Var;
        x5.l(k2.class, k2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0001\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001<\u0000\u0002<\u0000", new Object[]{"zze", "zzd", j2.class, i2.class});
        }
        if (i11 == 3) {
            return new k2();
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
