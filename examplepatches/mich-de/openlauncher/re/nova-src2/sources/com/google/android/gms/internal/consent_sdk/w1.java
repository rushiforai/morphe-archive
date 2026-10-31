package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class w1 extends x5 {
    private static final w1 zzb;
    private int zzd;
    private int zze;
    private v1 zzf;

    static {
        w1 w1Var = new w1();
        zzb = w1Var;
        x5.l(w1.class, w1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0002\u0003\u0002\u0000\u0000\u0000\u0002᠌\u0000\u0003ဉ\u0001", new Object[]{"zzd", "zze", y0.f32299g, "zzf"});
        }
        if (i11 == 3) {
            return new w1();
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
