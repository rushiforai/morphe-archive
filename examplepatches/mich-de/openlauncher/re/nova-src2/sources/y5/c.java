package y5;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f96722t;

    /* renamed from: u, reason: collision with root package name */
    public int f96723u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f96724v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f96725w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public c(Function2 function2, Continuation continuation, int i5) {
        super(2, continuation);
        this.f96722t = i5;
        switch (i5) {
            case 1:
                this.f96725w = (SuspendLambda) function2;
                super(2, continuation);
                break;
            default:
                this.f96725w = (SuspendLambda) function2;
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r1v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f96722t) {
            case 0:
                c cVar = new c(this.f96725w, continuation, 0);
                cVar.f96724v = obj;
                return cVar;
            default:
                c cVar2 = new c(this.f96725w, continuation, 1);
                cVar2.f96724v = obj;
                return cVar2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        b bVar = (b) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f96722t) {
        }
        return ((c) create(bVar, continuation)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Type inference failed for: r1v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r5v12, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f96722t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f96723u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b bVar = (b) this.f96724v;
                    this.f96723u = 1;
                    obj = this.f96725w.invoke(bVar, this);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                b bVar2 = (b) obj;
                Intrinsics.e(bVar2, "null cannot be cast to non-null type androidx.datastore.preferences.core.MutablePreferences");
                bVar2.f96721b.b();
                return bVar2;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f96723u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    b bVar3 = (b) this.f96724v;
                    ResultKt.b(obj);
                    return bVar3;
                }
                ResultKt.b(obj);
                b bVar4 = new b(MapsKt.u0(((b) this.f96724v).a()), false);
                this.f96724v = bVar4;
                this.f96723u = 1;
                return this.f96725w.invoke(bVar4, this) == coroutineSingletons2 ? coroutineSingletons2 : bVar4;
        }
    }
}
