package com.google.firebase.remoteconfig.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import androidx.annotation.Keep;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigClientException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigException;
import com.google.firebase.remoteconfig.FirebaseRemoteConfigServerException;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import p4.a;
import xg.b;
import xm.d;
import xm.e;
import xm.h;

/* loaded from: classes.dex */
public class ConfigFetchHttpClient {

    /* renamed from: h, reason: collision with root package name */
    public static final Pattern f34769h = Pattern.compile("^[^:]+:([0-9]+):(android|ios|web):([0-9a-f]+)");

    /* renamed from: a, reason: collision with root package name */
    public final Context f34770a;

    /* renamed from: b, reason: collision with root package name */
    public final String f34771b;

    /* renamed from: c, reason: collision with root package name */
    public final String f34772c;

    /* renamed from: d, reason: collision with root package name */
    public final String f34773d;

    /* renamed from: e, reason: collision with root package name */
    public final String f34774e;

    /* renamed from: f, reason: collision with root package name */
    public final long f34775f;

    /* renamed from: g, reason: collision with root package name */
    public final long f34776g;

    public ConfigFetchHttpClient(Context context, String str, String str2, long j11, long j12) {
        this.f34770a = context;
        this.f34771b = str;
        this.f34772c = str2;
        Matcher matcher = f34769h.matcher(str);
        this.f34773d = matcher.matches() ? matcher.group(1) : null;
        this.f34774e = "firebase";
        this.f34775f = j11;
        this.f34776g = j12;
    }

