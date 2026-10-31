package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.external.InneractiveContentController.EventsListener;

/* loaded from: classes3.dex */
public interface InneractiveContentController<EventsListenerT extends EventsListener> {

    public interface EventsListener {
    }

    void destroy();

    InneractiveAdSpot getAdSpot();

    void setEventsListener(EventsListenerT eventslistenert);
}
