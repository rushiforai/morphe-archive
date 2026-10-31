package h50;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class b extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f59155t;

    /* renamed from: u, reason: collision with root package name */
    public int f59156u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ w50.e f59157v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f59158w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Function3 f59159x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Function3 function3, Continuation continuation, int i5) {
        super(3, continuation);
        this.f59155t = i5;
        this.f59159x = function3;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        w50.e eVar = (w50.e) obj;
        Continuation continuation = (Continuation) obj3;
        switch (this.f59155t) {
            case 0:
                b bVar = new b(this.f59159x, continuation, 0);
                bVar.f59157v = eVar;
                bVar.f59158w = obj2;
                return bVar.invokeSuspend(Unit.f71706a);
            default:
                b bVar2 = new b(this.f59159x, continuation, 1);
                bVar2.f59157v = eVar;
                bVar2.f59158w = obj2;
                return bVar2.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        w50.e eVar;
        w50.e eVar2;
        switch (this.f59155t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f59156u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    eVar = this.f59157v;
                    Object obj2 = this.f59158w;
                    if (!(obj2 instanceof r50.c)) {
                        return Unit.f71706a;
                    }
                    Object obj3 = eVar.f93783a;
                    this.f59157v = eVar;
                    this.f59156u = 1;
                    obj = this.f59159x.invoke(obj3, obj2, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        if (i5 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    eVar = this.f59157v;
                    ResultKt.b(obj);
                }
                r50.c cVar = (r50.c) obj;
                if (cVar == null) {
                    return Unit.f71706a;
                }
                this.f59157v = null;
                this.f59156u = 2;
                if (eVar.d(cVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f59156u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    eVar2 = this.f59157v;
                    Object obj4 = this.f59158w;
                    Object obj5 = eVar2.f93783a;
                    this.f59157v = eVar2;
                    this.f59156u = 1;
                    obj = this.f59159x.invoke(obj5, obj4, this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    eVar2 = this.f59157v;
                    ResultKt.b(obj);
                }
                r50.c cVar2 = (r50.c) obj;
                if (cVar2 != null) {
                    this.f59157v = null;
                    this.f59156u = 2;
                    if (eVar2.d(cVar2, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                }
                return Unit.f71706a;
        }
    }
}
