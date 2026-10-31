package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class bc extends o1 {
    private static final bc zzh;
    private static volatile o2 zzi;
    private int zzb;
    private ac zzf;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        bc bcVar = new bc();
        zzh = bcVar;
        o1.p(bc.class, bcVar);
    }

    public static yb y() {
        return (yb) zzh.k();
    }

    public final /* synthetic */ void A(ac acVar) {
        this.zzf = acVar;
        this.zzb |= 2;
    }

    public final /* synthetic */ void B(String str) {
        str.getClass();
        this.zzb |= 4;
        this.zzg = str;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဉ\u0001\u0003ဈ\u0002", new Object[]{"zzb", "zze", "zzf", "zzg"});
        }
        if (i11 == 3) {
            return new bc();
        }
        if (i11 == 4) {
            return new yb(zzh);
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
        synchronized (bc.class) {
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

    public final /* synthetic */ void z(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zze = str;
    }
}
