package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class e4 extends x5 {
    private static final e4 zzb;
    private int zzd;
    private d4 zze;

    static {
        e4 e4Var = new e4();
        zzb = e4Var;
        x5.l(e4.class, e4Var);
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
            return new e4();
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
