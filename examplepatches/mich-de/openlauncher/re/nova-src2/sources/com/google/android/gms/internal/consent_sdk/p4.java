package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class p4 extends x5 {
    private static final p4 zzb;
    private int zzd;
    private int zze = 0;
    private Object zzf;
    private j7 zzg;
    private j7 zzh;
    private int zzi;

    static {
        p4 p4Var = new p4();
        zzb = p4Var;
        x5.l(p4.class, p4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0005\u0001\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003᠌\u0002\u00047\u0000\u0005<\u0000", new Object[]{"zzf", "zze", "zzd", "zzg", "zzh", "zzi", o4.f32177b, q5.class});
        }
        if (i11 == 3) {
            return new p4();
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
