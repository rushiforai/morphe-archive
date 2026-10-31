package q90;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;
import q.c;

/* loaded from: classes5.dex */
public final class b extends UploadDataProvider {

    /* renamed from: a, reason: collision with root package name */
    public volatile FileChannel f83904a;

    /* renamed from: b, reason: collision with root package name */
    public final c f83905b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f83906c = new Object();

    public b(c cVar) {
        this.f83905b = cVar;
    }

    public final FileChannel a() {
        if (this.f83904a == null) {
            synchronized (this.f83906c) {
                try {
                    if (this.f83904a == null) {
                        this.f83904a = this.f83905b.p();
                    }
                } finally {
                }
            }
        }
        return this.f83904a;
    }

    @Override // org.chromium.net.UploadDataProvider, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        FileChannel fileChannel = this.f83904a;
        if (fileChannel != null) {
            fileChannel.close();
        }
    }

    @Override // org.chromium.net.UploadDataProvider
    public final long getLength() {
        return a().size();
    }

    @Override // org.chromium.net.UploadDataProvider
    public final void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) throws IOException {
        if (!byteBuffer.hasRemaining()) {
            throw new IllegalStateException("Cronet passed a buffer with no bytes remaining");
        }
        FileChannel fileChannelA = a();
        int i5 = 0;
        while (i5 == 0) {
            int i11 = fileChannelA.read(byteBuffer);
            if (i11 == -1) {
                break;
            } else {
                i5 += i11;
            }
        }
        uploadDataSink.onReadSucceeded(false);
    }

    @Override // org.chromium.net.UploadDataProvider
    public final void rewind(UploadDataSink uploadDataSink) throws IOException {
        a().position(0L);
        uploadDataSink.onRewindSucceeded();
    }
}
