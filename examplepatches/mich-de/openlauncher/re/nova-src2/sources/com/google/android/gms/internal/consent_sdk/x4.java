package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class x4 extends x5 {
    private static final x4 zzb;
    private int zzd;
    private v4 zze;
    private w4 zzf;
    private u4 zzg;
    private int zzh;

    static {
        x4 x4Var = new x4();
        zzb = x4Var;
        x5.l(x4.class, x4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0004\u0000\u0001\u0001\u0005\u0004\u0000\u0000\u0000\u0001ဉ\u0001\u0002ဉ\u0002\u0003ဉ\u0000\u0005᠌\u0003", new Object[]{"zzd", "zzf", "zzg", "zze", "zzh", o4.f32194u});
        }
        if (i11 == 3) {
            return new x4();
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
