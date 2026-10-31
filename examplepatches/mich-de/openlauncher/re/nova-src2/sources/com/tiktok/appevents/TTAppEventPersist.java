package com.tiktok.appevents;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
class TTAppEventPersist implements Serializable {
    public static final long serialVersionUID = 1;
    private List<TTAppEvent> appEvents = new ArrayList();

    public void addEvents(List<TTAppEvent> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        this.appEvents.addAll(list);
    }

    public List<TTAppEvent> getAppEvents() {
        return this.appEvents;
    }

    public boolean isEmpty() {
        return this.appEvents.isEmpty();
    }

    public void setAppEvents(List<TTAppEvent> list) {
        this.appEvents = list;
    }

    public String toString() {
        return fq.c.e(new StringBuilder("TTAppEventPersist{appEvents="), this.appEvents, AbstractJsonLexerKt.END_OBJ);
    }
}
