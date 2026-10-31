package org.chromium.net.impl;

import org.chromium.net.QuicException;

/* loaded from: classes5.dex */
public class QuicExceptionImpl extends QuicException {
    @Override // org.chromium.net.QuicException
    public final int getConnectionCloseSource() {
        return 0;
    }

    @Override // org.chromium.net.NetworkException
    public final int getCronetInternalErrorCode() {
        throw null;
    }

    @Override // org.chromium.net.NetworkException
    public final int getErrorCode() {
        throw null;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        throw null;
    }

    @Override // org.chromium.net.QuicException
    public final int getQuicDetailedErrorCode() {
        return 0;
    }

    @Override // org.chromium.net.NetworkException
    public final boolean immediatelyRetryable() {
        throw null;
    }
}
