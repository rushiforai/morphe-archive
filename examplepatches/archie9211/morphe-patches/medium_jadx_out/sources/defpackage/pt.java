package defpackage;

import android.net.http.UrlResponseInfo;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class pt extends mq7 {
    public final UrlResponseInfo f;

    public pt(UrlResponseInfo urlResponseInfo) {
        this.f = urlResponseInfo;
    }

    public static pt L(UrlResponseInfo urlResponseInfo) {
        if (urlResponseInfo == null) {
            return null;
        }
        try {
            urlResponseInfo.getUrl();
            return new pt(urlResponseInfo);
        } catch (NullPointerException unused) {
            return null;
        }
    }

    @Override // defpackage.mq7
    public final String B() {
        return this.f.getUrl();
    }

    @Override // defpackage.mq7
    public final int z() {
        return this.f.getHttpStatusCode();
    }
}
