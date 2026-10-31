package io.sentry.protocol;

import java.util.Locale;

/* loaded from: classes4.dex */
public enum d0 {
    CUSTOM,
    URL,
    ROUTE,
    VIEW,
    COMPONENT,
    TASK;

    public String apiName() {
        return name().toLowerCase(Locale.ROOT);
    }
}
