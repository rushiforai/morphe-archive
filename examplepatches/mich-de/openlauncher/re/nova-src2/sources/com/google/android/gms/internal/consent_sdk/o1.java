package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class o1 extends x5 {
    private static final o1 zzb;
    private int zzd;
    private q1 zze;
    private p1 zzf;

    static {
        o1 o1Var = new o1();
        zzb = o1Var;
        x5.l(o1.class, o1Var);
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
            return new o1();
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
