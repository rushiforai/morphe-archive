package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class y2 extends x5 {
    private static final y2 zzb;
    private int zzd;
    private x2 zze;
    private l2 zzf;

    static {
        y2 y2Var = new y2();
        zzb = y2Var;
        x5.l(y2.class, y2Var);
    }

    @Override // com.google.android.gms.internal.consent_sdk.x5
    public final Object f(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s6(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new y2();
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
