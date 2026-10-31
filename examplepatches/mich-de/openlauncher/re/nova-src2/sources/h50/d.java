package h50;

import ads_mobile_sdk.cq0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import p1.w1;

/* loaded from: classes.dex */
public final class d extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f59167t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f59168u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d(int i5, Continuation continuation, int i11) {
        super(i5, continuation);
        this.f59167t = i11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f59167t) {
            case 0:
                d dVar = new d(2, continuation, 0);
                dVar.f59168u = obj;
                return dVar;
            case 1:
                d dVar2 = new d(2, continuation, 1);
                dVar2.f59168u = obj;
                return dVar2;
            case 2:
                d dVar3 = new d(2, continuation, 2);
                dVar3.f59168u = obj;
                return dVar3;
            default:
                d dVar4 = new d(2, continuation, 3);
                dVar4.f59168u = obj;
                return dVar4;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f59167t) {
            case 0:
                ((d) create((l50.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
                return null;
            case 1:
                d dVar = new d(2, (Continuation) obj2, 1);
                dVar.f59168u = (cq0) obj;
                return dVar.invokeSuspend(Unit.f71706a);
            case 2:
                return ((d) create((w1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((d) create((w70.w1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f59167t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                if (((l50.b) this.f59168u).b().c().getAttributes().d(e.f59174b) == null) {
                    return null;
                }
                throw new ClassCastException();
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                b.l0 l0Var = (b.l0) ((cq0) this.f59168u).n();
                l0Var.c(l0Var.d() + 1);
                return (cq0) l0Var.a();
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(((w1) this.f59168u) == w1.f81613a);
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return Boolean.valueOf(((w70.w1) this.f59168u) != w70.w1.f94061a);
        }
    }
}
