package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class fc extends o1 {
    private static final fc zzh;
    private static volatile o2 zzi;
    private int zzb;
    private Object zzf;
    private int zze = 0;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        fc fcVar = new fc();
        zzh = fcVar;
        o1.p(fc.class, fcVar);
    }

    public static ec D() {
        return (ec) zzh.k();
    }

    public static fc E() {
        return zzh;
    }

    public final double A() {
        if (this.zze == 3) {
            return ((Double) this.zzf).doubleValue();
        }
        return 0.0d;
    }

    public final String B() {
        return this.zze == 4 ? (String) this.zzf : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final v0 C() {
        return this.zze == 5 ? (v0) this.zzf : v0.f33120b;
    }

    public final /* synthetic */ void F(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zzg = str;
    }

    public final /* synthetic */ void G(long j11) {
        this.zze = 1;
        this.zzf = Long.valueOf(j11);
    }

    public final /* synthetic */ void H(boolean z11) {
        this.zze = 2;
        this.zzf = Boolean.valueOf(z11);
    }

    public final /* synthetic */ void I(double d5) {
        this.zze = 3;
        this.zzf = Double.valueOf(d5);
    }

    public final /* synthetic */ void J(String str) {
        str.getClass();
        this.zze = 4;
        this.zzf = str;
    }

    public final /* synthetic */ void K(u0 u0Var) {
        u0Var.getClass();
        this.zze = 5;
        this.zzf = u0Var;
    }

    public final int L() {
        int i5 = this.zze;
        if (i5 == 0) {
            return 6;
        }
        int i11 = 1;
        if (i5 != 1) {
            i11 = 2;
            if (i5 != 2) {
                i11 = 3;
                if (i5 != 3) {
                    i11 = 4;
                    if (i5 != 4) {
                        i11 = 5;
                        if (i5 != 5) {
                            return 0;
                        }
                    }
                }
            }
        }
        return i11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzh, "\u0004\u0006\u0001\u0001\u0001\n\u0006\u0000\u0000\u0000\u00018\u0000\u0002:\u0000\u00033\u0000\u0004;\u0000\u0005=\u0000\nဈ\u0000", new Object[]{"zzf", "zze", "zzb", "zzg"});
        }
        if (i11 == 3) {
            return new fc();
        }
        if (i11 == 4) {
            return new ec(zzh);
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
        synchronized (fc.class) {
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
        if (this.zze == 1) {
            return ((Long) this.zzf).longValue();
        }
        return 0L;
    }

    public final boolean z() {
        if (this.zze == 2) {
            return ((Boolean) this.zzf).booleanValue();
        }
        return false;
    }
}
