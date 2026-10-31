package xu;

import java.io.Closeable;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import tx.g4;
import w70.i2;
import w70.u1;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final j0 f96336a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f96337b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f96338c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f96339d;

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f96340e = new AtomicBoolean(false);

    /* renamed from: f, reason: collision with root package name */
    public final i2 f96341f;

    /* renamed from: g, reason: collision with root package name */
    public final uw.c f96342g;

    /* renamed from: h, reason: collision with root package name */
    public final uw.c f96343h;

    public f(j0 j0Var, Object obj, boolean z11, Function1 function1) {
        this.f96336a = j0Var;
        this.f96337b = obj;
        this.f96338c = z11;
        this.f96339d = function1;
        i2 i2VarC = u1.c(ul.b.P(obj));
        this.f96341f = i2VarC;
        this.f96342g = ps.v.u(i2VarC, new g4(29));
        this.f96343h = ps.v.u(i2VarC, new c(0));
    }

    public final boolean a() {
        return ((List) this.f96341f.getValue()).size() > 1;
    }

    public final void b() {
        if (this.f96340e.get()) {
            return;
        }
        c();
    }

    public final void c() {
        i2 i2Var;
        Object value;
        ArrayList arrayListK1;
        do {
            i2Var = this.f96341f;
            value = i2Var.getValue();
            arrayListK1 = b70.g.K1((List) value);
            Object objRemove = arrayListK1.remove(ul.b.K(arrayListK1));
            if (objRemove instanceof Closeable) {
                ((Closeable) objRemove).close();
            }
            this.f96339d.invoke(objRemove);
        } while (!i2Var.i(value, b70.g.I1(arrayListK1)));
    }

    public final void d(List screens) {
        Intrinsics.g(screens, "screens");
        if (this.f96340e.get()) {
            return;
        }
        i2 i2Var = this.f96341f;
        List list = (List) i2Var.getValue();
        i2Var.getClass();
        i2Var.k(null, screens);
        for (Object obj : list) {
            if (!screens.contains(obj) && (obj instanceof Closeable)) {
                ((Closeable) obj).close();
            }
        }
    }

    public final void e(v vVar) {
        if (this.f96340e.get()) {
            return;
        }
        f(vVar);
    }

    public final void f(Object obj) {
        i2 i2Var;
        Object value;
        List list;
        do {
            i2Var = this.f96341f;
            value = i2Var.getValue();
            list = (List) value;
        } while (!i2Var.i(value, this.f96338c ? b70.g.u1(b70.g.p1(list, this.f96337b), obj) : b70.g.u1(list, obj)));
    }
}
