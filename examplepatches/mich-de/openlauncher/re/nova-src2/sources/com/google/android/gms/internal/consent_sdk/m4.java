package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class m4 extends x5 {
    private static final m4 zzb;
    private int zzd;
    private int zze;
    private int zzf;
    private boolean zzg;
    private boolean zzh;

    static {
        m4 m4Var = new m4();
        zzb = m4Var;
        x5.l(m4.class, m4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003ဇ\u0002\u0004ဇ\u0003", new Object[]{"zzd", "zze", y0.C, "zzf", z6.f32336a, "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new m4();
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
