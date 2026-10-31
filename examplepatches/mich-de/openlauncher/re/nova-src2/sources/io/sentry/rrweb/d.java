package io.sentry.rrweb;

import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.io.IOException;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum d implements i1 {
    Mutation,
    MouseMove,
    MouseInteraction,
    Scroll,
    ViewportResize,
    Input,
    TouchMove,
    MediaInteraction,
    StyleSheetRule,
    CanvasMutation,
    Font,
    Log,
    Drag,
    StyleDeclaration,
    Selection,
    AdoptedStyleSheet,
    CustomElement;

    @Override // io.sentry.i1
    public void serialize(@NotNull y1 y1Var, @NotNull ILogger iLogger) throws IOException {
        ((e3) y1Var).w(ordinal());
    }
}
