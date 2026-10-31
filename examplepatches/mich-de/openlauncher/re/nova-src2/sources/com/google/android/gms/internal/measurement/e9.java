package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class e9 extends o1 {
    private static final e9 zzi;
    private static volatile o2 zzj;
    private int zzb;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private boolean zzf;
    private boolean zzg;
    private int zzh;

    static {
        e9 e9Var = new e9();
        zzi = e9Var;
        o1.p(e9.class, e9Var);
    }

    public final boolean A() {
        return (this.zzb & 4) != 0;
    }

    public final boolean B() {
        return this.zzg;
    }

    public final boolean C() {
        return (this.zzb & 8) != 0;
    }

    public final int D() {
        return this.zzh;
    }

    public final /* synthetic */ void E(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zze = str;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzi, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဇ\u0001\u0003ဇ\u0002\u0004င\u0003", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new e9();
        }
        if (i11 == 4) {
            return new d9(zzi);
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
        synchronized (e9.class) {
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

    public final String x() {
        return this.zze;
    }

    public final boolean y() {
        return (this.zzb & 2) != 0;
    }

    public final boolean z() {
        return this.zzf;
    }
}
