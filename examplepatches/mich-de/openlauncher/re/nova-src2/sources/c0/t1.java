package c0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class t1 implements i {

    /* renamed from: a, reason: collision with root package name */
    public final j2 f18949a;

    /* renamed from: b, reason: collision with root package name */
    public final i2 f18950b;

    /* renamed from: c, reason: collision with root package name */
    public Object f18951c;

    /* renamed from: d, reason: collision with root package name */
    public Object f18952d;

    /* renamed from: e, reason: collision with root package name */
    public s f18953e;

    /* renamed from: f, reason: collision with root package name */
    public s f18954f;

    /* renamed from: g, reason: collision with root package name */
    public final s f18955g;

    /* renamed from: h, reason: collision with root package name */
    public long f18956h;

    /* renamed from: i, reason: collision with root package name */
    public s f18957i;

    public t1(m mVar, i2 i2Var, Object obj, Object obj2, s sVar) {
        this.f18949a = mVar.a(i2Var);
        this.f18950b = i2Var;
        this.f18951c = obj2;
        this.f18952d = obj;
        this.f18953e = (s) i2Var.f18832a.invoke(obj);
        Function1 function1 = i2Var.f18832a;
        this.f18954f = (s) function1.invoke(obj2);
        this.f18955g = sVar != null ? f.d(sVar) : ((s) function1.invoke(obj)).c();
        this.f18956h = -1L;
    }

    @Override // c0.i
    public final boolean a() {
        return this.f18949a.a();
    }

    @Override // c0.i
    public final s b(long j11) {
        if (!c(j11)) {
            return this.f18949a.p(j11, this.f18953e, this.f18954f, this.f18955g);
        }
        s sVar = this.f18957i;
        if (sVar != null) {
            return sVar;
        }
        s sVarT = this.f18949a.t(this.f18953e, this.f18954f, this.f18955g);
        this.f18957i = sVarT;
        return sVarT;
    }

    @Override // c0.i
    public final long d() {
        if (this.f18956h < 0) {
            this.f18956h = this.f18949a.b(this.f18953e, this.f18954f, this.f18955g);
        }
        return this.f18956h;
    }

    @Override // c0.i
    public final i2 e() {
        return this.f18950b;
    }

    @Override // c0.i
    public final Object f(long j11) {
        if (c(j11)) {
            return this.f18951c;
        }
        s sVarK = this.f18949a.k(j11, this.f18953e, this.f18954f, this.f18955g);
        int iB = sVarK.b();
        for (int i5 = 0; i5 < iB; i5++) {
            if (Float.isNaN(sVarK.a(i5))) {
                w0.b("AnimationVector cannot contain a NaN. " + sVarK + ". Animation: " + this + ", playTimeNanos: " + j11);
            }
        }
        return this.f18950b.f18833b.invoke(sVarK);
    }

    @Override // c0.i
    public final Object g() {
        return this.f18951c;
    }

    public final void h(Object obj) {
        if (Intrinsics.b(obj, this.f18952d)) {
            return;
        }
        this.f18952d = obj;
        this.f18953e = (s) this.f18950b.f18832a.invoke(obj);
        this.f18957i = null;
        this.f18956h = -1L;
    }

    public final void i(Object obj) {
        if (Intrinsics.b(this.f18951c, obj)) {
            return;
        }
        this.f18951c = obj;
        this.f18954f = (s) this.f18950b.f18832a.invoke(obj);
        this.f18957i = null;
        this.f18956h = -1L;
    }

    public final String toString() {
        return "TargetBasedAnimation: " + this.f18952d + " -> " + this.f18951c + ",initial velocity: " + this.f18955g + ", duration: " + (d() / 1000000) + " ms,animationSpec: " + this.f18949a;
    }
}
