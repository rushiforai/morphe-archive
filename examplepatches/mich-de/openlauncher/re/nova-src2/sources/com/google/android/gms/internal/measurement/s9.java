package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class s9 extends o1 {
    private static final s9 zzl;
    private static volatile o2 zzm;
    private int zzb;
    private boolean zze;
    private boolean zzf;
    private boolean zzg;
    private boolean zzh;
    private boolean zzi;
    private boolean zzj;
    private boolean zzk;

    static {
        s9 s9Var = new s9();
        zzl = s9Var;
        o1.p(s9.class, s9Var);
    }

    public static r9 E() {
        return (r9) zzl.k();
    }

    public static s9 F() {
        return zzl;
    }

    public final boolean A() {
        return this.zzh;
    }

    public final boolean B() {
        return this.zzi;
    }

    public final boolean C() {
        return this.zzj;
    }

    public final boolean D() {
        return this.zzk;
    }

    public final /* synthetic */ void G(boolean z11) {
        this.zzb |= 1;
        this.zze = z11;
    }

    public final /* synthetic */ void H(boolean z11) {
        this.zzb |= 2;
        this.zzf = z11;
    }

    public final /* synthetic */ void I(boolean z11) {
        this.zzb |= 4;
        this.zzg = z11;
    }

    public final /* synthetic */ void J(boolean z11) {
        this.zzb |= 8;
        this.zzh = z11;
    }

    public final /* synthetic */ void K(boolean z11) {
        this.zzb |= 16;
        this.zzi = z11;
    }

    public final /* synthetic */ void L(boolean z11) {
        this.zzb |= 32;
        this.zzj = z11;
    }

    public final /* synthetic */ void M(boolean z11) {
        this.zzb |= 64;
        this.zzk = z11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzl, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001ဇ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004ဇ\u0003\u0005ဇ\u0004\u0006ဇ\u0005\u0007ဇ\u0006", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new s9();
        }
        if (i11 == 4) {
            return new r9(zzl);
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
        synchronized (s9.class) {
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

    public final boolean x() {
        return this.zze;
    }

    public final boolean y() {
        return this.zzf;
    }

    public final boolean z() {
        return this.zzg;
    }
}
