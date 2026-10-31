package io.sentry;

import java.util.concurrent.Future;

/* loaded from: classes4.dex */
public interface o0 {
    void i(long j11);

    boolean isClosed();

    Future m(Runnable runnable, long j11);

    Future submit(Runnable runnable);
}
