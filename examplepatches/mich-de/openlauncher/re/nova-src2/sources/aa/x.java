package aa;

import ads_mobile_sdk.ap3;
import ads_mobile_sdk.bp3;
import ads_mobile_sdk.ew1;
import ads_mobile_sdk.f32;
import ads_mobile_sdk.ul2;
import ads_mobile_sdk.zm3;
import android.app.AppOpsManager;
import android.content.Context;
import android.net.ConnectivityManager;
import android.view.View;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ScrollView;
import androidx.work.impl.workers.ConstraintTrackingWorker;
import b00.h1;
import b10.k2;
import com.android.launcher3.widget.WidgetsBottomSheet;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.gms.internal.measurement.v6;
import com.google.android.material.sidesheet.SideSheetBehavior;
import com.google.android.material.textfield.TextInputLayout;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.K;
import com.stripe.hcaptcha.HCaptchaException;
import com.teslacoilsw.launcher.appwidget.WidgetsPeekingSheet;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefExpanderView;
import com.tiktok.appevents.DeeplinkCallbackWrapper;
import com.tiktok.appevents.TTAppEventLogger;
import com.vungle.ads.internal.v2;
import fe.o1;
import fe.u1;
import java.net.HttpURLConnection;
import java.util.Iterator;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import t70.s1;

