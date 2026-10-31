package s90;

import org.chromium.net.UploadDataSink;

/* loaded from: classes5.dex */
public final class o extends UploadDataSink {

    /* renamed from: a, reason: collision with root package name */
    public final android.net.http.UploadDataSink f86990a;

    public o(android.net.http.UploadDataSink uploadDataSink) {
        this.f86990a = uploadDataSink;
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onReadError(Exception exc) {
        this.f86990a.onReadError(exc);
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onReadSucceeded(boolean z11) {
        this.f86990a.onReadSucceeded(z11);
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onRewindError(Exception exc) {
        this.f86990a.onRewindError(exc);
    }

    @Override // org.chromium.net.UploadDataSink
    public final void onRewindSucceeded() {
        this.f86990a.onRewindSucceeded();
    }
}
