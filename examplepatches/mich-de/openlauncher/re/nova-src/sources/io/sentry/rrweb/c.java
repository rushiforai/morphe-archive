package io.sentry.rrweb;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum c implements i1 {
    DomContentLoaded,
    Load,
    FullSnapshot,
    IncrementalSnapshot,
    Meta,
    Custom,
    Plugin;

    @Override // io.sentry.i1
    public void serialize(@NotNull y1 y1Var, @NotNull ILogger iLogger) throws IOException {
        ((e3) y1Var).w(ordinal());
    }
}
