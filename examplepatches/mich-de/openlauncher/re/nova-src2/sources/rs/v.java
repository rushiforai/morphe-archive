package rs;

import c3.b2;
import c3.c3;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import p1.e1;
import t70.j0;

/* loaded from: classes4.dex */
public final class v extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f86305t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g2.j f86306u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c3 f86307v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ e1 f86308w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v(g2.j jVar, c3 c3Var, e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f86305t = i5;
        this.f86306u = jVar;
        this.f86307v = c3Var;
        this.f86308w = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f86305t) {
            case 0:
                return new v(this.f86306u, this.f86307v, this.f86308w, continuation, 0);
            default:
                return new v(this.f86306u, this.f86307v, this.f86308w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f86305t) {
        }
        return ((v) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f86305t;
        c3 c3Var = this.f86307v;
        g2.j jVar = this.f86306u;
        e1 e1Var = this.f86308w;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                if (((j) e1Var.getValue()).f86196k == vs.g.f92957a && ((j) e1Var.getValue()).f86186a != null) {
                    ((g2.l) jVar).b(true);
                    if (c3Var != null) {
                        ((b2) c3Var).a();
                    }
                }
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                if (((j) e1Var.getValue()).f86196k == vs.g.f92957a && ((j) e1Var.getValue()).f86186a != null) {
                    ((g2.l) jVar).b(true);
                    if (c3Var != null) {
                        ((b2) c3Var).a();
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
