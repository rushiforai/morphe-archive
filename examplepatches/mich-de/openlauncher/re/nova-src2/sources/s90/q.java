package s90;

import android.net.http.UrlRequest$StatusListener;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class q implements UrlRequest$StatusListener {

    /* renamed from: a, reason: collision with root package name */
    public final UrlRequest.StatusListener f86998a;

    public q(UrlRequest.StatusListener statusListener) {
        this.f86998a = statusListener;
    }

    public final void onStatus(int i5) {
        this.f86998a.onStatus(i5);
    }
}
