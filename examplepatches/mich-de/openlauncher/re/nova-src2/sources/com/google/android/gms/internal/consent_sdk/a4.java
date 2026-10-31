package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class a4 extends x5 {
    private static final a4 zzb;
    private int zzd;
    private j6 zzh = j6.f32114b;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        a4 a4Var = new a4();
        zzb = a4Var;
        x5.l(a4.class, a4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0001\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဈ\u0002\u00042", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", z3.f32335a});
        }
        if (i11 == 3) {
            return new a4();
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
