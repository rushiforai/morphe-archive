package s90;

import android.net.http.BidirectionalStream$Callback;
import android.net.http.HeaderBlock;
import android.net.http.HttpException;
import android.net.http.UrlResponseInfo;
import java.nio.ByteBuffer;
import java.util.Objects;
import org.chromium.net.BidirectionalStream;
import org.chromium.net.CronetException;

/* loaded from: classes5.dex */
public final class a implements BidirectionalStream$Callback {

    /* renamed from: a, reason: collision with root package name */
    public final BidirectionalStream.Callback f86844a;

    /* renamed from: b, reason: collision with root package name */
    public b f86845b;

    public a(BidirectionalStream.Callback callback) {
        Objects.requireNonNull(callback, "Callback is required.");
        this.f86844a = callback;
    }

    public final void onCanceled(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo) {
        s sVarA = s.a(urlResponseInfo);
        try {
            this.f86844a.onCanceled(this.f86845b, sVarA);
        } finally {
            this.f86845b.a(2, sVarA, null);
        }
    }

    public final void onFailed(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo, HttpException httpException) {
        s sVarA = s.a(urlResponseInfo);
        CronetException cronetExceptionD = d0.d(httpException);
        try {
            this.f86844a.onFailed(this.f86845b, sVarA, cronetExceptionD);
        } finally {
            this.f86845b.a(1, sVarA, cronetExceptionD);
        }
    }

    public final void onReadCompleted(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer, boolean z11) {
        this.f86844a.onReadCompleted(this.f86845b, s.a(urlResponseInfo), byteBuffer, z11);
    }

    public final void onResponseHeadersReceived(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo) {
        this.f86844a.onResponseHeadersReceived(this.f86845b, s.a(urlResponseInfo));
    }

    public final void onResponseTrailersReceived(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo, HeaderBlock headerBlock) {
        this.f86844a.onResponseTrailersReceived(this.f86845b, s.a(urlResponseInfo), new d(headerBlock));
    }

    public final void onStreamReady(android.net.http.BidirectionalStream bidirectionalStream) {
        this.f86844a.onStreamReady(this.f86845b);
    }

    public final void onSucceeded(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo) {
        s sVarA = s.a(urlResponseInfo);
        try {
            this.f86844a.onSucceeded(this.f86845b, sVarA);
        } finally {
            this.f86845b.a(0, sVarA, null);
        }
    }

    public final void onWriteCompleted(android.net.http.BidirectionalStream bidirectionalStream, UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer, boolean z11) {
        this.f86844a.onWriteCompleted(this.f86845b, s.a(urlResponseInfo), byteBuffer, z11);
    }
}
