package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class xa extends o1 {
    private static final xa zzk;
    private static volatile o2 zzl;
    private int zzb;
    private int zze;
    private y1 zzf = r2.f33023e;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private boolean zzi;
    private double zzj;

    static {
        xa xaVar = new xa();
        zzk = xaVar;
        o1.p(xa.class, xaVar);
    }

    public final String A() {
        return this.zzh;
    }

    public final boolean B() {
        return (this.zzb & 8) != 0;
    }

    public final boolean C() {
        return this.zzi;
    }

    public final boolean D() {
        return (this.zzb & 16) != 0;
    }

    public final double E() {
        return this.zzj;
    }

    public final int F() {
        int i5;
        int i11 = this.zze;
        if (i11 != 0) {
            i5 = 2;
            if (i11 != 1) {
                if (i11 != 2) {
                    i5 = 4;
                    if (i11 != 3) {
                        i5 = i11 != 4 ? 0 : 5;
                    }
                } else {
                    i5 = 3;
                }
            }
        } else {
            i5 = 1;
        }
        if (i5 == 0) {
            return 1;
        }
        return i5;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzk, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0001\u0000\u0001᠌\u0000\u0002\u001b\u0003ဈ\u0001\u0004ဈ\u0002\u0005ဇ\u0003\u0006က\u0004", new Object[]{"zzb", "zze", k0.f32719p, "zzf", xa.class, "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new xa();
        }
        if (i11 == 4) {
            return new w8(zzk);
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
        synchronized (xa.class) {
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

    public final List x() {
        return this.zzf;
    }

    public final String y() {
        return this.zzg;
    }

    public final boolean z() {
        return (this.zzb & 4) != 0;
    }
}
