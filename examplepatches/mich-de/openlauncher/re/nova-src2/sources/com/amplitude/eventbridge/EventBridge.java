package com.amplitude.eventbridge;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\u0018\u0010\b\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u000bÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/eventbridge/EventBridge;", b.f42142b, "sendEvent", b.f42142b, "channel", "Lcom/amplitude/eventbridge/EventChannel;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/eventbridge/Event;", "setEventReceiver", "receiver", "Lcom/amplitude/eventbridge/EventReceiver;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface EventBridge {
    void sendEvent(@NotNull EventChannel channel, @NotNull Event event);

    void setEventReceiver(@NotNull EventChannel channel, @NotNull EventReceiver receiver);
}
