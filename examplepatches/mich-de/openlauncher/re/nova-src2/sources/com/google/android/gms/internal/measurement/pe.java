package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class pe extends o1 {
    private static final pe zzh;
    private static volatile o2 zzi;
    private int zzb;
    private Object zzf;
    private int zze = 0;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        pe peVar = new pe();
        zzh = peVar;
        o1.p(pe.class, peVar);
    }

    public static oe D() {
        return (oe) zzh.k();
    }

    public final double A() {
        if (this.zze == 4) {
            return ((Double) this.zzf).doubleValue();
        }
        return 0.0d;
    }

    public final String B() {
        return this.zze == 5 ? (String) this.zzf : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final v0 C() {
        return this.zze == 6 ? (v0) this.zzf : v0.f33120b;
    }

    public final /* synthetic */ void E(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zzg = str;
    }

    public final /* synthetic */ void F(long j11) {
        this.zze = 2;
        this.zzf = Long.valueOf(j11);
    }

    public final /* synthetic */ void G(boolean z11) {
        this.zze = 3;
        this.zzf = Boolean.valueOf(z11);
    }

    public final /* synthetic */ void H(double d5) {
        this.zze = 4;
        this.zzf = Double.valueOf(d5);
    }

    public final /* synthetic */ void I(String str) {
        str.getClass();
        this.zze = 5;
        this.zzf = str;
    }

    public final /* synthetic */ void J(v0 v0Var) {
        v0Var.getClass();
        this.zze = 6;
        this.zzf = v0Var;
    }

    public final int K() {
        int i5 = this.zze;
        if (i5 == 0) {
            return 6;
        }
        if (i5 == 2) {
            return 1;
        }
        if (i5 == 3) {
            return 2;
        }
        if (i5 == 4) {
            return 3;
        }
        if (i5 != 5) {
            return i5 != 6 ? 0 : 5;
        }
        return 4;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0006\u0001\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001ဈ\u0000\u00025\u0000\u0003:\u0000\u00043\u0000\u0005;\u0000\u0006=\u0000", new Object[]{"zzf", "zze", "zzb", "zzg"});
        }
        if (i11 == 3) {
            return new pe();
        }
        if (i11 == 4) {
            return new oe(zzh);
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
        synchronized (pe.class) {
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
        return this.zzg;
    }

    public final long y() {
        if (this.zze == 2) {
            return ((Long) this.zzf).longValue();
        }
        return 0L;
    }

    public final boolean z() {
        if (this.zze == 3) {
            return ((Boolean) this.zzf).booleanValue();
        }
        return false;
    }
}
