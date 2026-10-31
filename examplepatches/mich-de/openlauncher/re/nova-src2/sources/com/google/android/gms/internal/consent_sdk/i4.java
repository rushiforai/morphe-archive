package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class i4 extends x5 {
    private static final i4 zzb;
    private int zzd;
    private g4 zze;
    private h4 zzf;

    static {
        i4 i4Var = new i4();
        zzb = i4Var;
        x5.l(i4.class, i4Var);
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
            return new i4();
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
