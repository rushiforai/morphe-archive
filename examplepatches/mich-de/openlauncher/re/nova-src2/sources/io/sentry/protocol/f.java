package io.sentry.protocol;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import java.util.Locale;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum f implements i1 {
    PORTRAIT,
    LANDSCAPE;

    @Override // io.sentry.i1
    public void serialize(@NotNull y1 y1Var, @NotNull ILogger iLogger) throws IOException {
        ((e3) y1Var).A(toString().toLowerCase(Locale.ROOT));
    }
}
