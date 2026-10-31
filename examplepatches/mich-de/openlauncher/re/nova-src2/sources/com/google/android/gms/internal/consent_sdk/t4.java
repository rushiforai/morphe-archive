package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class t4 extends x5 {
    private static final t4 zzb;
    private int zzd;
    private int zze;
    private int zzf;

    static {
        t4 t4Var = new t4();
        zzb = t4Var;
        x5.l(t4.class, t4Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001᠌\u0000\u0002᠌\u0001", new Object[]{"zzd", "zze", o4.f32191r, "zzf", o4.f32181f});
        }
        if (i11 == 3) {
            return new t4();
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
