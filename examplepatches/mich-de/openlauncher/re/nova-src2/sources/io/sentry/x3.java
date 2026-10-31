package io.sentry;

import java.io.IOException;
import java.util.Locale;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum x3 implements i1 {
    SESSION,
    BUFFER;

    @Override // io.sentry.i1
    public void serialize(@NotNull y1 y1Var, @NotNull ILogger iLogger) throws IOException {
        ((e3) y1Var).A(name().toLowerCase(Locale.ROOT));
    }
}
