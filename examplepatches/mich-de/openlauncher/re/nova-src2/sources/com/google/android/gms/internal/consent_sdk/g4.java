package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class g4 extends x5 {
    private static final g4 zzb;
    private int zzd;
    private f4 zze;
    private l2 zzf;

    static {
        g4 g4Var = new g4();
        zzb = g4Var;
        x5.l(g4.class, g4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new g4();
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
