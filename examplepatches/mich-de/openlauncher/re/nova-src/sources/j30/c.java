package j30;

import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.OutputStream;

/* loaded from: classes4.dex */
public final class c extends OutputStream {

    /* renamed from: a, reason: collision with root package name */
    public OutputStream f68881a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f68882b;

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f68881a.close();
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public final void flush() throws IOException {
        if (this.f68882b) {
            throw new InterruptedIOException();
        }
        this.f68881a.flush();
    }

    @Override // java.io.OutputStream
    public final void write(int i5) throws IOException {
        if (this.f68882b) {
            throw new InterruptedIOException();
        }
        this.f68881a.write(i5);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = i11 + i5;
        while (i5 < i12) {
            if (!this.f68882b) {
                int iMin = Math.min(u1.FLAG_APPEARED_IN_PRE_LAYOUT, i12 - i5);
                this.f68881a.write(bArr, i5, iMin);
                i5 += iMin;
            } else {
                throw new InterruptedIOException();
            }
        }
    }
}
