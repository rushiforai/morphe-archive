package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class h1 extends x5 {
    private static final h1 zzb;
    private int zzd;
    private f1 zze;
    private g1 zzf;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        h1 h1Var = new h1();
        zzb = h1Var;
        x5.l(h1.class, h1Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဈ\u0002\u0004ဈ\u0003", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new h1();
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
