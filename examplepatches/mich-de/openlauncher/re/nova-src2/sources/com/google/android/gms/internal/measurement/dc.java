package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class dc extends o1 {
    private static final dc zzl;
    private static volatile o2 zzm;
    private int zzb;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private v0 zzf = v0.f33120b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzh;
    private y1 zzi;
    private boolean zzj;
    private long zzk;

    static {
        dc dcVar = new dc();
        zzl = dcVar;
        o1.p(dc.class, dcVar);
    }

    public dc() {
        r2 r2Var = r2.f33023e;
        this.zzh = r2Var;
        this.zzi = r2Var;
    }

    public static cc D() {
        return (cc) zzl.k();
    }

    public final String A() {
        return this.zzg;
    }

    public final y1 B() {
        return this.zzh;
    }

    public final long C() {
        return this.zzk;
    }

    public final /* synthetic */ void E(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zze = str;
    }

    public final /* synthetic */ void F(u0 u0Var) {
        u0Var.getClass();
        this.zzb |= 2;
        this.zzf = u0Var;
    }

    public final /* synthetic */ void G(String str) {
        str.getClass();
        this.zzb |= 4;
        this.zzg = str;
    }

    public final void H(fc fcVar) {
        y1 y1Var = this.zzh;
        if (!((o0) y1Var).f32868a) {
            this.zzh = b.c9.i(y1Var);
        }
        this.zzh.add(fcVar);
    }

    public final void I(String str) {
        str.getClass();
        y1 y1Var = this.zzi;
        if (!((o0) y1Var).f32868a) {
            this.zzi = b.c9.i(y1Var);
        }
        this.zzi.add(str);
    }

    public final /* synthetic */ void J(boolean z11) {
        this.zzb |= 8;
        this.zzj = z11;
    }

    public final /* synthetic */ void K(long j11) {
        this.zzb |= 16;
        this.zzk = j11;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzl, "\u0004\u0007\u0000\u0001\u0001\t\u0007\u0000\u0002\u0000\u0001ဈ\u0002\u0002ဈ\u0000\u0003ည\u0001\u0004\u001b\u0005\u001a\bဇ\u0003\tဂ\u0004", new Object[]{"zzb", "zzg", "zze", "zzf", "zzh", fc.class, "zzi", "zzj", "zzk"});
        }
        if (i11 == 3) {
            return new dc();
        }
        if (i11 == 4) {
            return new cc(zzl);
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
        synchronized (dc.class) {
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

    public final String x() {
        return this.zze;
    }

    public final boolean y() {
        return (this.zzb & 2) != 0;
    }

    public final v0 z() {
        return this.zzf;
    }
}
