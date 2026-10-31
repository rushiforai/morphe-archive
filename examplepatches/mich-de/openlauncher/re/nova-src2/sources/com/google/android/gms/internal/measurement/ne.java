package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class ne extends o1 {
    private static final ne zzj;
    private static volatile o2 zzk;
    private int zzb;
    private long zzh;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private v0 zzf = v0.f33120b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzi = r2.f33023e;

    static {
        ne neVar = new ne();
        zzj = neVar;
        o1.p(ne.class, neVar);
    }

    public static me D() {
        return (me) zzj.k();
    }

    public static ne E() {
        return zzj;
    }

    public final long A() {
        return this.zzh;
    }

    public final y1 B() {
        return this.zzi;
    }

    public final int C() {
        return this.zzi.size();
    }

    public final /* synthetic */ void F(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zze = str;
    }

    public final /* synthetic */ void G(v0 v0Var) {
        v0Var.getClass();
        this.zzb |= 2;
        this.zzf = v0Var;
    }

    public final /* synthetic */ void H(String str) {
        str.getClass();
        this.zzb |= 4;
        this.zzg = str;
    }

    public final /* synthetic */ void I(long j11) {
        this.zzb |= 8;
        this.zzh = j11;
    }

    public final void J(pe peVar) {
        y1 y1Var = this.zzi;
        if (!((o0) y1Var).f32868a) {
            this.zzi = b.c9.i(y1Var);
        }
        this.zzi.add(peVar);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0001\u0000\u0001ဈ\u0000\u0002ည\u0001\u0003ဈ\u0002\u0004ဂ\u0003\u0005\u001b", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", pe.class});
        }
        if (i11 == 3) {
            return new ne();
        }
        if (i11 == 4) {
            return new me(zzj);
        }
        if (i11 == 5) {
            return zzj;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzk;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (ne.class) {
            try {
                m1Var = zzk;
                if (m1Var == null) {
                    m1Var = new m1(zzj);
                    zzk = m1Var;
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

    public final v0 y() {
        return this.zzf;
    }

    public final String z() {
        return this.zzg;
    }
}
