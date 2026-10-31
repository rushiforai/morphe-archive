package s90;

import android.net.http.UploadDataProvider;
import android.net.http.UploadDataSink;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class n extends UploadDataProvider {

    /* renamed from: a, reason: collision with root package name */
    public final org.chromium.net.UploadDataProvider f86981a;

    public n(org.chromium.net.UploadDataProvider uploadDataProvider) {
        Objects.requireNonNull(uploadDataProvider, "Invalid UploadDataProvider.");
        this.f86981a = uploadDataProvider;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f86981a.close();
    }

    public final long getLength() {
        return this.f86981a.getLength();
    }

    public final void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) throws IOException {
        this.f86981a.read(new o(uploadDataSink), byteBuffer);
    }

    public final void rewind(UploadDataSink uploadDataSink) throws IOException {
        this.f86981a.rewind(new o(uploadDataSink));
    }
}
