package com.fyber.inneractive.sdk.util;

import android.security.NetworkSecurityPolicy;
import android.text.TextUtils;
import java.io.BufferedInputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.zip.GZIPInputStream;

/* loaded from: classes.dex */
public abstract class s {
    public static boolean a() {
        return NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted();
    }

    public static String b(HttpURLConnection httpURLConnection) throws Exception {
        int responseCode = httpURLConnection.getResponseCode();
        if ((responseCode <= 300 || responseCode >= 304) && responseCode != 307 && responseCode != 308) {
            return null;
        }
        IAlog.a("getRedirectUrl: received redirect code %s", Integer.toString(responseCode));
        String headerField = httpURLConnection.getHeaderField(com.fyber.inneractive.sdk.network.n.LOCATION.a());
        if (!TextUtils.isEmpty(headerField)) {
            IAlog.a("getRedirectUrl: redirecting target url: %s", headerField);
            return headerField;
        }
        throw new Exception("Server returned HTTP " + Integer.toString(responseCode) + " with empty location header!");
    }

    public static String a(String str, int i5, int i11) throws Exception {
        String string;
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            httpURLConnection.setConnectTimeout(i5);
            httpURLConnection.setReadTimeout(i11);
            httpURLConnection.connect();
            FilterInputStream filterInputStreamA = a(httpURLConnection);
            String strB = b(httpURLConnection);
            if (!TextUtils.isEmpty(strB)) {
                httpURLConnection.disconnect();
                return a(strB, i11, i5);
            }
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode != 200) {
                IAlog.a("isResponseValid: found invalid response status: %s", Integer.toString(responseCode));
                string = null;
            } else {
                string = v.b((InputStream) filterInputStreamA).toString();
            }
            httpURLConnection.disconnect();
            return string;
        } catch (Exception e3) {
            IAlog.a("getBodyFromUrl failed with exception", e3, new Object[0]);
            throw e3;
        } catch (Throwable th2) {
            IAlog.a("getBodyFromUrl failed with error", th2, new Object[0]);
            return null;
        }
    }

    public static FilterInputStream a(HttpURLConnection httpURLConnection) throws IOException {
        try {
            InputStream inputStream = httpURLConnection.getInputStream();
            if (TextUtils.equals("gzip", httpURLConnection.getContentEncoding())) {
                return new GZIPInputStream(inputStream);
            }
            return new BufferedInputStream(inputStream);
        } catch (Exception unused) {
            return null;
        }
    }

    public static HashMap a(Map map) {
        List list;
        HashMap map2 = new HashMap();
        if (map != null) {
            for (String str : map.keySet()) {
                if (str != null && (list = (List) map.get(str)) != null && !list.isEmpty()) {
                    map2.put(str.toLowerCase(Locale.US), (String) list.get(0));
                }
            }
        }
        return map2;
    }
}
