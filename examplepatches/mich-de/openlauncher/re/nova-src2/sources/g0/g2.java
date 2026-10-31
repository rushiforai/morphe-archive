package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class g2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public long f56545t;

    /* renamed from: u, reason: collision with root package name */
    public int f56546u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ long f56547v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h2 f56548w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g2(h2 h2Var, Continuation continuation) {
        super(2, continuation);
        this.f56548w = h2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        g2 g2Var = new g2(this.f56548w, continuation);
        g2Var.f56547v = ((y3.r) obj).f96620a;
        return g2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        long j11 = ((y3.r) obj).f96620a;
        g2 g2Var = new g2(this.f56548w, (Continuation) obj2);
        g2Var.f56547v = j11;
        return g2Var.invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x006f  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) throws Throwable {
        long j11;
        long j12;
        long j13;
        long j14;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f56546u;
        h2 h2Var = this.f56548w;
        if (i5 == 0) {
            ResultKt.b(obj);
            j11 = this.f56547v;
            x7.h hVar = h2Var.f56562f;
            this.f56547v = j11;
            this.f56546u = 1;
            obj = hVar.g(j11, this);
            if (obj != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                if (i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j14 = this.f56545t;
                j13 = this.f56547v;
                ResultKt.b(obj);
                return new y3.r(y3.r.f(j13, y3.r.f(j14, ((y3.r) obj).f96620a)));
            }
            j12 = this.f56545t;
            j11 = this.f56547v;
            ResultKt.b(obj);
            long j15 = ((y3.r) obj).f96620a;
            x7.h hVar2 = h2Var.f56562f;
            long jF = y3.r.f(j12, j15);
            this.f56547v = j11;
            this.f56545t = j15;
            this.f56546u = 3;
            obj = hVar2.f(jF, j15, this);
            if (obj != coroutineSingletons) {
                j13 = j11;
                j14 = j15;
                return new y3.r(y3.r.f(j13, y3.r.f(j14, ((y3.r) obj).f96620a)));
            }
            return coroutineSingletons;
        }
        j11 = this.f56547v;
        ResultKt.b(obj);
        long jF2 = y3.r.f(j11, ((y3.r) obj).f96620a);
        this.f56547v = j11;
        this.f56545t = jF2;
        this.f56546u = 2;
        obj = h2Var.a(jF2, this);
        if (obj != coroutineSingletons) {
            j12 = jF2;
            long j152 = ((y3.r) obj).f96620a;
            x7.h hVar22 = h2Var.f56562f;
            long jF3 = y3.r.f(j12, j152);
            this.f56547v = j11;
            this.f56545t = j152;
            this.f56546u = 3;
            obj = hVar22.f(jF3, j152, this);
            if (obj != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
