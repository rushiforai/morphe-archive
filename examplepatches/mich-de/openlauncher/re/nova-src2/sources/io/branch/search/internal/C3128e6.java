package io.branch.search.internal;

import io.branch.search.internal.C3094c6;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.DirectRequestCancellation$removeCancellation$2", f = "InternalRequestCoordinator.kt", l = {368}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.e6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3128e6 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f64364a;

    /* renamed from: b, reason: collision with root package name */
    public C3094c6 f64365b;

    /* renamed from: c, reason: collision with root package name */
    public EnumC3145f6 f64366c;

    /* renamed from: d, reason: collision with root package name */
    public long f64367d;

    /* renamed from: e, reason: collision with root package name */
    public int f64368e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ EnumC3145f6 f64369f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ C3094c6 f64370g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ long f64371h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3128e6(long j11, C3094c6 c3094c6, EnumC3145f6 enumC3145f6, Continuation continuation) {
        super(2, continuation);
        this.f64369f = enumC3145f6;
        this.f64370g = c3094c6;
        this.f64371h = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        EnumC3145f6 enumC3145f6 = this.f64369f;
        return new C3128e6(this.f64371h, this.f64370g, enumC3145f6, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3128e6) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        C3094c6 c3094c6;
        c80.a aVar;
        long j11;
        EnumC3145f6 enumC3145f6;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64368e;
        try {
            if (i5 == 0) {
                ResultKt.b(obj);
                EnumC3145f6 enumC3145f62 = this.f64369f;
                if (enumC3145f62.f64478a) {
                    c3094c6 = this.f64370g;
                    c80.a aVar2 = c3094c6.f64095b;
                    long j12 = this.f64371h;
                    this.f64364a = aVar2;
                    this.f64365b = c3094c6;
                    this.f64366c = enumC3145f62;
                    this.f64367d = j12;
                    this.f64368e = 1;
                    c80.d dVar = (c80.d) aVar2;
                    if (dVar.e(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    aVar = dVar;
                    j11 = j12;
                    enumC3145f6 = enumC3145f62;
                }
                return Unit.f71706a;
            }
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = this.f64367d;
            enumC3145f6 = this.f64366c;
            c3094c6 = this.f64365b;
            aVar = this.f64364a;
            ResultKt.b(obj);
            C3094c6.a aVar3 = c3094c6.f64094a.get(enumC3145f6);
            if (aVar3 != null) {
                if (aVar3.f64096a == j11) {
                    c3094c6.f64094a.remove(enumC3145f6);
                }
                Unit unit = Unit.f71706a;
            }
            ((c80.d) aVar).g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            ((c80.d) aVar).g(null);
            throw th2;
        }
    }
}
