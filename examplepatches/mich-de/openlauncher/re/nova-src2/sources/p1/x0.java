package p1;

import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class x0 implements z1, t70.f0 {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f81626a;

    /* renamed from: b, reason: collision with root package name */
    public final Function2 f81627b;

    /* renamed from: c, reason: collision with root package name */
    public final y70.d f81628c;

    /* renamed from: d, reason: collision with root package name */
    public t70.g2 f81629d;

    public x0(CoroutineContext coroutineContext, Function2 function2) {
        this.f81626a = coroutineContext;
        this.f81627b = function2;
        this.f81628c = t70.k0.a(coroutineContext.plus(coroutineContext.get(a2.i.f111b) != null ? this : EmptyCoroutineContext.f71803a));
    }

    @Override // p1.z1
    public final void a() {
        t70.g2 g2Var = this.f81629d;
        if (g2Var != null) {
            t70.m0.h(g2Var, "Old job was still running!", null);
        }
        this.f81629d = t70.m0.t(this.f81628c, null, null, this.f81627b, 3);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return t70.d0.a(this, obj, function2);
    }

    @Override // p1.z1
    public final void g() {
        t70.g2 g2Var = this.f81629d;
        if (g2Var != null) {
            g2Var.B(new p0(1));
        }
        this.f81629d = null;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return t70.d0.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    public final CoroutineContext.Key getKey() {
        return t70.e0.f88787a;
    }

    @Override // t70.f0
    public final void handleException(CoroutineContext coroutineContext, Throwable th2) throws Throwable {
        a2.i iVar = (a2.i) coroutineContext.get(a2.i.f111b);
        if (iVar != null) {
            iVar.a(this, th2);
        }
        t70.f0 f0Var = (t70.f0) this.f81626a.get(t70.e0.f88787a);
        if (f0Var == null) {
            throw th2;
        }
        f0Var.handleException(coroutineContext, th2);
    }

    @Override // p1.z1
    public final void i() {
        t70.g2 g2Var = this.f81629d;
        if (g2Var != null) {
            g2Var.B(new p0(1));
        }
        this.f81629d = null;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return t70.d0.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return t70.d0.d(this, coroutineContext);
    }
}
