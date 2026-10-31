package s90;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;
import org.chromium.net.UrlResponseInfo;

/* loaded from: classes5.dex */
public final class g1 extends UrlResponseInfo {

    /* renamed from: a, reason: collision with root package name */
    public final List f86948a;

    /* renamed from: b, reason: collision with root package name */
    public final int f86949b;

    /* renamed from: c, reason: collision with root package name */
    public final String f86950c;

    /* renamed from: d, reason: collision with root package name */
    public final String f86951d;

    /* renamed from: e, reason: collision with root package name */
    public final String f86952e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicLong f86953f = new AtomicLong(0);

    /* renamed from: g, reason: collision with root package name */
    public final f1 f86954g;

    public g1(ArrayList arrayList, int i5, String str, List list, String str2) {
        this.f86948a = Collections.unmodifiableList(arrayList);
        this.f86949b = i5;
        this.f86950c = str;
        this.f86954g = new f1(Collections.unmodifiableList(list));
        this.f86951d = str2;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final Map getAllHeaders() {
        return this.f86954g.getAsMap();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final List getAllHeadersAsList() {
        return this.f86954g.f86941a;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final int getHttpStatusCode() {
        return this.f86949b;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getHttpStatusText() {
        return this.f86950c;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getNegotiatedProtocol() {
        return this.f86951d;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getProxyServer() {
        return this.f86952e;
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final long getReceivedByteCount() {
        return this.f86953f.get();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final String getUrl() {
        return (String) a2.c.e(1, this.f86948a);
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final List getUrlChain() {
        return this.f86948a;
    }

    public final String toString() {
        Locale locale = Locale.ROOT;
        String hexString = Integer.toHexString(System.identityHashCode(this));
        String url = getUrl();
        String string = this.f86948a.toString();
        String string2 = this.f86954g.f86941a.toString();
        long j11 = this.f86953f.get();
        StringBuilder sbW = b.c0.w("UrlResponseInfo@[", hexString, "][", url, "]: urlChain = ");
        sbW.append(string);
        sbW.append(", httpStatus = ");
        sbW.append(this.f86949b);
        sbW.append(" ");
        b.c0.D(sbW, this.f86950c, ", headers = ", string2, ", wasCached = false, negotiatedProtocol = ");
        b.c0.D(sbW, this.f86951d, ", proxyServer= ", this.f86952e, ", receivedByteCount = ");
        sbW.append(j11);
        return sbW.toString();
    }

    @Override // org.chromium.net.UrlResponseInfo
    public final boolean wasCached() {
        return false;
    }
}
