package xu;

import androidx.recyclerview.widget.n0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.j0;
import t70.t0;

/* loaded from: classes4.dex */
public final class e extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f96333t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Function0 f96334u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f96335v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(Function0 function0, f fVar, Continuation continuation) {
        super(2, continuation);
        this.f96334u = function0;
        this.f96335v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new e(this.f96334u, this.f96335v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f96333t;
        if (i5 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            long jG = DurationKt.g(n0.DEFAULT_SWIPE_ANIMATION_DURATION, DurationUnit.f72045d);
            this.f96333t = 1;
            if (t0.c(jG, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f96334u.invoke();
        this.f96335v.f96340e.set(false);
        return Unit.f71706a;
    }
}
