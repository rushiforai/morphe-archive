package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class u4 extends x5 {
    private static final u4 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private int zzg;
    private int zzh;
    private j7 zzi;
    private j7 zzj;
    private int zzk;

    static {
        u4 u4Var = new u4();
        zzb = u4Var;
        x5.l(u4.class, u4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0007\u0001\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001\u0003ဉ\u0002\u0004ဉ\u0003\u0005᠌\u0004\u00067\u0000\u0007<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", o4.f32182g, "zzh", o4.f32183h, "zzi", "zzj", "zzk", o4.f32184i, q5.class});
        }
        if (i11 == 3) {
            return new u4();
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
