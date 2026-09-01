package defpackage;

import com.google.gson.JsonSyntaxException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class c2b extends jud {
    public final e2b a;

    public c2b(e2b e2bVar) {
        this.a = e2bVar;
    }

    @Override // defpackage.jud
    public final Object b(gd6 gd6Var) throws IOException {
        if (gd6Var.p0() == jd6.NULL) {
            gd6Var.a0();
            return null;
        }
        Object objD = d();
        Map map = this.a.a;
        try {
            gd6Var.m();
            while (gd6Var.hasNext()) {
                b2b b2bVar = (b2b) map.get(gd6Var.X());
                if (b2bVar == null) {
                    gd6Var.v();
                } else {
                    f(objD, gd6Var, b2bVar);
                }
            }
            gd6Var.I();
            return e(objD);
        } catch (IllegalAccessException e) {
            to7 to7Var = w1b.a;
            lg8.p("Unexpected IllegalAccessException occurred (Gson 2.14.0). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e);
            return null;
        } catch (IllegalStateException e2) {
            throw new JsonSyntaxException(e2);
        }
    }

    @Override // defpackage.jud
    public final void c(yd6 yd6Var, Object obj) throws IOException {
        if (obj == null) {
            yd6Var.Q();
            return;
        }
        yd6Var.p();
        try {
            Iterator it2 = this.a.b.iterator();
            while (it2.hasNext()) {
                ((b2b) it2.next()).a(yd6Var, obj);
            }
            yd6Var.I();
        } catch (IllegalAccessException e) {
            to7 to7Var = w1b.a;
            lg8.p("Unexpected IllegalAccessException occurred (Gson 2.14.0). Certain ReflectionAccessFilter features require Java >= 9 to work correctly. If you are not using ReflectionAccessFilter, report this to the Gson maintainers.", e);
        }
    }

    public abstract Object d();

    public abstract Object e(Object obj);

    public abstract void f(Object obj, gd6 gd6Var, b2b b2bVar);
}
