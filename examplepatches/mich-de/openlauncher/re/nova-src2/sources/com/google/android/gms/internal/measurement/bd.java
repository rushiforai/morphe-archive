package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class bd extends o1 {
    private static final bd zze;
    private static volatile o2 zzf;
    private f2 zzb = f2.f32523b;

    static {
        bd bdVar = new bd();
        zze = bdVar;
        o1.p(bd.class, bdVar);
    }

    public static bd y() {
        return zze;
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zze, "\u0004\u0001\u0000\u0000\u0002\u0002\u0001\u0001\u0000\u0000\u00022", new Object[]{"zzb", zc.f33294a});
        }
        if (i11 == 3) {
            return new bd();
        }
        if (i11 == 4) {
            return new ad(zze);
        }
        if (i11 == 5) {
            return zze;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzf;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (bd.class) {
            try {
                m1Var = zzf;
                if (m1Var == null) {
                    m1Var = new m1(zze);
                    zzf = m1Var;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return m1Var;
    }

    public final yc x(String str, yc ycVar) {
        str.getClass();
        yc ycVar2 = (yc) this.zzb.get(str);
        return ycVar2 != null ? ycVar2 : ycVar;
    }

    public final f2 z() {
        f2 f2Var = this.zzb;
        if (!f2Var.f32524a) {
            this.zzb = f2Var.a();
        }
        return this.zzb;
    }
}
