package qw;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class q extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public int f84392t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ v f84393u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ String f84394v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ int f84395w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ int f84396x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(v vVar, String str, int i5, int i11, Continuation continuation) {
        super(1, continuation);
        this.f84393u = vVar;
        this.f84394v = str;
        this.f84395w = i5;
        this.f84396x = i11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new q(this.f84393u, this.f84394v, this.f84395w, this.f84396x, continuation);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return ((q) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object objC;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f84392t;
        if (i5 == 0) {
            ResultKt.b(obj);
            v vVar = this.f84393u;
            String str = this.f84394v;
            Result resultB = v.b(vVar, str);
            if (resultB == null && (resultB = v.a(vVar, str)) == null) {
                this.f84392t = 1;
                objC = v.c(vVar, str, this.f84395w, this.f84396x, this);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                objC = resultB.f71688a;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objC = ((Result) obj).f71688a;
        }
        return new Result(objC);
    }
}
