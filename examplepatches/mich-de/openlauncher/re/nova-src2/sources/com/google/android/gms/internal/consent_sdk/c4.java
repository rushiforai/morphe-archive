package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class c4 extends x5 {
    private static final c4 zzb;
    private int zzd;
    private int zze;
    private b4 zzf;
    private a4 zzg;

    static {
        c4 c4Var = new c4();
        zzb = c4Var;
        x5.l(c4.class, c4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001᠌\u0000\u0002ဉ\u0001\u0003ဉ\u0002", new Object[]{"zzd", "zze", y0.B, "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new c4();
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
