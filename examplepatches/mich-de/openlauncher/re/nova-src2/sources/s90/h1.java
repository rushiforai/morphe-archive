package s90;

import java.util.concurrent.Executor;
import org.chromium.net.RequestFinishedInfo;

/* loaded from: classes5.dex */
public final class h1 extends RequestFinishedInfo.Listener {

    /* renamed from: a, reason: collision with root package name */
    public final RequestFinishedInfo.Listener f86959a;

    public h1(RequestFinishedInfo.Listener listener) {
        super(listener.getExecutor());
        this.f86959a = listener;
    }

    @Override // org.chromium.net.RequestFinishedInfo.Listener
    public final Executor getExecutor() {
        return this.f86959a.getExecutor();
    }

    @Override // org.chromium.net.RequestFinishedInfo.Listener
    public final void onRequestFinished(RequestFinishedInfo requestFinishedInfo) {
        this.f86959a.onRequestFinished(requestFinishedInfo);
    }
}
