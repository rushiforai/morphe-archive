package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class x3 extends x5 {
    private static final x3 zzb;
    private int zzd;
    private o3 zze;
    private s3 zzf;
    private p3 zzg;
    private t3 zzh;
    private n3 zzi;
    private v3 zzj;
    private u3 zzk;

    static {
        x3 x3Var = new x3();
        zzb = x3Var;
        x5.l(x3.class, x3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004ဉ\u0003\u0005ဉ\u0004\u0006ဉ\u0005\u0007ဉ\u0006", new Object[]{"zzd", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new x3();
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
