package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class j4 extends x5 {
    private static final j4 zzb;
    private int zzd;
    private i4 zze;
    private a1 zzf;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        j4 j4Var = new j4();
        zzb = j4Var;
        x5.l(j4.class, j4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0003\u0000\u0001\u0001\u0005\u0003\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0005ለ\u0002", new Object[]{"zzd", "zze", "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new j4();
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
