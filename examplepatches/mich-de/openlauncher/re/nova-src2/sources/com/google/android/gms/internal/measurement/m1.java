package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes3.dex */
public final class m1 implements o2 {

    /* renamed from: a, reason: collision with root package name */
    public final o1 f32810a;

    static {
        e1 e1Var = e1.f32488a;
        int i5 = p0.f32944a;
    }

    public m1(o1 o1Var) {
        this.f32810a = o1Var;
    }

    public final o1 a(InputStream inputStream, e1 e1Var) throws zzaeh {
        y0 y0VarH = y0.h(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT, inputStream);
        int i5 = o1.zzd;
        o1 o1VarI = this.f32810a.i();
        try {
            t2 t2VarA = q2.f32981c.a(o1VarI.getClass());
            aq.y yVar = (aq.y) y0VarH.f33240c;
            if (yVar == null) {
                yVar = new aq.y(y0VarH);
            }
            t2VarA.i(o1VarI, yVar, e1Var);
            t2VarA.a(o1VarI);
            y0VarH.m(0);
            if (o1.u(o1VarI, true)) {
                return o1VarI;
            }
            throw new zzafy().a();
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
}
