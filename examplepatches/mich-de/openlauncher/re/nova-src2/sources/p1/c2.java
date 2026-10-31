package p1;

import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c2 implements t70.j0, z1 {

    /* renamed from: e, reason: collision with root package name */
    public static final h f81389e = new h();

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f81390a;

    /* renamed from: b, reason: collision with root package name */
    public final CoroutineContext f81391b;

    /* renamed from: c, reason: collision with root package name */
    public final c2 f81392c = this;

    /* renamed from: d, reason: collision with root package name */
    public volatile CoroutineContext f81393d;

    public c2(CoroutineContext coroutineContext, CoroutineContext coroutineContext2) {
        this.f81390a = coroutineContext;
        this.f81391b = coroutineContext2;
    }

    @Override // p1.z1
    public final void a() {
    }

    public final void b() {
        synchronized (this.f81392c) {
            try {
                CoroutineContext coroutineContext = this.f81393d;
                if (coroutineContext == null) {
                    this.f81393d = f81389e;
                } else {
                    t70.m0.g(coroutineContext, new p0(0));
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // p1.z1
    public final void g() {
        b();
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        CoroutineContext coroutineContextPlus;
        CoroutineContext coroutineContext = this.f81393d;
        if (coroutineContext == null || coroutineContext == f81389e) {
            a2.i iVar = (a2.i) this.f81390a.get(a2.i.f111b);
            CoroutineContext b2Var = iVar != null ? new b2(iVar, this) : EmptyCoroutineContext.f71803a;
            synchronized (this.f81392c) {
                try {
                    CoroutineContext coroutineContext2 = this.f81393d;
                    if (coroutineContext2 == null) {
                        CoroutineContext coroutineContext3 = this.f81390a;
                        coroutineContextPlus = coroutineContext3.plus(new t70.s1((t70.r1) coroutineContext3.get(t70.q1.f88853a))).plus(this.f81391b).plus(b2Var);
                    } else if (coroutineContext2 == f81389e) {
                        CoroutineContext coroutineContext4 = this.f81390a;
                        t70.s1 s1Var = new t70.s1((t70.r1) coroutineContext4.get(t70.q1.f88853a));
                        s1Var.z(new p0(0));
                        coroutineContextPlus = coroutineContext4.plus(s1Var).plus(this.f81391b).plus(b2Var);
                    } else {
                        coroutineContextPlus = coroutineContext2;
                    }
                    this.f81393d = coroutineContextPlus;
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            coroutineContext = coroutineContextPlus;
        }
        Intrinsics.d(coroutineContext);
        return coroutineContext;
    }

    @Override // p1.z1
    public final void i() {
        b();
    }
}
