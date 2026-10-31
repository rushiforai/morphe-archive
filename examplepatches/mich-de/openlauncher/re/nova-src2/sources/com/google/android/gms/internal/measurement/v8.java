package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class v8 extends o1 {
    private static final v8 zzk;
    private static volatile o2 zzl;
    private int zzb;
    private int zze;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private r8 zzg;
    private boolean zzh;
    private boolean zzi;
    private boolean zzj;

    static {
        v8 v8Var = new v8();
        zzk = v8Var;
        o1.p(v8.class, v8Var);
    }

    public static u8 F() {
        return (u8) zzk.k();
    }

    public final r8 A() {
        r8 r8Var = this.zzg;
        return r8Var == null ? r8.F() : r8Var;
    }

    public final boolean B() {
        return this.zzh;
    }

    public final boolean C() {
        return this.zzi;
    }

    public final boolean D() {
        return (this.zzb & 32) != 0;
    }

    public final boolean E() {
        return this.zzj;
    }

    public final /* synthetic */ void G(String str) {
        this.zzb |= 2;
        this.zzf = str;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzk, "\u0004\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001င\u0000\u0002ဈ\u0001\u0003ဉ\u0002\u0004ဇ\u0003\u0005ဇ\u0004\u0006ဇ\u0005", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i11 == 3) {
            return new v8();
        }
        if (i11 == 4) {
            return new u8(zzk);
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
        synchronized (v8.class) {
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

    public final int y() {
        return this.zze;
    }

    public final String z() {
        return this.zzf;
    }
}
