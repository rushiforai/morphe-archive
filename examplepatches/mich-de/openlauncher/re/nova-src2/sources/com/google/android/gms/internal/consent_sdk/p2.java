package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class p2 extends x5 {
    private static final p2 zzb;
    private int zzd;
    private o2 zze;

    static {
        p2 p2Var = new p2();
        zzb = p2Var;
        x5.l(p2.class, p2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001ဉ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new p2();
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
