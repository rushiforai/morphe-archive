package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class ca extends o1 {
    private static final ca zzm;
    private static volatile o2 zzn;
    private int zzb;
    private y1 zze = r2.f33023e;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private long zzg;
    private long zzh;
    private int zzi;
    private long zzj;
    private long zzk;
    private long zzl;

    static {
        ca caVar = new ca();
        zzm = caVar;
        o1.p(ca.class, caVar);
    }

    public static ba N() {
        return (ba) zzm.k();
    }

    public final int A() {
        return this.zze.size();
    }

    public final fa B(int i5) {
        return (fa) this.zze.get(i5);
    }

    public final String C() {
        return this.zzf;
    }

    public final boolean D() {
        return (this.zzb & 2) != 0;
    }

    public final long E() {
        return this.zzg;
    }

    public final boolean F() {
        return (this.zzb & 4) != 0;
    }

    public final long G() {
        return this.zzh;
    }

    public final boolean H() {
        return (this.zzb & 8) != 0;
    }

    public final int I() {
        return this.zzi;
    }

    public final boolean J() {
        return (this.zzb & 32) != 0;
    }

    public final long K() {
        return this.zzk;
    }

    public final boolean L() {
        return (this.zzb & 64) != 0;
    }

    public final long M() {
        return this.zzl;
    }

    public final /* synthetic */ void O(int i5, fa faVar) {
        y();
        this.zze.set(i5, faVar);
    }

    public final /* synthetic */ void P(fa faVar) {
        faVar.getClass();
        y();
        this.zze.add(faVar);
    }

    public final /* synthetic */ void Q(Iterable iterable) {
        y();
        n0.d(iterable, this.zze);
    }

    public final void R() {
        this.zze = r2.f33023e;
    }

    public final /* synthetic */ void S(int i5) {
        y();
        this.zze.remove(i5);
    }

    public final /* synthetic */ void T(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zzf = str;
    }

    public final /* synthetic */ void U(long j11) {
        this.zzb |= 2;
        this.zzg = j11;
    }

    public final /* synthetic */ void V(long j11) {
        this.zzb |= 4;
        this.zzh = j11;
    }

    public final /* synthetic */ void W(long j11) {
        this.zzb |= 16;
        this.zzj = j11;
    }

    public final /* synthetic */ void X(long j11) {
        this.zzb |= 32;
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
            return new s2(zzm, "\u0004\b\u0000\u0001\u0001\b\b\u0000\u0001\u0000\u0001\u001b\u0002ဈ\u0000\u0003ဂ\u0001\u0004ဂ\u0002\u0005င\u0003\u0006ဂ\u0004\u0007ဂ\u0005\bဂ\u0006", new Object[]{"zzb", "zze", fa.class, "zzf", "zzg", "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new ca();
        }
        if (i11 == 4) {
            return new ba(zzm);
        }
        if (i11 == 5) {
            return zzm;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzn;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (ca.class) {
            try {
                m1Var = zzn;
                if (m1Var == null) {
                    m1Var = new m1(zzm);
                    zzn = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final /* synthetic */ void x(long j11) {
        this.zzb |= 64;
        this.zzl = j11;
    }

    public final void y() {
        y1 y1Var = this.zze;
        if (((o0) y1Var).f32868a) {
            return;
        }
        this.zze = b.c9.i(y1Var);
    }

    public final List z() {
        return this.zze;
    }
}
