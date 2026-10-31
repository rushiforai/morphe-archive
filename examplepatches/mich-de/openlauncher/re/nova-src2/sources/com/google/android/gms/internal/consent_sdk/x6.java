package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class x6 extends x5 {
    private static final x6 zzb;
    private long zzd;
    private int zze;

    static {
        x6 x6Var = new x6();
        zzb = x6Var;
        x5.l(x6.class, x6Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u0002\u0002\u0004", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new x6();
        }
        if (i11 == 4) {
            return new f5(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
