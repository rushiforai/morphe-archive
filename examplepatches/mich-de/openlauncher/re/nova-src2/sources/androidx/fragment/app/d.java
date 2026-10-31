package androidx.fragment.app;

import ads_mobile_sdk.a63;
import ads_mobile_sdk.qm1;
import ads_mobile_sdk.ub3;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.w53;
import ads_mobile_sdk.wo3;
import ads_mobile_sdk.yk0;
import android.animation.TimeInterpolator;
import android.content.ContentResolver;
import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.os.Trace;
import android.transition.ChangeBounds;
import android.transition.Fade;
import android.transition.TransitionManager;
import android.transition.TransitionSet;
import android.util.Pair;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewStartUpConfig;
import com.android.launcher3.CellLayout;
import com.android.launcher3.DeleteDropTarget;
import com.android.launcher3.Workspace;
import com.android.launcher3.dragndrop.DragLayer;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.android.gms.internal.measurement.ag;
import com.google.firebase.crashlytics.internal.common.CrashlyticsCore;
import com.instabridge.ai.auth.AiAuthManager;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.internal.unity_bridge.MolocoUnityLoadCallback;
import com.moloco.sdk.internal.unity_bridge.internal.a;
import com.moloco.sdk.publisher.MolocoAdError;
import com.stripe.hcaptcha.HCaptchaException;
import com.stripe.hcaptcha.webview.HCaptchaWebView;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.drawer.AppPageStandard;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.tiktok.appevents.TTAppEventLogger;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.protos.Sdk;
import io.sentry.e3;
import io.sentry.i2;
import io.sentry.j4;
import io.sentry.l4;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.stream.Collectors;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.chromium.net.impl.CallbackExceptionImpl;
import org.json.JSONObject;
import xk.r2;

