package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class l4 extends x5 {
    private static final l4 zzb;
    private int zzd;
    private int zze;
    private int zzf;
    private int zzg;
    private int zzh;
    private z5 zzi = y5.f32318e;
    private String zzj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private k4 zzk;

    static {
        l4 l4Var = new l4();
        zzb = l4Var;
        x5.l(l4.class, l4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0001\u0000\u0001င\u0000\u0002᠌\u0001\u0003᠌\u0002\u0004᠌\u0003\u0005ࠬ\u0006ဉ\u0005\u0007ለ\u0004", new Object[]{"zzd", "zze", "zzf", o4.f32191r, "zzg", o4.f32193t, "zzh", o4.f32192s, "zzi", o4.f32190q, "zzk", "zzj"});
        }
        if (i11 == 3) {
            return new l4();
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
