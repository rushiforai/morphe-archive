package g;

import ab.e0;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.SystemClock;
import android.util.Property;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.inputmethod.InputMethodManager;
import android.widget.RemoteViews;
import android.widget.TextView;
import androidx.core.app.FrameMetricsAggregator;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.webkit.WebViewCompat;
import as.d0;
import bn.s0;
import com.android.launcher3.CellLayout;
import com.android.launcher3.ExtendedEditText;
import com.android.launcher3.SecondaryDropTarget;
import com.android.launcher3.logging.InstanceId;
import com.android.launcher3.logging.StatsLogManager;
import com.android.launcher3.model.ModelDelegate;
import com.android.launcher3.shortcuts.DeepShortcutView;
import com.android.launcher3.util.ComponentKey;
import com.google.android.gms.internal.consent_sdk.c3;
import com.google.android.gms.internal.consent_sdk.k7;
import com.google.android.material.carousel.CarouselLayoutManager;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.teslacoilsw.launcher.NovaApplication;
import com.teslacoilsw.launcher.Stats;
import com.teslacoilsw.launcher.quicksearchbar.NovaSearchBarView;
import io.sentry.ILogger;
import io.sentry.android.core.NetworkBreadcrumbsIntegration;
import io.sentry.android.core.p0;
import io.sentry.g3;
import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import kl.q0;
import kotlin.jvm.internal.Intrinsics;
import o9.a3;
import o9.b3;
import o9.e4;
import o9.k0;
import o9.l0;
import o9.v2;
import xk.e2;
import xk.j2;

