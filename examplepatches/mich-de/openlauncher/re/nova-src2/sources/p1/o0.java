package p1;

import java.util.Arrays;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public abstract class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f81517a = new l0();

    public static final void a(Object obj, Object obj2, Function1 function1, o oVar) {
        t tVar = (t) oVar;
        boolean zF = tVar.f(obj) | tVar.f(obj2);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new j0(function1);
            tVar.m0(objP);
        }
    }

    public static final void b(Object obj, Function1 function1, o oVar) {
        t tVar = (t) oVar;
        boolean zF = tVar.f(obj);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new j0(function1);
            tVar.m0(objP);
        }
    }

    public static final void c(Object[] objArr, Function1 function1, o oVar) {
        boolean zF = false;
        for (Object obj : Arrays.copyOf(objArr, objArr.length)) {
            zF |= ((t) oVar).f(obj);
        }
        t tVar = (t) oVar;
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            tVar.m0(new j0(function1));
        }
    }

    public static final void d(Object obj, Object obj2, Object obj3, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        CoroutineContext coroutineContext = tVar.R;
        boolean zF = tVar.f(obj) | tVar.f(obj2) | tVar.f(obj3);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new x0(coroutineContext, function2);
            tVar.m0(objP);
        }
    }

    public static final void e(Object obj, Object obj2, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        CoroutineContext coroutineContext = tVar.R;
        boolean zF = tVar.f(obj) | tVar.f(obj2);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new x0(coroutineContext, function2);
            tVar.m0(objP);
        }
    }

    public static final void f(Object obj, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        CoroutineContext coroutineContext = tVar.R;
        boolean zF = tVar.f(obj);
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            objP = new x0(coroutineContext, function2);
            tVar.m0(objP);
        }
    }

    public static final void g(Object[] objArr, Function2 function2, o oVar) {
        t tVar = (t) oVar;
        CoroutineContext coroutineContext = tVar.R;
        boolean zF = false;
        for (Object obj : Arrays.copyOf(objArr, objArr.length)) {
            zF |= tVar.f(obj);
        }
        Object objP = tVar.P();
        if (zF || objP == n.f81514a) {
            tVar.m0(new x0(coroutineContext, function2));
        }
    }

    public static final void h(Function0 function0, o oVar) {
        q1.m0 m0Var = ((t) oVar).M.f83367b.f83364b;
        m0Var.q0(q1.b0.f83378c);
        fg.a.P(m0Var, 0, function0);
    }

    public static final t70.j0 i(CoroutineContext coroutineContext, o oVar) {
        if (coroutineContext.get(t70.q1.f88853a) == null) {
            return new c2(((t) oVar).R, coroutineContext);
        }
        t70.s1 s1VarC = t70.m0.c();
        s1VarC.X(new t70.v(false, new IllegalArgumentException("CoroutineContext supplied to rememberCoroutineScope may not include a parent job")));
        return t70.k0.a(s1VarC);
    }
}
