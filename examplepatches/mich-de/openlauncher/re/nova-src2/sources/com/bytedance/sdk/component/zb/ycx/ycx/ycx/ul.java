package com.bytedance.sdk.component.zb.ycx.ycx.ycx;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;

/* loaded from: classes2.dex */
public class ul extends InputStream {
    InputStream ycx;

    /* renamed from: zb, reason: collision with root package name */
    HttpURLConnection f24217zb;

    public ul(InputStream inputStream, HttpURLConnection httpURLConnection) {
        this.ycx = inputStream;
        this.f24217zb = httpURLConnection;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.available();
        }
        return 0;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            inputStream.close();
            this.ycx = null;
        }
        HttpURLConnection httpURLConnection = this.f24217zb;
        if (httpURLConnection != null) {
            httpURLConnection.disconnect();
            this.f24217zb = null;
        }
    }

    @Override // java.io.InputStream
    public synchronized void mark(int i5) {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            inputStream.mark(i5);
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.markSupported();
        }
        return false;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.read();
        }
        return 0;
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            inputStream.reset();
        }
    }

    @Override // java.io.InputStream
    public long skip(long j11) throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.skip(j11);
        }
        return 0L;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.read(bArr);
        }
        return 0;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i5, int i11) throws IOException {
        InputStream inputStream = this.ycx;
        if (inputStream != null) {
            return inputStream.read(bArr, i5, i11);
        }
        return 0;
    }
}