/* loaded from: classes2.dex */
public final /* synthetic */ class p implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56426a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f56427b;

    public /* synthetic */ p(io.sentry.android.core.a aVar, ge.d dVar) {
        this.f56426a = 5;
        this.f56427b = aVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:232:0x0230 A[EXC_TOP_SPLITTER, PHI: r3
      0x0230: PHI (r3v22 java.io.DataOutputStream) = (r3v21 java.io.DataOutputStream), (r3v23 java.io.DataOutputStream) binds: [B:110:0x022e, B:116:0x0244] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:237:0x0247 A[PHI: r3
      0x0247: PHI (r3v24 java.io.DataOutputStream) = 
      (r3v21 java.io.DataOutputStream)
      (r3v22 java.io.DataOutputStream)
      (r3v23 java.io.DataOutputStream)
      (r3v0 java.io.DataOutputStream)
     binds: [B:110:0x022e, B:111:0x0230, B:116:0x0244, B:101:0x0206] A[DONT_GENERATE, DONT_INLINE], SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r4v0, types: [int] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v17 */
    /* JADX WARN: Type inference failed for: r5v18, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v19 */
    /* JADX WARN: Type inference failed for: r5v20 */
    /* JADX WARN: Type inference failed for: r5v22 */
    /* JADX WARN: Type inference failed for: r6v21, types: [android.content.pm.ApplicationInfo] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() {
        DataOutputStream dataOutputStream;
        Object obj;
        int i5 = 2;
        DataOutputStream dataOutputStream2 = null;
        ?? r42 = 0;
        ?? r52 = 1;
        r52 = 1;
        switch (this.f56426a) {
            case 0:
                q.a((q) this.f56427b);
                return;
            case 1:
                ge.f fVar = (ge.f) this.f56427b;
                fVar.g(fVar.a(), 1028, new ge.d(r42));
                wf.h hVar = fVar.f57398f;
                CopyOnWriteArraySet copyOnWriteArraySet = hVar.f94330d;
                Iterator it = copyOnWriteArraySet.iterator();
                while (it.hasNext()) {
                    wf.g gVar = (wf.g) it.next();
                    wf.f fVar2 = hVar.f94329c;
                    gVar.f94326d = true;
                    if (gVar.f94325c) {
                        gVar.f94325c = false;
                        fVar2.f(gVar.f94323a, gVar.f94324b.h());
                    }
                }
                copyOnWriteArraySet.clear();
                hVar.f94333g = true;
                return;
            case 2:
                com.vungle.ads.internal.omsdk.c.a((com.vungle.ads.internal.omsdk.c) this.f56427b);
                return;
            case 3:
                ((bm.t) this.f56427b).q(Collections.EMPTY_LIST);
                return;
            case 4:
                TextView textView = (TextView) this.f56427b;
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(textView, (Property<TextView, Float>) View.SCALE_X, 1.0f, 1.1f, 1.0f);
                objectAnimatorOfFloat.setRepeatCount(-1);
                ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(textView, (Property<TextView, Float>) View.SCALE_Y, 1.0f, 1.1f, 1.0f);
                objectAnimatorOfFloat2.setRepeatCount(-1);
                AnimatorSet animatorSet = new AnimatorSet();
                animatorSet.playTogether(objectAnimatorOfFloat, objectAnimatorOfFloat2);
                animatorSet.setDuration(1200L);
                animatorSet.setInterpolator(new AccelerateDecelerateInterpolator());
                animatorSet.start();
                return;
            case 5:
                io.sentry.android.core.a aVar = (io.sentry.android.core.a) this.f56427b;
                aVar.f66842h = SystemClock.uptimeMillis();
                aVar.f66843i.set(false);
                return;
            case 6:
                og.g gVar2 = ((FrameMetricsAggregator) ((s0) this.f56427b).f18279b).f14217a;
                ArrayList arrayList = (ArrayList) gVar2.f80408c;
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    WeakReference weakReference = (WeakReference) arrayList.get(size);
                    Activity activity = (Activity) weakReference.get();
                    if (weakReference.get() != null) {
                        activity.getWindow().removeOnFrameMetricsAvailableListener((n4.j) gVar2.f80409d);
                        arrayList.remove(size);
                    }
                }
                return;
            case 7:
                ((io.sentry.android.core.p) this.f56427b).a(null, true);
                return;
            case 8:
                NetworkBreadcrumbsIntegration networkBreadcrumbsIntegration = (NetworkBreadcrumbsIntegration) this.f56427b;
                synchronized (networkBreadcrumbsIntegration.f66795d) {
                    try {
                        if (networkBreadcrumbsIntegration.f66798g != null) {
                            Context context = networkBreadcrumbsIntegration.f66792a;
                            ILogger iLogger = networkBreadcrumbsIntegration.f66794c;
                            io.sentry.android.core.a0 a0Var = networkBreadcrumbsIntegration.f66793b;
                            p0 p0Var = networkBreadcrumbsIntegration.f66798g;
                            a0Var.getClass();
                            ConnectivityManager connectivityManagerD = io.sentry.android.core.internal.util.b.d(context, iLogger);
                            if (connectivityManagerD != null) {
                                try {
                                    connectivityManagerD.unregisterNetworkCallback(p0Var);
                                } catch (Throwable th2) {
                                    iLogger.e(g3.WARNING, "unregisterNetworkCallback failed", th2);
                                }
                            }
                            networkBreadcrumbsIntegration.f66794c.g(g3.DEBUG, "NetworkBreadcrumbsIntegration removed.", new Object[0]);
                        }
                        networkBreadcrumbsIntegration.f66798g = null;
                    } finally {
                    }
                }
                return;
            case 9:
                ((CarouselLayoutManager) this.f56427b).requestLayout();
                return;
            case 10:
                k1.i iVar = (k1.i) this.f56427b;
                k1.p pVar = iVar.f70835a;
                if (pVar != null) {
                    pVar.setState(k1.i.f70834g);
                }
                iVar.f70838d = null;
                return;
            case 11:
                DeepShortcutView deepShortcutView = (DeepShortcutView) this.f56427b;
                deepShortcutView.f21243b.x(deepShortcutView.f21245d, false);
                deepShortcutView.f21244c.setBackground(deepShortcutView.f21243b.f20869f);
                return;
            case 12:
                NovaSearchBarView novaSearchBarView = (NovaSearchBarView) this.f56427b;
                NovaSearchBarView.f(novaSearchBarView, novaSearchBarView.f46149h, novaSearchBarView.f46150i, true, 8);
                return;
            case 13:
                l30.s sVar = (l30.s) this.f56427b;
                ((o9.l) sVar.f74693d).u().removeView(sVar);
                a10.a aVar2 = (a10.a) sVar.f74694e;
                if (aVar2 != null) {
                    aVar2.run();
                    return;
                }
                return;
            case 14:
                ((d0) ((l5.b) this.f56427b).d()).b(new GetCredentialUnknownException("Failed to launch the selector UI. Hint: ensure the `context` parameter is an Activity-based context."));
                return;
            case 15:
                com.vungle.ads.internal.ui.z.a(true, (com.vungle.ads.internal.ui.z) this.f56427b);
                return;
            case 16:
                WebViewCompat.WebViewStartUpCallback webViewStartUpCallback = (WebViewCompat.WebViewStartUpCallback) this.f56427b;
                Uri uri = WebViewCompat.f15309a;
                webViewStartUpCallback.onSuccess(new b6.e(15));
                return;
            case 17:
                ab.x xVar = (ab.x) this.f56427b;
                xVar.getClass();
                xVar.updateAppWidget(new RemoteViews(xVar.getAppWidgetInfo().provider.getPackageName(), 0));
                return;
            case 18:
                EditShortcutFloatingView editShortcutFloatingView = (EditShortcutFloatingView) this.f56427b;
                int i11 = EditShortcutFloatingView.f45599v;
                ArrayList arrayListY = editShortcutFloatingView.Y();
                mx.v vVar = editShortcutFloatingView.f45613r;
                if (editShortcutFloatingView.f45616u) {
                    Iterator it2 = arrayListY.iterator();
                    while (true) {
                        if (it2.hasNext()) {
                            uy.s sVar2 = (uy.s) it2.next();
                            ArrayList arrayList2 = vVar.f77251a;
                            if (arrayList2 == null) {
                                Intrinsics.m("groups");
                                throw null;
                            }
                            if (!arrayList2.contains(sVar2)) {
                                q0 q0Var = editShortcutFloatingView.f45611p;
                                if (q0Var != null) {
                                    q0Var.d(sVar2).a(editShortcutFloatingView.f45607j);
                                }
                                editShortcutFloatingView.f45616u = false;
                            }
                        }
                    }
                }
                vVar.f77251a = arrayListY;
                vVar.notifyDataSetChanged();
                return;
            case 19:
                NovaApplication novaApplication = (NovaApplication) this.f56427b;
                Boolean bool = NovaApplication.f45635g;
                AtomicBoolean atomicBoolean = ox.u.f81112a;
                j10.d.b(novaApplication);
                if (ox.u.f81112a.compareAndSet(false, true)) {
                    ox.u.f81114c = (c3) ((k7) com.google.android.gms.internal.consent_sdk.d.b(novaApplication).f32033h).zzb();
                    ox.u.e();
                    ox.u.f81116e = true;
                    ox.u.b(ox.u.d(novaApplication));
                    ox.u.f81113b.X(Boolean.FALSE);
                }
                ox.u.a(novaApplication);
                px.c cVar = px.c.f83110a;
                mh.c cVar2 = px.c.f83114e;
                if (cVar2 == null) {
                    throw new IllegalStateException("AdsBootstrap not initialized — new SDK is not active");
                }
                cVar2.L();
                return;
            case 20:
                Stats stats = (Stats) this.f56427b;
                synchronized (stats.f45678e) {
                    stats.c();
                    try {
                        try {
                            dataOutputStream = new DataOutputStream(stats.f45674a.openFileOutput("stats.log.tmp", 0));
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    } catch (FileNotFoundException e3) {
                        e = e3;
                    } catch (Exception e11) {
                        e = e11;
                    }
                    try {
                        dataOutputStream.writeInt(2);
                        dataOutputStream.writeInt(ul.b.a0(stats.f45677d.f95974d));
                        Iterator it3 = ((xk.s) stats.f45677d.entrySet()).iterator();
                        while (it3.hasNext()) {
                            j2 j2Var = (j2) ((e2) it3.next());
                            dataOutputStream.writeUTF(e0.C((ComponentKey) j2Var.f95943a, stats.f45674a));
                            dataOutputStream.writeInt(j2Var.a());
                            Long lValueOf = (Long) stats.f45676c.get(j2Var.f95943a);
                            if (lValueOf == null || lValueOf.longValue() > System.currentTimeMillis()) {
                                lValueOf = Long.valueOf(System.currentTimeMillis());
                            }
                            dataOutputStream.writeLong(lValueOf.longValue());
                        }
                        dataOutputStream.close();
                        stats.f45674a.getFileStreamPath("stats.log.tmp").renameTo(stats.f45674a.getFileStreamPath("stats.log"));
                    } catch (FileNotFoundException e12) {
                        e = e12;
                        dataOutputStream2 = dataOutputStream;
                        mc0.b bVar = mc0.d.f76206a;
                        bVar.r("Nova/Stats");
                        bVar.p(e, "unable to create stats data", new Object[0]);
                        if (dataOutputStream2 != null) {
                            try {
                                dataOutputStream2.close();
                            } catch (IOException unused) {
                            }
                        }
                        return;
                    } catch (Exception e13) {
                        e = e13;
                        dataOutputStream2 = dataOutputStream;
                        mc0.b bVar2 = mc0.d.f76206a;
                        bVar2.r("Nova/Stats");
                        bVar2.p(e, "unable to write to stats data", new Object[0]);
                        if (dataOutputStream2 != null) {
                        }
                        return;
                    } catch (Throwable th4) {
                        th = th4;
                        dataOutputStream2 = dataOutputStream;
                        if (dataOutputStream2 != null) {
                            try {
                                dataOutputStream2.close();
                            } catch (IOException unused2) {
                            }
                        }
                        throw th;
                    }
                }
                return;
            case 21:
                Activity activity2 = (Activity) this.f56427b;
                if (activity2.isFinishing()) {
                    return;
                }
                Handler handler = n4.e.f77794g;
                Method method = n4.e.f77793f;
                int i12 = Build.VERSION.SDK_INT;
                if (i12 >= 28) {
                    activity2.recreate();
                    return;
                }
                if (((i12 != 26 && i12 != 27) || method != null) && (n4.e.f77792e != null || n4.e.f77791d != null)) {
                    try {
                        Object obj2 = n4.e.f77790c.get(activity2);
                        if (obj2 != null && (obj = n4.e.f77789b.get(activity2)) != null) {
                            Application application = activity2.getApplication();
                            n4.d dVar = new n4.d(activity2);
                            application.registerActivityLifecycleCallbacks(dVar);
                            handler.post(new mk.w(1 == true ? 1 : 0, dVar, obj2));
                            if (i12 != 26 && i12 != 27) {
                                r52 = 0;
                            }
                            try {
                                if (r52 != 0) {
                                    try {
                                        Boolean bool2 = Boolean.FALSE;
                                        r42 = application;
                                        r52 = dVar;
                                        method.invoke(obj, obj2, null, null, 0, bool2, null, null, bool2, bool2);
                                    } catch (Throwable th5) {
                                        th = th5;
                                        Application application2 = application;
                                        n4.d dVar2 = dVar;
                                        handler.post(new mk.w(i5, application2, dVar2));
                                        throw th;
                                    }
                                } else {
                                    r42 = application;
                                    r52 = dVar;
                                    activity2.recreate();
                                }
                                handler.post(new mk.w(i5, r42, r52));
                                return;
                            } catch (Throwable th6) {
                                th = th6;
                            }
                        }
                    } catch (Throwable unused3) {
                    }
                }
                activity2.recreate();
                return;
            case 22:
                com.vungle.ads.internal.ui.view.g.a((com.vungle.ads.internal.ui.view.g) this.f56427b);
                return;
            case 23:
                ((aa.h) this.f56427b).j();
                return;
            case 24:
                CellLayout cellLayout = (CellLayout) this.f56427b;
                b3 b3Var = cellLayout.P;
                if (cellLayout.B.isEmpty()) {
                    int childCount = b3Var.getChildCount();
                    for (int i13 = 0; i13 < childCount; i13++) {
                        KeyEvent.Callback childAt = b3Var.getChildAt(i13);
                        if (childAt instanceof v2) {
                            v2 v2Var = (v2) childAt;
                            v2Var.i(0.0f, 0.0f);
                            v2Var.h(1.0f);
                            v2Var.j(0.0f, 0.0f);
                        }
                    }
                    return;
                }
                return;
            case 25:
                ExtendedEditText extendedEditText = (ExtendedEditText) this.f56427b;
                int i14 = ExtendedEditText.f20956d;
                if (extendedEditText.requestFocus()) {
                    ((InputMethodManager) extendedEditText.getContext().getSystemService(InputMethodManager.class)).showSoftInput(extendedEditText, 1);
                }
                extendedEditText.f20957a = false;
                return;
            case 26:
                ((o9.a) this.f56427b).K(true);
                return;
            case 27:
                ((ModelDelegate) this.f56427b).getClass();
                return;
            case 28:
                a3 a3Var = (a3) this.f56427b;
                SecondaryDropTarget secondaryDropTarget = a3Var.f79763e;
                StatsLogManager statsLogManager = secondaryDropTarget.o;
                Context applicationContext = a3Var.f79760b.getApplicationContext();
                applicationContext.getPackageManager();
                try {
                    ?? applicationInfo = ((LauncherApps) applicationContext.getSystemService(LauncherApps.class)).getApplicationInfo(a3Var.f79761c, UserMetadata.MAX_INTERNAL_KEY_SIZE, a3Var.f79762d.f79955g.o);
                    if ((((ApplicationInfo) applicationInfo).flags & 8388608) != 0) {
                        if (((ApplicationInfo) applicationInfo).enabled) {
                            dataOutputStream2 = applicationInfo;
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused4) {
                }
                if (dataOutputStream2 != null) {
                    a3Var.b();
                    ea.e eVarA = statsLogManager.a();
                    InstanceId instanceId = a3Var.f79762d.n;
                    eVarA.b(ea.d.LAUNCHER_ITEM_UNINSTALL_CANCELLED);
                    return;
                }
                l0 l0Var = a3Var.f79762d;
                k0 k0Var = a3Var.f79759a;
                l0Var.f79957i = k0Var;
                k0Var.i(secondaryDropTarget, l0Var, true);
                ea.e eVarA2 = statsLogManager.a();
                InstanceId instanceId2 = a3Var.f79762d.n;
                eVarA2.b(ea.d.LAUNCHER_ITEM_UNINSTALL_COMPLETED);
                return;
            default:
                ((e4) ((wf.o) this.f56427b).f94363d).f79825a.x0();
                return;
        }
    }

    public /* synthetic */ p(Object obj, int i5) {
        this.f56426a = i5;
        this.f56427b = obj;
    }
}
