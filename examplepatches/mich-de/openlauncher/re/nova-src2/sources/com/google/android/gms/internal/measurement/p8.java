package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes.dex */
public final class p8 extends o1 {
    private static final p8 zzm;
    private static volatile o2 zzn;
    private int zzb;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzg = o1.s();
    private boolean zzh;
    private t8 zzi;
    private boolean zzj;
    private boolean zzk;
    private boolean zzl;

    static {
        p8 p8Var = new p8();
        zzm = p8Var;
        o1.p(p8.class, p8Var);
    }

    public static o8 J() {
        return (o8) zzm.k();
    }

    public final List A() {
        return this.zzg;
    }

    public final int B() {
        return this.zzg.size();
    }

    public final r8 C(int i5) {
        return (r8) this.zzg.get(i5);
    }

    public final boolean D() {
        return (this.zzb & 8) != 0;
    }

    public final t8 E() {
        t8 t8Var = this.zzi;
        return t8Var == null ? t8.G() : t8Var;
    }

    public final boolean F() {
        return this.zzj;
    }

    public final boolean G() {
        return this.zzk;
    }

    public final boolean H() {
        return (this.zzb & 64) != 0;
    }

    public final boolean I() {
        return this.zzl;
    }

    public final /* synthetic */ void K(String str) {
        this.zzb |= 2;
        this.zzf = str;
    }

    public final /* synthetic */ void L(int i5, r8 r8Var) {
        o0 o0Var = (o0) this.zzg;
        if (!o0Var.c()) {
            this.zzg = o1.t(o0Var);
        }
        this.zzg.set(i5, r8Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return o1.q(zzm, "\u0004\b\u0000\u0001\u0001\b\b\u0000\u0001\u0000\u0001င\u0000\u0002ဈ\u0001\u0003\u001b\u0004ဇ\u0002\u0005ဉ\u0003\u0006ဇ\u0004\u0007ဇ\u0005\bဇ\u0006", new Object[]{"zzb", "zze", "zzf", "zzg", r8.class, "zzh", "zzi", "zzj", "zzk", "zzl"});
        }
        if (i11 == 3) {
            return new p8();
        }
        if (i11 == 4) {
            return new o8(zzm);
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
        synchronized (p8.class) {
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

    public final boolean x() {
        return (this.zzb & 1) != 0;
    }

    public final int y() {
        return this.zze;
    }

    public final String z() {
        return this.zzf;
    }
}
