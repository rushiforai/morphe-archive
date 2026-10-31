package m1;

import c0.s1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class h extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public int f75686t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ p f75687u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ d0 f75688v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f75689w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ f1.y f75690x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f75691y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(f1.y yVar, float f11, Continuation continuation) {
        super(4, continuation);
        this.f75690x = yVar;
        this.f75691y = f11;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        h hVar = new h(this.f75690x, this.f75691y, (Continuation) obj4);
        hVar.f75687u = (p) obj;
        hVar.f75688v = (d0) obj2;
        hVar.f75689w = obj3;
        return hVar.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f75686t;
        if (i5 == 0) {
            ResultKt.b(obj);
            p pVar = this.f75687u;
            float fC = this.f75688v.c(this.f75689w);
            if (!Float.isNaN(fC)) {
                Ref.FloatRef floatRef = new Ref.FloatRef();
                f1.y yVar = this.f75690x;
                float fI = Float.isNaN(yVar.i()) ? 0.0f : yVar.i();
                floatRef.f71860a = fI;
                c0.m mVar = yVar.f54112b;
                g gVar = new g(pVar, floatRef);
                this.f75687u = null;
                this.f75688v = null;
                this.f75686t = 1;
                if (s1.a(fI, fC, this.f75691y, mVar, gVar, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
