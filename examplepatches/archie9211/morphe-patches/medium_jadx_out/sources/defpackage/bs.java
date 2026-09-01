package defpackage;

import android.os.Build;
import android.os.Trace;
import androidx.work.impl.WorkerStoppedException;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bs implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ bs(String str, g08 g08Var, String str2, boolean z) {
        this.a = 1;
        this.c = str;
        this.d = g08Var;
        this.e = str2;
        this.b = z;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        boolean z = this.b;
        Object obj2 = this.e;
        Object obj3 = this.d;
        Object obj4 = this.c;
        switch (i) {
            case 0:
                wp wpVar = (wp) obj3;
                bs0 bs0Var = (bs0) obj2;
                cq6 cq6Var = (cq6) obj;
                cq6Var.a();
                g61 g61Var = cq6Var.a;
                if (((Boolean) ((m45) obj4).invoke()).booleanValue()) {
                    if (z) {
                        long jK0 = g61Var.k0();
                        m50 m50Var = g61Var.b;
                        long jB = m50Var.B();
                        m50Var.x().h();
                        try {
                            ((md5) m50Var.b).z(-1.0f, 1.0f, jK0);
                            ho2.m(cq6Var, wpVar, bs0Var);
                        } finally {
                            y30.x(m50Var, jB);
                        }
                    } else {
                        ho2.m(cq6Var, wpVar, bs0Var);
                    }
                }
                return c1eVar;
            case 1:
                wr2 wr2Var = (wr2) obj;
                wr2Var.getClass();
                eo2 eo2Var = wr2Var.a;
                ko2 ko2Var = eo2Var.b;
                gn9 gn9Var = (gn9) ko2Var.u.get();
                ys2 ys2Var = (ys2) eo2Var.e;
                fr9 fr9VarR = ys2Var.r();
                hx4 hx4VarH = ko2Var.h();
                ko2 ko2Var2 = ys2Var.b;
                y8b y8bVar = new y8b((gn9) ko2Var2.u.get(), ko2Var2.q(), 0);
                a1a a1aVarL = ys2Var.L();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new z9b((String) obj4, (g08) obj3, (String) obj2, this.b, gn9Var, fr9VarR, hx4VarH, y8bVar, a1aVarL, r13Var, ys2Var.a);
            default:
                k37 k37Var = (k37) obj4;
                String str = (String) obj3;
                u8f u8fVar = (u8f) obj2;
                Throwable th = (Throwable) obj;
                if (th instanceof WorkerStoppedException) {
                    k37Var.stop(((WorkerStoppedException) th).a);
                }
                if (z && str != null) {
                    int iHashCode = u8fVar.a.hashCode();
                    if (Build.VERSION.SDK_INT >= 29) {
                        kqd.b(iHashCode, gq7.X(str));
                    } else {
                        String strX = gq7.X(str);
                        try {
                            Method method = gq7.e;
                            if (method == null) {
                                method = Trace.class.getMethod("asyncTraceEnd", Long.TYPE, String.class, Integer.TYPE);
                                gq7.e = method;
                            }
                            method.invoke(null, Long.valueOf(gq7.b), strX, Integer.valueOf(iHashCode));
                        } catch (Exception e) {
                            gq7.B("asyncTraceEnd", e);
                        }
                    }
                    break;
                }
                return c1eVar;
        }
    }

    public /* synthetic */ bs(int i, Object obj, Object obj2, Object obj3, boolean z) {
        this.a = i;
        this.c = obj;
        this.b = z;
        this.d = obj2;
        this.e = obj3;
    }
}
