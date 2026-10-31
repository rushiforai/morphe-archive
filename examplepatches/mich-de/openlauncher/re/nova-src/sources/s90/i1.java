package s90;

import java.nio.ByteBuffer;
import org.chromium.net.CronetException;
import org.chromium.net.UrlRequest;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public final class i1 extends UrlRequest.Callback {

    /* renamed from: j, reason: collision with root package name */
    public final UrlRequest.Callback f86967j;

    public i1(UrlRequest.Callback callback) {
        this.f86967j = callback;
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onCanceled(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        this.f86967j.onCanceled(urlRequest, urlResponseInfo);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onFailed(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, CronetException cronetException) {
        this.f86967j.onFailed(urlRequest, urlResponseInfo, cronetException);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onReadCompleted(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer) throws Exception {
        this.f86967j.onReadCompleted(urlRequest, urlResponseInfo, byteBuffer);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onRedirectReceived(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, String str) throws Exception {
        this.f86967j.onRedirectReceived(urlRequest, urlResponseInfo, str);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onResponseStarted(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) throws Exception {
        this.f86967j.onResponseStarted(urlRequest, urlResponseInfo);
    }

    @Override // org.chromium.net.UrlRequest.Callback
    public final void onSucceeded(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        this.f86967j.onSucceeded(urlRequest, urlResponseInfo);
    }
}
