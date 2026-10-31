package com.amplitude.core.utilities;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.EventOptions;
import com.amplitude.eventbridge.Event;
import com.amplitude.eventbridge.EventChannel;
import com.amplitude.eventbridge.EventReceiver;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0018\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\r"}, d2 = {"Lcom/amplitude/core/utilities/AnalyticsEventReceiver;", "Lcom/amplitude/eventbridge/EventReceiver;", "amplitude", "Lcom/amplitude/core/Amplitude;", "(Lcom/amplitude/core/Amplitude;)V", "getAmplitude", "()Lcom/amplitude/core/Amplitude;", "receive", b.f42142b, "channel", "Lcom/amplitude/eventbridge/EventChannel;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/eventbridge/Event;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AnalyticsEventReceiver implements EventReceiver {

    @NotNull
    private final Amplitude amplitude;

    public AnalyticsEventReceiver(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        this.amplitude = amplitude;
    }

    @NotNull
    public final Amplitude getAmplitude() {
        return this.amplitude;
    }

    @Override // com.amplitude.eventbridge.EventReceiver
    public void receive(@NotNull EventChannel channel, @NotNull Event event) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(event, "event");
        this.amplitude.getLogger().debug("Receive event from event bridge " + event.getEventType());
        Amplitude.track$default(this.amplitude, AnalyticsEventReceiverKt.toBaseEvent(event), (EventOptions) null, (Function3) null, 6, (Object) null);
    }
}
