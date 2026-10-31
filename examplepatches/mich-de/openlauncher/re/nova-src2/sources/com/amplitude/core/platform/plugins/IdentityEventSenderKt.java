package com.amplitude.core.platform.plugins;

import com.amplitude.core.events.BaseEvent;
import com.amplitude.eventbridge.Event;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000¨\u0006\u0003"}, d2 = {"toBridgeEvent", "Lcom/amplitude/eventbridge/Event;", "Lcom/amplitude/core/events/BaseEvent;", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentityEventSenderKt {
    @NotNull
    public static final Event toBridgeEvent(@NotNull BaseEvent baseEvent) {
        Intrinsics.g(baseEvent, "<this>");
        String eventType = baseEvent.getEventType();
        Map<String, Object> eventProperties = baseEvent.getEventProperties();
        Map mapS0 = eventProperties != null ? MapsKt.s0(eventProperties) : null;
        Map<String, Object> userProperties = baseEvent.getUserProperties();
        Map mapS02 = userProperties != null ? MapsKt.s0(userProperties) : null;
        Map<String, Object> groups = baseEvent.getGroups();
        Map mapS03 = groups != null ? MapsKt.s0(groups) : null;
        Map<String, Object> groupProperties = baseEvent.getGroupProperties();
        return new Event(eventType, mapS0, mapS02, mapS03, groupProperties != null ? MapsKt.s0(groupProperties) : null);
    }
}
