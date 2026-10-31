package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class f3 extends x5 {
    private static final f3 zzb;
    private int zzd;
    private int zze;
    private boolean zzf;
    private boolean zzg;
    private int zzh;
    private int zzi;
    private int zzj;

    static {
        f3 f3Var = new f3();
        zzb = f3Var;
        x5.l(f3.class, f3Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0006\u0000\u0001\u0001\u0007\u0006\u0000\u0000\u0000\u0001᠌\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004᠌\u0003\u0005᠌\u0004\u0007᠌\u0005", new Object[]{"zzd", "zze", y0.f32312v, "zzf", "zzg", "zzh", y0.f32313w, "zzi", y0.f32311u, "zzj", y0.f32310t});
        }
        if (i11 == 3) {
            return new f3();
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
