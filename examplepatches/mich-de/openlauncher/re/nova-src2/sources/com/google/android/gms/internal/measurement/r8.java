package com.google.android.gms.internal.measurement;

/* loaded from: classes.dex */
public final class r8 extends o1 {
    private static final r8 zzi;
    private static volatile o2 zzj;
    private int zzb;
    private x8 zze;
    private t8 zzf;
    private boolean zzg;
    private String zzh = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        r8 r8Var = new r8();
        zzi = r8Var;
        o1.p(r8.class, r8Var);
    }

    public static r8 F() {
        return zzi;
    }

    public final t8 A() {
        t8 t8Var = this.zzf;
        return t8Var == null ? t8.G() : t8Var;
    }

    public final boolean B() {
        return (this.zzb & 4) != 0;
    }

    public final boolean C() {
        return this.zzg;
    }

    public final boolean D() {
        return (this.zzb & 8) != 0;
    }

    public final String E() {
        return this.zzh;
    }

    public final /* synthetic */ void G(String str) {
        this.zzb |= 8;
        this.zzh = str;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return o1.q(zzi, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002ဉ\u0001\u0003ဇ\u0002\u0004ဈ\u0003", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new r8();
        }
        if (i11 == 4) {
            return new q8(zzi);
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
        synchronized (r8.class) {
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

    public final x8 y() {
        x8 x8Var = this.zze;
        return x8Var == null ? x8.E() : x8Var;
    }

    public final boolean z() {
        return (this.zzb & 2) != 0;
    }
}
