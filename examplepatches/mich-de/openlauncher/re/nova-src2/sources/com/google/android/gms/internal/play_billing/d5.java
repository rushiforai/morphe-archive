package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class d5 extends x2 {
    private static final d5 zzb;
    private int zzd;
    private boolean zze;
    private boolean zzf;

    static {
        d5 d5Var = new d5();
        zzb = d5Var;
        x2.f(d5.class, d5Var);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new d5();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }
}
