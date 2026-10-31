package p10;

import b.u4;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class g2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f81776t;

    /* renamed from: u, reason: collision with root package name */
    public int f81777u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ h2 f81778v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g2(h2 h2Var, Continuation continuation) {
        super(2, continuation);
        this.f81778v = h2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new g2(this.f81778v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g2) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Ref.ObjectRef objectRef;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f81777u;
        if (i5 == 0) {
            Ref.ObjectRef objectRefL = u4.l(obj);
            objectRefL.f71863a = new i2(1, true, false);
            h2 h2Var = this.f81778v;
            t5.g gVar = h2Var.f81786a;
            f2 f2Var = new f2(h2Var, objectRefL, null);
            this.f81776t = objectRefL;
            this.f81777u = 1;
            if (vm.d.e(gVar, f2Var, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRefL;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            objectRef = this.f81776t;
            ResultKt.b(obj);
        }
        return objectRef.f71863a;
    }
}
