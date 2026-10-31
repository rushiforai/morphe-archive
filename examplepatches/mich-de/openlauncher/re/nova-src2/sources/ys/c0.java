package ys;

import java.util.Iterator;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kw.i2;
import kw.k2;

/* loaded from: classes4.dex */
public final class c0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ i2 f97435t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f97436u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(i2 i2Var, boolean z11, Continuation continuation) {
        super(2, continuation);
        this.f97435t = i2Var;
        this.f97436u = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new c0(this.f97435t, this.f97436u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Iterator it = this.f97435t.f72418b.iterator();
        while (it.hasNext()) {
            ((k2) it.next()).a(this.f97436u);
        }
        return Unit.f71706a;
    }
}
