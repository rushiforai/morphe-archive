package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class l1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f56619t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f56620u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ float f56621v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l1(Ref.FloatRef floatRef, float f11, Continuation continuation) {
        super(2, continuation);
        this.f56620u = floatRef;
        this.f56621v = f11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        l1 l1Var = new l1(this.f56620u, this.f56621v, continuation);
        l1Var.f56619t = obj;
        return l1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((l1) create((n1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f56620u.f71860a = ((n1) this.f56619t).a(this.f56621v);
        return Unit.f71706a;
    }
}
