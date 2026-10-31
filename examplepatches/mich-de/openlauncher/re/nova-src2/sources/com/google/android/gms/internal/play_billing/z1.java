package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class z1 extends x2 {
    private static final z1 zzb;
    private int zzd;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        z1 z1Var = new z1();
        zzb = z1Var;
        x2.f(z1.class, z1Var);
    }

    public static z1 r(byte[] bArr) {
        return (z1) x2.n(zzb, bArr);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001င\u0000\u0002ဈ\u0001", new Object[]{"zzd", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new z1();
        }
        if (i11 == 4) {
            return new s1(zzb);
        }
        if (i11 == 5) {
            return zzb;
        }
        throw null;
    }

    public final int q() {
        return this.zze;
    }

    public final String s() {
        return this.zzf;
    }
}