/* loaded from: classes2.dex */
public final /* synthetic */ class x implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f661a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f662b;

    public /* synthetic */ x(fe.h0 h0Var, o1 o1Var) {
        this.f661a = 24;
        this.f662b = o1Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws SecurityException, IllegalArgumentException {
        boolean z11 = true;
        char c11 = 1;
        switch (this.f661a) {
            case 0:
                d0 d0Var = (d0) this.f662b;
                int i5 = d0Var.f573u - 1;
                d0Var.f573u = i5;
                if (i5 <= 0) {
                    ya.j.f97149d.b(10);
                    return;
                }
                return;
            case 1:
                ((ab.b) this.f662b).u();
                return;
            case 2:
                WidgetsBottomSheet widgetsBottomSheet = (WidgetsBottomSheet) this.f662b;
                widgetsBottomSheet.removeOnLayoutChangeListener(widgetsBottomSheet.B);
                return;
            case 3:
                bp3 bp3Var = (bp3) this.f662b;
                ap3 ap3Var = new ap3(bp3Var);
                try {
                    Object systemService = bp3Var.f1482b.getSystemService("appops");
                    systemService.getClass();
                    ((AppOpsManager) systemService).startWatchingActive(bp3.f1480h, bp3Var.f1483c, ap3Var);
                    return;
                } catch (Throwable unused) {
                    return;
                }
            case 4:
                ew1 this$0 = (ew1) this.f662b;
                Intrinsics.g(this$0, "this$0");
                synchronized (this$0) {
                    try {
                        if (this$0.f3070d.get()) {
                            return;
                        }
                        Context context = this$0.f3068b.getContext();
                        if (context != null) {
                            if (this$0.f3071e == null) {
                                View view = new View(context);
                                view.setLayoutParams(new FrameLayout.LayoutParams(-1, 0));
                                this$0.f3071e = view;
                            }
                            ni.o oVar = this$0.f3068b;
                            View view2 = this$0.f3071e;
                            if (!oVar.equals(view2 != null ? view2.getParent() : null)) {
                                this$0.f3068b.addView(this$0.f3071e);
                            }
                        }
                        Unit unit = Unit.f71706a;
                        return;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            case 5:
                f32 f32Var = (f32) this.f662b;
                k30.d0 d0Var2 = new k30.d0(f32Var, c11 == true ? 1 : 0);
                try {
                    Object systemService2 = f32Var.f3134a.getSystemService("connectivity");
                    systemService2.getClass();
                    ((ConnectivityManager) systemService2).registerDefaultNetworkCallback(d0Var2);
                    return;
                } catch (Throwable unused2) {
                    return;
                }
            case 6:
                ((HttpURLConnection) this.f662b).disconnect();
                return;
            case 7:
                ul2 ul2Var = (ul2) this.f662b;
                zm3 zm3Var = (zm3) ul2Var.f10399a.get();
                long j11 = ul2Var.f10403e;
                if (j11 > 0) {
                    zm3Var.f12595e.a(new x(zm3Var, 8), j11);
                    return;
                } else {
                    zm3Var.a();
                    return;
                }
            case 8:
                ((zm3) this.f662b).a();
                return;
            case 9:
                ((h1) this.f662b).f16363c.c();
                return;
            case 10:
                ((k2) this.f662b).f16767f = false;
                return;
            case 11:
                ConstraintTrackingWorker constraintTrackingWorker = (ConstraintTrackingWorker) this.f662b;
                if (constraintTrackingWorker.f15355i.f98296a instanceof z7.a) {
                    return;
                }
                String strB = constraintTrackingWorker.getInputData().b("androidx.work.impl.workers.ConstraintTrackingWorker.ARGUMENT_CLASS_NAME");
                o7.r rVarC = o7.r.c();
                Intrinsics.f(rVarC, "get()");
                if (strB == null || strB.length() == 0) {
                    rVarC.a(b8.a.f17604a, "No worker to delegate to.");
                    z7.j future = constraintTrackingWorker.f15355i;
                    Intrinsics.f(future, "future");
                    future.j(new o7.m());
                    return;
                }
                o7.q qVarA = constraintTrackingWorker.getWorkerFactory().a(constraintTrackingWorker.getApplicationContext(), strB, constraintTrackingWorker.f15352f);
                constraintTrackingWorker.f15356j = qVarA;
                if (qVarA == null) {
                    String str = b8.a.f17604a;
                    z7.j future2 = constraintTrackingWorker.f15355i;
                    Intrinsics.f(future2, "future");
                    future2.j(new o7.m());
                    return;
                }
                p7.s sVarC = p7.s.c(constraintTrackingWorker.getApplicationContext());
                Intrinsics.f(sVarC, "getInstance(applicationContext)");
                x7.s sVarI = sVarC.f82374c.i();
                String string = constraintTrackingWorker.getId().toString();
                Intrinsics.f(string, "id.toString()");
                x7.q qVarL = sVarI.l(string);
                if (qVarL == null) {
                    z7.j future3 = constraintTrackingWorker.f15355i;
                    Intrinsics.f(future3, "future");
                    String str2 = b8.a.f17604a;
                    future3.j(new o7.m());
                    return;
                }
                v7.j jVar = sVarC.f82381j;
                Intrinsics.f(jVar, "workManagerImpl.trackers");
                v6 v6Var = new v6(jVar);
                t70.c0 c0Var = ((a8.c) sVarC.f82375d).f459b;
                Intrinsics.f(c0Var, "workManagerImpl.workTask…r.taskCoroutineDispatcher");
                constraintTrackingWorker.f15355i.b(new x(t7.h.a(v6Var, qVarL, c0Var, constraintTrackingWorker), 12), new fi.s(1));
                if (!v6Var.b(qVarL)) {
                    String str3 = b8.a.f17604a;
                    z7.j future4 = constraintTrackingWorker.f15355i;
                    Intrinsics.f(future4, "future");
                    future4.j(new o7.n());
                    return;
                }
                String str4 = b8.a.f17604a;
                try {
                    o7.q qVar = constraintTrackingWorker.f15356j;
                    Intrinsics.d(qVar);
                    ListenableFuture listenableFutureStartWork = qVar.startWork();
                    Intrinsics.f(listenableFutureStartWork, "delegate!!.startWork()");
                    listenableFutureStartWork.b(new ae.c(7, constraintTrackingWorker, listenableFutureStartWork), constraintTrackingWorker.getBackgroundExecutor());
                    return;
                } catch (Throwable unused3) {
                    String str5 = b8.a.f17604a;
                    synchronized (constraintTrackingWorker.f15353g) {
                        try {
                            if (constraintTrackingWorker.f15354h) {
                                z7.j future5 = constraintTrackingWorker.f15355i;
                                Intrinsics.f(future5, "future");
                                future5.j(new o7.n());
                                return;
                            } else {
                                z7.j future6 = constraintTrackingWorker.f15355i;
                                Intrinsics.f(future6, "future");
                                future6.j(new o7.m());
                                return;
                            }
                        } finally {
                        }
                    }
                }
            case 12:
                ((s1) this.f662b).c(null);
                return;
            case 13:
                ba.e eVar = (ba.e) this.f662b;
                if (eVar.f17747f) {
                    return;
                }
                eVar.f17747f = true;
                eVar.f17746e.run();
                return;
            case 14:
                Iterator it = ((bx.c) this.f662b).f18674d.iterator();
                while (it.hasNext()) {
                    ((bx.a) it.next()).b(new HCaptchaException(yw.c.f97664e));
                }
                return;
            case 15:
                v2.a((v2) this.f662b);
                return;
            case 16:
                ck.e eVar2 = (ck.e) this.f662b;
                eVar2.f19978c = false;
                SideSheetBehavior sideSheetBehavior = (SideSheetBehavior) eVar2.f19980e;
                r5.d dVar = sideSheetBehavior.f34339i;
                if (dVar != null && dVar.f()) {
                    eVar2.i(eVar2.f19977b);
                    return;
                } else {
                    if (sideSheetBehavior.f34338h == 2) {
                        sideSheetBehavior.x(eVar2.f19977b);
                        return;
                    }
                    return;
                }
            case 17:
                ((UserMetadata) this.f662b).serializeUserDataIfNeeded();
                return;
            case 18:
                K.c.a.a((K) this.f662b);
                return;
            case 19:
                com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.blur.b.c((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear.blur.b) this.f662b);
                return;
            case 20:
                WidgetsPeekingSheet widgetsPeekingSheet = (WidgetsPeekingSheet) this.f662b;
                int i11 = WidgetsPeekingSheet.f45705j0;
                if (widgetsPeekingSheet.f70514g >= widgetsPeekingSheet.a0()) {
                    widgetsPeekingSheet.f70518k = true;
                    widgetsPeekingSheet.f0(widgetsPeekingSheet.a0());
                    return;
                }
                return;
            case 21:
                TTAppEventLogger.lambda$fetchDeferredDeeplinkWithCompletion$9((DeeplinkCallbackWrapper) this.f662b);
                return;
            case 22:
                FancyPrefExpanderView fancyPrefExpanderView = (FancyPrefExpanderView) this.f662b;
                int i12 = FancyPrefExpanderView.f45995c;
                ViewParent parent = fancyPrefExpanderView.getParent();
                while (parent != null && !(parent instanceof ScrollView)) {
                    parent = parent.getParent();
                }
                ScrollView scrollView = parent instanceof ScrollView ? (ScrollView) parent : null;
                if (scrollView != null) {
                    if (scrollView.getHeight() + scrollView.getScrollY() < fancyPrefExpanderView.getHeight() + fancyPrefExpanderView.getTop()) {
                        int top = fancyPrefExpanderView.getTop();
                        int height = (fancyPrefExpanderView.getHeight() + fancyPrefExpanderView.getTop()) - scrollView.getHeight();
                        if (height - fancyPrefExpanderView.getHeight() > top) {
                            scrollView.smoothScrollTo(0, height);
                            return;
                        } else {
                            scrollView.smoothScrollTo(0, top);
                            return;
                        }
                    }
                    return;
                }
                return;
            case 23:
                com.vungle.ads.internal.load.i.i((com.vungle.ads.internal.load.i) this.f662b);
                return;
            case 24:
                o1 o1Var = (o1) this.f662b;
                try {
                    synchronized (o1Var) {
                    }
                    try {
                        o1Var.f54939a.b(o1Var.f54942d, o1Var.f54943e);
                        return;
                    } finally {
                        o1Var.b(true);
                    }
                } catch (ExoPlaybackException e3) {
                    wf.a.p("ExoPlayerImplInternal", "Unexpected error delivering message on external thread.", e3);
                    throw new RuntimeException(e3);
                }
            case 25:
                ((u1) this.f662b).d();
                return;
            case 26:
                ((fk.d) this.f662b).s(true);
                return;
            case 27:
                fk.i iVar = (fk.i) this.f662b;
                boolean zIsPopupShowing = iVar.f55188h.isPopupShowing();
                iVar.s(zIsPopupShowing);
                iVar.f55193m = zIsPopupShowing;
                return;
            case 28:
                ((TextInputLayout) this.f662b).f34369d.requestLayout();
                return;
            default:
                g.l this$02 = (g.l) this.f662b;
                Intrinsics.g(this$02, "this$0");
                Runnable runnable = this$02.f56420b;
                if (runnable != null) {
                    runnable.run();
                    this$02.f56420b = null;
                    return;
                }
                return;
        }
    }

    public /* synthetic */ x(Object obj, int i5) {
        this.f661a = i5;
        this.f662b = obj;
    }
}
