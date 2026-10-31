package com.amplitude.core.platform.plugins;

import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.intercept.IdentifyInterceptor;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
@DebugMetadata(c = "com.amplitude.core.platform.plugins.AmplitudeDestination$enqueue$1$1", f = "AmplitudeDestination.kt", l = {53}, m = "invokeSuspend")
/* loaded from: classes2.dex */
public final class AmplitudeDestination$enqueue$1$1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
    final /* synthetic */ BaseEvent $event;
    int label;
    final /* synthetic */ AmplitudeDestination this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AmplitudeDestination$enqueue$1$1(AmplitudeDestination amplitudeDestination, BaseEvent baseEvent, Continuation<? super AmplitudeDestination$enqueue$1$1> continuation) {
        super(2, continuation);
        this.this$0 = amplitudeDestination;
        this.$event = baseEvent;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new AmplitudeDestination$enqueue$1$1(this.this$0, this.$event, continuation);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.label;
        if (i5 == 0) {
            ResultKt.b(obj);
            IdentifyInterceptor identifyInterceptor = this.this$0.identifyInterceptor;
            if (identifyInterceptor == null) {
                Intrinsics.m("identifyInterceptor");
                throw null;
            }
            BaseEvent baseEvent = this.$event;
            this.label = 1;
            obj = identifyInterceptor.intercept(baseEvent, this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        BaseEvent baseEvent2 = (BaseEvent) obj;
        if (baseEvent2 != null) {
            this.this$0.enqueuePipeline(baseEvent2);
        }
        return Unit.f71706a;
    }

    @Override // kotlin.jvm.functions.Function2
    @Nullable
    public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
        return ((AmplitudeDestination$enqueue$1$1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }
}
