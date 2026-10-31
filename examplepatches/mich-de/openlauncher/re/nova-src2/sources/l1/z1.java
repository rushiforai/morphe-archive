package l1;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class z1 implements u2.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ a2 f74345a;

    public z1(a2 a2Var) {
        this.f74345a = a2Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11, long j12, Continuation continuation) {
        y1 y1Var;
        z1 z1Var;
        long j13;
        if (continuation instanceof y1) {
            y1Var = (y1) continuation;
            int i5 = y1Var.f74291x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y1Var.f74291x = i5 - Integer.MIN_VALUE;
            } else {
                y1Var = new y1(this, (ContinuationImpl) continuation);
            }
        }
        Object rVar = y1Var.f74289v;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = y1Var.f74291x;
        if (i11 == 0) {
            ResultKt.b(rVar);
            y1Var.f74287t = this;
            y1Var.f74288u = j12;
            y1Var.f74291x = 1;
            rVar = new y3.r(0L);
            if (rVar != obj) {
                z1Var = this;
            }
            return obj;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j13 = y1Var.f74288u;
            ResultKt.b(rVar);
            return new y3.r(y3.r.g(j13, ((y3.r) rVar).f96620a));
        }
        j12 = y1Var.f74288u;
        z1Var = y1Var.f74287t;
        ResultKt.b(rVar);
        long j14 = ((y3.r) rVar).f96620a;
        o9 o9Var = (o9) z1Var.f74345a.f73007a;
        float fE = y3.r.e(j12);
        a2 a2Var = z1Var.f74345a;
        c0.y yVar = (c0.y) a2Var.f73009c;
        c0.l1 l1Var = (c0.l1) a2Var.f73008b;
        y1Var.f74287t = null;
        y1Var.f74288u = j14;
        y1Var.f74291x = 2;
        rVar = i0.f(o9Var, fE, yVar, l1Var, y1Var);
        if (rVar != obj) {
            j13 = j14;
            return new y3.r(y3.r.g(j13, ((y3.r) rVar).f96620a));
        }
        return obj;
    }

    @Override // u2.a
    public final long g(int i5, long j11) {
        o9 o9Var = (o9) this.f74345a.f73007a;
        if (!Boolean.TRUE.booleanValue() || h2.b.e(j11) > 0.0f) {
            return 0L;
        }
        float fB = o9Var.b();
        o9Var.d(h2.b.e(j11) + o9Var.b());
        if (fB == o9Var.b()) {
            return 0L;
        }
        return h2.b.a(j11, 0.0f, 0.0f, 2);
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        o9 o9Var = (o9) this.f74345a.f73007a;
        if (!Boolean.TRUE.booleanValue()) {
            return 0L;
        }
        o9Var.f73760b.p(h2.b.e(j11) + o9Var.f73760b.m());
        if (h2.b.e(j12) < 0.0f || h2.b.e(j11) < 0.0f) {
            float fB = o9Var.b();
            o9Var.d(h2.b.e(j11) + o9Var.b());
            return ab.e0.h(0.0f, o9Var.b() - fB);
        }
        if (h2.b.e(j11) == 0.0f && h2.b.e(j12) > 0.0f) {
            o9Var.f73760b.p(0.0f);
        }
        if (h2.b.e(j12) <= 0.0f) {
            return 0L;
        }
        float fB2 = o9Var.b();
        o9Var.d(h2.b.e(j12) + o9Var.b());
        return ab.e0.h(0.0f, o9Var.b() - fB2);
    }
}
