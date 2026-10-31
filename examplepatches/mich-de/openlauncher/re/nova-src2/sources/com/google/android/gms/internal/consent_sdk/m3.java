package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class m3 extends x5 {
    private static final m3 zzb;
    private int zzd;
    private l3 zze;
    private c4 zzf;
    private int zzg;

    static {
        m3 m3Var = new m3();
        zzb = m3Var;
        x5.l(m3.class, m3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0004\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0003᠌\u0002\u0004ဉ\u0001", new Object[]{"zzd", "zze", "zzg", y0.f32304l, "zzf"});
        }
        if (i11 == 3) {
            return new m3();
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
