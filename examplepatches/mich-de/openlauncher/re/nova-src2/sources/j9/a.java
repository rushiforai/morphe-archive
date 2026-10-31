package j9;

import java.io.BufferedInputStream;
import java.io.EOFException;
import java.io.FilterInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: classes2.dex */
public final class a extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public int f69156a;

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f69157b;

    /* renamed from: c, reason: collision with root package name */
    public final ByteBuffer f69158c;

    public a(BufferedInputStream bufferedInputStream) {
        super(bufferedInputStream);
        this.f69156a = 0;
        byte[] bArr = new byte[8];
        this.f69157b = bArr;
        this.f69158c = ByteBuffer.wrap(bArr);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr) throws IOException {
        int i5 = ((FilterInputStream) this).in.read(bArr);
        this.f69156a += i5 >= 0 ? i5 : 0;
        return i5;
    }

    public final int readInt() throws EOFException {
        if (read(this.f69157b, 0, 4) != 4) {
            throw new EOFException();
        }
        ByteBuffer byteBuffer = this.f69158c;
        byteBuffer.rewind();
        return byteBuffer.getInt();
    }

    public final short readShort() throws EOFException {
        if (read(this.f69157b, 0, 2) != 2) {
            throw new EOFException();
        }
        ByteBuffer byteBuffer = this.f69158c;
        byteBuffer.rewind();
        return byteBuffer.getShort();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final long skip(long j11) throws IOException {
        long jSkip = ((FilterInputStream) this).in.skip(j11);
        this.f69156a = (int) (this.f69156a + jSkip);
        return jSkip;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = ((FilterInputStream) this).in.read(bArr, i5, i11);
        this.f69156a += i12 >= 0 ? i12 : 0;
        return i12;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        int i5 = ((FilterInputStream) this).in.read();
        this.f69156a += i5 >= 0 ? 1 : 0;
        return i5;
    }
}
