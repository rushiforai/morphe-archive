package sx;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class g extends SuspendLambda implements Function2 {
    public final /* synthetic */ boolean A;
    public final /* synthetic */ Double B;

    /* renamed from: t, reason: collision with root package name */
    public c80.d f87768t;

    /* renamed from: u, reason: collision with root package name */
    public i f87769u;

    /* renamed from: v, reason: collision with root package name */
    public j f87770v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f87771w;

    /* renamed from: x, reason: collision with root package name */
    public int f87772x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ i f87773y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ j f87774z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(i iVar, j jVar, boolean z11, Double d5, Continuation continuation) {
        super(2, continuation);
        this.f87773y = iVar;
        this.f87774z = jVar;
        this.A = z11;
        this.B = d5;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new g(this.f87773y, this.f87774z, this.A, this.B, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((g) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        j jVar;
        c80.d dVar;
        i iVar;
        boolean z11;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f87772x;
        if (i5 == 0) {
            ResultKt.b(obj);
            i iVar2 = this.f87773y;
            a aVar = iVar2.f87785b;
            jVar = this.f87774z;
            String str = jVar.f87795d.f87819b;
            o oVar = jVar.f87792a;
            String str2 = jVar.f87793b;
            Double d5 = this.B;
            aVar.f(str, oVar, str2, this.A, d5 != null ? d5.doubleValue() : 0.0d);
            dVar = iVar2.f87789f;
            this.f87768t = dVar;
            this.f87769u = iVar2;
            this.f87770v = jVar;
            boolean z12 = this.A;
            this.f87771w = z12;
            this.f87772x = 1;
            if (dVar.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            iVar = iVar2;
            z11 = z12;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z11 = this.f87771w;
            jVar = this.f87770v;
            iVar = this.f87769u;
            dVar = this.f87768t;
            ResultKt.b(obj);
        }
        if (!z11) {
            try {
                i.a(iVar, jVar);
            } catch (Throwable th2) {
                dVar.g(null);
                throw th2;
            }
        }
        i.d(iVar, jVar.f87795d.f87819b, jVar.f87792a);
        Unit unit = Unit.f71706a;
        dVar.g(null);
        return Unit.f71706a;
    }
}
