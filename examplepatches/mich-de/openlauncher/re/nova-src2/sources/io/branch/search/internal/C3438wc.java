package io.branch.search.internal;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.util.SampledQueue$1", f = "Coros.kt", l = {335}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.wc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3438wc extends SuspendLambda implements Function2<Function0<? extends Unit>, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public int f66237a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f66238b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C3472yc f66239c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ long f66240d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3438wc(C3472yc c3472yc, long j11, Continuation<? super C3438wc> continuation) {
        super(2, continuation);
        this.f66239c = c3472yc;
        this.f66240d = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        C3438wc c3438wc = new C3438wc(this.f66239c, this.f66240d, continuation);
        c3438wc.f66238b = obj;
        return c3438wc;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3438wc) create((Function0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        Function0 function0;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f66237a;
        if (i5 == 0) {
            ResultKt.b(obj);
            Function0 function02 = (Function0) this.f66238b;
            long jCurrentTimeMillis = System.currentTimeMillis() - this.f66239c.f66334d;
            long j11 = this.f66240d;
            if (jCurrentTimeMillis < j11) {
                this.f66238b = function02;
                this.f66237a = 1;
                if (t70.t0.b(j11 - jCurrentTimeMillis, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            function0 = function02;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            function0 = (Function0) this.f66238b;
            ResultKt.b(obj);
        }
        function0.invoke();
        this.f66239c.f66334d = System.currentTimeMillis();
        return Unit.f71706a;
    }
}
