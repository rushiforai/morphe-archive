package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class p3 extends x5 {
    private static final p3 zzb;
    private int zzd;
    private boolean zze;

    static {
        p3 p3Var = new p3();
        zzb = p3Var;
        x5.l(p3.class, p3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဇ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new p3();
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
