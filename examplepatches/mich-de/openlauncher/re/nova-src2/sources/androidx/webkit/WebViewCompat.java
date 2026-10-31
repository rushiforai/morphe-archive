package androidx.webkit;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.Handler;
import android.os.Looper;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.webkit.WebViewRenderProcess;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import m7.c;
import m7.e;
import m7.g;
import m7.j;
import m7.k;
import m7.p;
import m7.q;
import m7.s;
import m7.t;
import m7.u;
import n7.a0;
import n7.d;
import n7.d0;
import n7.i;
import n7.l;
import n7.o;
import n7.r;
import n7.w;
import n7.y;
import n7.z;
import org.chromium.support_lib_boundary.ProfileBoundaryInterface;
import u90.a;

/* loaded from: classes.dex */
public class WebViewCompat {

    /* renamed from: a, reason: collision with root package name */
    public static final Uri f15309a = Uri.parse("*");

    /* renamed from: b, reason: collision with root package name */
    public static final Uri f15310b = Uri.parse(b.f42142b);

    /* renamed from: c, reason: collision with root package name */
    public static final WeakHashMap f15311c = new WeakHashMap();

    /* loaded from: classes2.dex */
    public interface WebViewStartUpCallback {
        void onSuccess(WebViewStartUpResult webViewStartUpResult);
    }

