package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import androidx.recyclerview.widget.u1;
import com.amplitude.core.events.Identify;
import h6.c1;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.NoRouteToHostException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class p implements h {
    public static final Pattern o = Pattern.compile("^bytes (\\d+)-(\\d+)/(\\d+)$");

    /* renamed from: p, reason: collision with root package name */
    public static final AtomicReference f30390p = new AtomicReference();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f30391a;

    /* renamed from: b, reason: collision with root package name */
    public final int f30392b;

    /* renamed from: c, reason: collision with root package name */
    public final int f30393c;

    /* renamed from: d, reason: collision with root package name */
    public final String f30394d;

    /* renamed from: e, reason: collision with root package name */
    public final w f30395e;

    /* renamed from: f, reason: collision with root package name */
    public final w f30396f;

    /* renamed from: g, reason: collision with root package name */
    public final m f30397g;

    /* renamed from: h, reason: collision with root package name */
    public HttpURLConnection f30398h;

    /* renamed from: i, reason: collision with root package name */
    public InputStream f30399i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f30400j;

    /* renamed from: k, reason: collision with root package name */
    public long f30401k;

    /* renamed from: l, reason: collision with root package name */
    public long f30402l;

    /* renamed from: m, reason: collision with root package name */
    public long f30403m;
    public long n;

    public p(String str, m mVar, int i5, int i11, boolean z11, w wVar) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException();
        }
        this.f30394d = str;
        this.f30397g = mVar;
        this.f30396f = new w();
        this.f30392b = i5;
        this.f30393c = i11;
        this.f30391a = z11;
        this.f30395e = wVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        HttpURLConnection httpURLConnection = this.f30398h;
        if (httpURLConnection == null) {
            return null;
        }
        return Uri.parse(httpURLConnection.getURL().toString());
    }

    public final HttpURLConnection b(k kVar) throws IOException {
        URL url = new URL(kVar.f30365a.toString());
        long j11 = kVar.f30367c;
        long j12 = kVar.f30368d;
        int i5 = 0;
        boolean z11 = (kVar.f30370f & 1) == 1;
        if (!this.f30391a) {
            return a(url, null, j11, j12, z11, true);
        }
        while (true) {
            int i11 = i5 + 1;
            if (i5 > 20) {
                throw new NoRouteToHostException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Too many redirects: ", i11));
            }
            boolean z12 = z11;
            long j13 = j12;
            long j14 = j11;
            HttpURLConnection httpURLConnectionA = a(url, null, j14, j13, z12, false);
            j11 = j14;
            j12 = j13;
            z11 = z12;
            int responseCode = httpURLConnectionA.getResponseCode();
            if (responseCode != 300 && responseCode != 301 && responseCode != 302 && responseCode != 303 && responseCode != 307 && responseCode != 308) {
                return httpURLConnectionA;
            }
            String headerField = httpURLConnectionA.getHeaderField("Location");
            httpURLConnectionA.disconnect();
            if (headerField == null) {
                throw new ProtocolException("Null location redirect");
            }
            URL url2 = new URL(url, headerField);
            String protocol = url2.getProtocol();
            if (!"https".equals(protocol) && !"http".equals(protocol)) {
                throw new ProtocolException(b.c0.k("Unsupported protocol redirect: ", protocol));
            }
            i5 = i11;
            url = url2;
        }
    }

    public final void c() throws IOException {
        if (this.f30403m == this.f30401k) {
            return;
        }
        byte[] bArr = (byte[]) f30390p.getAndSet(null);
        if (bArr == null) {
            bArr = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        }
        while (true) {
            long j11 = this.f30403m;
            long j12 = this.f30401k;
            if (j11 == j12) {
                f30390p.set(bArr);
                return;
            }
            int i5 = this.f30399i.read(bArr, 0, (int) Math.min(j12 - j11, bArr.length));
            if (Thread.interrupted()) {
                throw new InterruptedIOException();
            }
            if (i5 == -1) {
                throw new EOFException();
            }
            long j13 = i5;
            this.f30403m += j13;
            m mVar = this.f30397g;
            if (mVar != null) {
                synchronized (mVar) {
                    mVar.f30379d += j13;
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() {
        try {
            if (this.f30399i != null) {
                HttpURLConnection httpURLConnection = this.f30398h;
                long j11 = this.f30402l;
                if (j11 != -1) {
                    j11 -= this.n;
                }
                a(httpURLConnection, j11);
                try {
                    this.f30399i.close();
                } catch (IOException e3) {
                    throw new u(e3);
                }
            }
        } finally {
            this.f30399i = null;
            b();
            if (this.f30400j) {
                this.f30400j = false;
                m mVar = this.f30397g;
                if (mVar != null) {
                    mVar.a();
                }
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws u {
        try {
            c();
            return a(bArr, i5, i11);
        } catch (IOException e3) {
            throw new u(e3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00e7  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a(k kVar) throws IOException, NumberFormatException {
        long j11;
        long jMax;
        String headerField;
        this.n = 0L;
        this.f30403m = 0L;
        try {
            HttpURLConnection httpURLConnectionB = b(kVar);
            this.f30398h = httpURLConnectionB;
            try {
                int responseCode = httpURLConnectionB.getResponseCode();
                if (responseCode < 200 || responseCode > 299) {
                    this.f30398h.getHeaderFields();
                    b();
                    v vVar = new v(responseCode);
                    if (responseCode != 416) {
                        throw vVar;
                    }
                    vVar.initCause(new i());
                    throw vVar;
                }
                this.f30398h.getContentType();
                if (responseCode == 200) {
                    j11 = kVar.f30367c;
                    if (j11 == 0) {
                        j11 = 0;
                    }
                }
                this.f30401k = j11;
                if ((kVar.f30370f & 1) == 1) {
                    this.f30402l = kVar.f30368d;
                } else {
                    long j12 = kVar.f30368d;
                    if (j12 != -1) {
                        this.f30402l = j12;
                    } else {
                        HttpURLConnection httpURLConnection = this.f30398h;
                        String headerField2 = httpURLConnection.getHeaderField("Content-Length");
                        if (TextUtils.isEmpty(headerField2)) {
                            jMax = -1;
                            headerField = httpURLConnection.getHeaderField("Content-Range");
                            if (!TextUtils.isEmpty(headerField)) {
                            }
                            this.f30402l = jMax != -1 ? jMax - this.f30401k : -1L;
                        } else {
                            try {
                                jMax = Long.parseLong(headerField2);
                            } catch (NumberFormatException unused) {
                                Log.e("DefaultHttpDataSource", "Unexpected Content-Length [" + headerField2 + "]");
                            }
                            headerField = httpURLConnection.getHeaderField("Content-Range");
                            if (!TextUtils.isEmpty(headerField)) {
                                Matcher matcher = o.matcher(headerField);
                                if (matcher.find()) {
                                    try {
                                        long j13 = (Long.parseLong(matcher.group(2)) - Long.parseLong(matcher.group(1))) + 1;
                                        if (jMax < 0) {
                                            jMax = j13;
                                        } else if (jMax != j13) {
                                            Log.w("DefaultHttpDataSource", "Inconsistent headers [" + headerField2 + "] [" + headerField + "]");
                                            jMax = Math.max(jMax, j13);
                                        }
                                    } catch (NumberFormatException unused2) {
                                        Log.e("DefaultHttpDataSource", "Unexpected Content-Range [" + headerField + "]");
                                    }
                                }
                            }
                            this.f30402l = jMax != -1 ? jMax - this.f30401k : -1L;
                        }
                    }
                }
                try {
                    this.f30399i = this.f30398h.getInputStream();
                    this.f30400j = true;
                    m mVar = this.f30397g;
                    if (mVar != null) {
                        synchronized (mVar) {
                            try {
                                if (mVar.f30377b == 0) {
                                    mVar.f30378c = SystemClock.elapsedRealtime();
                                }
                                mVar.f30377b++;
                            } catch (Throwable th2) {
                                throw th2;
                            }
                        }
                    }
                    return this.f30402l;
                } catch (IOException e3) {
                    b();
                    throw new u(e3);
                }
            } catch (IOException e11) {
                b();
                throw new u("Unable to connect to " + kVar.f30365a.toString(), e11);
            }
        } catch (IOException e12) {
            throw new u("Unable to connect to " + kVar.f30365a.toString(), e12);
        }
    }

    public final void b() {
        HttpURLConnection httpURLConnection = this.f30398h;
        if (httpURLConnection != null) {
            try {
                httpURLConnection.disconnect();
            } catch (Exception e3) {
                Log.e("DefaultHttpDataSource", "Unexpected error while disconnecting", e3);
            }
            this.f30398h = null;
        }
    }

    public final HttpURLConnection a(URL url, byte[] bArr, long j11, long j12, boolean z11, boolean z12) throws IOException {
        Map map;
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        httpURLConnection.setConnectTimeout(this.f30392b);
        httpURLConnection.setReadTimeout(this.f30393c);
        w wVar = this.f30395e;
        if (wVar != null) {
            synchronized (wVar) {
                try {
                    if (wVar.f30417b == null) {
                        wVar.f30417b = Collections.unmodifiableMap(new HashMap(wVar.f30416a));
                    }
                    map = wVar.f30417b;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            for (Map.Entry entry : map.entrySet()) {
                httpURLConnection.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
            }
        }
        for (Map.Entry entry2 : this.f30396f.a().entrySet()) {
            httpURLConnection.setRequestProperty((String) entry2.getKey(), (String) entry2.getValue());
        }
        if (j11 != 0 || j12 != -1) {
            String strO = c1.o(j11, "bytes=", Identify.UNSET_VALUE);
            if (j12 != -1) {
                StringBuilder sbQ = a2.c.q(strO);
                sbQ.append((j11 + j12) - 1);
                strO = sbQ.toString();
            }
            httpURLConnection.setRequestProperty("Range", strO);
        }
        httpURLConnection.setRequestProperty("User-Agent", this.f30394d);
        if (!z11) {
            httpURLConnection.setRequestProperty("Accept-Encoding", "identity");
        }
        httpURLConnection.setInstanceFollowRedirects(z12);
        httpURLConnection.setDoOutput(bArr != null);
        if (bArr != null) {
            httpURLConnection.setRequestMethod("POST");
            if (bArr.length == 0) {
                httpURLConnection.connect();
                return httpURLConnection;
            }
            httpURLConnection.setFixedLengthStreamingMode(bArr.length);
            httpURLConnection.connect();
            OutputStream outputStream = httpURLConnection.getOutputStream();
            outputStream.write(bArr);
            outputStream.close();
            return httpURLConnection;
        }
        httpURLConnection.connect();
        return httpURLConnection;
    }

    public final int a(byte[] bArr, int i5, int i11) throws IOException {
        if (i11 == 0) {
            return 0;
        }
        long j11 = this.f30402l;
        if (j11 != -1) {
            long j12 = j11 - this.n;
            if (j12 == 0) {
                return -1;
            }
            i11 = (int) Math.min(i11, j12);
        }
        int i12 = this.f30399i.read(bArr, i5, i11);
        if (i12 == -1) {
            if (this.f30402l == -1) {
                return -1;
            }
            throw new EOFException();
        }
        long j13 = i12;
        this.n += j13;
        m mVar = this.f30397g;
        if (mVar == null) {
            return i12;
        }
        synchronized (mVar) {
            mVar.f30379d += j13;
        }
        return i12;
    }

    public static void a(HttpURLConnection httpURLConnection, long j11) throws IllegalAccessException, NoSuchMethodException, IOException, SecurityException, IllegalArgumentException, InvocationTargetException {
        int i5 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        if (i5 == 19 || i5 == 20) {
            try {
                InputStream inputStream = httpURLConnection.getInputStream();
                if (j11 == -1) {
                    if (inputStream.read() == -1) {
                        return;
                    }
                } else if (j11 <= 2048) {
                    return;
                }
                String name = inputStream.getClass().getName();
                if (name.equals("com.android.okhttp.internal.http.HttpTransport$ChunkedInputStream") || name.equals("com.android.okhttp.internal.http.HttpTransport$FixedLengthInputStream")) {
                    Method declaredMethod = inputStream.getClass().getSuperclass().getDeclaredMethod("unexpectedEndOfInput", null);
                    declaredMethod.setAccessible(true);
                    declaredMethod.invoke(inputStream, null);
                }
            } catch (Exception unused) {
            }
        }
    }
}
