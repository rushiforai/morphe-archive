package com.google.android.exoplayer2.upstream;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketTimeoutException;
import vk.b0;

/* loaded from: classes3.dex */
public class HttpDataSource$HttpDataSourceException extends DataSourceException {

    /* renamed from: c, reason: collision with root package name */
    public final int f31595c;

    public HttpDataSource$HttpDataSourceException() {
        super(2008);
        this.f31595c = 1;
    }

    public static HttpDataSource$HttpDataSourceException a(int i5, IOException iOException) {
        String message = iOException.getMessage();
        int i11 = iOException instanceof SocketTimeoutException ? 2002 : iOException instanceof InterruptedIOException ? 1004 : (message == null || !b0.s(message).matches("cleartext.*not permitted.*")) ? 2001 : 2007;
        return i11 == 2007 ? new HttpDataSource$CleartextNotPermittedException(2007, iOException, "Cleartext HTTP traffic not permitted. See https://exoplayer.dev/issues/cleartext-not-permitted") : new HttpDataSource$HttpDataSourceException(i11, i5, iOException);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public HttpDataSource$HttpDataSourceException(int i5, int i11, IOException iOException) {
        if (i5 == 2000 && i11 == 1) {
            i5 = 2001;
        }
        super(iOException, i5);
        this.f31595c = i11;
    }

    public HttpDataSource$HttpDataSourceException(int i5, IOException iOException, String str) {
        super(str, iOException, i5 == 2000 ? 2001 : i5);
        this.f31595c = 1;
    }
}
