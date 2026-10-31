package kz;

import ab.o;
import ai.x0;
import android.animation.ValueAnimator;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInstaller;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Trace;
import android.os.UserHandle;
import android.text.TextUtils;
import android.util.Log;
import androidx.compose.ui.platform.ComposeView;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewStartUpResult;
import as.d0;
import b3.h0;
import com.android.launcher3.AppWidgetResizeFrame;
import com.android.launcher3.BubbleTextView;
import com.android.launcher3.CellLayout;
import com.android.launcher3.SessionCommitReceiver;
import com.android.launcher3.Workspace;
import com.android.launcher3.folder.FolderNameProvider;
import com.android.launcher3.util.PendingRequestArgs;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.search.AppSearchResultsView;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import com.vungle.ads.internal.ui.view.n;
import com.vungle.ads.internal.ui.z;
import com.vungle.ads.internal.util.p;
import fa.w;
import fa.x;
import h10.y0;
import java.io.File;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.stream.Collectors;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import m.q;
import o9.g3;
import o9.h2;
import o9.l0;
import o9.l2;
import o9.n1;
import o9.p0;
import o9.z0;
import s90.a1;
import s90.g1;
import s90.h1;
import s90.o0;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72856a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f72857b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f72858c;

    public /* synthetic */ c(int i5, Object obj, Object obj2) {
        this.f72856a = i5;
        this.f72857b = obj;
        this.f72858c = obj2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = 3;
        int i11 = 4;
        int i12 = 1;
        switch (this.f72856a) {
            case 0:
                ox.l lVar = (ox.l) this.f72857b;
                y0 y0Var = new y0((CrosshairsCellLayout) this.f72858c, 29);
                if (qx.l.f84545g.h()) {
                    lVar.post(new com.amplitude.android.internal.gestures.c(lVar, px.c.f83110a.e(lVar.getContext()), y0Var, i5));
                    return;
                } else {
                    lVar.setVisibility(8);
                    return;
                }
            case 1:
                com.vungle.ads.internal.session.b.a((File) this.f72857b, (String) this.f72858c);
                return;
            case 2:
                ((d0) ((l5.b) this.f72857b).d()).b(((Ref.ObjectRef) this.f72858c).f71863a);
                return;
            case 3:
                ((d0) ((l5.b) this.f72857b).d()).b((GetCredentialUnknownException) this.f72858c);
                return;
            case 4:
                ((d0) ((l5.b) this.f72857b).d()).c((f5.m) this.f72858c);
                return;
            case 5:
                q qVar = (q) this.f72857b;
                Runnable runnable = (Runnable) this.f72858c;
                qVar.getClass();
                try {
                    runnable.run();
                    return;
                } finally {
                    qVar.a();
                }
            case 6:
                z.a((n) this.f72857b, (String) this.f72858c);
                return;
            case 7:
                WebViewCompat.WebViewStartUpCallback webViewStartUpCallback = (WebViewCompat.WebViewStartUpCallback) this.f72857b;
                WebViewStartUpResult webViewStartUpResult = (WebViewStartUpResult) this.f72858c;
                Uri uri = WebViewCompat.f15309a;
                webViewStartUpCallback.onSuccess(webViewStartUpResult);
                return;
            case 8:
                Ref.ObjectRef objectRef = (Ref.ObjectRef) this.f72857b;
                ga.j jVar = (ga.j) this.f72858c;
                ComponentName componentName = NovaLauncher.f45646r1;
                ((iz.a) objectRef.f71863a).Y0(jVar, false);
                return;
            case 9:
                p.a((String) this.f72857b, (Function1) this.f72858c);
                return;
            case 10:
                o9.p pVar = (o9.p) this.f72857b;
                pVar.d((l0) this.f72858c);
                pVar.f80046b.o();
                pVar.f80045a.M.h(l2.f79974m);
                return;
            case 11:
                l0 l0Var = (l0) this.f72857b;
                Context context = (Context) this.f72858c;
                l0Var.getClass();
                l0Var.f79961m = FolderNameProvider.b(context);
                return;
            case 12:
                p0 p0Var = (p0) this.f72857b;
                ValueAnimator valueAnimator = (ValueAnimator) this.f72858c;
                p0Var.getClass();
                valueAnimator.removeUpdateListener(p0Var);
                return;
            case 13:
                ((z0) this.f72857b).h((Context) this.f72858c);
                return;
            case 14:
                n1 n1Var = (n1) this.f72857b;
                PendingRequestArgs pendingRequestArgs = (PendingRequestArgs) this.f72858c;
                n1Var.getClass();
                CellLayout cellLayoutI0 = n1Var.I0(pendingRequestArgs.f57291c, pendingRequestArgs.f57292d);
                if (cellLayoutI0 != null) {
                    cellLayoutI0.T();
                    return;
                }
                return;
            case 15:
                Context context2 = (Context) this.f72857b;
                Intent intent = (Intent) this.f72858c;
                if (SessionCommitReceiver.a()) {
                    PackageInstaller.SessionInfo sessionInfo = (PackageInstaller.SessionInfo) intent.getParcelableExtra("android.content.pm.extra.SESSION");
                    UserHandle userHandle = (UserHandle) intent.getParcelableExtra("android.intent.extra.USER");
                    if (!"android.content.pm.action.SESSION_COMMITTED".equals(intent.getAction()) || sessionInfo == null || userHandle == null) {
                        return;
                    }
                    ja.a aVar = (ja.a) ja.a.f69271f.h(context2);
                    aVar.getClass();
                    Context context3 = aVar.f69273b;
                    if (u9.b.n.b() && sessionInfo.getInstallReason() == 2) {
                        h2.a(context3.getContentResolver(), "restore_backup_table");
                    }
                    if (!TextUtils.isEmpty(sessionInfo.getAppPackageName()) && sessionInfo.getInstallReason() == 4) {
                        if (!aVar.d().d(sessionInfo.getSessionId())) {
                            StringBuilder sb2 = new StringBuilder("Adding package name to install queue. Package name: ");
                            sb2.append(sessionInfo.getAppPackageName());
                            sb2.append(", has app icon: ");
                            sb2.append(sessionInfo.getAppIcon() != null);
                            sb2.append(", has app label: ");
                            sb2.append(!TextUtils.isEmpty(sessionInfo.getAppLabel()));
                            ea.b.h("SessionCommitReceiver", sb2.toString(), null);
                            x xVar = (x) x.f54523e.h(context2);
                            String appPackageName = sessionInfo.getAppPackageName();
                            xVar.getClass();
                            xVar.b(new w(appPackageName, userHandle));
                            return;
                        }
                    }
                    int sessionId = sessionInfo.getSessionId();
                    if (aVar.d().d(sessionId)) {
                        aVar.d().f97209a.o(sessionId);
                        g3.l(context3).edit().putString("promise_icon_ids", aVar.d().f97209a.r()).apply();
                        return;
                    }
                    return;
                }
                return;
            case 16:
                aa.h hVar = (aa.h) this.f72857b;
                androidx.fragment.app.d dVar = (androidx.fragment.app.d) this.f72858c;
                int i13 = Workspace.f20990m1;
                hVar.h(dVar);
                return;
            case 17:
                o oVar = (o) this.f72857b;
                CellLayout cellLayout = (CellLayout) this.f72858c;
                int i14 = Workspace.f20990m1;
                AppWidgetResizeFrame.X(oVar, cellLayout);
                return;
            case 18:
                Runnable runnable2 = (Runnable) this.f72857b;
                Runnable runnable3 = (Runnable) this.f72858c;
                int i15 = Workspace.f20990m1;
                runnable2.run();
                runnable3.run();
                return;
            case 19:
                p7.h hVar2 = (p7.h) this.f72857b;
                x7.i iVar = (x7.i) this.f72858c;
                synchronized (hVar2.f82346k) {
                    try {
                        Iterator it = hVar2.f82345j.iterator();
                        while (it.hasNext()) {
                            ((p7.c) it.next()).c(iVar, false);
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                return;
            case 20:
                p9.e eVar = (p9.e) this.f72857b;
                ga.e eVar2 = (ga.e) this.f72858c;
                n1 n1Var2 = eVar.f82473b;
                n1Var2.K(Collections.singletonList(eVar2), true);
                n1Var2.P.announceForAccessibility(n1Var2.getResources().getString(2132018077));
                return;
            case 21:
                pa.e eVar3 = (pa.e) this.f72857b;
                Set set = (Set) this.f72858c;
                HashSet hashSet = eVar3.f82488g;
                hashSet.clear();
                hashSet.addAll(set);
                eVar3.b();
                return;
            case 22:
                pa.e eVar4 = (pa.e) this.f72857b;
                eVar4.f82485d.edit().putStringSet("pinned_apps", (Set) ((HashSet) this.f72858c).stream().map(new pa.b(eVar4, i12)).collect(Collectors.toSet())).apply();
                return;
            case 23:
                ((q4.b) this.f72857b).g((Typeface) this.f72858c);
                return;
            case 24:
                x0 this$0 = (x0) this.f72857b;
                p7.m token = (p7.m) this.f72858c;
                Intrinsics.g(this$0, "this$0");
                Intrinsics.g(token, "$token");
                ((nx.l) this$0.f13459c).o(token, 3);
                return;
            case 25:
                ComposeView composeView = (ComposeView) this.f72857b;
                AppSearchResultsView appSearchResultsView = (AppSearchResultsView) this.f72858c;
                h0 h0Var = AppSearchResultsView.f46177o0;
                composeView.setContent(new x1.e(new r10.q(appSearchResultsView, i11), true, 200169623));
                return;
            case 26:
                ga.a aVar2 = (ga.a) this.f72857b;
                BubbleTextView bubbleTextView = (BubbleTextView) this.f72858c;
                h0 h0Var2 = AppSearchResultsView.f46177o0;
                ((s10.d) aVar2).F.e(bubbleTextView);
                return;
            case 27:
                try {
                    ((h1) this.f72857b).onRequestFinished((s90.m) this.f72858c);
                    return;
                } catch (Exception e3) {
                    Log.e("HttpEngineWrapper", "Exception thrown from observation task", e3);
                    return;
                }
            case 28:
                String str = (String) this.f72857b;
                o0 o0Var = (o0) this.f72858c;
                p90.a.a("JavaUploadDataSinkBase#executeOnExecutor " + str + " running callback");
                try {
                    o0Var.run();
                    Trace.endSection();
                    return;
                } catch (Throwable th3) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th4) {
                        th3.addSuppressed(th4);
                    }
                    throw th3;
                }
            default:
                a1 a1Var = (a1) this.f72857b;
                g1 g1Var = (g1) this.f72858c;
                s90.x0 x0Var = a1Var.f86853a;
                String str2 = a1Var.f86866p;
                x0Var.getClass();
                x0Var.b(new be.f(10, x0Var, g1Var, str2), "onRedirectReceived");
                return;
        }
    }
}
