package s90;

import android.net.http.UrlRequest;
import java.nio.ByteBuffer;
import java.util.Collection;
import org.chromium.net.CronetException;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.RequestFinishedInfo;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class r extends ExperimentalUrlRequest {

    /* renamed from: a, reason: collision with root package name */
    public final UrlRequest f87001a;

    /* renamed from: b, reason: collision with root package name */
    public final h f87002b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87003c;

    /* renamed from: d, reason: collision with root package name */
    public final Collection f87004d;

    /* renamed from: e, reason: collision with root package name */
    public final h1 f87005e;

    public r(UrlRequest urlRequest, h hVar, String str, Collection collection, RequestFinishedInfo.Listener listener) {
        this.f87001a = urlRequest;
        this.f87002b = hVar;
        this.f87003c = str;
        this.f87004d = collection;
        this.f87005e = listener == null ? null : new h1(listener);
    }

    public final void a(int i5, s sVar, CronetException cronetException) {
        m.a(this.f87002b, this.f87003c, this.f87004d, this.f87005e, i5, sVar, cronetException);
    }

    @Override // org.chromium.net.UrlRequest
    public final void cancel() {
        this.f87001a.cancel();
    }

    @Override // org.chromium.net.UrlRequest
    public final void followRedirect() {
        this.f87001a.followRedirect();
    }

    @Override // org.chromium.net.UrlRequest
    public final void getStatus(UrlRequest.StatusListener statusListener) {
        this.f87001a.getStatus(new q(statusListener));
    }

    @Override // org.chromium.net.UrlRequest
    public final boolean isDone() {
        return this.f87001a.isDone();
    }

    @Override // org.chromium.net.UrlRequest
    public final void read(ByteBuffer byteBuffer) {
        this.f87001a.read(byteBuffer);
    }

    @Override // org.chromium.net.UrlRequest
    public final void start() {
        this.f87001a.start();
    }
}
