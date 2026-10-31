package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.InternalRequestCoordinatorImpl$coordinateRequest$2$1$2$1", f = "InternalRequestCoordinator.kt", l = {335}, m = "invokeSuspend")
/* loaded from: classes4.dex */
public final class Z7 extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f63825a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3094c6 f63826b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ EnumC3145f6 f63827c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f63828d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Z7(long j11, C3094c6 c3094c6, EnumC3145f6 enumC3145f6, Continuation continuation) {
        super(2, continuation);
        this.f63826b = c3094c6;
        this.f63827c = enumC3145f6;
        this.f63828d = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new Z7(this.f63828d, this.f63826b, this.f63827c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((Z7) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Object obj2 = CoroutineSingletons.f71806a;
        int i5 = this.f63825a;
        if (i5 == 0) {
            ResultKt.b(obj);
            C3094c6 c3094c6 = this.f63826b;
            EnumC3145f6 enumC3145f6 = this.f63827c;
            long j11 = this.f63828d;
            this.f63825a = 1;
            c3094c6.getClass();
            Object objD = t70.k0.d(new C3128e6(j11, c3094c6, enumC3145f6, null), this);
            if (objD != obj2) {
                objD = Unit.f71706a;
            }
            if (objD == obj2) {
                return obj2;
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
