package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class x8 extends o1 {
    private static final x8 zzi;
    private static volatile o2 zzj;
    private int zzb;
    private int zze;
    private boolean zzg;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzh = r2.f33023e;

    static {
        x8 x8Var = new x8();
        zzi = x8Var;
        o1.p(x8.class, x8Var);
    }

    public static x8 E() {
        return zzi;
    }

    public final boolean A() {
        return (this.zzb & 4) != 0;
    }

    public final boolean B() {
        return this.zzg;
    }

    public final y1 C() {
        return this.zzh;
    }

    public final int D() {
        return this.zzh.size();
    }

    public final int F() {
        int i5;
        switch (this.zze) {
            case 0:
                i5 = 1;
                break;
            case 1:
                i5 = 2;
                break;
            case 2:
                i5 = 3;
                break;
            case 3:
                i5 = 4;
                break;
            case 4:
                i5 = 5;
                break;
            case 5:
                i5 = 6;
                break;
            case 6:
                i5 = 7;
                break;
            default:
                i5 = 0;
                break;
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
            return new s2(zzi, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0001\u0000\u0001᠌\u0000\u0002ဈ\u0001\u0003ဇ\u0002\u0004\u001a", new Object[]{"zzb", "zze", k0.f32709d, "zzf", "zzg", "zzh"});
        }
        if (i11 == 3) {
            return new x8();
        }
        if (i11 == 4) {
            return new w8(zzi);
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
        synchronized (x8.class) {
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

    public final boolean y() {
        return (this.zzb & 2) != 0;
    }

    public final String z() {
        return this.zzf;
    }
}
