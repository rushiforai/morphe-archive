package com.fyber.inneractive.sdk.web;

import android.text.TextUtils;
import android.webkit.WebResourceRequest;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public final class b1 {

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f31263b = new byte[0];

    /* renamed from: c, reason: collision with root package name */
    public static final b1 f31264c = new b1();

    /* renamed from: a, reason: collision with root package name */
    public final z0 f31265a = new z0();

    /* JADX WARN: Removed duplicated region for block: B:24:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static c1 a(HttpURLConnection httpURLConnection, ByteBuffer byteBuffer) throws IOException {
        InputStream inputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        boolean zIsEmpty;
        String str;
        String str2;
        Map<String, List<String>> headerFields;
        String responseMessage;
        httpURLConnection.connect();
        int i5 = 0;
        while (true) {
            if (i5 >= 20) {
                break;
            }
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode < 300 || responseCode >= 400) {
                try {
                    inputStream = httpURLConnection.getInputStream();
                } catch (Throwable unused) {
                    inputStream = null;
                }
                try {
                    byte[] bArrArray = byteBuffer.array();
                    byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        try {
                            int i11 = inputStream.read(bArrArray);
                            if (i11 == -1) {
                                break;
                            }
                            byteArrayOutputStream.write(bArrArray, 0, i11);
                        } catch (Throwable unused2) {
                        }
                    }
                } catch (Throwable unused3) {
                    byteArrayOutputStream = null;
                    com.fyber.inneractive.sdk.util.v.b((Closeable) inputStream);
                    httpURLConnection.disconnect();
                    String contentType = httpURLConnection.getContentType();
                    zIsEmpty = TextUtils.isEmpty(contentType);
                    String strTrim = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    if (zIsEmpty) {
                    }
                    HashMap map = new HashMap();
                    headerFields = httpURLConnection.getHeaderFields();
                    if (headerFields != null) {
                    }
                    responseMessage = httpURLConnection.getResponseMessage();
                    if (!TextUtils.isEmpty(responseMessage)) {
                    }
                    return null;
                }
                com.fyber.inneractive.sdk.util.v.b((Closeable) inputStream);
                httpURLConnection.disconnect();
                String contentType2 = httpURLConnection.getContentType();
                zIsEmpty = TextUtils.isEmpty(contentType2);
                String strTrim2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (zIsEmpty) {
                    String[] strArrSplit = contentType2.split(";");
                    String strTrim3 = strArrSplit.length > 0 ? strArrSplit[0].trim() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    if (strArrSplit.length > 1) {
                        strTrim2 = strArrSplit[1].trim();
                    }
                    str = strTrim3;
                    str2 = strTrim2;
                } else {
                    str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    str2 = str;
                }
                HashMap map2 = new HashMap();
                headerFields = httpURLConnection.getHeaderFields();
                if (headerFields != null) {
                    for (String str3 : headerFields.keySet()) {
                        List<String> list = headerFields.get(str3);
                        if (list != null && list.size() > 0) {
                            map2.put(str3, list.get(0));
                        }
                    }
                }
                responseMessage = httpURLConnection.getResponseMessage();
                if (!TextUtils.isEmpty(responseMessage)) {
                    return new c1(byteArrayOutputStream == null ? f31263b : byteArrayOutputStream.toByteArray(), map2, str, str2, responseCode, responseMessage);
                }
            } else {
                String headerField = httpURLConnection.getHeaderField("Location");
                if (TextUtils.isEmpty(headerField)) {
                    break;
                }
                httpURLConnection.disconnect();
                httpURLConnection = (HttpURLConnection) new URL(headerField).openConnection();
                httpURLConnection.connect();
                i5++;
            }
        }
        return null;
    }

    public static void a(WebResourceRequest webResourceRequest, HttpURLConnection httpURLConnection) {
        if (webResourceRequest.getRequestHeaders() == null || webResourceRequest.getRequestHeaders().size() <= 0) {
            return;
        }
        for (String str : webResourceRequest.getRequestHeaders().keySet()) {
            if (str != null && webResourceRequest.getRequestHeaders().get(str) != null) {
                httpURLConnection.setRequestProperty(str, webResourceRequest.getRequestHeaders().get(str));
            }
        }
    }
}
