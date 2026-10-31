package zk;

import java.io.OutputStream;
import vk.b0;

/* loaded from: classes.dex */
public final class e extends OutputStream {
    public final String toString() {
        return "ByteStreams.nullOutputStream()";
    }

    @Override // java.io.OutputStream
    public final void write(int i5) {
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr) {
        bArr.getClass();
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) {
        bArr.getClass();
        b0.i(i5, i11 + i5, bArr.length);
    }
}
