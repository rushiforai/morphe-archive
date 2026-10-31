package j20;

import java.util.Collection;
import java.util.LinkedHashMap;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import t70.m0;

/* loaded from: classes4.dex */
public final class b extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f68736t;

    /* renamed from: u, reason: collision with root package name */
    public int f68737u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ LinkedHashMap f68738v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(LinkedHashMap linkedHashMap, Continuation continuation, int i5) {
        super(2, continuation);
        this.f68736t = i5;
        this.f68738v = linkedHashMap;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f68736t) {
            case 0:
                return new b(this.f68738v, continuation, 0);
            case 1:
                return new b(this.f68738v, continuation, 1);
            case 2:
                return new b(this.f68738v, continuation, 2);
            default:
                return new b(this.f68738v, continuation, 3);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f68736t) {
        }
        return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f68736t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f68737u;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                Collection collectionValues = this.f68738v.values();
                this.f68737u = 1;
                Object objF = m0.f(collectionValues, this);
                return objF == coroutineSingletons ? coroutineSingletons : objF;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f68737u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                Collection collectionValues2 = this.f68738v.values();
                this.f68737u = 1;
                Object objF2 = m0.f(collectionValues2, this);
                return objF2 == coroutineSingletons2 ? coroutineSingletons2 : objF2;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f68737u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                Collection collectionValues3 = this.f68738v.values();
                this.f68737u = 1;
                Object objF3 = m0.f(collectionValues3, this);
                return objF3 == coroutineSingletons3 ? coroutineSingletons3 : objF3;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f68737u;
                if (i13 != 0) {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                Collection collectionValues4 = this.f68738v.values();
                this.f68737u = 1;
                Object objF4 = m0.f(collectionValues4, this);
                return objF4 == coroutineSingletons4 ? coroutineSingletons4 : objF4;
        }
    }
}
