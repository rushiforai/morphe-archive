package tv;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Build;
import b70.g;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.stripe3ds2.observability.Stripe3ds2ErrorReporterConfig;
import com.tiktok.util.TTConst;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.HttpsURLConnection;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import ps.f0;
import q6.l;
import s10.i;
import t70.k0;
import t70.m0;
import t70.y0;
import wv.k;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final Context f89601a;

    /* renamed from: b, reason: collision with root package name */
    public final a f89602b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f89603c;

    /* renamed from: d, reason: collision with root package name */
    public final f0 f89604d;

    /* renamed from: e, reason: collision with root package name */
    public final b f89605e;

    /* renamed from: f, reason: collision with root package name */
    public final String f89606f;

    /* renamed from: g, reason: collision with root package name */
    public final String f89607g;

    /* renamed from: h, reason: collision with root package name */
    public final int f89608h;

    static {
        StandardCharsets.UTF_8.name();
    }

    public c(Context context, Stripe3ds2ErrorReporterConfig stripe3ds2ErrorReporterConfig, CoroutineContext workContext, f0 f0Var, int i5) {
        a aVar = (i5 & 2) != 0 ? b.f89599a : stripe3ds2ErrorReporterConfig;
        if ((i5 & 4) != 0) {
            a80.e eVar = y0.f88884a;
            workContext = a80.d.f488c;
        }
        f0Var = (i5 & 8) != 0 ? k.f94731b : f0Var;
        b bVar = b.f89600b;
        String localeCountry = Locale.getDefault().getCountry();
        int i11 = Build.VERSION.SDK_INT;
        Intrinsics.g(workContext, "workContext");
        Intrinsics.g(localeCountry, "localeCountry");
        this.f89601a = context;
        this.f89602b = aVar;
        this.f89603c = workContext;
        this.f89604d = f0Var;
        this.f89605e = bVar;
        this.f89606f = "release";
        this.f89607g = localeCountry;
        this.f89608h = i11;
    }

    public static final void a(c cVar, JSONObject jSONObject) throws IOException {
        cVar.f89605e.getClass();
        URLConnection uRLConnectionOpenConnection = new URL("https://errors.stripe.com/api/426/store/").openConnection();
        Intrinsics.e(uRLConnectionOpenConnection, "null cannot be cast to non-null type javax.net.ssl.HttpsURLConnection");
        HttpsURLConnection httpsURLConnection = (HttpsURLConnection) uRLConnectionOpenConnection;
        httpsURLConnection.setRequestMethod("POST");
        httpsURLConnection.setDoOutput(true);
        Pair pair = new Pair("Content-Type", "application/json; charset=utf-8");
        Pair pair2 = new Pair("User-Agent", "Android3ds2Sdk 22.7.0");
        Pair pair3 = new Pair("sentry_key", "dcb428fea25c40e7b99f81ae5981ee6a");
        Pair pair4 = new Pair("sentry_version", "7");
        long jCurrentTimeMillis = System.currentTimeMillis();
        long seconds = TimeUnit.MILLISECONDS.toSeconds(jCurrentTimeMillis);
        for (Map.Entry entry : MapsKt.j0(pair, pair2, new Pair("X-Sentry-Auth", g.f1(ul.b.Q("Sentry", g.f1(ul.b.Q(pair3, pair4, new Pair("sentry_timestamp", seconds + "." + (jCurrentTimeMillis - TimeUnit.SECONDS.toMillis(seconds))), new Pair("sentry_client", "Android3ds2Sdk 22.7.0")), ", ", null, null, 0, new i(18), 30)), " ", null, null, 0, null, 62))).entrySet()) {
            httpsURLConnection.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
        }
        OutputStream outputStream = httpsURLConnection.getOutputStream();
        try {
            Intrinsics.d(outputStream);
            Charset UTF_8 = StandardCharsets.UTF_8;
            Intrinsics.f(UTF_8, "UTF_8");
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(outputStream, UTF_8);
            try {
                outputStreamWriter.write(jSONObject.toString());
                outputStreamWriter.flush();
                Unit unit = Unit.f71706a;
                outputStreamWriter.close();
                outputStream.close();
                httpsURLConnection.connect();
                httpsURLConnection.getResponseCode();
                httpsURLConnection.disconnect();
            } finally {
            }
        } finally {
        }
    }

    public final JSONObject b(Throwable th2) throws JSONException {
        List<StackTraceElement> listD1;
        Object objA;
        ApplicationInfo applicationInfo;
        JSONObject jSONObjectPut = new JSONObject().put("release", "com.stripe.android.stripe3ds2@22.7.0");
        JSONObject jSONObject = new JSONObject();
        JSONArray jSONArray = new JSONArray();
        JSONObject jSONObjectPut2 = new JSONObject().put(TTConst.TRACK_TYPE, th2.getClass().getCanonicalName());
        String message = th2.getMessage();
        String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (message == null) {
            message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        JSONObject jSONObjectPut3 = jSONObjectPut2.put("value", message);
        JSONObject jSONObject2 = new JSONObject();
        JSONArray jSONArray2 = new JSONArray();
        StackTraceElement[] stackTrace = th2.getStackTrace();
        Intrinsics.f(stackTrace, "getStackTrace(...)");
        if (stackTrace.length == 0) {
            listD1 = EmptyList.f71733a;
        } else {
            listD1 = kotlin.collections.c.d1(stackTrace);
            Collections.reverse(listD1);
        }
        for (StackTraceElement stackTraceElement : listD1) {
            jSONArray2.put(new JSONObject().put("lineno", stackTraceElement.getLineNumber()).put("filename", stackTraceElement.getClassName()).put("function", stackTraceElement.getMethodName()));
        }
        Unit unit = Unit.f71706a;
        JSONObject jSONObjectPut4 = jSONObject2.put("frames", jSONArray2);
        Intrinsics.f(jSONObjectPut4, "put(...)");
        JSONObject jSONObjectPut5 = jSONObjectPut.put("exception", jSONObject.put("values", jSONArray.put(jSONObjectPut3.put("stacktrace", jSONObjectPut4))));
        JSONObject jSONObjectPut6 = new JSONObject().put("locale", this.f89607g).put("environment", this.f89606f).put("android_os_version", this.f89608h);
        for (Map.Entry entry : this.f89602b.b().entrySet()) {
            jSONObjectPut6.put((String) entry.getKey(), (String) entry.getValue());
        }
        Unit unit2 = Unit.f71706a;
        JSONObject jSONObjectPut7 = jSONObjectPut5.put("tags", jSONObjectPut6);
        Context context = this.f89601a;
        try {
            int i5 = Result.f71687b;
            objA = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (Throwable th3) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th3);
        }
        if (objA instanceof Result.Failure) {
            objA = null;
        }
        PackageInfo packageInfo = (PackageInfo) objA;
        CharSequence charSequenceLoadLabel = (packageInfo == null || (applicationInfo = packageInfo.applicationInfo) == null) ? null : applicationInfo.loadLabel(context.getPackageManager());
        JSONObject jSONObject3 = new JSONObject();
        JSONObject jSONObjectPut8 = new JSONObject().put("app_identifier", context.getPackageName()).put("app_name", charSequenceLoadLabel);
        String str2 = packageInfo != null ? packageInfo.versionName : null;
        if (str2 != null) {
            str = str2;
        }
        JSONObject jSONObjectPut9 = jSONObject3.put("app", jSONObjectPut8.put("app_version", str));
        JSONObject jSONObjectPut10 = new JSONObject().put(PendingUpgradeStore.KEY_NAME, AndroidContextPlugin.PLATFORM).put("version", Build.VERSION.RELEASE);
        String str3 = Build.TYPE;
        JSONObject jSONObjectPut11 = jSONObjectPut9.put("os", jSONObjectPut10.put(TTConst.TRACK_TYPE, str3).put("build", Build.DISPLAY));
        JSONObject jSONObjectPut12 = new JSONObject().put("model_id", Build.ID).put("model", Build.MODEL).put("manufacturer", Build.MANUFACTURER).put(TTConst.TRACK_TYPE, str3);
        JSONArray jSONArray3 = new JSONArray();
        String[] SUPPORTED_ABIS = Build.SUPPORTED_ABIS;
        Intrinsics.f(SUPPORTED_ABIS, "SUPPORTED_ABIS");
        for (String str4 : SUPPORTED_ABIS) {
            jSONArray3.put(str4);
        }
        Unit unit3 = Unit.f71706a;
        JSONObject jSONObjectPut13 = jSONObjectPut11.put("device", jSONObjectPut12.put("archs", jSONArray3));
        Intrinsics.f(jSONObjectPut13, "put(...)");
        JSONObject jSONObjectPut14 = jSONObjectPut7.put("contexts", jSONObjectPut13);
        Intrinsics.f(jSONObjectPut14, "put(...)");
        return jSONObjectPut14;
    }

    public final void c(Throwable th2) {
        m0.t(k0.a(this.f89603c), null, null, new l(this, th2, null, 5), 3);
    }
}
