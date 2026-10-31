package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class c9 extends o1 {
    private static final c9 zzh;
    private static volatile o2 zzi;
    private int zzb;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzf = r2.f33023e;
    private boolean zzg;

    static {
        c9 c9Var = new c9();
        zzh = c9Var;
        o1.p(c9.class, c9Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0001\u0000\u0001ဈ\u0000\u0002\u001b\u0003ဇ\u0001", new Object[]{"zzb", "zze", "zzf", j9.class, "zzg"});
        }
        if (i11 == 3) {
            return new c9();
        }
        if (i11 == 4) {
            return new w8(zzh);
        }
        if (i11 == 5) {
            return zzh;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzi;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (c9.class) {
            try {
                m1Var = zzi;
                if (m1Var == null) {
                    m1Var = new m1(zzh);
                    zzi = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final String x() {
        return this.zze;
    }
}
