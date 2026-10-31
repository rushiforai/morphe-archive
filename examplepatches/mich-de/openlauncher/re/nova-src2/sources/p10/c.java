package p10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class c extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81716t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e f81717u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ long f81718v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f81719w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, long j11, Ref.BooleanRef booleanRef, Continuation continuation) {
        super(2, continuation);
        this.f81717u = eVar;
        this.f81718v = j11;
        this.f81719w = booleanRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        c cVar = new c(this.f81717u, this.f81718v, this.f81719w, continuation);
        cVar.f81716t = obj;
        return cVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c) create((y5.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        y5.b bVar = (y5.b) this.f81716t;
        y5.f fVar = e.f81743f;
        Long l9 = (Long) bVar.b(fVar);
        e eVar = this.f81717u;
        long j11 = this.f81718v;
        if (e.a(eVar, j11, l9)) {
            bVar.d(fVar, new Long(j11));
            this.f81719w.f71859a = true;
        }
        return Unit.f71706a;
    }
}
