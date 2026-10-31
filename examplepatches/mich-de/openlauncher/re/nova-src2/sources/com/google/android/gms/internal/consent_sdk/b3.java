package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class b3 extends x5 {
    private static final b3 zzb;
    private int zzd;
    private a3 zze;
    private z2 zzf;

    static {
        b3 b3Var = new b3();
        zzb = b3Var;
        x5.l(b3.class, b3Var);
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
            return new b3();
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
