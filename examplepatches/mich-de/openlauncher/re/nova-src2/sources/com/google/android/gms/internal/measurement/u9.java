package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class u9 extends o1 {
    private static final u9 zzi;
    private static volatile o2 zzj;
    private int zzb;
    private int zze;
    private na zzf;
    private na zzg;
    private boolean zzh;

    static {
        u9 u9Var = new u9();
        zzi = u9Var;
        o1.p(u9.class, u9Var);
    }

    public static t9 E() {
        return (t9) zzi.k();
    }

    public final boolean A() {
        return (this.zzb & 4) != 0;
    }

    public final na B() {
        na naVar = this.zzg;
        return naVar == null ? na.G() : naVar;
    }

    public final boolean C() {
        return (this.zzb & 8) != 0;
    }

    public final boolean D() {
        return this.zzh;
    }

    public final /* synthetic */ void F(int i5) {
        this.zzb |= 1;
        this.zze = i5;
    }

    public final /* synthetic */ void G(na naVar) {
        this.zzf = naVar;
        this.zzb |= 2;
    }

    public final /* synthetic */ void H(na naVar) {
        this.zzg = naVar;
        this.zzb |= 4;
    }

    public final /* synthetic */ void I(boolean z11) {
        this.zzb |= 8;
        this.zzh = z11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzi, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001င\u0000\u0002ဉ\u0001\u0003ဉ\u0002\u0004ဇ\u0003", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new u9();
        }
        if (i11 == 4) {
            return new t9(zzi);
        }
        if (i11 == 5) {
            return zzi;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzj;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (u9.class) {
            try {
                m1Var = zzj;
                if (m1Var == null) {
                    m1Var = new m1(zzi);
                    zzj = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final boolean x() {
        return (this.zzb & 1) != 0;
    }

    public final int y() {
        return this.zze;
    }

    public final na z() {
        na naVar = this.zzf;
        return naVar == null ? na.G() : naVar;
    }
}
