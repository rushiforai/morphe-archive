package io.ktor.utils.io;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 implements t {

    /* renamed from: b, reason: collision with root package name */
    public final t f66649b;

    /* renamed from: c, reason: collision with root package name */
    public final e80.a f66650c;

    /* renamed from: d, reason: collision with root package name */
    public long f66651d;

    /* renamed from: e, reason: collision with root package name */
    public long f66652e;

    public t0(t delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f66649b = delegate;
        this.f66650c = new e80.a();
    }

    @Override // io.ktor.utils.io.t
    public final void a(Throwable th2) {
        this.f66649b.a(th2);
    }

    @Override // io.ktor.utils.io.t
    public final Throwable b() {
        return this.f66649b.b();
    }

    public final void c() {
        d();
        this.f66651d += this.f66650c.e(this.f66649b.f());
    }

    public final void d() {
        long j11 = this.f66652e;
        long j12 = this.f66651d;
        long j13 = this.f66650c.f52247c;
        this.f66652e = (j12 - j13) + j11;
        this.f66651d = j13;
    }

    @Override // io.ktor.utils.io.t
    public final e80.a f() {
        c();
        return this.f66650c;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.ktor.utils.io.t
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(int i5, ContinuationImpl continuationImpl) {
        s0 s0Var;
        if (continuationImpl instanceof s0) {
            s0Var = (s0) continuationImpl;
            int i11 = s0Var.f66647v;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                s0Var.f66647v = i11 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(this, continuationImpl);
            }
        }
        Object objG = s0Var.f66645t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = s0Var.f66647v;
        if (i12 == 0) {
            ResultKt.b(objG);
            c();
            if (this.f66650c.f52247c >= i5) {
                return Boolean.TRUE;
            }
            s0Var.f66647v = 1;
            objG = this.f66649b.g(i5, s0Var);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objG);
        }
        if (!((Boolean) objG).booleanValue()) {
            return Boolean.FALSE;
        }
        c();
        return Boolean.TRUE;
    }

    @Override // io.ktor.utils.io.t
    public final boolean h() {
        return this.f66650c.N() && this.f66649b.h();
    }
}
