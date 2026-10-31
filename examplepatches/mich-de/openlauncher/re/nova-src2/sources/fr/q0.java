package fr;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import javax.net.ssl.HttpsURLConnection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 implements Closeable {

    /* renamed from: b, reason: collision with root package name */
    public static final String f55688b = StandardCharsets.UTF_8.name();

    /* renamed from: a, reason: collision with root package name */
    public final HttpsURLConnection f55689a;

    public q0(HttpsURLConnection httpsURLConnection) {
        this.f55689a = httpsURLConnection;
    }

    public final u0 a() throws IOException {
        HttpsURLConnection httpsURLConnection = this.f55689a;
        int responseCode = httpsURLConnection.getResponseCode();
        int responseCode2 = httpsURLConnection.getResponseCode();
        InputStream errorStream = (200 > responseCode2 || responseCode2 >= 300) ? httpsURLConnection.getErrorStream() : httpsURLConnection.getInputStream();
        if (errorStream != null) {
            try {
                Scanner scannerUseDelimiter = new Scanner(errorStream, f55688b).useDelimiter("\\A");
                next = scannerUseDelimiter.hasNext() ? scannerUseDelimiter.next() : null;
                errorStream.close();
            } finally {
            }
        }
        Map<String, List<String>> headerFields = httpsURLConnection.getHeaderFields();
        Intrinsics.f(headerFields, "getHeaderFields(...)");
        return new u0(headerFields, next, responseCode);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        HttpsURLConnection httpsURLConnection = this.f55689a;
        int responseCode = httpsURLConnection.getResponseCode();
        InputStream errorStream = (200 > responseCode || responseCode >= 300) ? httpsURLConnection.getErrorStream() : httpsURLConnection.getInputStream();
        if (errorStream != null) {
            errorStream.close();
        }
        httpsURLConnection.disconnect();
    }
}
