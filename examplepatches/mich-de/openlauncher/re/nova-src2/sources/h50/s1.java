package h50;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;

/* loaded from: classes.dex */
public final class s1 extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ k50.c f59276t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ String f59277u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s1(String str, Continuation continuation) {
        super(4, continuation);
        this.f59277u = str;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        s1 s1Var = new s1(this.f59277u, (Continuation) obj4);
        s1Var.f59276t = (k50.c) obj2;
        return s1Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        k50.c cVar = this.f59276t;
        t1.f59283a.h("Adding User-Agent header: agent for " + cVar.f71117a);
        List list = o50.p.f79582a;
        cVar.f71119c.d("User-Agent", this.f59277u.toString());
        return Unit.f71706a;
    }
}
