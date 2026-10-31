package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class xd extends o1 {
    private static final xd zzl;
    private static volatile o2 zzm;
    private int zzb;
    private boolean zzf;
    private int zzh;
    private boolean zzi;
    private boolean zzj;
    private boolean zzk;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private y1 zzg = r2.f33023e;

    static {
        xd xdVar = new xd();
        zzl = xdVar;
        o1.p(xd.class, xdVar);
    }

    public static xd z(InputStream inputStream, e1 e1Var) throws zzaeh {
        xd xdVar = zzl;
        y0 y0VarH = y0.h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, inputStream);
        o1 o1VarI = xdVar.i();
        try {
            t2 t2VarA = q2.f32981c.a(o1VarI.getClass());
            aq.y yVar = (aq.y) y0VarH.f33240c;
            if (yVar == null) {
                yVar = new aq.y(y0VarH);
            }
            t2VarA.i(o1VarI, yVar, e1Var);
            t2VarA.a(o1VarI);
            o1.v(o1VarI);
            return (xd) o1VarI;
        } catch (zzaeh e3) {
            if (e3.f33302a) {
                throw new zzaeh(e3.getMessage(), e3);
            }
            throw e3;
        } catch (zzafy e11) {
            throw e11.a();
        } catch (IOException e12) {
            if (e12.getCause() instanceof zzaeh) {
                throw ((zzaeh) e12.getCause());
            }
            throw new zzaeh(e12.getMessage(), e12);
        } catch (RuntimeException e13) {
            if (e13.getCause() instanceof zzaeh) {
                throw ((zzaeh) e13.getCause());
            }
            throw e13;
        }
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzl, "\u0004\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0001\u0000\u0001ဈ\u0000\u0002ဇ\u0001\u0003\u001a\u0004᠌\u0002\u0005ဇ\u0003\u0006ဇ\u0005\u0007ဇ\u0004", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", k0.f32707b, "zzi", "zzk", "zzj"});
        }
        if (i11 == 3) {
            return new xd();
        }
        if (i11 == 4) {
            return new w8(zzl);
        }
        if (i11 == 5) {
            return zzl;
        }
        if (i11 != 6) {
            throw null;
        }
        o2 o2Var = zzm;
        if (o2Var != null) {
            return o2Var;
        }
        synchronized (xd.class) {
            try {
                m1Var = zzm;
                if (m1Var == null) {
                    m1Var = new m1(zzl);
                    zzm = m1Var;
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
        return this.zzf;
    }
}
