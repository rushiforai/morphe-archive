package dy;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes4.dex */
public final class i extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public volatile byte[] f49850a;

    /* renamed from: b, reason: collision with root package name */
    public int f49851b;

    /* renamed from: c, reason: collision with root package name */
    public int f49852c;

    /* renamed from: d, reason: collision with root package name */
    public int f49853d;

    /* renamed from: e, reason: collision with root package name */
    public int f49854e;

    public i(InputStream inputStream) {
        super(inputStream);
        this.f49853d = -1;
        if (inputStream != null) {
            this.f49850a = f.a();
        }
    }

    public static void c() throws IOException {
        throw new IOException("BufferedInputStream is closed");
    }

    public final int a(InputStream inputStream, byte[] bArr) throws IOException {
        int i5 = this.f49853d;
        if (i5 != -1) {
            int i11 = this.f49854e - i5;
            int i12 = this.f49852c;
            if (i11 < i12) {
                if (i5 == 0 && i12 > bArr.length) {
                    int length = bArr.length * 2;
                    if (length <= i12) {
                        i12 = length;
                    }
                    byte[] bArr2 = new byte[i12];
                    System.arraycopy(bArr, 0, bArr2, 0, bArr.length);
                    if (this.f49850a != null) {
                        f.b(this.f49850a);
                    }
                    this.f49850a = bArr2;
                    bArr = bArr2;
                } else if (i5 > 0) {
                    System.arraycopy(bArr, i5, bArr, 0, bArr.length - i5);
                }
                int i13 = this.f49854e - this.f49853d;
                this.f49854e = i13;
                this.f49853d = 0;
                this.f49851b = 0;
                int i14 = inputStream.read(bArr, i13, bArr.length - i13);
                int i15 = this.f49854e;
                if (i14 > 0) {
                    i15 += i14;
                }
                this.f49851b = i15;
                return i14;
            }
        }
        int i16 = inputStream.read(bArr);
        if (i16 > 0) {
            this.f49853d = -1;
            this.f49854e = 0;
            this.f49851b = i16 != -1 ? i16 : 0;
        }
        return i16;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized int available() {
        InputStream inputStream;
        inputStream = ((FilterInputStream) this).in;
        if (this.f49850a == null || inputStream == null) {
            c();
            throw null;
        }
        return (this.f49851b - this.f49854e) + inputStream.available();
    }

    public final void b() {
        ((FilterInputStream) this).in = null;
        this.f49851b = 0;
        this.f49852c = 0;
        this.f49853d = 0;
        this.f49854e = 0;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        byte[] bArr = this.f49850a;
        this.f49850a = null;
        if (bArr != null) {
            f.b(bArr);
        }
        InputStream inputStream = ((FilterInputStream) this).in;
        ((FilterInputStream) this).in = null;
        if (inputStream != null) {
            inputStream.close();
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized void mark(int i5) {
        this.f49852c = i5;
        this.f49853d = this.f49854e;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final boolean markSupported() {
        return true;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized int read() {
        byte[] bArr = this.f49850a;
        InputStream inputStream = ((FilterInputStream) this).in;
        if (bArr == null || inputStream == null) {
            c();
            throw null;
        }
        if (this.f49854e >= this.f49851b && a(inputStream, bArr) == -1) {
            return -1;
        }
        if (bArr != this.f49850a && (bArr = this.f49850a) == null) {
            c();
            throw null;
        }
        int i5 = this.f49851b;
        int i11 = this.f49854e;
        if (i5 - i11 <= 0) {
            return -1;
        }
        this.f49854e = i11 + 1;
        return bArr[i11] & 255;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized void reset() {
        if (this.f49850a == null) {
            throw new IOException("Stream is closed");
        }
        int i5 = this.f49853d;
        if (-1 == i5) {
            throw new IOException("Mark has been invalidated.");
        }
        this.f49854e = i5;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized long skip(long j11) {
        byte[] bArr = this.f49850a;
        InputStream inputStream = ((FilterInputStream) this).in;
        if (bArr == null) {
            c();
            throw null;
        }
        if (j11 < 1) {
            return 0L;
        }
        if (inputStream == null) {
            c();
            throw null;
        }
        int i5 = this.f49851b;
        int i11 = this.f49854e;
        long j12 = i5 - i11;
        if (j12 >= j11) {
            this.f49854e = (int) (i11 + j11);
            return j11;
        }
        this.f49854e = i5;
        if (this.f49853d == -1 || j11 > this.f49852c) {
            return j12 + inputStream.skip(j11 - j12);
        }
        if (a(inputStream, bArr) == -1) {
            return j12;
        }
        int i12 = this.f49851b;
        int i13 = this.f49854e;
        long j13 = i12 - i13;
        long j14 = j11 - j12;
        if (j13 >= j14) {
            this.f49854e = (int) (i13 + j14);
            return j11;
        }
        long j15 = j12 + j13;
        this.f49854e = i12;
        return j15;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final synchronized int read(byte[] bArr, int i5, int i11) {
        int i12;
        int i13;
        byte[] bArr2 = this.f49850a;
        if (bArr2 != null) {
            int length = bArr.length;
            if ((i5 | i11) < 0 || i5 > length || length - i5 < i11) {
                throw new IndexOutOfBoundsException();
            }
            if (i11 == 0) {
                return 0;
            }
            InputStream inputStream = ((FilterInputStream) this).in;
            if (inputStream != null) {
                int i14 = this.f49854e;
                int i15 = this.f49851b;
                if (i14 < i15) {
                    int i16 = i15 - i14;
                    if (i16 >= i11) {
                        i16 = i11;
                    }
                    System.arraycopy(bArr2, i14, bArr, i5, i16);
                    this.f49854e += i16;
                    if (i16 == i11 || inputStream.available() == 0) {
                        return i16;
                    }
                    i5 += i16;
                    i12 = i11 - i16;
                } else {
                    i12 = i11;
                }
                while (true) {
                    if (this.f49853d == -1 && i12 >= bArr2.length) {
                        i13 = inputStream.read(bArr, i5, i12);
                        if (i13 == -1) {
                            return i12 != i11 ? i11 - i12 : -1;
                        }
                    } else {
                        if (a(inputStream, bArr2) == -1) {
                            return i12 != i11 ? i11 - i12 : -1;
                        }
                        if (bArr2 != this.f49850a && (bArr2 = this.f49850a) == null) {
                            c();
                            throw null;
                        }
                        int i17 = this.f49851b;
                        int i18 = this.f49854e;
                        i13 = i17 - i18;
                        if (i13 >= i12) {
                            i13 = i12;
                        }
                        System.arraycopy(bArr2, i18, bArr, i5, i13);
                        this.f49854e += i13;
                    }
                    i12 -= i13;
                    if (i12 == 0) {
                        return i11;
                    }
                    if (inputStream.available() == 0) {
                        return i11 - i12;
                    }
                    i5 += i13;
                }
            } else {
                c();
                throw null;
            }
        } else {
            c();
            throw null;
        }
    }
}
