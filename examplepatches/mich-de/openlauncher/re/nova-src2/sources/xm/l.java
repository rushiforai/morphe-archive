package xm;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.consent_sdk.z;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Random;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import o7.g0;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: r, reason: collision with root package name */
    public static final int[] f96144r = {2, 4, 8, 16, 32, 64, 128, 256};

    /* renamed from: s, reason: collision with root package name */
    public static final Pattern f96145s = Pattern.compile("^[^:]+:([0-9]+):(android|ios|web):([0-9a-f]+)");

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashSet f96146a;

    /* renamed from: c, reason: collision with root package name */
    public int f96148c;

    /* renamed from: f, reason: collision with root package name */
    public HttpURLConnection f96151f;

    /* renamed from: g, reason: collision with root package name */
    public final ScheduledExecutorService f96152g;

    /* renamed from: h, reason: collision with root package name */
    public final i f96153h;

    /* renamed from: i, reason: collision with root package name */
    public final ul.g f96154i;

    /* renamed from: j, reason: collision with root package name */
    public final om.e f96155j;

    /* renamed from: k, reason: collision with root package name */
    public final c f96156k;

    /* renamed from: l, reason: collision with root package name */
    public final Context f96157l;

    /* renamed from: p, reason: collision with root package name */
    public final n f96159p;

    /* renamed from: b, reason: collision with root package name */
    public boolean f96147b = false;
    public final Random n = new Random();
    public final xg.a o = xg.a.f95830a;

    /* renamed from: m, reason: collision with root package name */
    public final String f96158m = "firebase";

    /* renamed from: d, reason: collision with root package name */
    public boolean f96149d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f96150e = false;

    /* renamed from: q, reason: collision with root package name */
    public final Object f96160q = new Object();

    public l(ul.g gVar, om.e eVar, i iVar, c cVar, Context context, LinkedHashSet linkedHashSet, n nVar, ScheduledExecutorService scheduledExecutorService) {
        this.f96146a = linkedHashSet;
        this.f96152g = scheduledExecutorService;
        this.f96148c = Math.max(8 - nVar.h().c(), 1);
        this.f96154i = gVar;
        this.f96153h = iVar;
        this.f96155j = eVar;
        this.f96156k = cVar;
        this.f96157l = context;
        this.f96159p = nVar;
    }

    public static boolean d(int i5) {
        return i5 == 408 || i5 == 429 || i5 == 502 || i5 == 503 || i5 == 504;
    }

    public static String f(InputStream inputStream) throws IOException {
        StringBuilder sb2 = new StringBuilder();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            while (true) {
                String line = bufferedReader.readLine();
                if (line == null) {
                    break;
                }
                sb2.append(line);
            }
        } catch (IOException unused) {
            if (sb2.length() == 0) {
                return "Unable to connect to the server, access is forbidden. HTTP status code: 403";
            }
        }
        return sb2.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized boolean a() {
        boolean z11;
        if (this.f96146a.isEmpty() || this.f96147b || this.f96149d) {
            z11 = false;
        } else if (!this.f96150e) {
            z11 = true;
        }
        return z11;
    }

    public final void b(InputStream inputStream, InputStream inputStream2) throws IOException {
        HttpURLConnection httpURLConnection = this.f96151f;
        if (httpURLConnection != null && !this.f96150e) {
            httpURLConnection.disconnect();
        }
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException unused) {
            }
        }
        if (inputStream2 != null) {
            try {
                inputStream2.close();
            } catch (IOException unused2) {
            }
        }
    }

    public final String c(String str) {
        ul.g gVar = this.f96154i;
        gVar.a();
        Matcher matcher = f96145s.matcher(gVar.f91322c.f91336b);
        return c0.n("https://firebaseremoteconfigrealtime.googleapis.com/v1/projects/", matcher.matches() ? matcher.group(1) : null, "/namespaces/", str, ":streamFetchInvalidations");
    }

    public final synchronized void e(long j11) {
        try {
            if (a()) {
                int i5 = this.f96148c;
                if (i5 > 0) {
                    this.f96148c = i5 - 1;
                    this.f96152g.schedule(new g0(this, 27), j11, TimeUnit.MILLISECONDS);
                } else if (!this.f96150e) {
                    new FirebaseRemoteConfigClientException("Unable to connect to the server. Check your connection and try again.");
                    g();
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void g() {
        Iterator it = this.f96146a.iterator();
        while (it.hasNext()) {
            ((k) it.next()).a();
        }
    }

    public final synchronized void h() {
        this.o.getClass();
        e(Math.max(0L, this.f96159p.h().a().getTime() - new Date(System.currentTimeMillis()).getTime()));
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0097  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(HttpURLConnection httpURLConnection, String str, String str2) {
        String strB;
        byte[] bArrD;
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("X-Goog-Firebase-Installations-Auth", str2);
        ul.g gVar = this.f96154i;
        gVar.a();
        ul.i iVar = gVar.f91322c;
        httpURLConnection.setRequestProperty("X-Goog-Api-Key", iVar.f91335a);
        Context context = this.f96157l;
        httpURLConnection.setRequestProperty("X-Android-Package", context.getPackageName());
        try {
            bArrD = xg.b.d(context, context.getPackageName());
        } catch (PackageManager.NameNotFoundException unused) {
            Log.i("FirebaseRemoteConfig", "No such package: " + context.getPackageName());
        }
        if (bArrD != null) {
            strB = xg.b.b(bArrD);
            httpURLConnection.setRequestProperty("X-Android-Cert", strB);
            httpURLConnection.setRequestProperty("X-Google-GFE-Can-Retry", "yes");
            httpURLConnection.setRequestProperty("X-Accept-Response-Streaming", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setRequestProperty("Accept", "application/json");
            HashMap map = new HashMap();
            gVar.a();
            Matcher matcher = f96145s.matcher(iVar.f91336b);
            map.put("project", matcher.matches() ? matcher.group(1) : null);
            map.put("namespace", this.f96158m);
            map.put("lastKnownVersionNumber", Long.toString(this.f96153h.f96135g.f()));
            gVar.a();
            map.put("appId", iVar.f91336b);
            map.put("sdkVersion", "23.1.0");
            map.put("appInstanceId", str);
            byte[] bytes = new JSONObject(map).toString().getBytes("utf-8");
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(httpURLConnection.getOutputStream());
            bufferedOutputStream.write(bytes);
            bufferedOutputStream.flush();
            bufferedOutputStream.close();
        }
        Log.e("FirebaseRemoteConfig", "Could not get fingerprint hash for package: " + context.getPackageName());
        strB = null;
        httpURLConnection.setRequestProperty("X-Android-Cert", strB);
        httpURLConnection.setRequestProperty("X-Google-GFE-Can-Retry", "yes");
        httpURLConnection.setRequestProperty("X-Accept-Response-Streaming", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
        httpURLConnection.setRequestProperty("Content-Type", "application/json");
        httpURLConnection.setRequestProperty("Accept", "application/json");
        HashMap map2 = new HashMap();
        gVar.a();
        Matcher matcher2 = f96145s.matcher(iVar.f91336b);
        map2.put("project", matcher2.matches() ? matcher2.group(1) : null);
        map2.put("namespace", this.f96158m);
        map2.put("lastKnownVersionNumber", Long.toString(this.f96153h.f96135g.f()));
        gVar.a();
        map2.put("appId", iVar.f91336b);
        map2.put("sdkVersion", "23.1.0");
        map2.put("appInstanceId", str);
        byte[] bytes2 = new JSONObject(map2).toString().getBytes("utf-8");
        BufferedOutputStream bufferedOutputStream2 = new BufferedOutputStream(httpURLConnection.getOutputStream());
        bufferedOutputStream2.write(bytes2);
        bufferedOutputStream2.flush();
        bufferedOutputStream2.close();
    }

    public final synchronized z j(HttpURLConnection httpURLConnection) {
        return new z(httpURLConnection, this.f96153h, this.f96156k, this.f96146a, new k(this), this.f96152g, this.f96159p);
    }

    public final void k(Date date) {
        n nVar = this.f96159p;
        int iC = nVar.h().c() + 1;
        nVar.n(iC, new Date(date.getTime() + (TimeUnit.MINUTES.toMillis(f96144r[(iC < 8 ? iC : 8) - 1]) / 2) + this.n.nextInt((int) r2)));
    }
}
