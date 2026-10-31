package sx;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public c80.d f87757t;

    /* renamed from: u, reason: collision with root package name */
    public i f87758u;

    /* renamed from: v, reason: collision with root package name */
    public j f87759v;

    /* renamed from: w, reason: collision with root package name */
    public int f87760w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ i f87761x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ j f87762y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ double f87763z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(i iVar, j jVar, double d5, Continuation continuation) {
        super(2, continuation);
        this.f87761x = iVar;
        this.f87762y = jVar;
        this.f87763z = d5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new e(this.f87761x, this.f87762y, this.f87763z, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        i iVar;
        j jVar;
        c80.d dVar;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f87760w;
        if (i5 == 0) {
            ResultKt.b(obj);
            iVar = this.f87761x;
            a aVar = iVar.f87785b;
            j jVar2 = this.f87762y;
            aVar.f(jVar2.f87795d.f87819b, jVar2.f87792a, jVar2.f87793b, true, this.f87763z);
            c80.d dVar2 = iVar.f87789f;
            this.f87757t = dVar2;
            this.f87758u = iVar;
            this.f87759v = jVar2;
            this.f87760w = 1;
            if (dVar2.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            jVar = jVar2;
            dVar = dVar2;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jVar = this.f87759v;
            iVar = this.f87758u;
            dVar = this.f87757t;
            ResultKt.b(obj);
        }
        try {
            i.d(iVar, jVar.f87795d.f87819b, jVar.f87792a);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
