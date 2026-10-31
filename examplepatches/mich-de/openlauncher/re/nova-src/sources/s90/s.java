package s90;

import java.util.List;
import java.util.Map;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public final class s extends UrlResponseInfo {

    /* renamed from: a, reason: collision with root package name */
    public final android.net.http.UrlResponseInfo f87010a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87011b;

    public s(android.net.http.UrlResponseInfo urlResponseInfo, String str) {
        this.f87010a = urlResponseInfo;
        this.f87011b = str;
    }

    public static s a(android.net.http.UrlResponseInfo urlResponseInfo) {
        if (urlResponseInfo == null) {
            return null;
        }
        try {
            urlResponseInfo.getUrl();
            return new s(urlResponseInfo, null);
        } catch (NullPointerException unused) {
            return null;
        }
    }

    public static s b(android.net.http.UrlResponseInfo urlResponseInfo) {
        if (urlResponseInfo == null) {
            return null;
        }
        try {
            urlResponseInfo.getUrl();
            return new s(urlResponseInfo, ":0");
        } catch (NullPointerException unused) {
            return null;
        }
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final Map getAllHeaders() {
        return this.f87010a.getHeaders().getAsMap();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final List getAllHeadersAsList() {
        return this.f87010a.getHeaders().getAsList();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final int getHttpStatusCode() {
        return this.f87010a.getHttpStatusCode();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getHttpStatusText() {
        return this.f87010a.getHttpStatusText();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getNegotiatedProtocol() {
        return this.f87010a.getNegotiatedProtocol();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getProxyServer() {
        return this.f87011b;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final long getReceivedByteCount() {
        return this.f87010a.getReceivedByteCount();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getUrl() {
        return this.f87010a.getUrl();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final List getUrlChain() {
        return this.f87010a.getUrlChain();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final boolean wasCached() {
        return this.f87010a.wasCached();
    }
}
