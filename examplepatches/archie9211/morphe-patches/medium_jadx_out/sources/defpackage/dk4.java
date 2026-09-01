package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import android.util.JsonReader;
import android.util.Log;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.firebase.installations.FirebaseInstallationsException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.concurrent.ExecutionException;
import java.util.regex.Pattern;
import java.util.zip.GZIPOutputStream;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dk4 {
    public static final Pattern d = Pattern.compile("[0-9]+s");
    public static final Charset e = Charset.forName("UTF-8");
    public final Context a;
    public final h8a b;
    public final zbb c;

    public dk4(Context context, h8a h8aVar) {
        this.a = context;
        this.b = h8aVar;
        zbb zbbVar = new zbb();
        fa4 fa4Var = fa4.t;
        if (fa4Var == null) {
            Pattern pattern = jpe.a;
            fa4Var = new fa4(24);
            fa4.t = fa4Var;
        }
        if (jpe.b == null) {
            jpe.b = new jpe(fa4Var);
        }
        this.c = zbbVar;
    }

    public static URL a(String str) {
        try {
            return new URL("https://firebaseinstallations.googleapis.com/v1/".concat(str));
        } catch (MalformedURLException e2) {
            throw new FirebaseInstallationsException(e2.getMessage());
        }
    }

    public static void b(HttpURLConnection httpURLConnection, String str, String str2, String str3) {
        StringBuilder sb;
        InputStream errorStream = httpURLConnection.getErrorStream();
        String str4 = null;
        if (errorStream != null) {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(errorStream, e));
            try {
                sb = new StringBuilder();
            } catch (IOException unused) {
            } catch (Throwable th) {
                try {
                    bufferedReader.close();
                } catch (IOException unused2) {
                }
                throw th;
            }
            try {
                while (true) {
                    String line = bufferedReader.readLine();
                    if (line == null) {
                        break;
                    }
                    sb.append(line);
                    sb.append('\n');
                    bufferedReader.close();
                }
                bufferedReader.close();
            } catch (IOException unused3) {
            }
            str4 = String.format("Error when communicating with the Firebase Installations server API. HTTP response: [%d %s: %s]", Integer.valueOf(httpURLConnection.getResponseCode()), httpURLConnection.getResponseMessage(), sb);
        }
        if (TextUtils.isEmpty(str4)) {
            return;
        }
        Log.w("Firebase-Installations", str4);
        Log.w("Firebase-Installations", ev6.y("Firebase options used while communicating with Firebase server APIs: ", str2, ", ", str3, TextUtils.isEmpty(str) ? "" : ka1.r(", ", str)));
    }

    public static pj0 e(HttpURLConnection httpURLConnection) throws IOException {
        InputStream inputStream = httpURLConnection.getInputStream();
        JsonReader jsonReader = new JsonReader(new InputStreamReader(inputStream, e));
        byte b = (byte) (0 | 1);
        jsonReader.beginObject();
        long jD = 0;
        String strNextString = null;
        String strNextString2 = null;
        String strNextString3 = null;
        String strNextString4 = null;
        jk0 jk0Var = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            if (strNextName.equals("name")) {
                strNextString2 = jsonReader.nextString();
            } else if (strNextName.equals("fid")) {
                strNextString3 = jsonReader.nextString();
            } else if (strNextName.equals("refreshToken")) {
                strNextString4 = jsonReader.nextString();
            } else if (strNextName.equals("authToken")) {
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    String strNextName2 = jsonReader.nextName();
                    if (strNextName2.equals("token")) {
                        strNextString = jsonReader.nextString();
                    } else if (strNextName2.equals("expiresIn")) {
                        jD = d(jsonReader.nextString());
                        b = (byte) (b | 1);
                    } else {
                        jsonReader.skipValue();
                    }
                }
                if (b != 1) {
                    ygf.f("Missing required properties: tokenExpirationTimestamp");
                    return null;
                }
                jk0Var = new jk0(strNextString, jD, null);
                jsonReader.endObject();
            } else {
                jsonReader.skipValue();
            }
        }
        jsonReader.endObject();
        jsonReader.close();
        inputStream.close();
        return new pj0(strNextString2, strNextString3, strNextString4, jk0Var, t36.OK);
    }

    public static jk0 f(HttpURLConnection httpURLConnection) throws IOException {
        InputStream inputStream = httpURLConnection.getInputStream();
        JsonReader jsonReader = new JsonReader(new InputStreamReader(inputStream, e));
        byte b = (byte) (0 | 1);
        jsonReader.beginObject();
        long jD = 0;
        String strNextString = null;
        while (jsonReader.hasNext()) {
            String strNextName = jsonReader.nextName();
            if (strNextName.equals("token")) {
                strNextString = jsonReader.nextString();
            } else if (strNextName.equals("expiresIn")) {
                jD = d(jsonReader.nextString());
                b = (byte) (b | 1);
            } else {
                jsonReader.skipValue();
            }
        }
        jsonReader.endObject();
        jsonReader.close();
        inputStream.close();
        rnd rndVar = rnd.OK;
        if (b == 1) {
            return new jk0(strNextString, jD, rndVar);
        }
        ygf.f("Missing required properties: tokenExpirationTimestamp");
        return null;
    }

    public static void g(HttpURLConnection httpURLConnection, String str, String str2) throws IOException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("fid", str);
            jSONObject.put("appId", str2);
            jSONObject.put("authVersion", "FIS_v2");
            jSONObject.put("sdkVersion", "a:19.1.0");
            i(httpURLConnection, jSONObject.toString().getBytes("UTF-8"));
        } catch (JSONException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static void h(HttpURLConnection httpURLConnection) throws IOException {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("sdkVersion", "a:19.1.0");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("installation", jSONObject);
            i(httpURLConnection, jSONObject2.toString().getBytes("UTF-8"));
        } catch (JSONException e2) {
            throw new IllegalStateException(e2);
        }
    }

    public static void i(HttpURLConnection httpURLConnection, byte[] bArr) throws IOException {
        OutputStream outputStream = httpURLConnection.getOutputStream();
        if (outputStream == null) {
            ik4.g("Cannot send request to FIS servers. No OutputStream available.");
            return;
        }
        GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(outputStream);
        try {
            gZIPOutputStream.write(bArr);
        } finally {
            try {
                gZIPOutputStream.close();
                outputStream.close();
            } catch (IOException unused) {
            }
        }
    }

    public final HttpURLConnection c(URL url, String str) {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
            httpURLConnection.setConnectTimeout(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setReadTimeout(PhotoshopDirectory.TAG_PRINT_FLAGS_INFO);
            httpURLConnection.addRequestProperty("Content-Type", "application/json");
            httpURLConnection.addRequestProperty("Accept", "application/json");
            httpURLConnection.addRequestProperty("Content-Encoding", "gzip");
            httpURLConnection.addRequestProperty("Cache-Control", "no-cache");
            Context context = this.a;
            httpURLConnection.addRequestProperty("X-Android-Package", context.getPackageName());
            aj5 aj5Var = (aj5) this.b.get();
            if (aj5Var != null) {
                try {
                    fz2 fz2Var = (fz2) aj5Var;
                    httpURLConnection.addRequestProperty("x-firebase-client", (String) vp7.h(!hk7.A(fz2Var.b) ? vp7.x("") : vp7.j(fz2Var.e, new ez2(fz2Var, 0))));
                } catch (InterruptedException e2) {
                    Thread.currentThread().interrupt();
                    Log.w("ContentValues", "Failed to get heartbeats header", e2);
                } catch (ExecutionException e3) {
                    Log.w("ContentValues", "Failed to get heartbeats header", e3);
                }
            }
            String strZ = null;
            try {
                byte[] bArrQ0 = ht2.q0(context, context.getPackageName());
                if (bArrQ0 == null) {
                    Log.e("ContentValues", "Could not get fingerprint hash for package: " + context.getPackageName());
                } else {
                    strZ = f76.z(bArrQ0);
                }
            } catch (PackageManager.NameNotFoundException e4) {
                Log.e("ContentValues", "No such package: " + context.getPackageName(), e4);
            }
            httpURLConnection.addRequestProperty("X-Android-Cert", strZ);
            httpURLConnection.addRequestProperty("x-goog-api-key", str);
            return httpURLConnection;
        } catch (IOException unused) {
            throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
        }
    }

    public static long d(String str) {
        vp7.k(ZVsviyDAr.NIqxyxsqnEzwFH, d.matcher(str).matches());
        if (str == null || str.length() == 0) {
            return 0L;
        }
        return Long.parseLong(str.substring(0, str.length() - 1));
    }
}
