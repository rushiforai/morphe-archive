package com.google.android.gms.internal.measurement;

import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class fa extends o1 {
    private static final fa zzk;
    private static volatile o2 zzl;
    private int zzb;
    private long zzg;
    private float zzh;
    private double zzi;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzj = r2.f33023e;

    static {
        fa faVar = new fa();
        zzk = faVar;
        o1.p(fa.class, faVar);
    }

    public static ea J() {
        return (ea) zzk.k();
    }

    public final String A() {
        return this.zzf;
    }

    public final boolean B() {
        return (this.zzb & 4) != 0;
    }

    public final long C() {
        return this.zzg;
    }

    public final boolean D() {
        return (this.zzb & 8) != 0;
    }

    public final float E() {
        return this.zzh;
    }

    public final boolean F() {
        return (this.zzb & 16) != 0;
    }

    public final double G() {
        return this.zzi;
    }

    public final y1 H() {
        return this.zzj;
    }

    public final int I() {
        return this.zzj.size();
    }

    public final /* synthetic */ void K(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zze = str;
    }

    public final /* synthetic */ void L(String str) {
        str.getClass();
        this.zzb |= 2;
        this.zzf = str;
    }

    public final /* synthetic */ void M() {
        this.zzb &= -3;
        this.zzf = zzk.zzf;
    }

    public final /* synthetic */ void N(long j11) {
        this.zzb |= 4;
        this.zzg = j11;
    }

    public final /* synthetic */ void O() {
        this.zzb &= -5;
        this.zzg = 0L;
    }

    public final /* synthetic */ void P(double d5) {
        this.zzb |= 16;
        this.zzi = d5;
    }

    public final /* synthetic */ void Q() {
        this.zzb &= -17;
        this.zzi = 0.0d;
    }

    public final void R(fa faVar) {
        y1 y1Var = this.zzj;
        if (!((o0) y1Var).f32868a) {
            this.zzj = b.c9.i(y1Var);
        }
        this.zzj.add(faVar);
    }

    public final void S(ArrayList arrayList) {
        y1 y1Var = this.zzj;
        if (!((o0) y1Var).f32868a) {
            this.zzj = b.c9.i(y1Var);
        }
        n0.d(arrayList, this.zzj);
    }

    public final void T() {
        this.zzj = r2.f33023e;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzk, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0001\u0000\u0001ဈ\u0000\u0002ဈ\u0001\u0003ဂ\u0002\u0004ခ\u0003\u0005က\u0004\u0006\u001b", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj", fa.class});
        }
        if (i11 == 3) {
            return new fa();
        }
        if (i11 == 4) {
            return new ea(zzk);
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
        synchronized (fa.class) {
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

    public final String y() {
        return this.zze;
    }

    public final boolean z() {
        return (this.zzb & 2) != 0;
    }
}
