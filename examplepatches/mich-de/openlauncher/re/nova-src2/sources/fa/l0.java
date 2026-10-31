package fa;

import android.media.AudioTrack;
import android.view.Choreographer;
import android.view.View;
import android.widget.ScrollView;
import androidx.credentials.playservices.CredentialProviderPlayServicesImpl;
import com.amplitude.android.sessionreplay.config.SessionReplayConfig;
import com.android.launcher3.notification.NotificationContainer;
import com.android.launcher3.notification.NotificationMainView;
import com.android.launcher3.popup.PopupContainerWithArrow;
import com.vungle.ads.internal.persistence.FilePreferences;
import fe.f1;
import fe.p1;
import fe.x1;
import fe.z1;
import io.sentry.android.core.ActivityLifecycleIntegration;
import io.sentry.android.core.AnrIntegration;
import io.sentry.android.core.PhoneStateBreadcrumbsIntegration;
import io.sentry.android.core.SentryAndroidOptions;
import io.sentry.android.core.SystemEventsBreadcrumbsIntegration;
import io.sentry.android.core.TempSensorBreadcrumbsIntegration;
import io.sentry.f4;
import io.sentry.g3;
import io.sentry.w3;
import java.io.File;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final /* synthetic */ class l0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54433a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54434b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f54435c;

    public /* synthetic */ l0(int i5, Object obj, Object obj2) {
        this.f54433a = i5;
        this.f54434b = obj;
        this.f54435c = obj2;
    }

    private final void a() {
        PhoneStateBreadcrumbsIntegration phoneStateBreadcrumbsIntegration = (PhoneStateBreadcrumbsIntegration) this.f54434b;
        w3 w3Var = (w3) this.f54435c;
        synchronized (phoneStateBreadcrumbsIntegration.f66804f) {
            try {
                if (!phoneStateBreadcrumbsIntegration.f66803e) {
                    phoneStateBreadcrumbsIntegration.a(w3Var);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void b() {
        SystemEventsBreadcrumbsIntegration systemEventsBreadcrumbsIntegration = (SystemEventsBreadcrumbsIntegration) this.f54434b;
        w3 w3Var = (w3) this.f54435c;
        synchronized (systemEventsBreadcrumbsIntegration.f66822f) {
            try {
                if (!systemEventsBreadcrumbsIntegration.f66821e) {
                    systemEventsBreadcrumbsIntegration.a((SentryAndroidOptions) w3Var);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private final void c() {
        TempSensorBreadcrumbsIntegration tempSensorBreadcrumbsIntegration = (TempSensorBreadcrumbsIntegration) this.f54434b;
        w3 w3Var = (w3) this.f54435c;
        synchronized (tempSensorBreadcrumbsIntegration.f66828f) {
            try {
                if (!tempSensorBreadcrumbsIntegration.f66827e) {
                    tempSensorBreadcrumbsIntegration.a(w3Var);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        long j11;
        boolean z11;
        long j12 = -9223372036854775807L;
        boolean z12 = false;
        boolean z13 = true;
        switch (this.f54433a) {
            case 0:
                ((ab.m) this.f54434b).deleteAppWidgetId(((ga.g) this.f54435c).f57310r);
                return;
            case 1:
                ((fb.c) this.f54434b).f54584d.p0((ArrayList) this.f54435c);
                return;
            case 2:
                fe.a0 a0Var = (fe.a0) this.f54434b;
                fe.e0 e0Var = (fe.e0) this.f54435c;
                int i5 = a0Var.H - e0Var.f54747c;
                a0Var.H = i5;
                if (e0Var.f54748d) {
                    a0Var.I = e0Var.f54749e;
                    a0Var.J = true;
                }
                if (e0Var.f54750f) {
                    a0Var.K = e0Var.f54751g;
                }
                if (i5 == 0) {
                    z1 z1Var = e0Var.f54746b.f54764a;
                    if (!a0Var.f54691j0.f54764a.p() && z1Var.p()) {
                        a0Var.f54693k0 = -1;
                        a0Var.f54695l0 = 0L;
                    }
                    if (!z1Var.p()) {
                        List listAsList = Arrays.asList(((p1) z1Var).f54960h);
                        wf.a.i(listAsList.size() == a0Var.o.size());
                        for (int i11 = 0; i11 < listAsList.size(); i11++) {
                            ((fe.z) a0Var.o.get(i11)).f55113b = (z1) listAsList.get(i11);
                        }
                    }
                    if (a0Var.J) {
                        if (e0Var.f54746b.f54765b.equals(a0Var.f54691j0.f54765b) && e0Var.f54746b.f54767d == a0Var.f54691j0.f54779r) {
                            z13 = false;
                        }
                        if (z13) {
                            if (z1Var.p() || e0Var.f54746b.f54765b.a()) {
                                j12 = e0Var.f54746b.f54767d;
                            } else {
                                f1 f1Var = e0Var.f54746b;
                                gf.w wVar = f1Var.f54765b;
                                long j13 = f1Var.f54767d;
                                Object obj = wVar.f57640a;
                                x1 x1Var = a0Var.n;
                                z1Var.g(obj, x1Var);
                                j12 = j13 + x1Var.f55079e;
                            }
                        }
                        j11 = j12;
                        z11 = z13;
                    } else {
                        j11 = -9223372036854775807L;
                        z11 = false;
                    }
                    a0Var.J = false;
                    a0Var.q0(e0Var.f54746b, 1, a0Var.K, false, z11, a0Var.I, j11, -1, false);
                    return;
                }
                return;
            case 3:
                gf.l0 l0Var = (gf.l0) this.f54434b;
                ke.s sVar = (ke.s) this.f54435c;
                l0Var.f57563x = l0Var.f57556q == null ? sVar : new ke.n(-9223372036854775807L);
                l0Var.f57564y = sVar.i();
                if (!l0Var.E && sVar.i() == -9223372036854775807L) {
                    z12 = true;
                }
                l0Var.f57565z = z12;
                l0Var.A = z12 ? 7 : 1;
                l0Var.f57548g.s(l0Var.f57564y, sVar.f(), l0Var.f57565z);
                if (l0Var.f57560u) {
                    return;
                }
                l0Var.x();
                return;
            case 4:
                View view = (View) this.f54434b;
                ScrollView scrollView = (ScrollView) this.f54435c;
                scrollView.scrollTo(0, ((int) lx.d.e(view, scrollView).y) - (scrollView.getMeasuredHeight() / 2));
                return;
            case 5:
                ((v9.k0) this.f54434b).f92421d.C((CharSequence) this.f54435c);
                return;
            case 6:
                h6.l lVar = (h6.l) this.f54434b;
                if (!((ArrayDeque) lVar.f59406d).offer((Runnable) this.f54435c)) {
                    throw new IllegalStateException("cannot enqueue any more runnables");
                }
                lVar.b();
                return;
            case 7:
                com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f54434b, (List) this.f54435c);
                return;
            case 8:
                com.amplitude.android.sessionreplay.a.a((com.amplitude.android.sessionreplay.a) this.f54434b, (SessionReplayConfig) this.f54435c);
                return;
            case 9:
                he.k kVar = (he.k) this.f54434b;
                synchronized (((ie.e) this.f54435c)) {
                }
                fe.x xVar = kVar.f59745b;
                int i12 = wf.v.f94376a;
                ge.f fVar = xVar.f55061a.f54699r;
                fVar.g(fVar.c((gf.w) fVar.f57396d.f18213e), 1013, new ge.c(7));
                return;
            case 10:
                AudioTrack audioTrack = (AudioTrack) this.f54434b;
                bg.g gVar = (bg.g) this.f54435c;
                try {
                    audioTrack.flush();
                    audioTrack.release();
                    gVar.d();
                    synchronized (he.y.f59805d0) {
                        try {
                            int i13 = he.y.f59807f0 - 1;
                            he.y.f59807f0 = i13;
                            if (i13 == 0) {
                                he.y.f59806e0.shutdown();
                                he.y.f59806e0 = null;
                            }
                        } finally {
                        }
                    }
                    return;
                } catch (Throwable th2) {
                    gVar.d();
                    synchronized (he.y.f59805d0) {
                        try {
                            int i14 = he.y.f59807f0 - 1;
                            he.y.f59807f0 = i14;
                            if (i14 == 0) {
                                he.y.f59806e0.shutdown();
                                he.y.f59806e0 = null;
                            }
                            throw th2;
                        } finally {
                        }
                    }
                }
            case 11:
                FilePreferences.a((File) this.f54434b, (HashMap) this.f54435c);
                return;
            case 12:
                ((io.sentry.l) this.f54434b).f((f4) this.f54435c);
                return;
            case 13:
                ((io.sentry.o0) this.f54435c).i(((io.sentry.a0) this.f54434b).f66733a.getShutdownTimeoutMillis());
                return;
            case 14:
                ActivityLifecycleIntegration.c((io.sentry.q0) this.f54434b, (io.sentry.q0) this.f54435c);
                return;
            case 15:
                AnrIntegration anrIntegration = (AnrIntegration) this.f54434b;
                SentryAndroidOptions sentryAndroidOptions = (SentryAndroidOptions) this.f54435c;
                synchronized (anrIntegration.f66772c) {
                    try {
                        if (!anrIntegration.f66771b) {
                            anrIntegration.a(sentryAndroidOptions);
                        }
                    } finally {
                    }
                }
                return;
            case 16:
                a();
                return;
            case 17:
                b();
                return;
            case 18:
                c();
                return;
            case 19:
                io.sentry.android.core.internal.util.o oVar = (io.sentry.android.core.internal.util.o) this.f54434b;
                io.sentry.android.core.j jVar = (io.sentry.android.core.j) this.f54435c;
                try {
                    oVar.f66981j = Choreographer.getInstance();
                    return;
                } catch (Throwable th3) {
                    jVar.e(g3.ERROR, "Error retrieving Choreographer instance. Slow and frozen frames will not be reported.", th3);
                    return;
                }
            case 20:
                ((io.sentry.cache.f) this.f54434b).c((Collection) this.f54435c, "breadcrumbs.json");
                return;
            case 21:
                io.sentry.cache.f fVar2 = (io.sentry.cache.f) this.f54434b;
                String str = (String) this.f54435c;
                if (str == null) {
                    io.sentry.cache.a.a(fVar2.f67167a, ".scope-cache", "transaction.json");
                    return;
                } else {
                    fVar2.c(str, "transaction.json");
                    return;
                }
            case 22:
                io.sentry.cache.f fVar3 = (io.sentry.cache.f) this.f54434b;
                Runnable runnable = (Runnable) this.f54435c;
                fVar3.getClass();
                try {
                    runnable.run();
                    return;
                } catch (Throwable th4) {
                    fVar3.f67167a.getLogger().e(g3.ERROR, "Serialization task failed", th4);
                    return;
                }
            case 23:
                ((io.sentry.cache.f) this.f54434b).c((io.sentry.protocol.c) this.f54435c, "contexts.json");
                return;
            case 24:
                com.vungle.ads.internal.platform.c.a((com.vungle.ads.internal.platform.c) this.f54434b, (z4.a) this.f54435c);
                return;
            case 25:
                CredentialProviderPlayServicesImpl.onClearCredential$lambda$3$0$0((f5.d) this.f54434b, (Ref.ObjectRef) this.f54435c);
                return;
            case 26:
                CredentialProviderPlayServicesImpl.runFallbackClearCredFlow$lambda$2$0$0$0((f5.d) this.f54434b, (Exception) this.f54435c);
                return;
            case 27:
                ((as.d0) ((f5.d) this.f54434b)).b(this.f54435c);
                return;
            case 28:
                ((as.d0) ((f5.d) this.f54434b)).c((f5.m) this.f54435c);
                return;
            default:
                PopupContainerWithArrow popupContainerWithArrow = (PopupContainerWithArrow) this.f54434b;
                List list = (List) this.f54435c;
                NotificationContainer notificationContainer = popupContainerWithArrow.S;
                if (notificationContainer != null) {
                    NotificationMainView notificationMainView = notificationContainer.f21184g;
                    NotificationMainView notificationMainView2 = notificationContainer.f21183f;
                    ArrayList arrayList = notificationContainer.f21179b;
                    arrayList.clear();
                    if (list.isEmpty()) {
                        notificationMainView2.f21186a = null;
                        notificationMainView.f21186a = null;
                        return;
                    } else {
                        arrayList.addAll(list);
                        notificationMainView2.a((ha.c) list.get(0));
                        notificationMainView.a(list.size() > 1 ? (ha.c) list.get(1) : null);
                        return;
                    }
                }
                return;
        }
    }

    public /* synthetic */ l0(fb.c cVar, String str, ArrayList arrayList) {
        this.f54433a = 1;
        this.f54434b = cVar;
        this.f54435c = arrayList;
    }

    public /* synthetic */ l0(ActivityLifecycleIntegration activityLifecycleIntegration, io.sentry.q0 q0Var, io.sentry.q0 q0Var2) {
        this.f54433a = 14;
        this.f54434b = q0Var;
        this.f54435c = q0Var2;
    }
}
