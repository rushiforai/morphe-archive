package o8;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public final class g extends InputStream {

    /* renamed from: a, reason: collision with root package name */
    public final InputStream f79700a;

    /* renamed from: b, reason: collision with root package name */
    public int f79701b = 1073741824;

    public g(InputStream inputStream) {
        this.f79700a = inputStream;
    }

    @Override // java.io.InputStream
    public final int available() {
        return this.f79701b;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f79700a.close();
    }

    @Override // java.io.InputStream
    public final int read() throws IOException {
        int i5 = this.f79700a.read();
        if (i5 == -1) {
            this.f79701b = 0;
        }
        return i5;
    }

    @Override // java.io.InputStream
    public final long skip(long j11) {
        return this.f79700a.skip(j11);
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        int i5 = this.f79700a.read(bArr);
        if (i5 == -1) {
            this.f79701b = 0;
        }
        return i5;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f79700a.read(bArr, i5, i11);
        if (i12 == -1) {
            this.f79701b = 0;
        }
        return i12;
    }
}
