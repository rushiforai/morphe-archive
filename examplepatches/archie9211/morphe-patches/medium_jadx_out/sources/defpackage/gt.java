package defpackage;

import android.net.http.UploadDataProvider;
import android.net.http.UploadDataSink;
import java.nio.ByteBuffer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gt extends UploadDataProvider {
    public final u5e a;

    public gt(u5e u5eVar) {
        this.a = u5eVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }

    public final long getLength() {
        return this.a.m();
    }

    public final void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) {
        this.a.p(new ht(uploadDataSink), byteBuffer);
    }

    public final void rewind(UploadDataSink uploadDataSink) {
        this.a.B(new ht(uploadDataSink));
    }
}