/* loaded from: classes2.dex */
public final /* synthetic */ class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14507a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14508b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f14509c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f14510d;

    public /* synthetic */ d(int i5, Object obj, Object obj2, Object obj3) {
        this.f14507a = i5;
        this.f14508b = obj;
        this.f14509c = obj2;
        this.f14510d = obj3;
    }

    @Override // java.lang.Runnable
    public final void run() throws IllegalStateException, NoSuchMethodException, SecurityException, IOException, IllegalArgumentException {
        int i5 = 8;
        Continuation continuation = null;
        int i11 = 0;
        switch (this.f14507a) {
            case 0:
                ViewGroup container = (ViewGroup) this.f14508b;
                View view = (View) this.f14509c;
                f this$0 = (f) this.f14510d;
                Intrinsics.g(container, "$container");
                Intrinsics.g(this$0, "this$0");
                container.endViewTransition(view);
                this$0.f14550c.f14609a.c(this$0);
                return;
            case 1:
                d2 d2Var = (d2) this.f14508b;
                d2 d2Var2 = (d2) this.f14509c;
                n nVar = (n) this.f14510d;
                h0 inFragment = d2Var.f14518c;
                h0 outFragment = d2Var2.f14518c;
                boolean z11 = nVar.o;
                w1 w1Var = r1.f14678a;
                Intrinsics.g(inFragment, "inFragment");
                Intrinsics.g(outFragment, "outFragment");
                if (z11) {
                    outFragment.getEnterTransitionCallback();
                    return;
                } else {
                    inFragment.getEnterTransitionCallback();
                    return;
                }
            case 2:
                a63 a63Var = (a63) this.f14508b;
                HashMap map = (HashMap) this.f14509c;
                Context context = (Context) this.f14510d;
                ub3 ub3Var = a63Var.f869g;
                ub3Var.getClass();
                HashMap map2 = new HashMap();
                Iterator it = ub3Var.f10287a.iterator();
                while (it.hasNext()) {
                    ((b.j1) it.next()).a(map2);
                }
                map.putAll(map2);
                a63Var.m0a(map);
                map.put(InneractiveMediationDefs.GENDER_FEMALE, "q");
                map.put("ctx", context);
                return;
            case 3:
                w53 w53Var = (w53) this.f14508b;
                ai.y0 y0Var = (ai.y0) this.f14509c;
                MotionEvent motionEvent = (MotionEvent) this.f14510d;
                w53Var.getClass();
                try {
                    try {
                        y0Var.a(motionEvent);
                    } catch (wo3 e3) {
                        vi3 vi3Var = w53Var.f11051d;
                        yk0 yk0Var = yk0.EVENT_ID_UNSPECIFIED;
                        ((qm1) vi3Var.f10792a).a(15004, -1L, null, e3);
                    }
                    return;
                } finally {
                    motionEvent.recycle();
                }
            case 4:
                AnalyticsClient.b((Sdk.SDKError.Reason) this.f14508b, (String) this.f14509c, (com.vungle.ads.internal.util.s) this.f14510d);
                return;
            case 5:
                ((CrashlyticsCore) this.f14508b).lambda$logException$1((Throwable) this.f14509c, (Map) this.f14510d);
                return;
            case 6:
                AiAuthManager.endLoginAndRequestSignIn$lambda$14((Function2) this.f14508b, (Context) this.f14509c, (AiAuthManager) this.f14510d);
                return;
            case 7:
                com.moloco.sdk.internal.unity_bridge.internal.a.a((MolocoUnityLoadCallback) this.f14508b, (String) this.f14509c, (MolocoAdError.AdCreateError) this.f14510d);
                return;
            case 8:
                a.C0178a.a((MolocoUnityLoadCallback) this.f14508b, (String) this.f14509c, (MolocoAdError) this.f14510d);
                return;
            case 9:
                TTAppEventLogger.lambda$monitorMetric$8((String) this.f14508b, (JSONObject) this.f14509c, (JSONObject) this.f14510d);
                return;
            case 10:
                mg.l lVar = (mg.l) this.f14508b;
                cx.f fVar = (cx.f) this.f14509c;
                Uri uri = (Uri) this.f14510d;
                HCaptchaWebView hCaptchaWebView = (HCaptchaWebView) lVar.f76311d;
                hCaptchaWebView.removeJavascriptInterface("JSInterface");
                hCaptchaWebView.removeJavascriptInterface("JSDI");
                fVar.f48414b.f45527c.invoke(new HCaptchaException(yw.c.f97666g, "Insecure resource " + uri + " requested"));
                return;
            case 11:
                com.vungle.ads.internal.downloader.i.a((com.vungle.ads.internal.downloader.i) this.f14508b, (com.vungle.ads.internal.downloader.l) this.f14509c, (com.vungle.ads.internal.downloader.e) this.f14510d);
                return;
            case 12:
                CopyOnWriteArrayList copyOnWriteArrayList = (CopyOnWriteArrayList) this.f14508b;
                CountDownLatch countDownLatch = (CountDownLatch) this.f14509c;
                copyOnWriteArrayList.add((sx.j) t70.m0.u(EmptyCoroutineContext.f71803a, new cv.y((sx.i) this.f14510d, continuation, i5)));
                countDownLatch.countDown();
                return;
            case 13:
                e3 e3Var = (e3) this.f14508b;
                eb0.g gVar = (eb0.g) this.f14509c;
                eb0.p0 p0Var = (eb0.p0) this.f14510d;
                eb0.n nVar2 = (eb0.n) e3Var.f67209c;
                if (nVar2.f52591b.p()) {
                    gVar.e(nVar2, new IOException("Canceled"));
                    return;
                } else {
                    gVar.a(nVar2, p0Var);
                    return;
                }
            case 14:
                ((eb0.g) this.f14509c).e((eb0.n) ((e3) this.f14508b).f67209c, (Throwable) this.f14510d);
                return;
            case 15:
                com.vungle.ads.internal.load.k.a((com.vungle.ads.internal.load.l) this.f14508b, (j3) this.f14509c, (com.vungle.ads.internal.network.o) this.f14510d);
                return;
            case 16:
                fa.x xVar = (fa.x) this.f14508b;
                fa.w wVar = (fa.w) this.f14509c;
                Exception exc = (Exception) this.f14510d;
                Context context2 = xVar.f54525b;
                Pair pairF0 = wVar.f0(context2);
                if (pairF0 == null) {
                    ea.b.h("ItemInstallQueue", "Adding PendingInstallShortcutInfo with no attached info to queue.", exc);
                } else {
                    ea.b.h("ItemInstallQueue", "Adding PendingInstallShortcutInfo to queue. Attached info: " + pairF0.first, exc);
                }
                xVar.a();
                if (xVar.f54527d.contains(wVar)) {
                    return;
                }
                xVar.f54527d.add(wVar);
                xVar.f54524a.E(context2, xVar.f54527d);
                return;
            case 17:
                fa.p0 p0Var2 = (fa.p0) this.f14508b;
                Collection<ga.e> collection = (Collection) this.f14509c;
                ag agVar = (ag) this.f14510d;
                Context context3 = p0Var2.f54455a;
                for (ga.e eVar : collection) {
                    context3.getContentResolver().delete(o9.g2.c(eVar.f57289a), null, null);
                    fa.q qVar = p0Var2.f54457c;
                    ga.e[] eVarArr = {eVar};
                    synchronized (qVar) {
                        qVar.f(context3, Arrays.asList(eVarArr));
                    }
                    agVar.v();
                }
                return;
            case 18:
                fa.p0 p0Var3 = (fa.p0) this.f14508b;
                ga.c cVar = (ga.c) this.f14509c;
                ag agVar2 = (ag) this.f14510d;
                fa.q qVar2 = p0Var3.f54457c;
                Context context4 = p0Var3.f54455a;
                ContentResolver contentResolver = context4.getContentResolver();
                if (!(cVar instanceof iz.a)) {
                    contentResolver.delete(o9.g2.f79844a, "container=" + cVar.f57289a, null);
                    qVar2.f(context4, cVar.H);
                    cVar.H.clear();
                }
                contentResolver.delete(o9.g2.c(cVar.f57289a), null, null);
                ga.e[] eVarArr2 = {cVar};
                synchronized (qVar2) {
                    qVar2.f(context4, Arrays.asList(eVarArr2));
                }
                agVar2.v();
                return;
            case 19:
                fe.z0 z0Var = (fe.z0) this.f14508b;
                xk.s0 s0Var = (xk.s0) this.f14509c;
                gf.w wVar2 = (gf.w) this.f14510d;
                ge.f fVar2 = z0Var.f55116c;
                r2 r2VarF = s0Var.f();
                bn.i iVar = fVar2.f57396d;
                fe.l1 l1Var = fVar2.f57399g;
                l1Var.getClass();
                iVar.getClass();
                iVar.f18210b = xk.v0.o(r2VarF);
                if (!r2VarF.isEmpty()) {
                    iVar.f18213e = (gf.w) r2VarF.get(0);
                    wVar2.getClass();
                    iVar.f18214f = wVar2;
                }
                if (((gf.w) iVar.f18212d) == null) {
                    iVar.f18212d = bn.i.p(l1Var, (xk.v0) iVar.f18210b, (gf.w) iVar.f18213e, (fe.x1) iVar.f18209a);
                }
                iVar.E(((fe.a0) l1Var).O());
                return;
            case 20:
                gf.a0 a0Var = (gf.a0) this.f14508b;
                ((gf.b0) this.f14509c).i(a0Var.f57451a, a0Var.f57452b, (gf.r) this.f14510d);
                return;
            case 21:
                io.sentry.cache.f fVar3 = (io.sentry.cache.f) this.f14508b;
                j4 j4Var = (j4) this.f14509c;
                io.sentry.m0 m0Var = (io.sentry.m0) this.f14510d;
                if (j4Var != null) {
                    fVar3.c(j4Var, "trace.json");
                    return;
                }
                fl.l lVar2 = ((i2) m0Var).f67311p;
                j4 j4Var2 = new j4((io.sentry.protocol.u) lVar2.f55376d, (l4) lVar2.f55374b, CarrierConfigurator.APN_TYPE, null, null);
                j4Var2.f67360i = TTConst.TRACK_TYPE_AUTO;
                fVar3.c(j4Var2, "trace.json");
                return;
            case 22:
                WebViewStartUpConfig webViewStartUpConfig = (WebViewStartUpConfig) this.f14508b;
                WebViewCompat.WebViewStartUpCallback webViewStartUpCallback = (WebViewCompat.WebViewStartUpCallback) this.f14509c;
                Context context5 = (Context) this.f14510d;
                Uri uri2 = WebViewCompat.f15309a;
                u90.b.N();
                if (n7.w.f77957t.b()) {
                    n7.y.f77965a.a(webViewStartUpConfig, new k30.e(webViewStartUpCallback, 4));
                    return;
                }
                if (webViewStartUpConfig.shouldRunUiThreadStartUpTasks()) {
                    WebSettings.getDefaultUserAgent(context5.getApplicationContext());
                }
                new Handler(Looper.getMainLooper()).post(new g.p(webViewStartUpCallback, 16));
                return;
            case 23:
                o30.h hVar = (o30.h) this.f14508b;
                HashMap map3 = (HashMap) this.f14509c;
                o30.e eVar2 = (o30.e) this.f14510d;
                try {
                    String strB = o30.h.b(map3);
                    if (hVar.f79504d) {
                        return;
                    }
                    String[] strArrSplit = strB.split("\\{\\}", 2);
                    if (strArrSplit.length == 2) {
                        String str = strArrSplit[0];
                        try {
                            eVar2.p(Integer.parseInt(str.split("\\|", 2)[0]), str, strArrSplit[1]);
                            return;
                        } catch (RemoteException e11) {
                            e11.printStackTrace();
                            return;
                        }
                    }
                    return;
                } catch (IOException e12) {
                    e12.printStackTrace();
                    return;
                }
            case 24:
                DeleteDropTarget deleteDropTarget = (DeleteDropTarget) this.f14508b;
                ya.r rVar = (ya.r) this.f14509c;
                fa.p0 p0Var4 = (fa.p0) this.f14510d;
                int i12 = DeleteDropTarget.f20948p;
                NovaLauncher novaLauncher = deleteDropTarget.f80045a;
                novaLauncher.f80007h0 = rVar;
                p0Var4.f54463i = false;
                p0Var4.f54462h.clear();
                p0Var4.f54456b.d();
                novaLauncher.O().a().b(ea.d.LAUNCHER_UNDO);
                return;
            case 25:
                Workspace workspace = (Workspace) this.f14508b;
                ab.o oVar = (ab.o) this.f14509c;
                CellLayout cellLayout = (CellLayout) this.f14510d;
                int i13 = Workspace.f20990m1;
                if (workspace.B || o9.a.P(workspace.f21013s0, 2) != null) {
                    return;
                }
                oVar.post(new kz.c(17, oVar, cellLayout));
                return;
            case 26:
                pa.e eVar3 = (pa.e) this.f14508b;
                ya.j.f97147b.submit(new kz.c(21, eVar3, (Set) ((SharedPreferences) this.f14509c).getStringSet((String) this.f14510d, Collections.EMPTY_SET).stream().map(new pa.b(eVar3, i11)).filter(new aa.z(i5)).collect(Collectors.toSet())));
                return;
            case 27:
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f14508b;
                AppPageStandard appPageStandard = (AppPageStandard) this.f14509c;
                ArrayList arrayList = (ArrayList) this.f14510d;
                b3.h0 h0Var = AppSearchResultsView.f46177o0;
                TransitionSet transitionSet = new TransitionSet();
                transitionSet.setOrdering(0);
                transitionSet.setInterpolator((TimeInterpolator) new f6.a(1));
                transitionSet.addTransition(new ChangeBounds());
                transitionSet.addTransition(new Fade(1));
                transitionSet.setDuration(200L);
                TransitionManager.beginDelayedTransition(appSearchResultsView.m().f92319c, transitionSet);
                AppSearchResultsView.w(appSearchResultsView, appPageStandard, arrayList, 24);
                return;
            case 28:
                ra.h hVar2 = (ra.h) this.f14508b;
                ra.a aVar = (ra.a) this.f14509c;
                za.j jVar = (za.j) this.f14510d;
                ra.f fVar4 = ((o9.n1) hVar2).M;
                if (((ra.a) fVar4.f85765g) == aVar && ((ra.a) fVar4.f85767i) == aVar) {
                    ra.a aVar2 = ((ra.c) fVar4.f85760b).f85757f;
                    if ((aVar2 == null || aVar2 == aVar) && jVar.getAlpha() >= 1.0f) {
                        jVar.getChildCount();
                        return;
                    }
                    return;
                }
                return;
            default:
                s90.n0 n0Var = (s90.n0) this.f14508b;
                String str2 = (String) this.f14509c;
                s90.b1 b1Var = (s90.b1) this.f14510d;
                p90.a.a("Cronet JavaUploadDataSinkBase#executeOnUploadExecutor " + str2 + " running callback");
                try {
                    s90.a1 a1Var = ((s90.y0) n0Var).f87071m;
                    try {
                        b1Var.mo109run();
                    } catch (Throwable th2) {
                        a1Var.c(new CallbackExceptionImpl("Exception received from UploadDataProvider", th2));
                    }
                    Trace.endSection();
                    return;
                } finally {
                }
        }
    }

    public /* synthetic */ d(ra.h hVar, ra.a aVar, DragLayer dragLayer, int i5) {
        this.f14507a = 28;
        this.f14508b = hVar;
        this.f14509c = aVar;
        this.f14510d = dragLayer;
    }
}