    public static void a(WebView webView) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (Build.VERSION.SDK_INT < 28) {
            try {
                Method declaredMethod = WebView.class.getDeclaredMethod("checkThread", null);
                declaredMethod.setAccessible(true);
                declaredMethod.invoke(webView, null);
                return;
            } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException e3) {
                throw new RuntimeException(e3);
            }
        }
        Looper webViewLooper = webView.getWebViewLooper();
        if (webViewLooper == Looper.myLooper()) {
            return;
        }
        throw new RuntimeException("A WebView method was called on thread '" + Thread.currentThread().getName() + "'. All WebView methods must be called on the same thread. (Expected Looper " + webViewLooper + " called on " + Looper.myLooper() + ", FYI main Looper is " + Looper.getMainLooper() + ")");
    }

    public static g addDocumentStartJavaScript(WebView webView, String str, Set<String> set) {
        if (!w.o.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        return d.d(a0VarB.f77906a.addDocumentStartJavaScript(str, (String[]) set.toArray(new String[0])));
    }

    public static void addNavigationListener(WebView webView, Executor executor, c cVar) {
        if (!w.A.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        a0VarB.f77906a.addWebViewNavigationListener(executor, new a(new i()));
    }

    public static void addWebMessageListener(WebView webView, String str, Set<String> set, s sVar) {
        if (!w.n.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        a0VarB.f77906a.addWebMessageListener(str, (String[]) set.toArray(new String[0]), new a(new d(sVar, 4)));
    }

    public static a0 b(WebView webView) {
        if (!w.B.b()) {
            return new a0(y.f77965a.createWebView(webView));
        }
        WeakHashMap weakHashMap = f15311c;
        a0 a0Var = (a0) weakHashMap.get(webView);
        if (a0Var != null) {
            return a0Var;
        }
        a0 a0Var2 = new a0(y.f77965a.createWebView(webView));
        weakHashMap.put(webView, a0Var2);
        return a0Var2;
    }

    public static k[] createWebMessageChannel(WebView webView) {
        return r.c(webView.createWebMessageChannel());
    }

    public static PackageInfo getCurrentLoadedWebViewPackage() {
        return ex.i.y();
    }

    public static PackageInfo getCurrentWebViewPackage(Context context) {
        PackageInfo currentLoadedWebViewPackage = getCurrentLoadedWebViewPackage();
        if (currentLoadedWebViewPackage != null) {
            return currentLoadedWebViewPackage;
        }
        try {
            String str = (String) Class.forName("android.webkit.WebViewUpdateService").getMethod("getCurrentWebViewPackageName", null).invoke(null, null);
            if (str != null) {
                return context.getPackageManager().getPackageInfo(str, 0);
            }
        } catch (PackageManager.NameNotFoundException | ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
        }
        return null;
    }

    public static Profile getProfile(WebView webView) {
        if (w.f77954q.b()) {
            return new l((ProfileBoundaryInterface) u90.b.i(ProfileBoundaryInterface.class, b(webView).f77906a.getProfile()));
        }
        throw w.a();
    }

    public static Uri getSafeBrowsingPrivacyPolicyUrl() {
        n7.b bVar = w.f77943d;
        if (bVar.a()) {
            return lb0.b.B();
        }
        if (bVar.b()) {
            return y.f77965a.getStatics().getSafeBrowsingPrivacyPolicyUrl();
        }
        throw w.a();
    }

    public static String getVariationsHeader() {
        if (w.f77953p.b()) {
            return y.f77965a.getStatics().getVariationsHeader();
        }
        throw w.a();
    }

    public static WebChromeClient getWebChromeClient(WebView webView) {
        w.f77949j.getClass();
        return ex.i.E(webView);
    }

    @Deprecated
    public static m7.l getWebNavigationClient(WebView webView) {
        if (!w.f77963z.b()) {
            throw w.a();
        }
        InvocationHandler webViewNavigationClient = b(webView).f77906a.getWebViewNavigationClient();
        if (webViewNavigationClient == null) {
            return null;
        }
        ((n7.s) ((a) webViewNavigationClient).a()).getClass();
        return null;
    }

    public static WebViewClient getWebViewClient(WebView webView) {
        w.f77948i.getClass();
        return ex.i.F(webView);
    }

    public static t getWebViewRenderProcess(WebView webView) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        n7.b bVar = w.f77950k;
        if (bVar.a()) {
            WebViewRenderProcess webViewRenderProcessR = g90.k.R(webView);
            if (webViewRenderProcessR != null) {
                return d0.a(webViewRenderProcessR);
            }
            return null;
        }
        if (!bVar.b()) {
            throw w.a();
        }
        a(webView);
        return d0.b(b(webView).f77906a.getWebViewRenderer());
    }

    public static u getWebViewRenderProcessClient(WebView webView) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        n7.b bVar = w.f77951l;
        if (bVar.a()) {
            g90.k.S(webView);
            return null;
        }
        if (!bVar.b()) {
            throw w.a();
        }
        a(webView);
        InvocationHandler webViewRendererClient = b(webView).f77906a.getWebViewRendererClient();
        if (webViewRendererClient == null) {
            return null;
        }
        c0.y(((a) webViewRendererClient).a());
        throw null;
    }

    public static boolean isAudioMuted(WebView webView) {
        if (w.f77955r.b()) {
            return b(webView).f77906a.isAudioMuted();
        }
        throw w.a();
    }

    public static boolean isMultiProcessEnabled() {
        if (w.f77952m.b()) {
            return y.f77965a.getStatics().isMultiProcessEnabled();
        }
        throw w.a();
    }

    public static void postVisualStateCallback(WebView webView, long j11, m7.r rVar) {
        webView.postVisualStateCallback(j11, new q());
    }

    public static void postWebMessage(WebView webView, j jVar, Uri uri) {
        if (f15309a.equals(uri)) {
            uri = f15310b;
        }
        n7.b bVar = w.f77947h;
        if (jVar.c() == 0) {
            webView.postWebMessage(r.a(jVar), uri);
        } else {
            if (!bVar.b() || !o.a(jVar.c())) {
                throw w.a();
            }
            a(webView);
            b(webView).f77906a.postMessageToMainFrame(new a(new o(jVar)), uri);
        }
    }

    public static void prerenderUrlAsync(WebView webView, String str, CancellationSignal cancellationSignal, Executor executor, e eVar) {
        if (!w.f77960w.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        a0VarB.f77906a.prerenderUrl(str, cancellationSignal, executor, new z(eVar, 2), new z(eVar, 3));
    }

    public static void removeNavigationListener(WebView webView, c cVar) {
        if (!w.A.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        a0VarB.f77906a.removeWebViewNavigationListener(new a(new i()));
    }

    public static void removeWebMessageListener(WebView webView, String str) {
        if (!w.n.b()) {
            throw w.a();
        }
        b(webView).f77906a.removeWebMessageListener(str);
    }

    public static void saveState(WebView webView, Bundle bundle, int i5, boolean z11) {
        if (!w.f77962y.b()) {
            throw w.a();
        }
        b(webView).f77906a.saveState(bundle, i5, z11);
    }

    public static void setAudioMuted(WebView webView, boolean z11) {
        if (!w.f77955r.b()) {
            throw w.a();
        }
        b(webView).f77906a.setAudioMuted(z11);
    }

    public static void setDefaultTrafficStatsTag(int i5) {
        if (!w.f77959v.b()) {
            throw w.a();
        }
        y.f77965a.getStatics().setDefaultTrafficStatsTag(i5);
    }

    public static void setProfile(WebView webView, String str) {
        if (!w.f77954q.b()) {
            throw w.a();
        }
        b(webView).f77906a.setProfile(str);
    }

    public static void setSafeBrowsingAllowlist(Set<String> set, ValueCallback<Boolean> valueCallback) {
        n7.b bVar = w.f77942c;
        n7.b bVar2 = w.f77941b;
        if (bVar.b()) {
            y.f77965a.getStatics().setSafeBrowsingAllowlist(set, valueCallback);
            return;
        }
        ArrayList arrayList = new ArrayList(set);
        if (bVar2.a()) {
            lb0.b.S(arrayList, valueCallback);
        } else {
            if (!bVar2.b()) {
                throw w.a();
            }
            y.f77965a.getStatics().setSafeBrowsingWhitelist(arrayList, valueCallback);
        }
    }

    @Deprecated
    public static void setSafeBrowsingWhitelist(List<String> list, ValueCallback<Boolean> valueCallback) {
        setSafeBrowsingAllowlist(new HashSet(list), valueCallback);
    }

    @Deprecated
    public static void setWebNavigationClient(WebView webView, m7.l lVar) {
        if (!w.f77963z.b()) {
            throw w.a();
        }
        a0 a0VarB = b(webView);
        a0VarB.f77906a.setWebViewNavigationClient(new a(new n7.s()));
    }

    @SuppressLint({"LambdaLast"})
    public static void setWebViewRenderProcessClient(WebView webView, Executor executor, u uVar) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        n7.b bVar = w.f77951l;
        if (bVar.a()) {
            g90.k.e0(webView, executor);
        } else {
            if (!bVar.b()) {
                throw w.a();
            }
            a(webView);
            b(webView).f77906a.setWebViewRendererClient(null);
        }
    }

    @Deprecated
    public static void startSafeBrowsing(Context context, ValueCallback<Boolean> valueCallback) {
        n7.b bVar = w.f77940a;
        if (bVar.a()) {
            lb0.b.T(context, valueCallback);
        } else {
            if (!bVar.b()) {
                throw w.a();
            }
            y.f77965a.getStatics().initSafeBrowsing(context, valueCallback);
        }
    }

    public static void startUpWebView(Context context, WebViewStartUpConfig webViewStartUpConfig, WebViewStartUpCallback webViewStartUpCallback) {
        webViewStartUpConfig.getBackgroundExecutor().execute(new androidx.fragment.app.d(22, webViewStartUpConfig, webViewStartUpCallback, context));
    }

    public static void addNavigationListener(WebView webView, c cVar) {
        addNavigationListener(webView, new p(new Handler(Looper.getMainLooper())), cVar);
    }

    public static void prerenderUrlAsync(WebView webView, String str, CancellationSignal cancellationSignal, Executor executor, m7.i iVar, e eVar) {
        if (w.f77960w.b()) {
            a0 a0VarB = b(webView);
            a0VarB.f77906a.prerenderUrl(str, cancellationSignal, executor, new a(new b6.b()), new z(eVar, 0), new z(eVar, 1));
            return;
        }
        throw w.a();
    }

    public static void setWebViewRenderProcessClient(WebView webView, u uVar) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        n7.b bVar = w.f77951l;
        if (bVar.a()) {
            g90.k.d0(webView);
        } else {
            if (bVar.b()) {
                a(webView);
                b(webView).f77906a.setWebViewRendererClient(null);
                return;
            }
            throw w.a();
        }
    }
}
