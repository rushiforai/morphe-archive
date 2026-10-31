package io.sentry.transport;

import io.sentry.e3;
import io.sentry.x;
import java.io.Closeable;

/* loaded from: classes4.dex */
public interface f extends Closeable {
    default boolean k() {
        return true;
    }

    void n(boolean z11);

    m o();

    void q(long j11);

    void x(e3 e3Var, x xVar);
}