    public static JSONObject c(HttpURLConnection httpURLConnection) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream(), "utf-8"));
        StringBuilder sb2 = new StringBuilder();
        while (true) {
            int i5 = bufferedReader.read();
            if (i5 == -1) {
                return new JSONObject(sb2.toString());
            }
            sb2.append((char) i5);
        }
    }

    public static void d(HttpURLConnection httpURLConnection, byte[] bArr) throws IOException {
        httpURLConnection.setFixedLengthStreamingMode(bArr.length);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(httpURLConnection.getOutputStream());
        bufferedOutputStream.write(bArr);
        bufferedOutputStream.flush();
        bufferedOutputStream.close();
    }

    public final JSONObject a(String str, String str2, Map map, Long l9, Map map2) throws PackageManager.NameNotFoundException, FirebaseRemoteConfigClientException {
        HashMap map3 = new HashMap();
        if (str == null) {
            throw new FirebaseRemoteConfigClientException("Fetch failed: Firebase installation id is null.");
        }
        map3.put("appInstanceId", str);
        map3.put("appInstanceIdToken", str2);
        map3.put("appId", this.f34771b);
        Context context = this.f34770a;
        Locale locale = context.getResources().getConfiguration().locale;
        map3.put("countryCode", locale.getCountry());
        int i5 = Build.VERSION.SDK_INT;
        map3.put("languageCode", locale.toLanguageTag());
        map3.put("platformVersion", Integer.toString(i5));
        map3.put("timeZone", TimeZone.getDefault().getID());
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (packageInfo != null) {
                map3.put("appVersion", packageInfo.versionName);
                map3.put("appBuild", Long.toString(i5 >= 28 ? a.c(packageInfo) : packageInfo.versionCode));
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
        map3.put("packageName", context.getPackageName());
        map3.put("sdkVersion", "23.1.0");
        map3.put("analyticsUserProperties", new JSONObject(map));
        if (!map2.isEmpty()) {
            map3.put("customSignals", new JSONObject(map2));
            Objects.toString(map2.keySet());
        }
        if (l9 != null) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US);
            simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
            map3.put("firstOpenTime", simpleDateFormat.format(l9));
        }
        return new JSONObject(map3);
    }

    public final HttpURLConnection b() {
        try {
            return (HttpURLConnection) new URL("https://firebaseremoteconfig.googleapis.com/v1/projects/" + this.f34773d + "/namespaces/" + this.f34774e + ":fetch").openConnection();
        } catch (IOException e3) {
            throw new FirebaseRemoteConfigException(e3.getMessage());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x009d A[LOOP:0: B:13:0x0097->B:15:0x009d, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00d7 A[Catch: all -> 0x0182, IOException | JSONException -> 0x0184, IOException -> 0x0186, TRY_LEAVE, TryCatch #0 {all -> 0x0182, blocks: (B:17:0x00bb, B:19:0x00d7, B:66:0x0188, B:67:0x0191, B:68:0x0192, B:69:0x0199), top: B:81:0x00bb }] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0188 A[Catch: all -> 0x0182, IOException | JSONException -> 0x0184, IOException -> 0x0186, TRY_ENTER, TryCatch #0 {all -> 0x0182, blocks: (B:17:0x00bb, B:19:0x00d7, B:66:0x0188, B:67:0x0191, B:68:0x0192, B:69:0x0199), top: B:81:0x00bb }] */
    @Keep
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public h fetch(HttpURLConnection httpURLConnection, String str, String str2, Map<String, String> map, String str3, Map<String, String> map2, Long l9, Date date, Map<String, String> map3) throws FirebaseRemoteConfigException {
        String strB;
        int responseCode;
        JSONObject jSONObject;
        JSONArray jSONArray;
        JSONObject jSONObject2;
        byte[] bArrD;
        boolean zEquals = true;
        httpURLConnection.setDoOutput(true);
        TimeUnit timeUnit = TimeUnit.SECONDS;
        httpURLConnection.setConnectTimeout((int) timeUnit.toMillis(this.f34775f));
        httpURLConnection.setReadTimeout((int) timeUnit.toMillis(this.f34776g));
        httpURLConnection.setRequestProperty("If-None-Match", str3);
        httpURLConnection.setRequestProperty("X-Goog-Api-Key", this.f34772c);
        Context context = this.f34770a;
        httpURLConnection.setRequestProperty("X-Android-Package", context.getPackageName());
        JSONArray jSONArray2 = null;
        try {
            bArrD = b.d(context, context.getPackageName());
        } catch (PackageManager.NameNotFoundException e3) {
            Log.e("FirebaseRemoteConfig", "No such package: " + context.getPackageName(), e3);
        }
        if (bArrD == null) {
            Log.e("FirebaseRemoteConfig", "Could not get fingerprint hash for package: " + context.getPackageName());
            strB = null;
            httpURLConnection.setRequestProperty("X-Android-Cert", strB);
            httpURLConnection.setRequestProperty("X-Google-GFE-Can-Retry", "yes");
            httpURLConnection.setRequestProperty("X-Goog-Firebase-Installations-Auth", str2);
            httpURLConnection.setRequestProperty("Content-Type", "application/json");
            httpURLConnection.setRequestProperty("Accept", "application/json");
            for (Map.Entry<String, String> entry : map2.entrySet()) {
                httpURLConnection.setRequestProperty(entry.getKey(), entry.getValue());
            }
            try {
                try {
                    d(httpURLConnection, a(str, str2, map, l9, map3).toString().getBytes("utf-8"));
                    httpURLConnection.connect();
                    responseCode = httpURLConnection.getResponseCode();
                    if (responseCode == 200) {
                        throw new FirebaseRemoteConfigServerException(responseCode, httpURLConnection.getResponseMessage());
                    }
                    String headerField = httpURLConnection.getHeaderField("ETag");
                    JSONObject jSONObjectC = c(httpURLConnection);
                    try {
                        httpURLConnection.getInputStream().close();
                    } catch (IOException unused) {
                    }
                    try {
                        d dVarD = e.d();
                        dVarD.f96103b = date;
                        try {
                            jSONObject = jSONObjectC.getJSONObject("entries");
                        } catch (JSONException unused2) {
                            jSONObject = null;
                        }
                        if (jSONObject != null) {
                            try {
                                dVarD.f96102a = new JSONObject(jSONObject.toString());
                            } catch (JSONException unused3) {
                            }
                        }
                        try {
                            jSONArray = jSONObjectC.getJSONArray("experimentDescriptions");
                        } catch (JSONException unused4) {
                            jSONArray = null;
                        }
                        if (jSONArray != null) {
                            try {
                                dVarD.f96104c = new JSONArray(jSONArray.toString());
                            } catch (JSONException unused5) {
                            }
                        }
                        try {
                            jSONObject2 = jSONObjectC.getJSONObject("personalizationMetadata");
                        } catch (JSONException unused6) {
                            jSONObject2 = null;
                        }
                        if (jSONObject2 != null) {
                            try {
                                dVarD.f96105d = new JSONObject(jSONObject2.toString());
                            } catch (JSONException unused7) {
                            }
                        }
                        String string = jSONObjectC.has("templateVersion") ? jSONObjectC.getString("templateVersion") : null;
                        if (string != null) {
                            dVarD.f96106e = Long.parseLong(string);
                        }
                        try {
                            jSONArray2 = jSONObjectC.getJSONArray("rolloutMetadata");
                        } catch (JSONException unused8) {
                        }
                        if (jSONArray2 != null) {
                            try {
                                dVarD.f96107f = new JSONArray(jSONArray2.toString());
                            } catch (JSONException unused9) {
                            }
                        }
                        e eVarA = dVarD.a();
                        try {
                            zEquals = true ^ jSONObjectC.get("state").equals("NO_CHANGE");
                        } catch (JSONException unused10) {
                        }
                        return !zEquals ? h.a(eVarA) : h.b(headerField, eVarA);
                    } catch (JSONException e11) {
                        throw new FirebaseRemoteConfigClientException("Fetch failed: fetch response could not be parsed.", e11);
                    }
                } finally {
                    httpURLConnection.disconnect();
                    try {
                        httpURLConnection.getInputStream().close();
                    } catch (IOException unused11) {
                    }
                }
            } catch (IOException | JSONException e12) {
                throw new FirebaseRemoteConfigClientException("The client had an error while calling the backend!", e12);
            }
        }
        strB = b.b(bArrD);
        httpURLConnection.setRequestProperty("X-Android-Cert", strB);
        httpURLConnection.setRequestProperty("X-Google-GFE-Can-Retry", "yes");
        httpURLConnection.setRequestProperty("X-Goog-Firebase-Installations-Auth", str2);
        httpURLConnection.setRequestProperty("Content-Type", "application/json");
        httpURLConnection.setRequestProperty("Accept", "application/json");
        while (r0.hasNext()) {
        }
        d(httpURLConnection, a(str, str2, map, l9, map3).toString().getBytes("utf-8"));
        httpURLConnection.connect();
        responseCode = httpURLConnection.getResponseCode();
        if (responseCode == 200) {
        }
    }
}
