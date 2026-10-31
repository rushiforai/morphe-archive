package com.amplitude.core.utilities;

import com.amplitude.core.events.BaseEvent;
import com.amplitude.eventbridge.Event;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\f\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0000¨\u0006\u0003"}, d2 = {"toBaseEvent", "Lcom/amplitude/core/events/BaseEvent;", "Lcom/amplitude/eventbridge/Event;", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AnalyticsEventReceiverKt {
    @NotNull
    public static final BaseEvent toBaseEvent(@NotNull Event event) {
        Intrinsics.g(event, "<this>");
        BaseEvent baseEvent = new BaseEvent();
        baseEvent.setEventType(event.getEventType());
        Map<String, Object> eventProperties = event.getEventProperties();
        baseEvent.setEventProperties(eventProperties != null ? JSONKt.deepCopy(eventProperties) : null);
        Map<String, Object> userProperties = event.getUserProperties();
        baseEvent.setUserProperties(userProperties != null ? JSONKt.deepCopy(userProperties) : null);
        Map<String, Object> groups = event.getGroups();
        baseEvent.setGroups(groups != null ? JSONKt.deepCopy(groups) : null);
        Map<String, Object> groupProperties = event.getGroupProperties();
        baseEvent.setGroupProperties(groupProperties != null ? JSONKt.deepCopy(groupProperties) : null);
        return baseEvent;
    }
}
