package c6;

import androidx.compose.ui.node.LayoutNode;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public final class f extends b {
    public f(byte[] bArr) {
        super(bArr);
        this.f19708a.mark(LayoutNode.NotPlacedPlaceOrder);
    }

    public final void b(long j11) throws IOException {
        int i5 = this.f19710c;
        if (i5 > j11) {
            this.f19710c = 0;
            this.f19708a.reset();
        } else {
            j11 -= i5;
        }
        a((int) j11);
    }

    public f(InputStream inputStream) {
        super(inputStream);
        if (inputStream.markSupported()) {
            this.f19708a.mark(LayoutNode.NotPlacedPlaceOrder);
            return;
        }
        throw new IllegalArgumentException("Cannot create SeekableByteOrderedDataInputStream with stream that does not support mark/reset");
    }
}
