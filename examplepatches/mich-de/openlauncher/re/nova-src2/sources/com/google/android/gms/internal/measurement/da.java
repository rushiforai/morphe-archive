package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class da extends o1 {
    private static final da zzg;
    private static volatile o2 zzh;
    private int zzb;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long zzf;

    static {
        da daVar = new da();
        zzg = daVar;
        o1.p(da.class, daVar);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဂ\u0001", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new da();
        }
        if (i11 == 4) {
            return new w8(zzg);
        }
        if (i11 == 5) {
            return zzg;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzh;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (da.class) {
            try {
                m1Var = zzh;
                if (m1Var == null) {
                    m1Var = new m1(zzg);
                    zzh = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }
}
