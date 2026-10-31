package ab;

import ads_mobile_sdk.cm0;
import ads_mobile_sdk.fk;
import ads_mobile_sdk.fm0;
import ads_mobile_sdk.nn3;
import ads_mobile_sdk.pg;
import ads_mobile_sdk.rp1;
import ads_mobile_sdk.sh3;
import ads_mobile_sdk.ul0;
import ads_mobile_sdk.vi3;
import ads_mobile_sdk.w93;
import ads_mobile_sdk.yk0;
import android.content.IntentFilter;
import android.graphics.drawable.Drawable;
import android.net.TrafficStats;
import android.util.Log;
import androidx.work.impl.WorkDatabase;
import b.f1;
import b.u4;
import b.w4;
import cl.r0;
import cl.w0;
import com.google.firebase.installations.FirebaseInstallationsException;
import com.teslacoilsw.launcher.preferences.AdaptiveIconSettingsActivity;
import com.teslacoilsw.launcher.preferences.fragments.SettingsLookFeel;
import e10.y2;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Callable;
import kotlin.jvm.internal.Intrinsics;
import org.chromium.support_lib_boundary.JsReplyProxyBoundaryInterface;
import org.chromium.support_lib_boundary.WebViewNavigationBoundaryInterface;
import org.chromium.support_lib_boundary.WebViewPageBoundaryInterface;
import org.chromium.support_lib_boundary.WebViewRendererBoundaryInterface;

