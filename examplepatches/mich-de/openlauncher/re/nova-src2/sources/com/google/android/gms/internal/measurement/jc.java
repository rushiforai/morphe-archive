package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes3.dex */
public final class jc extends o1 {
    private static final jc zzj;
    private static volatile o2 zzk;
    private int zzb;
    private long zzh;
    private f2 zzi = f2.f32523b;
    private String zze = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    private v0 zzf = v0.f33120b;
    private String zzg = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    static {
        jc jcVar = new jc();
        zzj = jcVar;
        o1.p(jc.class, jcVar);
    }

    public static jc D(y0 y0Var, e1 e1Var) {
        o1 o1VarI = zzj.i();
        try {
            t2 t2VarA = q2.f32981c.a(o1VarI.getClass());
            aq.y yVar = (aq.y) y0Var.f33240c;
            if (yVar == null) {
                yVar = new aq.y(y0Var);
            }
            t2VarA.i(o1VarI, yVar, e1Var);
            t2VarA.a(o1VarI);
            o1.v(o1VarI);
            return (jc) o1VarI;
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

    public static jc E() {
        return zzj;
    }

    public final long A() {
        return this.zzh;
    }

    public final int B() {
        return this.zzi.size();
    }

    public final Map C() {
        return Collections.unmodifiableMap(this.zzi);
    }

    @Override // com.google.android.gms.internal.measurement.o1
    public final Object w(int i5) {
        o2 m1Var;
        int i11 = i5 - 1;
        if (i11 == 0) {
            return (byte) 1;
        }
        if (i11 == 2) {
            return new s2(zzj, "\u0004\u0005\u0000\u0001\u0001\u0005\u0005\u0001\u0000\u0000\u0001ဈ\u0000\u0002ည\u0001\u0003ဈ\u0002\u0004ဂ\u0003\u00052", new Object[]{"zzb", "zze", "zzf", "zzg", "zzh", "zzi", ic.f32652a});
        }
        if (i11 == 3) {
            return new jc();
        }
        if (i11 == 4) {
            return new w8(zzj);
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
        synchronized (jc.class) {
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

    public final String x() {
        return this.zze;
    }

    public final v0 y() {
        return this.zzf;
    }

    public final String z() {
        return this.zzg;
    }
}
