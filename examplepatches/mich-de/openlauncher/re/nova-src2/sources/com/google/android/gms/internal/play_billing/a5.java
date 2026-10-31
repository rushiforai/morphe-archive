package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class a5 extends x2 {
    private static final a5 zzb;
    private int zzd;
    private int zzf;
    private x4 zzi;
    private boolean zzj;
    private boolean zzk;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private b3 zzg = y2.f33660e;
    private c3 zzh = v3.f33566e;

    static {
        a5 a5Var = new a5();
        zzb = a5Var;
        x2.f(a5.class, a5Var);
    }

    @Override // com.google.android.gms.internal.play_billing.x2
    public final Object j(int i5) {
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new w3(zzb, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0002\u0000\u0001ဈ\u0000\u0002᠌\u0001\u0003ࠬ\u0004\u001b\u0005ဉ\u0002\u0006ဇ\u0003\u0007ဇ\u0004", new Object[]{"zzd", "zze", "zzf", f2.f33397f, "zzg", f2.f33396e, "zzh", l5.class, "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new a5();
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
