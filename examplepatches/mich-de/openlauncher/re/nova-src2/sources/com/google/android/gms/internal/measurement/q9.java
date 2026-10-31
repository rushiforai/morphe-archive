package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class q9 extends o1 {
    private static final q9 zzl;
    private static volatile o2 zzm;
    private int zzb;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzi = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzj = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzk = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        q9 q9Var = new q9();
        zzl = q9Var;
        o1.p(q9.class, q9Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzl, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဈ\u0002\u0004ဈ\u0003\u0005ဈ\u0004\u0006ဈ\u0005\u0007ဈ\u0006", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new q9();
        }
        if (i11 == 4) {
            return new w8(zzl);
        }
        if (i11 == 5) {
            return zzl;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzm;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (q9.class) {
            try {
                m1Var = zzm;
                if (m1Var == null) {
                    m1Var = new m1(zzl);
                    zzm = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }
}
