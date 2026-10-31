package c10;

import a5.f0;
import ads_mobile_sdk.au;
import ai.c2;
import ai.i2;
import ai.m1;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.RemoteException;
import android.os.SystemClock;
import android.provider.Settings;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.Pair;
import android.view.WindowInsetsAnimation;
import android.webkit.WebView;
import android.widget.TextView;
import androidx.core.graphics.Insets;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;
import b.ca;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.android.volley.AuthFailureError;
import com.android.volley.ClientError;
import com.android.volley.NetworkError;
import com.android.volley.NoConnectionError;
import com.android.volley.ServerError;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.google.android.gms.internal.measurement.k7;
import com.google.android.gms.measurement.internal.AppMeasurementDynamiteService;
import com.google.android.gms.tasks.Task;
import com.google.crypto.tink.shaded.protobuf.g;
import com.google.crypto.tink.shaded.protobuf.m;
import com.stripe.android.cards.Bin;
import com.stripe.android.core.model.StripeModel;
import com.stripe.android.model.AccountRange;
import com.stripe.android.model.CardMetadata;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import com.teslacoilsw.launcher.wallpaper.ui.GLRootView;
import cw.c0;
import dr.b;
import e0.z1;
import e10.u2;
import eb0.y;
import f1.o0;
import f10.o;
import f10.v;
import fe.u1;
import fe.x;
import fi.e;
import fl.l;
import he.h;
import he.z;
import i30.r;
import i30.s;
import i30.t;
import i30.u;
import ib0.d;
import io.sentry.ILogger;
import io.sentry.b4;
import io.sentry.e3;
import io.sentry.g3;
import io.sentry.protocol.a0;
import io.sentry.t1;
import io.sentry.w3;
import j30.f;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Constructor;
import java.lang.reflect.Type;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.TimeZone;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import jb.c;
import jb.i;
import jb.n;
import jb.q;
import jf.j;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import kotlin.ranges.IntRange;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import nb0.d0;
import nb0.e0;
import nb0.p;
import o9.z0;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class a implements c2, f, eb0.f, v, b, ILogger, e, ib0.f {

    /* renamed from: d, reason: collision with root package name */
    public static boolean f19145d = false;

    /* renamed from: e, reason: collision with root package name */
    public static a f19146e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f19147a;

    /* renamed from: b, reason: collision with root package name */
    public Object f19148b;

    /* renamed from: c, reason: collision with root package name */
    public Object f19149c;

    public /* synthetic */ a(int i5, byte b11) {
        this.f19147a = i5;
    }

    public static a D(WindowInsetsAnimation.Bounds bounds) {
        return new a(bounds);
    }

    public static synchronized a o(PackageManager packageManager) {
        Pair pairS;
        try {
            if (!f19145d) {
                NovaApplication novaApplication = NovaApplication.f45637i;
                if (novaApplication == null) {
                    Intrinsics.m("instance");
                    throw null;
                }
                if (((Boolean) novaApplication.f45640b.getValue()).booleanValue() && (pairS = x7.e.s(packageManager, "com.teslacoilsw.launcher.action.PARTNER_CUSTOMIZATION")) != null) {
                    f19146e = new a(0, (String) pairS.first, (Resources) pairS.second);
                }
                f19145d = true;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f19146e;
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x01c3 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01a7 A[LOOP:0: B:3:0x0004->B:89:0x01a7, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public jb.f A(i iVar) throws Throwable {
        byte[] bArr;
        e3 e3Var;
        String str;
        int timeoutMs;
        c cVar;
        int i5;
        Map map;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            com.android.volley.toolbox.a aVar = null;
            try {
                jb.a cacheEntry = iVar.getCacheEntry();
                if (cacheEntry == null) {
                    try {
                        map = Collections.EMPTY_MAP;
                    } catch (IOException e3) {
                        e = e3;
                        e = e;
                        bArr = null;
                        if (e instanceof SocketTimeoutException) {
                        }
                        str = (String) e3Var.f67208b;
                        n retryPolicy = iVar.getRetryPolicy();
                        timeoutMs = iVar.getTimeoutMs();
                        try {
                            VolleyError volleyError = (VolleyError) e3Var.f67209c;
                            cVar = (c) retryPolicy;
                            i5 = cVar.f69385b + 1;
                            cVar.f69385b = i5;
                            int i11 = cVar.f69384a;
                            cVar.f69384a = i11 + ((int) (i11 * cVar.f69387d));
                            if (i5 > cVar.f69386c) {
                            }
                        } catch (VolleyError e11) {
                            iVar.addMarker(str + "-timeout-giveup [timeout=" + timeoutMs + "]");
                            throw e11;
                        }
                    }
                } else {
                    HashMap map2 = new HashMap();
                    String str2 = cacheEntry.f69370b;
                    if (str2 != null) {
                        map2.put("If-None-Match", str2);
                    }
                    long j11 = cacheEntry.f69372d;
                    if (j11 > 0) {
                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", Locale.US);
                        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
                        map2.put("If-Modified-Since", simpleDateFormat.format(new Date(j11)));
                    }
                    map = map2;
                }
                try {
                    com.android.volley.toolbox.a aVarT = ((br.a) this.f19148b).t(iVar, map);
                    try {
                        int i12 = aVarT.f21382a;
                        List listUnmodifiableList = Collections.unmodifiableList(aVarT.f21383b);
                        if (i12 == 304) {
                            SystemClock.elapsedRealtime();
                            return lb0.b.z(iVar, listUnmodifiableList);
                        }
                        InputStream inputStream = (InputStream) aVarT.f21385d;
                        if (inputStream == null) {
                            inputStream = null;
                        }
                        byte[] bArrE = inputStream != null ? lb0.b.E(inputStream, aVarT.f21384c, (com.android.volley.toolbox.a) this.f19149c) : new byte[0];
                        long jElapsedRealtime2 = SystemClock.elapsedRealtime() - jElapsedRealtime;
                        if (q.f69424a || jElapsedRealtime2 > 3000) {
                            q.a("HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]", iVar, Long.valueOf(jElapsedRealtime2), bArrE != null ? Integer.valueOf(bArrE.length) : AbstractJsonLexerKt.NULL, Integer.valueOf(i12), Integer.valueOf(((c) iVar.getRetryPolicy()).f69385b));
                        }
                        if (i12 < 200 || i12 > 299) {
                            throw new IOException();
                        }
                        SystemClock.elapsedRealtime();
                        return new jb.f(i12, bArrE, false, listUnmodifiableList);
                    } catch (IOException e12) {
                        e = e12;
                        bArr = null;
                        aVar = aVarT;
                        if (e instanceof SocketTimeoutException) {
                            e3Var = new e3(8, "socket", new TimeoutError());
                        } else {
                            if (e instanceof MalformedURLException) {
                                throw new RuntimeException("Bad URL " + iVar.getUrl(), e);
                            }
                            if (aVar != null) {
                                int i13 = aVar.f21382a;
                                q.b("Unexpected response code %d for %s", Integer.valueOf(i13), iVar.getUrl());
                                if (bArr != null) {
                                    List listUnmodifiableList2 = Collections.unmodifiableList(aVar.f21383b);
                                    SystemClock.elapsedRealtime();
                                    jb.f fVar = new jb.f(i13, bArr, false, listUnmodifiableList2);
                                    if (i13 == 401 || i13 == 403) {
                                        e3Var = new e3(8, "auth", new AuthFailureError(fVar));
                                    } else {
                                        if (i13 >= 400 && i13 <= 499) {
                                            throw new ClientError(fVar);
                                        }
                                        if (i13 < 500 || i13 > 599 || !iVar.shouldRetryServerErrors()) {
                                            throw new ServerError(fVar);
                                        }
                                        e3Var = new e3(8, "server", new ServerError(fVar));
                                    }
                                } else {
                                    e3Var = new e3(8, "network", new NetworkError());
                                }
                            } else {
                                if (!iVar.shouldRetryConnectionErrors()) {
                                    throw new NoConnectionError(e);
                                }
                                e3Var = new e3(8, "connection", new NoConnectionError());
                            }
                        }
                        str = (String) e3Var.f67208b;
                        n retryPolicy2 = iVar.getRetryPolicy();
                        timeoutMs = iVar.getTimeoutMs();
                        VolleyError volleyError2 = (VolleyError) e3Var.f67209c;
                        cVar = (c) retryPolicy2;
                        i5 = cVar.f69385b + 1;
                        cVar.f69385b = i5;
                        int i112 = cVar.f69384a;
                        cVar.f69384a = i112 + ((int) (i112 * cVar.f69387d));
                        if (i5 > cVar.f69386c) {
                            throw volleyError2;
                        }
                        iVar.addMarker(str + "-retry [timeout=" + timeoutMs + "]");
                    }
                } catch (IOException e13) {
                    e = e13;
                    e = e;
                    bArr = null;
                    if (e instanceof SocketTimeoutException) {
                    }
                    str = (String) e3Var.f67208b;
                    n retryPolicy22 = iVar.getRetryPolicy();
                    timeoutMs = iVar.getTimeoutMs();
                    VolleyError volleyError22 = (VolleyError) e3Var.f67209c;
                    cVar = (c) retryPolicy22;
                    i5 = cVar.f69385b + 1;
                    cVar.f69385b = i5;
                    int i1122 = cVar.f69384a;
                    cVar.f69384a = i1122 + ((int) (i1122 * cVar.f69387d));
                    if (i5 > cVar.f69386c) {
                    }
                }
            } catch (IOException e14) {
                e = e14;
            }
            iVar.addMarker(str + "-retry [timeout=" + timeoutMs + "]");
        }
    }

    public long B(BufferedInputStream bufferedInputStream) throws IOException {
        long j11 = 0;
        int i5 = 0;
        do {
            int i11 = bufferedInputStream.read();
            if (i11 == -1) {
                return -1L;
            }
            j11++;
            while (i5 >= 0 && ((byte) i11) != ((byte[]) this.f19148b)[i5]) {
                i5 = ((int[]) this.f19149c)[i5];
            }
            i5++;
        } while (i5 != ((byte[]) this.f19148b).length);
        return j11;
    }

    public WindowInsetsAnimation.Bounds C() {
        f0.o();
        return f0.i(((Insets) this.f19148b).toPlatformInsets(), ((Insets) this.f19149c).toPlatformInsets());
    }

    public void a() {
        WebView webView = (WebView) this.f19148b;
        ca caVar = (ca) this.f19149c;
        try {
            if (!WebViewFeature.a(WebViewFeature.WEB_MESSAGE_LISTENER)) {
                caVar.b();
                return;
            }
            try {
                WebViewCompat.removeWebMessageListener(webView, caVar.a());
                WebViewCompat.addWebMessageListener(webView, caVar.a(), new HashSet(Arrays.asList("*")), new au(this, 13));
            } catch (Exception e3) {
                Log.e("OMIDLIB", "Error adding WebView listener", e3);
                caVar.b();
            }
        } catch (NoClassDefFoundError unused) {
            caVar.b();
        }
    }

    @Override // f10.v
    public d b() {
        return d.b(new p(((u2) this.f19148b).b(), new o(new o0(this), 1), 2));
    }

    @Override // eb0.f
    public Type c() {
        return (Type) this.f19148b;
    }

    @Override // io.sentry.ILogger
    public void d(g3 g3Var, Throwable th2, String str, Object... objArr) {
        ILogger iLogger = (ILogger) this.f19149c;
        if (iLogger == null || !h(g3Var)) {
            return;
        }
        iLogger.d(g3Var, th2, str, objArr);
    }

    @Override // io.sentry.ILogger
    public void e(g3 g3Var, String str, Throwable th2) {
        ILogger iLogger = (ILogger) this.f19149c;
        if (iLogger == null || !h(g3Var)) {
            return;
        }
        iLogger.e(g3Var, str, th2);
    }

    @Override // f10.v
    public Object f() {
        return ((Enum) ((u2) this.f19148b).l()).name();
    }

    @Override // io.sentry.ILogger
    public void g(g3 g3Var, String str, Object... objArr) {
        ILogger iLogger = (ILogger) this.f19149c;
        if (iLogger == null || !h(g3Var)) {
            return;
        }
        iLogger.g(g3Var, str, objArr);
    }

    @Override // io.sentry.ILogger
    public boolean h(g3 g3Var) {
        w3 w3Var = (w3) this.f19148b;
        return g3Var != null && w3Var.isDebug() && g3Var.ordinal() >= w3Var.getDiagnosticLevel().ordinal();
    }

    @Override // eb0.f
    public Object i(y yVar) {
        Executor executor = (Executor) this.f19149c;
        return executor == null ? yVar : new eb0.n(executor, yVar);
    }

    @Override // ib0.f
    public void j(long j11) {
        e0 e0Var = (e0) this.f19149c;
        if (e0Var.f78114i == Thread.currentThread() || !e0Var.f78111f) {
            ((ib0.f) this.f19148b).j(j11);
        } else {
            e0Var.f78112g.c(new d0(this, j11));
        }
    }

    @Override // f10.v
    public void k(Object obj) {
        ((u2) this.f19148b).i(((c0) this.f19149c).invoke(obj));
    }

    public void l(z0 z0Var, DisplayMetrics displayMetrics) {
        String str = (String) this.f19148b;
        Resources resources = (Resources) this.f19149c;
        try {
            int identifier = resources.getIdentifier("grid_num_rows", "integer", str);
            int integer = identifier > 0 ? resources.getInteger(identifier) : -1;
            int identifier2 = resources.getIdentifier("grid_num_columns", "integer", str);
            int integer2 = identifier2 > 0 ? resources.getInteger(identifier2) : -1;
            int identifier3 = resources.getIdentifier("grid_icon_size_dp", "dimen", str);
            if (identifier3 > 0) {
                resources.getDimensionPixelSize(identifier3);
                int i5 = displayMetrics.densityDpi;
                Pattern pattern = o9.g3.f79846a;
            }
            if (integer <= 0 || integer2 <= 0) {
                return;
            }
            z0Var.f80268a = integer;
            z0Var.f80269b = integer2;
        } catch (Resources.NotFoundException e3) {
            Log.e("Launcher.Partner", "Invalid Partner grid resource!", e3);
        }
    }

    public g m() {
        ((m) this.f19148b).c0();
        return new g((byte[]) this.f19149c);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x005b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public fe.c[] n(Handler handler, x xVar, x xVar2, x xVar3, x xVar4) {
        ArrayList arrayList = new ArrayList();
        Context context = (Context) this.f19148b;
        w6.b bVar = (w6.b) this.f19149c;
        arrayList.add(new xf.f(context, bVar, handler, xVar));
        l lVar = new l(12, (byte) 0);
        he.f fVar = he.f.f59690c;
        lVar.f55376d = fVar;
        lVar.f55375c = z.f59835a;
        Intent intentC = wf.v.C(context, null, new IntentFilter("android.media.action.HDMI_AUDIO_PLUG"));
        int i5 = wf.v.f94376a;
        if (i5 >= 17) {
            String str = wf.v.f94378c;
            if (("Amazon".equals(str) || "Xiaomi".equals(str)) && Settings.Global.getInt(context.getContentResolver(), "external_surround_sound_enabled", 0) == 1) {
                fVar = he.f.f59691d;
            } else if (i5 >= 29 && (wf.v.x(context) || (i5 >= 23 && context.getPackageManager().hasSystemFeature("android.hardware.type.automotive")))) {
                fVar = new he.f(he.e.a(), 8);
            } else if (intentC != null && intentC.getIntExtra("android.media.extra.AUDIO_PLUG_STATE", 0) != 0) {
                fVar = new he.f(intentC.getIntArrayExtra("android.media.extra.ENCODINGS"), intentC.getIntExtra("android.media.extra.MAX_CHANNEL_COUNT", 8));
            }
        }
        fVar.getClass();
        lVar.f55376d = fVar;
        if (((l) lVar.f55374b) == null) {
            lVar.f55374b = new l(new h[0]);
        }
        arrayList.add(new he.c0((Context) this.f19148b, bVar, handler, xVar2, new he.y(lVar)));
        arrayList.add(new j(xVar3, handler.getLooper()));
        arrayList.add(new com.google.android.exoplayer2.metadata.a(xVar4, handler.getLooper()));
        arrayList.add(new yf.b());
        return (fe.c[]) arrayList.toArray(new fe.c[0]);
    }

    @Override // fi.e
    public void onComplete(Task task) {
        kk.m mVar = (kk.m) this.f19148b;
        fi.j jVar = (fi.j) this.f19149c;
        synchronized (mVar.f71548f) {
            mVar.f71547e.remove(jVar);
        }
    }

    public m p() {
        return (m) this.f19148b;
    }

    public ArrayList q(Map map, ArrayList arrayList, boolean z11) {
        Thread threadCurrentThread = Thread.currentThread();
        if (map.isEmpty()) {
            return null;
        }
        ArrayList arrayList2 = new ArrayList();
        if (!map.containsKey(threadCurrentThread)) {
            map.put(threadCurrentThread, threadCurrentThread.getStackTrace());
        }
        for (Map.Entry entry : map.entrySet()) {
            Thread thread = (Thread) entry.getKey();
            boolean z12 = (thread == threadCurrentThread && !z11) || (arrayList != null && arrayList.contains(Long.valueOf(thread.getId())));
            StackTraceElement[] stackTraceElementArr = (StackTraceElement[]) entry.getValue();
            Thread thread2 = (Thread) entry.getKey();
            a0 a0Var = new a0();
            a0Var.f67459c = thread2.getName();
            a0Var.f67458b = Integer.valueOf(thread2.getPriority());
            a0Var.f67457a = Long.valueOf(thread2.getId());
            a0Var.f67463g = Boolean.valueOf(thread2.isDaemon());
            a0Var.f67460d = thread2.getState().name();
            a0Var.f67461e = Boolean.valueOf(z12);
            ArrayList arrayListA = ((b4) this.f19148b).a(stackTraceElementArr, false);
            if (((w3) this.f19149c).isAttachStacktrace() && arrayListA != null && !arrayListA.isEmpty()) {
                io.sentry.protocol.z zVar = new io.sentry.protocol.z(arrayListA);
                zVar.f67660c = Boolean.TRUE;
                a0Var.f67465i = zVar;
            }
            arrayList2.add(a0Var);
        }
        return arrayList2;
    }

    public ke.j r(Object... objArr) {
        Constructor constructorE;
        synchronized (((AtomicBoolean) this.f19149c)) {
            if (!((AtomicBoolean) this.f19149c).get()) {
                try {
                    constructorE = ((ge.d) this.f19148b).e();
                } catch (ClassNotFoundException unused) {
                    ((AtomicBoolean) this.f19149c).set(true);
                } catch (Exception e3) {
                    throw new RuntimeException("Error instantiating extension", e3);
                }
            }
            constructorE = null;
        }
        if (constructorE == null) {
            return null;
        }
        try {
            return (ke.j) constructorE.newInstance(objArr);
        } catch (Exception e11) {
            throw new IllegalStateException("Unexpected error creating extractor", e11);
        }
    }

    @Override // dr.b
    public StripeModel s(JSONObject jSONObject) throws JSONException {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("data");
        if (jSONArrayOptJSONArray == null) {
            jSONArrayOptJSONArray = new JSONArray();
        }
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, jSONArrayOptJSONArray.length());
        ArrayList arrayList = new ArrayList();
        IntProgressionIterator it = intRangeM0.iterator();
        while (it.f71911c) {
            int iNextInt = it.nextInt();
            gt.e eVar = (gt.e) this.f19149c;
            JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(iNextInt);
            Intrinsics.f(jSONObject2, "getJSONObject(...)");
            AccountRange accountRangeA = eVar.a(jSONObject2);
            if (accountRangeA != null) {
                arrayList.add(accountRangeA);
            }
        }
        return new CardMetadata((Bin) this.f19148b, arrayList);
    }

    public Insets t() {
        return (Insets) this.f19148b;
    }

    public String toString() {
        switch (this.f19147a) {
            case 1:
                return "Bounds{lower=" + ((Insets) this.f19148b) + " upper=" + ((Insets) this.f19149c) + "}";
            case 11:
                return "TransformPrefHolder(" + ((u2) this.f19148b) + ")";
            default:
                return super.toString();
        }
    }

    public String u() {
        return (String) this.f19148b;
    }

    public Resources v() {
        return (Resources) this.f19149c;
    }

    public Insets w() {
        return (Insets) this.f19149c;
    }

    public boolean x() {
        return ((Resources) this.f19149c).getIdentifier("partner_default_layout", "xml", (String) this.f19148b) != 0;
    }

    public void y(String str, String str2, Bundle bundle, long j11) {
        try {
            ((k7) this.f19148b).b(str, str2, bundle, j11);
        } catch (RemoteException e3) {
            m1 m1Var = ((AppMeasurementDynamiteService) this.f19149c).f33752a;
            if (m1Var != null) {
                ai.o0 o0Var = m1Var.f13138f;
                m1.l(o0Var);
                o0Var.f13193i.b(e3, "Event interceptor threw exception");
            }
        }
    }

    public Properties z() throws IOException {
        String str = (String) this.f19148b;
        try {
            File file = new File(str);
            if (!file.isFile() || !file.canRead()) {
                return null;
            }
            BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            try {
                Properties properties = new Properties();
                properties.load(bufferedInputStream);
                bufferedInputStream.close();
                return properties;
            } finally {
            }
        } catch (IOException e3) {
            ((t1) this.f19149c).d(g3.ERROR, e3, "Failed to load Sentry configuration from file: %s", str);
            return null;
        }
    }

    public /* synthetic */ a(int i5, Object obj, Object obj2) {
        this.f19147a = i5;
        this.f19148b = obj;
        this.f19149c = obj2;
    }

    public a(Bin bin) {
        this.f19147a = 15;
        Intrinsics.g(bin, "bin");
        this.f19148b = bin;
        this.f19149c = new gt.e(5);
    }

    public /* synthetic */ a(Object obj, Object obj2, boolean z11, int i5) {
        this.f19147a = i5;
        this.f19148b = obj2;
        this.f19149c = obj;
    }

    public a(u2 u2Var, z1 z1Var, c0 c0Var) {
        this.f19147a = 11;
        this.f19148b = u2Var;
        this.f19149c = c0Var;
    }

    public a(byte[] bArr) {
        this.f19147a = 6;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
        this.f19148b = bArrCopyOf;
        int[] iArr = new int[bArrCopyOf.length + 1];
        this.f19149c = iArr;
        int i5 = 0;
        int i11 = -1;
        iArr[0] = -1;
        while (i5 < ((byte[]) this.f19148b).length) {
            while (i11 >= 0) {
                byte[] bArr2 = (byte[]) this.f19148b;
                i11 = bArr2[i5] != bArr2[i11] ? ((int[]) this.f19149c)[i11] : i11;
            }
            i5++;
            i11++;
            ((int[]) this.f19149c)[i5] = i11;
        }
    }

    public static a a(String str, String str2) {
        if (!TextUtils.isEmpty(str)) {
            if (!TextUtils.isEmpty(str2)) {
                return new a(2, str, str2);
            }
            throw new IllegalArgumentException("Version is null or empty");
        }
        throw new IllegalArgumentException("Name is null or empty");
    }

    /* JADX WARN: Removed duplicated region for block: B:210:0x00d1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:214:0x0012 A[SYNTHETIC] */
    @Override // j30.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object a(j30.g gVar) throws IOException {
        Bitmap bitmapZ;
        FileOutputStream fileOutputStream;
        Bitmap.CompressFormat compressFormat;
        boolean z11;
        boolean zM0;
        Bitmap.CompressFormat compressFormat2;
        r rVar;
        boolean z12;
        u uVar;
        boolean z13 = false;
        File file = null;
        switch (this.f19147a) {
            case 9:
                RectF rectF = (RectF) this.f19148b;
                CropImage cropImage = (CropImage) this.f19149c;
                Bundle extras = cropImage.getIntent().getExtras();
                Rect rect = new Rect(Math.round(rectF.left), Math.round(rectF.top), Math.round(rectF.right), Math.round(rectF.bottom));
                Intent intent = new Intent();
                intent.putExtra("cropped-rect", rect);
                if (extras != null) {
                    Uri uri = (Uri) extras.getParcelable("output");
                    if (uri == null) {
                        z11 = false;
                        bitmapZ = null;
                    } else {
                        if (gVar.f68890e) {
                            return null;
                        }
                        bitmapZ = CropImage.Z(cropImage, rect);
                        try {
                            if (cropImage.c0().equals("png")) {
                                compressFormat2 = Bitmap.CompressFormat.PNG;
                            } else {
                                compressFormat2 = Bitmap.CompressFormat.JPEG;
                            }
                            zM0 = CropImage.m0(gVar, bitmapZ, compressFormat2, cropImage.getContentResolver().openOutputStream(uri));
                        } catch (FileNotFoundException e3) {
                            mc0.d.f76206a.p(e3, "cannot write output", new Object[0]);
                            zM0 = true;
                        }
                        if (!zM0) {
                            return null;
                        }
                        z11 = true;
                    }
                    if (extras.getBoolean("return-data", false)) {
                        if (gVar.f68890e) {
                            return null;
                        }
                        if (bitmapZ == null) {
                            bitmapZ = CropImage.Z(cropImage, rect);
                        }
                        intent.putExtra("icon", bitmapZ);
                        z11 = true;
                    }
                    if (!extras.getBoolean("set-as-wallpaper", true)) {
                        z13 = z11;
                    } else {
                        if (gVar.f68890e) {
                            return null;
                        }
                        if (bitmapZ == null) {
                            bitmapZ = CropImage.Z(cropImage, rect);
                        }
                        int i5 = CropImage.Q;
                        try {
                            WallpaperManager.getInstance(cropImage).setBitmap(bitmapZ);
                            try {
                                WallpaperManager.getInstance(cropImage).suggestDesiredDimensions(bitmapZ.getWidth(), bitmapZ.getHeight());
                                WallpaperManager.getInstance(cropImage).setWallpaperOffsets(cropImage.getWindow().getDecorView().getWindowToken(), 0.5f, 0.5f);
                            } catch (Throwable th2) {
                                th2.printStackTrace();
                            }
                        } catch (IOException e11) {
                            mc0.d.f76206a.p(e11, "fail to set wall paper", new Object[0]);
                        }
                        z13 = true;
                    }
                } else {
                    bitmapZ = null;
                }
                if (!z13) {
                    if (gVar.f68890e) {
                        return null;
                    }
                    if (bitmapZ == null) {
                        bitmapZ = CropImage.Z(cropImage, rect);
                    }
                    File cacheDir = cropImage.getCacheDir();
                    int i11 = CropImage.Q;
                    String strC0 = cropImage.c0();
                    File file2 = null;
                    for (int i12 = 1; i12 < 1000; i12++) {
                        file2 = new File(cacheDir, a80.m.f(i12, "_cropImageTemp-", ".", strC0));
                        try {
                        } catch (IOException e12) {
                            mc0.d.f76206a.p(e12, "fail to create new file: %s", file2.getAbsolutePath());
                        }
                        if (file2.createNewFile()) {
                            if (!file2.exists() && file2.isFile()) {
                                try {
                                    fileOutputStream = new FileOutputStream(file2);
                                } catch (IOException e13) {
                                    mc0.d.f76206a.p(e13, "fail to save image: %s", file2.getAbsolutePath());
                                    file2.delete();
                                }
                                try {
                                    if (strC0.equals("png")) {
                                        compressFormat = Bitmap.CompressFormat.PNG;
                                    } else {
                                        compressFormat = Bitmap.CompressFormat.JPEG;
                                    }
                                    CropImage.m0(gVar, bitmapZ, compressFormat, fileOutputStream);
                                    if (gVar.f68890e) {
                                        file2.delete();
                                    } else {
                                        file = file2;
                                    }
                                    if (file != null) {
                                        intent.setData(Uri.fromFile(file));
                                    }
                                } finally {
                                    fileOutputStream.close();
                                }
                            } else {
                                throw new RuntimeException("cannot create file: _cropImageTemp");
                            }
                        }
                    }
                    if (!file2.exists()) {
                    }
                    throw new RuntimeException("cannot create file: _cropImageTemp");
                }
                intent.putExtra("outputX", cropImage.K);
                intent.putExtra("outputY", cropImage.L);
                return intent;
            default:
                gVar.d(0);
                gVar.c((s) this.f19148b);
                while (!gVar.f68890e) {
                    synchronized (((u) this.f19149c)) {
                        try {
                            s sVar = ((u) this.f19149c).f61351t;
                            rVar = (r) sVar.f61337a;
                            if (rVar != null) {
                                sVar.f61337a = rVar.f61333t;
                            }
                            if (rVar == null && !gVar.f68890e) {
                                uVar = (u) this.f19149c;
                                long[] jArr = f30.f.f54304a;
                                uVar.wait();
                            }
                        } catch (InterruptedException unused) {
                            mc0.b bVar = mc0.d.f76206a;
                            bVar.r("Utils");
                            bVar.n("unexpected interrupt: %s", uVar);
                        } finally {
                        }
                    }
                    if (rVar != null) {
                        u uVar2 = (u) this.f19149c;
                        synchronized (uVar2) {
                            try {
                                if (rVar.f61335v == 2) {
                                    rVar.f61335v = 4;
                                    try {
                                        Bitmap bitmapB = rVar.f61336w.f61340g.b(rVar.f61332s, rVar.f61330q, rVar.f61331r, u.H);
                                        if (bitmapB != null && bitmapB.getConfig() == null) {
                                            Bitmap bitmapCopy = bitmapB.copy(Bitmap.Config.ARGB_8888, false);
                                            bitmapB.recycle();
                                            bitmapB = bitmapCopy;
                                        }
                                        rVar.f61334u = bitmapB;
                                    } catch (Throwable th3) {
                                        mc0.d.f76206a.p(th3, "fail to decode tile", new Object[0]);
                                    }
                                    z12 = rVar.f61334u != null;
                                    synchronized (uVar2) {
                                        try {
                                            if (rVar.f61335v == 32) {
                                                rVar.f61335v = 64;
                                                Bitmap bitmap = rVar.f61334u;
                                                if (bitmap != null) {
                                                    u.H.b(bitmap);
                                                    rVar.f61334u = null;
                                                }
                                                s sVar2 = uVar2.f61349r;
                                                rVar.f61333t = (r) sVar2.f61337a;
                                                sVar2.f61337a = rVar;
                                            } else {
                                                rVar.f61335v = z12 ? 8 : 16;
                                            }
                                        } finally {
                                        }
                                    }
                                    if (z12) {
                                        continue;
                                    } else {
                                        u uVar3 = (u) this.f19149c;
                                        synchronized (uVar3) {
                                            s sVar3 = uVar3.f61350s;
                                            rVar.f61333t = (r) sVar3.f61337a;
                                            sVar3.f61337a = rVar;
                                        }
                                        if (uVar3.C.f61338a.compareAndSet(false, true)) {
                                            i30.l lVar = uVar3.f61320b;
                                            t tVar = uVar3.C;
                                            GLRootView gLRootView = (GLRootView) lVar;
                                            synchronized (gLRootView.f46392g) {
                                                gLRootView.f46392g.addLast(tVar);
                                                i2 i2Var = gLRootView.f46393h;
                                                if (!i2Var.f13012b) {
                                                    i2Var.f13012b = true;
                                                    ((GLRootView) i2Var.f13013c).queueEvent(i2Var);
                                                }
                                            }
                                        } else {
                                            continue;
                                        }
                                    }
                                }
                            } finally {
                            }
                        }
                        z12 = false;
                        if (z12) {
                        }
                    }
                }
                return null;
        }
    }

    public a(TextView textView) {
        this.f19147a = 26;
        this.f19149c = textView;
        this.f19148b = new ai.h(this, 22);
    }

    public a(ex.a aVar, cm.f fVar, f60.b bVar) {
        this.f19147a = 14;
        tm.o oVar = new tm.o(fVar, bVar, new e3(14, (byte) 0));
        this.f19148b = aVar;
        this.f19149c = oVar;
    }

    public a(WebView webView, ca caVar) {
        this.f19147a = 3;
        if (webView != null) {
            this.f19148b = webView;
            this.f19149c = caVar;
            return;
        }
        throw new IllegalArgumentException("WebView is null");
    }

    public a(br.a aVar) {
        this.f19147a = 7;
        com.android.volley.toolbox.a aVar2 = new com.android.volley.toolbox.a();
        this.f19148b = aVar;
        this.f19149c = aVar2;
    }

    public a(Context context) {
        this.f19147a = 12;
        this.f19148b = context;
        this.f19149c = new w6.b();
    }

    public a(WindowInsetsAnimation.Bounds bounds) {
        this.f19147a = 1;
        this.f19148b = Insets.toCompatInsets(bounds.getLowerBound());
        this.f19149c = Insets.toCompatInsets(bounds.getUpperBound());
    }

    public a() {
        this.f19147a = 13;
        this.f19148b = new u1(0);
        this.f19149c = new u1(0);
    }

    public a(ge.d dVar) {
        this.f19147a = 23;
        this.f19148b = dVar;
        this.f19149c = new AtomicBoolean(false);
    }

    public a(LauncherWallpaperPickerActivity launcherWallpaperPickerActivity) {
        this.f19147a = 29;
        this.f19149c = launcherWallpaperPickerActivity;
    }

    public a(u uVar) {
        this.f19147a = 16;
        this.f19149c = uVar;
        s sVar = new s();
        sVar.f61337a = this;
        this.f19148b = sVar;
    }

    public a(int i5) {
        this.f19147a = 8;
        byte[] bArr = new byte[i5];
        this.f19149c = bArr;
        Logger logger = m.f34630k;
        this.f19148b = new m(bArr, i5);
    }
}
