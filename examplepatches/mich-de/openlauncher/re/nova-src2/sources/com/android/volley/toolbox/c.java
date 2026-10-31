package com.android.volley.toolbox;

import java.io.BufferedInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes2.dex */
public final class c extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f21394a = 0;

    /* renamed from: b, reason: collision with root package name */
    public long f21395b;

    /* renamed from: c, reason: collision with root package name */
    public long f21396c;

    public c(InputStream inputStream) {
        super(inputStream);
        this.f21396c = -1L;
        this.f21395b = 1048577L;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() {
        switch (this.f21394a) {
            case 1:
                return (int) Math.min(((FilterInputStream) this).in.available(), this.f21395b);
            default:
                return super.available();
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void mark(int i5) {
        switch (this.f21394a) {
            case 1:
                synchronized (this) {
                    ((FilterInputStream) this).in.mark(i5);
                    this.f21396c = this.f21395b;
                }
                return;
            default:
                super.mark(i5);
                return;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read() throws IOException {
        switch (this.f21394a) {
            case 0:
                int i5 = super.read();
                if (i5 != -1) {
                    this.f21396c++;
                }
                return i5;
            default:
                if (this.f21395b == 0) {
                    return -1;
                }
                int i11 = ((FilterInputStream) this).in.read();
                if (i11 != -1) {
                    this.f21395b--;
                }
                return i11;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void reset() throws IOException {
        switch (this.f21394a) {
            case 1:
                synchronized (this) {
                    if (!((FilterInputStream) this).in.markSupported()) {
                        throw new IOException("Mark not supported");
                    }
                    if (this.f21396c == -1) {
                        throw new IOException("Mark not set");
                    }
                    ((FilterInputStream) this).in.reset();
                    this.f21395b = this.f21396c;
                }
                return;
            default:
                super.reset();
                return;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long j11) throws IOException {
        switch (this.f21394a) {
            case 1:
                long jSkip = ((FilterInputStream) this).in.skip(Math.min(j11, this.f21395b));
                this.f21395b -= jSkip;
                return jSkip;
            default:
                return super.skip(j11);
        }
    }

    public c(BufferedInputStream bufferedInputStream, long j11) {
        super(bufferedInputStream);
        this.f21395b = j11;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        switch (this.f21394a) {
            case 0:
                int i12 = super.read(bArr, i5, i11);
                if (i12 != -1) {
                    this.f21396c += i12;
                }
                return i12;
            default:
                long j11 = this.f21395b;
                if (j11 == 0) {
                    return -1;
                }
                int i13 = ((FilterInputStream) this).in.read(bArr, i5, (int) Math.min(i11, j11));
                if (i13 != -1) {
                    this.f21395b -= i13;
                }
                return i13;
        }
    }
}
