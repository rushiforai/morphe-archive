package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class u1 extends x2 {
    private static final u1 zzb;
    private int zzd;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        u1 u1Var = new u1();
        zzb = u1Var;
        x2.f(u1.class, u1Var);
    }

    public static u1 q() {
        return zzb;
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0001\u0000\u0001\u0002\u0002\u0001\u0000\u0000\u0000\u0002ဈ\u0000", new Object[]{"zzd", "zze"});
        }
        if (i11 == 3) {
            return new u1();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }

    public final String r() {
        return this.zze;
    }
}
