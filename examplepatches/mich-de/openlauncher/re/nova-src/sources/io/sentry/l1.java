package io.sentry;

import java.util.Locale;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum l1 implements m1 {
    NANOSECOND,
    MICROSECOND,
    MILLISECOND,
    SECOND,
    MINUTE,
    HOUR,
    DAY,
    WEEK;

    @Override // io.sentry.m1
    @NotNull
    public String apiName() {
        return name().toLowerCase(Locale.ROOT);
    }
}
