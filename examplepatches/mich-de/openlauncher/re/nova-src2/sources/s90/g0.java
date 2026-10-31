package s90;

import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes5.dex */
public final class g0 implements ReadableByteChannel {

    /* renamed from: a, reason: collision with root package name */
    public final InputStream f86946a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f86947b = new AtomicBoolean(true);

    public g0(InputStream inputStream) {
        this.f86946a = inputStream;
    }

    @Override // java.nio.channels.Channel, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.f86947b.compareAndSet(true, false)) {
            this.f86946a.close();
        }
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return this.f86947b.get();
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer byteBuffer) throws IOException {
        boolean zHasArray = byteBuffer.hasArray();
        InputStream inputStream = this.f86946a;
        if (!zHasArray) {
            byte[] bArr = new byte[Math.min(ReaderJsonLexerKt.BATCH_SIZE, Math.min(Math.max(inputStream.available(), u1.FLAG_APPEARED_IN_PRE_LAYOUT), byteBuffer.remaining()))];
            int i5 = inputStream.read(bArr);
            if (i5 > 0) {
                byteBuffer.put(bArr, 0, i5);
            }
            return i5;
        }
        int i11 = inputStream.read(byteBuffer.array(), byteBuffer.position() + byteBuffer.arrayOffset(), byteBuffer.remaining());
        if (i11 > 0) {
        }
        return i11;
    }
}
