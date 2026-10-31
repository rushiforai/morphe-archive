package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class j7 extends x5 {
    private static final j7 zzb;
    private String zzd = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long zze;
    private int zzf;

    static {
        j7 j7Var = new j7();
        zzb = j7Var;
        x5.l(j7.class, j7Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0000\u0003\u0000\u0000\u0001\u0003\u0003\u0000\u0000\u0000\u0001Ȉ\u0002\u0002\u0003\u0004", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new j7();
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
