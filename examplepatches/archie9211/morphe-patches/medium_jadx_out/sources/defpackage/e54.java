package defpackage;

import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e54 extends a54 {
    public e54(InputStream inputStream) {
        super(inputStream);
        if (inputStream.markSupported()) {
            this.a.mark(Integer.MAX_VALUE);
        } else {
            ay0.e("Cannot create SeekableByteOrderedDataInputStream with stream that does not support mark/reset");
            throw null;
        }
    }

    public final void m(long j) throws IOException {
        int i = this.b;
        if (i > j) {
            this.b = 0;
            this.a.reset();
        } else {
            j -= (long) i;
        }
        f((int) j);
    }

    public e54(byte[] bArr) {
        super(bArr);
        this.a.mark(Integer.MAX_VALUE);
    }
}
