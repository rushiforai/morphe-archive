package defpackage;

import android.net.http.HttpException;
import android.net.http.UrlRequest;
import android.net.http.UrlRequest$Callback;
import android.net.http.UrlResponseInfo;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nt implements UrlRequest$Callback {
    public final ceg a;
    public ot b;

    public nt(ceg cegVar) {
        this.a = cegVar;
    }

    public final void onCanceled(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        pt.L(urlResponseInfo);
        try {
            this.b.d0();
        } catch (Throwable th) {
            this.b.d0();
            throw th;
        }
    }

    public final void onFailed(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, HttpException httpException) {
        try {
            this.a.F(this.b, pt.L(urlResponseInfo), m4.J(httpException));
        } finally {
            this.b.d0();
        }
    }

    public final void onReadCompleted(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, ByteBuffer byteBuffer) throws Exception {
        m4.c(new mt(this, urlResponseInfo, byteBuffer, 0));
    }

    public final void onRedirectReceived(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo, String str) throws Exception {
        m4.c(new mt(this, urlResponseInfo, str, 1));
    }

    public final void onResponseStarted(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) throws Exception {
        m4.c(new lt(this, 0, urlResponseInfo));
    }

    public final void onSucceeded(UrlRequest urlRequest, UrlResponseInfo urlResponseInfo) {
        try {
            this.a.J(this.b, pt.L(urlResponseInfo));
        } finally {
            this.b.d0();
        }
    }
}
