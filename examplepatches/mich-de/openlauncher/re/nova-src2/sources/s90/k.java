package s90;

import org.chromium.net.NetworkException;

/* loaded from: classes5.dex */
public final class k extends NetworkException {

    /* renamed from: a, reason: collision with root package name */
    public final android.net.http.NetworkException f86970a;

    public k(android.net.http.NetworkException networkException, boolean z11) {
        super(networkException.getMessage(), networkException);
        this.f86970a = networkException;
        if (!z11 && i.w(networkException)) {
            throw new IllegalArgumentException("Translating QuicException as NetworkException results in loss of information. Make sure you handle QuicException first. See the stacktrace for where the translation is being performed, and the cause for the exception being translated.", networkException);
        }
    }

    @Override // org.chromium.net.NetworkException
    public final int getCronetInternalErrorCode() {
        return -1;
    }

    @Override // org.chromium.net.NetworkException
    public final int getErrorCode() {
        return this.f86970a.getErrorCode();
    }

    @Override // org.chromium.net.NetworkException
    public final boolean immediatelyRetryable() {
        return this.f86970a.isImmediatelyRetryable();
    }
}
