package s90;

import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class j1 extends UrlRequest.StatusListener {

    /* renamed from: a, reason: collision with root package name */
    public final UrlRequest.StatusListener f86969a;

    public j1(UrlRequest.StatusListener statusListener) {
        this.f86969a = statusListener;
    }

    @Override // org.chromium.net.UrlRequest.StatusListener
    public final void onStatus(int i5) {
        this.f86969a.onStatus(i5);
    }
}
