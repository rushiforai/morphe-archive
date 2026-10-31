package l00;

import android.view.View;
import g0.t2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class k extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f72954t;

    /* renamed from: u, reason: collision with root package name */
    public int f72955u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f72956v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ View f72957w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k(View view, Continuation continuation, int i5) {
        super(2, continuation);
        this.f72954t = i5;
        this.f72957w = view;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f72954t) {
            case 0:
                k kVar = new k(this.f72957w, continuation, 0);
                kVar.f72956v = obj;
                return kVar;
            case 1:
                k kVar2 = new k(this.f72957w, continuation, 1);
                kVar2.f72956v = obj;
                return kVar2;
            default:
                k kVar3 = new k(this.f72957w, continuation, 2);
                kVar3.f72956v = obj;
                return kVar3;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        v2.b bVar = (v2.b) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f72954t) {
        }
        return ((k) create(bVar, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f72954t;
        View view = this.f72957w;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f72955u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    v2.b bVar = (v2.b) this.f72956v;
                    v2.n nVar = v2.n.f91980a;
                    this.f72955u = 1;
                    if (t2.c(bVar, this, 1) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                view.getParent().requestDisallowInterceptTouchEvent(true);
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f72955u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    v2.b bVar2 = (v2.b) this.f72956v;
                    v2.n nVar2 = v2.n.f91980a;
                    this.f72955u = 1;
                    if (t2.c(bVar2, this, 1) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                view.getParent().requestDisallowInterceptTouchEvent(true);
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f72955u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    v2.b bVar3 = (v2.b) this.f72956v;
                    v2.n nVar3 = v2.n.f91980a;
                    this.f72955u = 1;
                    if (t2.c(bVar3, this, 1) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                view.getParent().requestDisallowInterceptTouchEvent(true);
                return Unit.f71706a;
        }
    }
}
