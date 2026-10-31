package s90;

import android.net.http.HttpException;
import android.net.http.UrlRequest$Callback;
import android.net.http.UrlResponseInfo;
import java.nio.ByteBuffer;
import java.util.Objects;
import org.chromium.net.CronetException;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class p implements UrlRequest$Callback {

    /* renamed from: a, reason: collision with root package name */
    public final UrlRequest.Callback f86994a;

    /* renamed from: b, reason: collision with root package name */
    public r f86995b;

    public p(UrlRequest.Callback callback) {
        Objects.requireNonNull(callback, "Callback is required.");
        this.f86994a = callback;
    }

    public final void onCanceled(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        s sVarB = s.b(urlResponseInfo);
        try {
            this.f86994a.onCanceled(this.f86995b, sVarB);
        } finally {
            this.f86995b.a(2, sVarB, null);
        }
    }

    public final void onFailed(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, HttpException httpException) {
        s sVarB = s.b(urlResponseInfo);
        CronetException cronetExceptionD = d0.d(httpException);
        try {
            this.f86994a.onFailed(this.f86995b, sVarB, cronetExceptionD);
        } finally {
            this.f86995b.a(1, sVarB, cronetExceptionD);
        }
    }

    public final void onReadCompleted(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer) throws Exception {
        d0.b(new be.f(7, this, urlResponseInfo, byteBuffer), Exception.class);
    }

    public final void onRedirectReceived(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, String str) throws Exception {
        d0.b(new be.f(8, this, urlResponseInfo, str), Exception.class);
    }

    public final void onResponseStarted(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) throws Exception {
        d0.b(new q10.d(2, this, urlResponseInfo), Exception.class);
    }

    public final void onSucceeded(android.net.http.UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        s sVarB = s.b(urlResponseInfo);
        try {
            this.f86994a.onSucceeded(this.f86995b, sVarB);
        } finally {
            this.f86995b.a(0, sVarB, null);
        }
    }
}
