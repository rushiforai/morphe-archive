package h6;

import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class q1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.c0 f59422a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f59423b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ r1 f59424c;

    public q1(u70.d dVar, u uVar, r1 r1Var) {
        this.f59422a = dVar;
        this.f59423b = uVar;
        this.f59424c = r1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        EmptyCoroutineContext emptyCoroutineContext = EmptyCoroutineContext.f71803a;
        t70.c0 c0Var = this.f59422a;
        boolean zE0 = c0Var.e0(emptyCoroutineContext);
        r1 r1Var = this.f59424c;
        u uVar = this.f59423b;
        if (zE0) {
            c0Var.c0(emptyCoroutineContext, new p1(uVar, r1Var, 1));
        } else {
            uVar.c(r1Var);
        }
        return Unit.f71706a;
    }
}
