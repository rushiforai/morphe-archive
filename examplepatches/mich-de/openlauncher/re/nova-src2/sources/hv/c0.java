package hv;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class c0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f60169t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f60170u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ d0 f60171v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c0(d0 d0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f60169t = i5;
        this.f60171v = d0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f60169t) {
            case 0:
                c0 c0Var = new c0(this.f60171v, continuation, 0);
                c0Var.f60170u = obj;
                return c0Var;
            default:
                c0 c0Var2 = new c0(this.f60171v, continuation, 1);
                c0Var2.f60170u = obj;
                return c0Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f60169t) {
            case 0:
                return ((c0) create((ou.a) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((c0) create((q) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f60169t;
        d0 d0Var = this.f60171v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                d0Var.f60199f.invoke((ou.a) this.f60170u);
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return d0Var.c((q) this.f60170u, d0Var.f60202i);
        }
    }
}
