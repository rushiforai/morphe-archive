package com.android.volley.toolbox;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;

/* loaded from: classes2.dex */
public final class e extends FilterInputStream {

    /* renamed from: a, reason: collision with root package name */
    public final HttpURLConnection f21401a;

    /* JADX WARN: Illegal instructions before constructor call */
    public e(HttpURLConnection httpURLConnection) throws IOException {
        InputStream errorStream;
        try {
            errorStream = httpURLConnection.getInputStream();
        } catch (IOException unused) {
            errorStream = httpURLConnection.getErrorStream();
        }
        super(errorStream);
        this.f21401a = httpURLConnection;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        super.close();
        this.f21401a.disconnect();
    }
}
