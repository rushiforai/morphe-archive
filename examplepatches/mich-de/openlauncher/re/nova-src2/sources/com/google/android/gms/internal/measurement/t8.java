package com.google.android.gms.internal.measurement;

/* loaded from: classes.dex */
public final class t8 extends o1 {
    private static final t8 zzj;
    private static volatile o2 zzk;
    private int zzb;
    private int zze;
    private boolean zzf;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzi = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        t8 t8Var = new t8();
        zzj = t8Var;
        o1.p(t8.class, t8Var);
    }

    public static t8 G() {
        return zzj;
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

    public final String D() {
        return this.zzh;
    }

    public final boolean E() {
        return (this.zzb & 16) != 0;
    }

    public final String F() {
        return this.zzi;
    }

    public final int H() {
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
            return o1.q(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001᠌\u0000\u0002ဇ\u0001\u0003ဈ\u0002\u0004ဈ\u0003\u0005ဈ\u0004", new Object[]{"zzb", "zze", k0.f32708c, "zzf", "zzg", "zzh", "zzi"});
        }
        if (i11 == 3) {
            return new t8();
        }
        if (i11 == 4) {
            return new s8(zzj);
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
        synchronized (t8.class) {
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

    public final boolean x() {
        return (this.zzb & 1) != 0;
    }

    public final boolean y() {
        return (this.zzb & 2) != 0;
    }

    public final boolean z() {
        return this.zzf;
    }
}
