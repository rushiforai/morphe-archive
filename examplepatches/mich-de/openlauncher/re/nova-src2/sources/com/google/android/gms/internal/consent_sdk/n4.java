package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class n4 extends x5 {
    private static final n4 zzb;
    private int zzd;
    private int zze;
    private boolean zzf;

    static {
        n4 n4Var = new n4();
        zzb = n4Var;
        x5.l(n4.class, n4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002ဇ\u0001", new Object[]{"zzd", "zze", z6.f32336a, "zzf"});
        }
        if (i11 == 3) {
            return new n4();
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
