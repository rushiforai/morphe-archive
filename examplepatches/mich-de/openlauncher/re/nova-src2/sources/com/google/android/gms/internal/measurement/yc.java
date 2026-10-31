package com.google.android.gms.internal.measurement;

import java.util.List;

/* loaded from: classes3.dex */
public final class yc extends o1 {
    private static final yc zzg;
    private static volatile o2 zzh;
    private int zzb;
    private y1 zze = r2.f33023e;
    private String zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        yc ycVar = new yc();
        zzg = ycVar;
        o1.p(yc.class, ycVar);
    }

    public static yc y() {
        return zzg;
    }

    public final /* synthetic */ void A(String str) {
        this.zzb |= 1;
        this.zzf = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzg, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u001a\u0002ဈ\u0000", new Object[]{"zzb", "zze", "zzf"});
        }
        if (i11 == 3) {
            return new yc();
        }
        if (i11 == 4) {
            return new xc(zzg);
        }
        if (i11 == 5) {
            return zzg;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzh;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (yc.class) {
            try {
                m1Var = zzh;
                if (m1Var == null) {
                    m1Var = new m1(zzg);
                    zzh = m1Var;
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

    public final void z(String str) {
        y1 y1Var = this.zze;
        if (!((o0) y1Var).f32868a) {
            this.zze = b.c9.i(y1Var);
        }
        this.zze.add(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }
}
