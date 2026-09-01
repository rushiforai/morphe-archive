package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x26 implements ReadableByteChannel {
    public final InputStream a;
    public final AtomicBoolean b = new AtomicBoolean(true);

    public x26(InputStream inputStream) {
        this.a = inputStream;
    }

    @Override // java.nio.channels.Channel, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        if (this.b.compareAndSet(true, false)) {
            this.a.close();
        }
    }

    @Override // java.nio.channels.Channel
    public final boolean isOpen() {
        return this.b.get();
    }

    @Override // java.nio.channels.ReadableByteChannel
    public final int read(ByteBuffer byteBuffer) throws IOException {
        boolean zHasArray = byteBuffer.hasArray();
        InputStream inputStream = this.a;
        if (!zHasArray) {
            byte[] bArr = new byte[Math.min(OlympusMakernoteDirectory.TAG_MAIN_INFO, Math.min(Math.max(inputStream.available(), 4096), byteBuffer.remaining()))];
            int i = inputStream.read(bArr);
            if (i > 0) {
                byteBuffer.put(bArr, 0, i);
            }
            return i;
        }
        int i2 = inputStream.read(byteBuffer.array(), byteBuffer.position() + byteBuffer.arrayOffset(), byteBuffer.remaining());
        if (i2 > 0) {
        }
        return i2;
    }
}
