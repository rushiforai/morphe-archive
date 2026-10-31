package s90;

import org.chromium.net.QuicException;

/* loaded from: classes5.dex */
public final class l extends QuicException {

    /* renamed from: a, reason: collision with root package name */
    public final k f86974a;

    public l(android.net.http.QuicException quicException) {
        super(quicException.getMessage(), quicException);
        this.f86974a = new k(quicException, true);
    }

    @Override // org.chromium.net.QuicException
    public final int getConnectionCloseSource() {
        return 0;
    }

    @Override // org.chromium.net.NetworkException
    public final int getCronetInternalErrorCode() {
        this.f86974a.getClass();
        return -1;
    }

    @Override // org.chromium.net.NetworkException
    public final int getErrorCode() {
        return this.f86974a.f86970a.getErrorCode();
    }

    @Override // org.chromium.net.QuicException
    public final int getQuicDetailedErrorCode() {
        return 0;
    }

    @Override // org.chromium.net.NetworkException
    public final boolean immediatelyRetryable() {
        return this.f86974a.f86970a.isImmediatelyRetryable();
    }
}
