package b4;

import b.db;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes2.dex */
public final class i extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f17465t;

    /* renamed from: u, reason: collision with root package name */
    public int f17466u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f17467v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f17468w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Object f17469x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i(boolean z11, Object obj, long j11, Continuation continuation, int i5) {
        super(2, continuation);
        this.f17465t = i5;
        this.f17467v = z11;
        this.f17469x = obj;
        this.f17468w = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f17465t) {
            case 0:
                return new i(this.f17467v, (m) this.f17469x, this.f17468w, continuation, 0);
            case 1:
                return new i(this.f17467v, (db) this.f17469x, this.f17468w, continuation, 1);
            default:
                return new i(this.f17467v, (b.x) this.f17469x, this.f17468w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f17465t) {
        }
        return ((i) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f17465t) {
            case 0:
                m mVar = (m) this.f17469x;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f17466u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    if (this.f17467v) {
                        x7.h hVar = mVar.f17481a;
                        this.f17466u = 2;
                        obj = hVar.f(this.f17468w, 0L, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        ((y3.r) obj).getClass();
                    } else {
                        x7.h hVar2 = mVar.f17481a;
                        this.f17466u = 1;
                        obj = hVar2.f(0L, this.f17468w, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                        ((y3.r) obj).getClass();
                    }
                } else if (i5 == 1) {
                    ResultKt.b(obj);
                    ((y3.r) obj).getClass();
                } else {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    ((y3.r) obj).getClass();
                }
                return Unit.f71706a;
            case 1:
                db dbVar = (db) this.f17469x;
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f17466u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    boolean z11 = this.f17467v;
                    long j11 = this.f17468w;
                    if (z11) {
                        this.f17466u = 1;
                        if (dbVar.d(j11, this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
                    } else {
                        this.f17466u = 2;
                        if (dbVar.b(j11, this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
                    }
                } else {
                    if (i11 != 1 && i11 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                b.x xVar = (b.x) this.f17469x;
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f17466u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    boolean z12 = this.f17467v;
                    long j12 = this.f17468w;
                    if (z12) {
                        this.f17466u = 1;
                        if (xVar.a(j12, this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                    } else {
                        this.f17466u = 2;
                        if (xVar.c(j12, this) == coroutineSingletons3) {
                            return coroutineSingletons3;
                        }
                    }
                } else {
                    if (i12 != 1 && i12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
