package rs;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kw.y2;
import t70.j0;

/* loaded from: classes4.dex */
public final class y extends SuspendLambda implements Function2 {
    public final /* synthetic */ boolean A;

    /* renamed from: t, reason: collision with root package name */
    public int f86324t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q0.b f86325u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y2 f86326v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f86327w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g2.s f86328x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ g2.s f86329y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ g2.s f86330z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y(q0.b bVar, y2 y2Var, boolean z11, g2.s sVar, g2.s sVar2, g2.s sVar3, boolean z12, Continuation continuation) {
        super(2, continuation);
        this.f86325u = bVar;
        this.f86326v = y2Var;
        this.f86327w = z11;
        this.f86328x = sVar;
        this.f86329y = sVar2;
        this.f86330z = sVar3;
        this.A = z12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new y(this.f86325u, this.f86326v, this.f86327w, this.f86328x, this.f86329y, this.f86330z, this.A, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((y) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f86324t;
        boolean z11 = true;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f86324t = 1;
            if (this.f86325u.a(null, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        y2 y2Var = this.f86326v;
        String strL = y2Var.l();
        boolean z12 = strL == null || r70.k.U0(strL);
        String strL2 = y2Var.l();
        if (strL2 != null && !r70.k.U0(strL2)) {
            z11 = false;
        }
        boolean z13 = this.f86327w;
        g2.s sVar = (z13 && z12) ? this.f86328x : (z13 || !z11) ? this.A ? this.f86330z : null : this.f86329y;
        if (sVar != null) {
            g2.s.c(sVar);
        }
        return Unit.f71706a;
    }
}
