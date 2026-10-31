package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class a3 extends x5 {
    private static final a3 zzb;
    private int zzd;
    private int zze;
    private int zzf;

    static {
        a3 a3Var = new a3();
        zzb = a3Var;
        x5.l(a3.class, a3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzd", "zze", y0.o, "zzf", y0.n});
        }
        if (i11 == 3) {
            return new a3();
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
