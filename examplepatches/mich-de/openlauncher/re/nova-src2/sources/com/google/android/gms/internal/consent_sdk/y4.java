package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class y4 extends x5 {
    private static final y4 zzb;
    private int zzd;
    private int zze;
    private int zzf;

    static {
        y4 y4Var = new y4();
        zzb = y4Var;
        x5.l(y4.class, y4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzd", "zze", o4.f32187l, "zzf", o4.f32188m});
        }
        if (i11 == 3) {
            return new y4();
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
