package g0;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class v1 implements u2.a {

    /* renamed from: a, reason: collision with root package name */
    public final h2 f56729a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f56730b;

    public v1(h2 h2Var, boolean z11) {
        this.f56729a = h2Var;
        this.f56730b = z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // u2.a
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(long j11, long j12, Continuation continuation) throws Throwable {
        u1 u1Var;
        long jF;
        if (continuation instanceof u1) {
            u1Var = (u1) continuation;
            int i5 = u1Var.f56719w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                u1Var.f56719w = i5 - Integer.MIN_VALUE;
            } else {
                u1Var = new u1(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = u1Var.f56717u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = u1Var.f56719w;
        if (i11 == 0) {
            ResultKt.b(objA);
            jF = 0;
            if (this.f56730b) {
                h2 h2Var = this.f56729a;
                if (!h2Var.f56565i) {
                    u1Var.f56716t = j12;
                    u1Var.f56719w = 1;
                    objA = h2Var.a(j12, u1Var);
                    if (objA == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                }
                jF = y3.r.f(j12, jF);
            }
            return y3.r.a(jF);
        }
        if (i11 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        j12 = u1Var.f56716t;
        ResultKt.b(objA);
        jF = ((y3.r) objA).j();
        jF = y3.r.f(j12, jF);
        return y3.r.a(jF);
    }

    @Override // u2.a
    public final long m(int i5, long j11, long j12) {
        if (!this.f56730b) {
            return 0L;
        }
        h2 h2Var = this.f56729a;
        if (h2Var.f56557a.b()) {
            return 0L;
        }
        return h2Var.h(h2Var.d(h2Var.f56557a.a(h2Var.d(h2Var.g(j12)))));
    }
}