/* loaded from: classes2.dex */
public final /* synthetic */ class e implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f706a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f707b;

    public /* synthetic */ e(Object obj, int i5) {
        this.f706a = i5;
        this.f707b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v33, types: [java.util.concurrent.atomic.AtomicBoolean] */
    /* JADX WARN: Type inference failed for: r4v0, types: [ads_mobile_sdk.sh3, boolean] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v3, types: [int] */
    @Override // java.util.concurrent.Callable
    public final Object call() throws IOException, FirebaseInstallationsException {
        Object objApply;
        Object objA;
        int responseCode;
        int i5 = 3;
        int i11 = 2;
        ?? r42 = 0;
        switch (this.f706a) {
            case 0:
                return ((Drawable) this.f707b).mutate();
            case 1:
                fm0 fm0Var = (fm0) this.f707b;
                synchronized (fm0Var) {
                    try {
                        try {
                            try {
                                FileInputStream fileInputStream = new FileInputStream(fm0Var.f3427a);
                                try {
                                    objA = fm0Var.f3429c.a(fileInputStream);
                                    fileInputStream.close();
                                } catch (Throwable th2) {
                                    try {
                                        fileInputStream.close();
                                    } catch (Throwable th3) {
                                        th2.addSuppressed(th3);
                                    }
                                    throw th2;
                                }
                            } catch (IOException e3) {
                                objApply = fm0Var.f3430d.apply(new cm0(e3));
                                return objApply;
                            }
                        } catch (FileNotFoundException unused) {
                            objApply = fm0Var.f3429c.a();
                            return objApply;
                        }
                    } catch (cm0 e11) {
                        objApply = fm0Var.f3430d.apply(e11);
                        return objApply;
                    }
                }
                return objA;
            case 2:
                return (fk) ((w4) this.f707b).get();
            case 3:
                nn3 nn3Var = (nn3) this.f707b;
                nn3Var.getClass();
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.intent.action.USER_PRESENT");
                intentFilter.addAction("android.intent.action.SCREEN_OFF");
                nn3Var.f7629a.registerReceiver(nn3Var, intentFilter);
                return null;
            case 4:
                pg pgVar = (pg) this.f707b;
                f1 f1Var = new f1(pgVar, i11);
                synchronized (pgVar) {
                    vi3 vi3Var = pgVar.f8264b;
                    yk0 yk0Var = yk0.EVENT_ID_INIT_APP_INFO_TRACKER;
                    cl.v vVarE = w0.e(bh.g.V(new ae.h(i5, pgVar.f8263a, pgVar.f8265c)), f1Var, pgVar.f8266d);
                    vi3Var.a(yk0Var, (r0) vVarE);
                    pgVar.f8268f = vVarE;
                }
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            case 5:
                ul0 ul0Var = (ul0) this.f707b;
                ((ads_mobile_sdk.a) ul0Var.f10394c.get()).a();
                rp1 rp1Var = (rp1) ul0Var.f10393b.get();
                synchronized (rp1Var) {
                    try {
                        vi3 vi3Var2 = rp1Var.f9265e;
                        sh3 sh3Var = new sh3(yk0.EVENT_ID_FALLBACK_INIT_METHOD_PROVIDER, vi3Var2.f10793b, vi3Var2.f10792a);
                        try {
                            sh3Var.b();
                            rp1Var.a();
                            rp1Var.c();
                            rp1Var.d();
                            rp1Var.f9270j = true;
                        } catch (w93 e12) {
                            sh3Var.a(e12);
                        } catch (Throwable th4) {
                            sh3Var.a(th4);
                            throw th4;
                        }
                        sh3Var.a();
                    } catch (Throwable th5) {
                        r42.a();
                        throw th5;
                    }
                }
                return null;
            case 6:
                AdaptiveIconSettingsActivity adaptiveIconSettingsActivity = (AdaptiveIconSettingsActivity) this.f707b;
                int i12 = AdaptiveIconSettingsActivity.C;
                y2.f51877a.getClass();
                return ((gz.j) y2.F0().l()).a(adaptiveIconSettingsActivity);
            case 7:
                SettingsLookFeel settingsLookFeel = (SettingsLookFeel) this.f707b;
                y2 y2Var = y2.f51877a;
                y2Var.getClass();
                Drawable drawableA = ((gz.j) y2.F0().l()).a(settingsLookFeel.requireActivity());
                if (drawableA != null) {
                    return drawableA;
                }
                if (((Boolean) y2Var.g().l()).booleanValue()) {
                    return settingsLookFeel.requireActivity().getDrawable(2131820556);
                }
                com.teslacoilsw.launcher.icon.a aVarF = com.teslacoilsw.launcher.icon.a.f(settingsLookFeel.getResources(), 2131231602, null);
                Intrinsics.d(aVarF);
                return aVarF;
            case 8:
                return ya.j.f97147b.submit(new g.p((bm.t) this.f707b, i5));
            case 9:
                io.sentry.z zVar = (io.sentry.z) this.f707b;
                try {
                    zVar.f67936e.getClass();
                    zVar.f67933b = InetAddress.getLocalHost().getCanonicalHostName();
                    zVar.f67934c = System.currentTimeMillis() + zVar.f67932a;
                    return null;
                } finally {
                    zVar.f67935d.set(false);
                }
            case 10:
                io.sentry.metrics.a aVar = (io.sentry.metrics.a) this.f707b;
                StringBuilder sb2 = new StringBuilder();
                for (Map.Entry entry : aVar.f67397a.entrySet()) {
                    ((Long) entry.getKey()).getClass();
                    Collection collectionValues = ((Map) entry.getValue()).values();
                    int i13 = io.sentry.metrics.c.f67400b;
                    Iterator it = collectionValues.iterator();
                    if (it.hasNext()) {
                        throw u4.e(it);
                    }
                }
                return sb2.toString().getBytes(io.sentry.metrics.a.f67396b);
            case 11:
                return com.vungle.ads.internal.session.b.a((File) this.f707b);
            case 12:
                return new n7.g((JsReplyProxyBoundaryInterface) this.f707b);
            case 13:
                WebViewNavigationBoundaryInterface webViewNavigationBoundaryInterface = (WebViewNavigationBoundaryInterface) this.f707b;
                n7.h hVar = new n7.h();
                hVar.f77921a = webViewNavigationBoundaryInterface;
                return hVar;
            case 14:
                return new n7.j((WebViewPageBoundaryInterface) this.f707b);
            case 15:
                WebViewRendererBoundaryInterface webViewRendererBoundaryInterface = (WebViewRendererBoundaryInterface) this.f707b;
                n7.d0 d0Var = new n7.d0();
                d0Var.f77916a = webViewRendererBoundaryInterface;
                return d0Var;
            case 16:
                om.d dVar = (om.d) this.f707b;
                synchronized (dVar) {
                    dVar.f80519j = null;
                }
                pm.b bVarD = dVar.d();
                if (bVarD.a()) {
                    qm.d dVar2 = dVar.f80511b;
                    ul.g gVar = dVar.f80510a;
                    gVar.a();
                    String str = gVar.f91322c.f91335a;
                    String str2 = bVarD.f82665a;
                    ul.g gVar2 = dVar.f80510a;
                    gVar2.a();
                    String str3 = gVar2.f91322c.f91342h;
                    String str4 = bVarD.f82668d;
                    dVar2.getClass();
                    URL urlA = qm.d.a("projects/" + str3 + "/installations/" + str2);
                    while (r42 <= 1) {
                        TrafficStats.setThreadStatsTag(32770);
                        HttpURLConnection httpURLConnectionC = dVar2.c(urlA, str);
                        try {
                            httpURLConnectionC.setRequestMethod("DELETE");
                            httpURLConnectionC.addRequestProperty("Authorization", "FIS_v2 " + str4);
                            responseCode = httpURLConnectionC.getResponseCode();
                        } catch (IOException unused2) {
                        } catch (Throwable th6) {
                            httpURLConnectionC.disconnect();
                            TrafficStats.clearThreadStatsTag();
                            throw th6;
                        }
                        if (responseCode != 200 && responseCode != 401 && responseCode != 404) {
                            qm.d.b(httpURLConnectionC, null, str, str3);
                            if (responseCode != 429 && (responseCode < 500 || responseCode >= 600)) {
                                Log.e("Firebase-Installations", "Firebase Installations can not communicate with Firebase server APIs due to invalid configuration. Please update your Firebase initialization process and set valid Firebase options (API key, Project ID, Application ID) when initializing Firebase.");
                                throw new FirebaseInstallationsException("Bad config while trying to delete FID");
                                break;
                            }
                            httpURLConnectionC.disconnect();
                            TrafficStats.clearThreadStatsTag();
                            r42++;
                        }
                        httpURLConnectionC.disconnect();
                        TrafficStats.clearThreadStatsTag();
                    }
                    throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
                }
                pm.a aVarB = bVarD.b();
                aVarB.f82657b = 2;
                dVar.f(aVarB.a());
                return null;
            default:
                WorkDatabase workDatabase = (WorkDatabase) ((vm.c) this.f707b).f92857b;
                Long lV = workDatabase.e().v("next_alarm_manager_id");
                int iLongValue = lV != null ? (int) lV.longValue() : 0;
                workDatabase.e().x(new x7.d("next_alarm_manager_id", Long.valueOf(iLongValue != Integer.MAX_VALUE ? iLongValue + 1 : 0)));
                return Integer.valueOf(iLongValue);
        }
    }
}
