package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ta extends o1 {
    private static final ta zzk;
    private static volatile o2 zzl;
    private int zzb;
    private long zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long zzh;
    private float zzi;
    private double zzj;

    static {
        ta taVar = new ta();
        zzk = taVar;
        o1.p(ta.class, taVar);
    }

    public static sa I() {
        return (sa) zzk.k();
    }

    public final boolean A() {
        return (this.zzb & 4) != 0;
    }

    public final String B() {
        return this.zzg;
    }

    public final boolean C() {
        return (this.zzb & 8) != 0;
    }

    public final long D() {
        return this.zzh;
    }

    public final boolean E() {
        return (this.zzb & 16) != 0;
    }

    public final float F() {
        return this.zzi;
    }

    public final boolean G() {
        return (this.zzb & 32) != 0;
    }

    public final double H() {
        return this.zzj;
    }

    public final /* synthetic */ void J(long j11) {
        this.zzb |= 1;
        this.zze = j11;
    }

    public final /* synthetic */ void K(String str) {
        str.getClass();
        this.zzb |= 2;
        this.zzf = str;
    }

    public final /* synthetic */ void L(String str) {
        str.getClass();
        this.zzb |= 4;
        this.zzg = str;
    }

    public final /* synthetic */ void M() {
        this.zzb &= -5;
        this.zzg = zzk.zzg;
    }

    public final /* synthetic */ void N(long j11) {
        this.zzb |= 8;
        this.zzh = j11;
    }

    public final /* synthetic */ void O() {
        this.zzb &= -9;
        this.zzh = 0L;
    }

    public final /* synthetic */ void P(double d5) {
        this.zzb |= 32;
        this.zzj = d5;
    }

    public final /* synthetic */ void Q() {
        this.zzb &= -33;
        this.zzj = 0.0d;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzk, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001ဂ\u0000\u0002ဈ\u0001\u0003ဈ\u0002\u0004ဂ\u0003\u0005ခ\u0004\u0006က\u0005", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new ta();
        }
        if (i11 == 4) {
            return new sa(zzk);
        }
        if (i11 == 5) {
            return zzk;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzl;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (ta.class) {
            try {
                m1Var = zzl;
                if (m1Var == null) {
                    m1Var = new m1(zzk);
                    zzl = m1Var;
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

    public final long y() {
        return this.zze;
    }

    public final String z() {
        return this.zzf;
    }
}
