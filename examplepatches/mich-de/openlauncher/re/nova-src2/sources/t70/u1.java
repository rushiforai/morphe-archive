package t70;

import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class u1 extends m {

    /* renamed from: i, reason: collision with root package name */
    public final x1 f88867i;

    public u1(Continuation continuation, x1 x1Var) {
        super(1, continuation);
        this.f88867i = x1Var;
    }

    @Override // t70.m
    public final String A() {
        return "AwaitContinuation";
    }

    @Override // t70.m
    public final Throwable r(x1 x1Var) {
        Throwable thD;
        x1 x1Var2 = this.f88867i;
        x1Var2.getClass();
        Object obj = x1.f88882a.get(x1Var2);
        return (!(obj instanceof w1) || (thD = ((w1) obj).d()) == null) ? obj instanceof v ? ((v) obj).f88869a : x1Var.h() : thD;
    }
}
