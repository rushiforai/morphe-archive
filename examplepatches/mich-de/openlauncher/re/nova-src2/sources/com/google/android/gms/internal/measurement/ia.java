package com.google.android.gms.internal.measurement;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes3.dex */
public final class ia extends o1 {
    private static final ia zzi;
    private static volatile o2 zzj;
    private int zzb;
    private y1 zze = r2.f33023e;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private int zzh;

    static {
        ia iaVar = new ia();
        zzi = iaVar;
        o1.p(ia.class, iaVar);
    }

    public static ha E() {
        return (ha) zzi.k();
    }

    public static ha F(ia iaVar) {
        l1 l1VarK = zzi.k();
        l1VarK.g(iaVar);
        return (ha) l1VarK;
    }

    public final boolean A() {
        return (this.zzb & 1) != 0;
    }

    public final String B() {
        return this.zzf;
    }

    public final boolean C() {
        return (this.zzb & 2) != 0;
    }

    public final String D() {
        return this.zzg;
    }

    public final /* synthetic */ void G(int i5, ka kaVar) {
        M();
        this.zze.set(i5, kaVar);
    }

    public final /* synthetic */ void H(ka kaVar) {
        M();
        this.zze.add(kaVar);
    }

    public final /* synthetic */ void I(ArrayList arrayList) {
        M();
        n0.d(arrayList, this.zze);
    }

    public final void J() {
        this.zze = r2.f33023e;
    }

    public final /* synthetic */ void K(String str) {
        str.getClass();
        this.zzb |= 1;
        this.zzf = str;
    }

    public final /* synthetic */ void L(String str) {
        str.getClass();
        this.zzb |= 2;
        this.zzg = str;
    }

    public final void M() {
        y1 y1Var = this.zze;
        if (((o0) y1Var).f32868a) {
            return;
        }
        this.zze = b.c9.i(y1Var);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzi, "\u0004\u0004\u0000\u0001\u0001\t\u0004\u0000\u0001\u0000\u0001\u001b\u0007ဈ\u0000\bဈ\u0001\t᠌\u0002", new Object[]{"zzb", "zze", ka.class, "zzf", "zzg", "zzh", k0.f32716k});
        }
        if (i11 == 3) {
            return new ia();
        }
        if (i11 == 4) {
            return new ha(zzi);
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
        synchronized (ia.class) {
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

    public final List x() {
        return this.zze;
    }

    public final int y() {
        return this.zze.size();
    }

    public final ka z(int i5) {
        return (ka) this.zze.get(i5);
    }
}
