package q90;

import java.io.IOException;
import java.nio.ByteBuffer;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UploadDataSink;

/* loaded from: classes5.dex */
public final class a extends UploadDataProvider {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83902a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f83903b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f83902a = i5;
        this.f83903b = obj;
    }

    @Override // org.chromium.net.UploadDataProvider, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        switch (this.f83902a) {
            case 1:
                ((UploadDataProvider) this.f83903b).close();
                break;
            default:
                super.close();
                break;
        }
    }

    @Override // org.chromium.net.UploadDataProvider
    public final long getLength() {
        switch (this.f83902a) {
            case 0:
                return ((ByteBuffer) this.f83903b).limit();
            default:
                return ((UploadDataProvider) this.f83903b).getLength();
        }
    }

    @Override // org.chromium.net.UploadDataProvider
    public final void read(UploadDataSink uploadDataSink, ByteBuffer byteBuffer) throws IOException {
        switch (this.f83902a) {
            case 0:
                ByteBuffer byteBuffer2 = (ByteBuffer) this.f83903b;
                if (!byteBuffer.hasRemaining()) {
                    throw new IllegalStateException("Cronet passed a buffer with no bytes remaining");
                }
                if (byteBuffer.remaining() >= byteBuffer2.remaining()) {
                    byteBuffer.put(byteBuffer2);
                } else {
                    int iLimit = byteBuffer2.limit();
                    byteBuffer.put(byteBuffer2);
                }
                uploadDataSink.onReadSucceeded(false);
                return;
            default:
                ((UploadDataProvider) this.f83903b).read(uploadDataSink, byteBuffer);
                return;
        }
    }

    @Override // org.chromium.net.UploadDataProvider
    public final void rewind(UploadDataSink uploadDataSink) throws IOException {
        switch (this.f83902a) {
            case 0:
                uploadDataSink.onRewindSucceeded();
                break;
            default:
                ((UploadDataProvider) this.f83903b).rewind(uploadDataSink);
                break;
        }
    }
}
