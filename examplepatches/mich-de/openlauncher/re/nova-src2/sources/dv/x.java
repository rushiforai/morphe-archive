package dv;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.t0;

/* loaded from: classes4.dex */
public final class x extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public long f49657t;

    /* renamed from: u, reason: collision with root package name */
    public int f49658u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f49659v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f49660w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(long j11, Continuation continuation) {
        super(2, continuation);
        this.f49660w = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        x xVar = new x(this.f49660w, continuation);
        xVar.f49659v = obj;
        return xVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((x) create((w70.n) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0086  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0083 -> B:15:0x0048). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        w70.n nVar;
        long jL;
        Duration duration;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f49658u;
        if (i5 == 0) {
            ResultKt.b(obj);
            nVar = (w70.n) this.f49659v;
            jL = this.f49660w;
            Duration duration2 = new Duration(jL);
            this.f49659v = nVar;
            this.f49657t = jL;
            this.f49658u = 1;
            if (nVar.emit(duration2, this) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 == 2) {
                jL = this.f49657t;
                nVar = (w70.n) this.f49659v;
                ResultKt.b(obj);
                Duration.Companion companion = Duration.f72038b;
                jL = Duration.l(jL, DurationKt.g(1, DurationUnit.f72046e));
                duration = new Duration(jL);
                this.f49659v = nVar;
                this.f49657t = jL;
                this.f49658u = 3;
                if (nVar.emit(duration, this) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 3) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
        jL = this.f49657t;
        nVar = (w70.n) this.f49659v;
        ResultKt.b(obj);
        Duration.f72038b.getClass();
        if (Duration.c(jL, 0L) <= 0) {
            long jG = DurationKt.g(1, DurationUnit.f72046e);
            this.f49659v = nVar;
            this.f49657t = jL;
            this.f49658u = 2;
            if (t0.c(jG, this) != coroutineSingletons) {
                Duration.Companion companion2 = Duration.f72038b;
                jL = Duration.l(jL, DurationKt.g(1, DurationUnit.f72046e));
                duration = new Duration(jL);
                this.f49659v = nVar;
                this.f49657t = jL;
                this.f49658u = 3;
                if (nVar.emit(duration, this) != coroutineSingletons) {
                    Duration.f72038b.getClass();
                    if (Duration.c(jL, 0L) <= 0) {
                        return Unit.f71706a;
                    }
                }
            }
            return coroutineSingletons;
        }
    }
}
