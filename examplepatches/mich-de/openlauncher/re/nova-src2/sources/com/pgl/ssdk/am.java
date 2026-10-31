package com.pgl.ssdk;

import android.content.Context;
import android.text.TextUtils;
import android.util.Pair;
import com.amplitude.android.TrackingOptions;
import com.tiktok.util.UrlConst;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.Proxy;
import java.net.URL;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class am {

    /* renamed from: a, reason: collision with root package name */
    public static String f42287a;

    /* renamed from: c, reason: collision with root package name */
    private Context f42289c;

    /* renamed from: d, reason: collision with root package name */
    private int f42290d;

    /* renamed from: e, reason: collision with root package name */
    private int f42291e;

    /* renamed from: f, reason: collision with root package name */
    private byte[] f42292f;

    /* renamed from: b, reason: collision with root package name */
    private HttpURLConnection f42288b = null;

    /* renamed from: g, reason: collision with root package name */
    private int f42293g = -1;

    /* renamed from: h, reason: collision with root package name */
    private byte[] f42294h = null;

    /* renamed from: i, reason: collision with root package name */
    private int f42295i = 10000;

    /* renamed from: j, reason: collision with root package name */
    private int f42296j = 0;

    /* renamed from: k, reason: collision with root package name */
    private int f42297k = 2;

    /* renamed from: l, reason: collision with root package name */
    private boolean f42298l = true;

    /* renamed from: m, reason: collision with root package name */
    private Runnable f42299m = new a();

    public class a implements Runnable {
        public a() {
        }

        @Override // java.lang.Runnable
        public void run() {
            if (am.this.f42296j == 0) {
                an.c();
            }
            if (am.this.c() || am.this.f42296j >= am.this.f42297k) {
                return;
            }
            am.b(am.this);
            ar.a(this);
        }
    }

    public am(Context context) {
        this.f42289c = context;
    }

    public static /* synthetic */ int b(am amVar) {
        int i5 = amVar.f42296j;
        amVar.f42296j = i5 + 1;
        return i5;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00db A[EXC_TOP_SPLITTER, PHI: r0
      0x00db: PHI (r0v3 java.io.InputStream) = (r0v2 java.io.InputStream), (r0v17 java.io.InputStream) binds: [B:44:0x00d8, B:38:0x00cb] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean c() {
        InputStream inputStream;
        String strA;
        byte[] bArrA;
        int i5;
        try {
            strA = an.a(this.f42289c);
        } catch (Throwable unused) {
            inputStream = null;
        }
        if (TextUtils.isEmpty(strA)) {
            an.b(this.f42289c);
            HttpURLConnection httpURLConnection = this.f42288b;
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
                this.f42288b = null;
            }
            return false;
        }
        String strConcat = strA + a();
        if (!strConcat.startsWith(UrlConst.HTTPS) && !strConcat.startsWith("http://")) {
            strConcat = UrlConst.HTTPS.concat(strConcat);
        }
        URL url = new URL(strConcat);
        HttpURLConnection httpURLConnection2 = (HttpURLConnection) (this.f42298l ? url.openConnection(Proxy.NO_PROXY) : url.openConnection());
        this.f42288b = httpURLConnection2;
        httpURLConnection2.setConnectTimeout(this.f42295i);
        this.f42288b.setReadTimeout(this.f42295i);
        a(this.f42290d);
        b(this.f42291e);
        byte[] bArr = this.f42292f;
        if (bArr != null && bArr.length > 0) {
            this.f42288b.setDoOutput(true);
            OutputStream outputStream = this.f42288b.getOutputStream();
            outputStream.write(this.f42292f);
            outputStream.flush();
            outputStream.close();
        }
        this.f42288b.connect();
        this.f42293g = this.f42288b.getResponseCode();
        inputStream = this.f42288b.getInputStream();
        try {
            bArrA = a(inputStream);
            this.f42294h = bArrA;
            i5 = this.f42293g;
        } catch (Throwable unused2) {
            HttpURLConnection httpURLConnection3 = this.f42288b;
            if (httpURLConnection3 != null) {
                httpURLConnection3.disconnect();
                this.f42288b = null;
            }
            if (inputStream != null) {
            }
            an.b(this.f42289c);
            return false;
        }
        if (i5 == 200) {
            a(i5, bArrA);
            HttpURLConnection httpURLConnection4 = this.f42288b;
            if (httpURLConnection4 != null) {
                httpURLConnection4.disconnect();
                this.f42288b = null;
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (Throwable unused3) {
                }
            }
            return true;
        }
        HttpURLConnection httpURLConnection5 = this.f42288b;
        if (httpURLConnection5 != null) {
            httpURLConnection5.disconnect();
            this.f42288b = null;
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (Throwable unused4) {
            }
        }
        an.b(this.f42289c);
        return false;
    }

    public abstract String a();

    public abstract void a(int i5, byte[] bArr);

    private void a(int i5) throws ProtocolException {
        this.f42288b.setRequestMethod(i5 != 1 ? i5 != 3 ? i5 != 4 ? i5 != 5 ? i5 != 6 ? "GET" : "TRACE" : "HEAD" : "DELETE" : "PUT" : "POST");
    }

    private void b() throws JSONException {
        Object obj;
        if (this.f42288b == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            if (!TextUtils.isEmpty(f42287a)) {
                jSONObject.put("ipv6", f42287a);
            }
            if (!TextUtils.isEmpty(com.pgl.ssdk.ces.b.c())) {
                jSONObject.put("gaid", com.pgl.ssdk.ces.b.c());
            }
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_REGION, an.a());
            Pair<Integer, String> pairA = aq.a(jSONObject.toString());
            if (pairA == null || (obj = pairA.first) == null || pairA.second == null) {
                return;
            }
            this.f42288b.addRequestProperty("cypher", String.valueOf(obj));
            this.f42288b.addRequestProperty("transfer-param", (String) pairA.second);
        } catch (Exception unused) {
        }
    }

    private void b(int i5) throws JSONException {
        HttpURLConnection httpURLConnection;
        StringBuilder sb2;
        String str;
        String str2 = i5 != 1 ? i5 != 2 ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : "application/octet-stream" : "application/json; charset=utf-8";
        if (!str2.isEmpty()) {
            this.f42288b.addRequestProperty("Content-Type", str2);
        }
        String strB = an.b();
        if (strB != null) {
            this.f42288b.addRequestProperty("x-pangle-target-idc", strB);
        }
        b();
        try {
            String language = Locale.getDefault().getLanguage();
            if (language.equalsIgnoreCase("zh")) {
                httpURLConnection = this.f42288b;
                sb2 = new StringBuilder();
                sb2.append(Locale.getDefault().toString());
                sb2.append(",");
                sb2.append(language);
                str = ";q=0.9";
            } else {
                httpURLConnection = this.f42288b;
                sb2 = new StringBuilder();
                sb2.append(Locale.getDefault().toString());
                sb2.append(",");
                sb2.append(language);
                str = ";q=0.9,en-US;q=0.6,en;q=0.4";
            }
            sb2.append(str);
            httpURLConnection.addRequestProperty("Accept-Language", sb2.toString());
        } catch (Throwable unused) {
        }
    }

    public void a(int i5, int i11, byte[] bArr) {
        b(i5, i11, bArr);
        ar.a(this.f42299m);
    }

    public static synchronized void a(String str) {
        if (!TextUtils.isEmpty(str) && !str.equals(f42287a)) {
            f42287a = str;
        }
    }

    private void b(int i5, int i11, byte[] bArr) {
        this.f42290d = i5;
        this.f42291e = i11;
        this.f42292f = bArr;
    }

    private byte[] a(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[1024];
        while (true) {
            int i5 = inputStream.read(bArr, 0, 1024);
            if (i5 <= 0) {
                return byteArrayOutputStream.toByteArray();
            }
            byteArrayOutputStream.write(bArr, 0, i5);
        }
    }
}
