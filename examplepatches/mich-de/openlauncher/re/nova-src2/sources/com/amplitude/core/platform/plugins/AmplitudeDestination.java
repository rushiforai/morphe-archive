package com.amplitude.core.platform.plugins;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.GroupIdentifyEvent;
import com.amplitude.core.events.IdentifyEvent;
import com.amplitude.core.events.RevenueEvent;
import com.amplitude.core.platform.DestinationPlugin;
import com.amplitude.core.platform.EventPipeline;
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
import t70.m0;

@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0012\u0010\u0007\u001a\u00020\b2\b\u0010\t\u001a\u0004\u0018\u00010\nH\u0002J\u000e\u0010\u000b\u001a\u00020\b2\u0006\u0010\f\u001a\u00020\nJ\b\u0010\r\u001a\u00020\bH\u0016J\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\t\u001a\u00020\u000fH\u0016J\u0012\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\t\u001a\u00020\u0011H\u0016J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\t\u001a\u00020\u0013H\u0016J\u0010\u0010\u0014\u001a\u00020\b2\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\u0012\u0010\u0017\u001a\u0004\u0018\u00010\n2\u0006\u0010\t\u001a\u00020\nH\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082.¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082.¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/amplitude/core/platform/plugins/AmplitudeDestination;", "Lcom/amplitude/core/platform/DestinationPlugin;", "()V", "identifyInterceptor", "Lcom/amplitude/core/platform/intercept/IdentifyInterceptor;", "pipeline", "Lcom/amplitude/core/platform/EventPipeline;", "enqueue", b.f42142b, "payload", "Lcom/amplitude/core/events/BaseEvent;", "enqueuePipeline", DatabaseConstants.EVENT_FIELD, "flush", "groupIdentify", "Lcom/amplitude/core/events/GroupIdentifyEvent;", "identify", "Lcom/amplitude/core/events/IdentifyEvent;", "revenue", "Lcom/amplitude/core/events/RevenueEvent;", "setup", "amplitude", "Lcom/amplitude/core/Amplitude;", "track", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AmplitudeDestination extends DestinationPlugin {
    private IdentifyInterceptor identifyInterceptor;
    private EventPipeline pipeline;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.platform.plugins.AmplitudeDestination$flush$1", f = "AmplitudeDestination.kt", l = {39}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.platform.plugins.AmplitudeDestination$flush$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return AmplitudeDestination.this.new AnonymousClass1(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                IdentifyInterceptor identifyInterceptor = AmplitudeDestination.this.identifyInterceptor;
                if (identifyInterceptor == null) {
                    Intrinsics.m("identifyInterceptor");
                    throw null;
                }
                this.label = 1;
                if (identifyInterceptor.transferInterceptedIdentify(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            EventPipeline eventPipeline = AmplitudeDestination.this.pipeline;
            if (eventPipeline != null) {
                eventPipeline.flush();
                return Unit.f71706a;
            }
            Intrinsics.m("pipeline");
            throw null;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    private final void enqueue(BaseEvent payload) {
        if (payload != null) {
            if (payload.isValid()) {
                m0.t(getAmplitude().getAmplitudeScope(), getAmplitude().getStorageIODispatcher(), null, new AmplitudeDestination$enqueue$1$1(this, payload, null), 2);
                return;
            }
            getAmplitude().getLogger().warn("Event is invalid for missing information like userId and deviceId. Dropping event: " + payload.getEventType());
        }
    }

    public final void enqueuePipeline(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        EventPipeline eventPipeline = this.pipeline;
        if (eventPipeline != null) {
            eventPipeline.put(event);
        } else {
            Intrinsics.m("pipeline");
            throw null;
        }
    }

    @Override // com.amplitude.core.platform.EventPlugin
    public void flush() {
        m0.t(getAmplitude().getAmplitudeScope(), getAmplitude().getStorageIODispatcher(), null, new AnonymousClass1(null), 2);
    }

    @Override // com.amplitude.core.platform.EventPlugin
    @Nullable
    public GroupIdentifyEvent groupIdentify(@NotNull GroupIdentifyEvent payload) {
        Intrinsics.g(payload, "payload");
        enqueue(payload);
        return payload;
    }

    @Override // com.amplitude.core.platform.EventPlugin
    @Nullable
    public IdentifyEvent identify(@NotNull IdentifyEvent payload) {
        Intrinsics.g(payload, "payload");
        enqueue(payload);
        return payload;
    }

    @Override // com.amplitude.core.platform.EventPlugin
    @Nullable
    public RevenueEvent revenue(@NotNull RevenueEvent payload) {
        Intrinsics.g(payload, "payload");
        enqueue(payload);
        return payload;
    }

    @Override // com.amplitude.core.platform.DestinationPlugin, com.amplitude.core.platform.Plugin
    public void setup(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        super.setup(amplitude);
        EventPipeline eventPipeline = new EventPipeline(amplitude, null, null, null, null, null, null, null, null, 510, null);
        this.pipeline = eventPipeline;
        eventPipeline.start();
        this.identifyInterceptor = new IdentifyInterceptor(amplitude.getIdentifyInterceptStorage(), amplitude, amplitude.getLogger(), amplitude.getConfiguration(), this);
        add(new IdentityEventSender());
    }

    @Override // com.amplitude.core.platform.EventPlugin
    @Nullable
    public BaseEvent track(@NotNull BaseEvent payload) {
        Intrinsics.g(payload, "payload");
        enqueue(payload);
        return payload;
    }
}
