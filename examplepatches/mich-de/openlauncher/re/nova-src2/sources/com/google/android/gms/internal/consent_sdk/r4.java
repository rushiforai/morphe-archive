package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class r4 extends x5 {
    private static final r4 zzb;
    private int zzd;
    private int zze;

    static {
        r4 r4Var = new r4();
        zzb = r4Var;
        x5.l(r4.class, r4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001᠌\u0000", new Object[]{"zzd", "zze", o4.f32180e});
        }
        if (i11 == 3) {
            return new r4();
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
