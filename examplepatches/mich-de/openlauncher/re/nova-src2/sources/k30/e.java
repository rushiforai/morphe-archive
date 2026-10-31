package k30;

import a5.h2;
import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewStartUpResult;
import com.android.launcher3.CellLayout;
import com.android.launcher3.LauncherWallpaperPickerActivity;
import com.android.launcher3.WallpaperCropActivity;
import com.android.launcher3.Workspace;
import com.android.launcher3.allapps.AllAppsContainerView;
import com.google.android.exoplayer2.mediacodec.MediaCodecUtil$DecoderQueryException;
import com.google.android.gms.tasks.Task;
import com.google.firebase.messaging.FirebaseMessagingRegistrar;
import com.teslacoilsw.launcher.ChooseActionIntentActivity;
import com.teslacoilsw.launcher.EditShortcutFloatingView;
import com.teslacoilsw.launcher.NovaDeviceAdminReceiver;
import com.teslacoilsw.launcher.NovaLauncher;
import e00.t5;
import e10.s2;
import fa.p0;
import java.io.IOException;
import java.util.concurrent.ScheduledFuture;
import kotlin.jvm.internal.Intrinsics;
import o9.l2;
import o9.n3;
import o9.y3;
import s90.a1;
import s90.b1;
import s90.x0;
import t70.q0;

/* loaded from: classes4.dex */
public final /* synthetic */ class e implements d9.i, fi.g, a5.a0, WebViewCompat.WebViewStartUpCallback, nx.n, com.vungle.ads.internal.ui.view.b, ke.c, d9.g, mb0.b, ya.w, uk.a, kw.p, b1, d4.i, bm.e, fi.c, fi.e, we.r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70932a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f70933b;

    public /* synthetic */ e(Object obj, int i5) {
        this.f70932a = i5;
        this.f70933b = obj;
    }

    @Override // com.vungle.ads.internal.ui.view.b
    public void a(float f11, float f12) {
        com.vungle.ads.internal.ui.view.m.a((com.vungle.ads.internal.ui.view.m) this.f70933b, f11, f12);
    }

    @Override // mb0.b
    /* renamed from: b */
    public void mo5b(Object obj) {
        LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = ((n3) this.f70933b).f80033b;
        ((y3) launcherWallpaperPickerActivity.f20974s.getTag()).e(launcherWallpaperPickerActivity, ((Integer) obj).intValue());
    }

    @Override // ke.c
    public long c(long j11) {
        return wf.v.i((j11 * r0.f71415e) / 1000000, 0L, ((ke.o) this.f70933b).f71420j - 1);
    }

    @Override // d9.i
    public void d(d9.c cVar) {
        int i5 = this.f70932a;
        Object obj = this.f70933b;
        switch (i5) {
            case 0:
                ((g.o) obj).startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
                break;
            case 16:
                q10.f fVar = q10.l.f83451c;
                Object systemService = ((Context) obj).getSystemService("device_policy");
                Intrinsics.e(systemService, "null cannot be cast to non-null type android.app.admin.DevicePolicyManager");
                ((DevicePolicyManager) systemService).removeActiveAdmin(NovaDeviceAdminReceiver.f45645a);
                break;
            default:
                ((s2) obj).a();
                break;
        }
    }

    @Override // uk.a
    public void e(ex.a aVar) {
        ((t5) this.f70933b).invoke();
    }

    @Override // nx.n
    public void f(Intent intent) {
        ChooseActionIntentActivity chooseActionIntentActivity = (ChooseActionIntentActivity) this.f70933b;
        int i5 = ChooseActionIntentActivity.f45591t;
        chooseActionIntentActivity.setResult(-1, intent);
        chooseActionIntentActivity.finish();
    }

    @Override // d4.i
    public Object g(d4.h hVar) {
        q0 q0Var = (q0) this.f70933b;
        q0Var.w(new b0.e(22, hVar, q0Var));
        return "Deferred.asListenableFuture";
    }

    @Override // we.r
    public int h(Object obj) {
        try {
            return ((we.l) obj).c((fe.k0) this.f70933b) ? 1 : 0;
        } catch (MediaCodecUtil$DecoderQueryException unused) {
            return -1;
        }
    }

    @Override // d9.g
    public void j(d9.j jVar, int i5) {
        mb0.b bVar = (mb0.b) this.f70933b;
        Point point = WallpaperCropActivity.f20987r;
        bVar.mo5b(Integer.valueOf(i5 != 0 ? i5 != 1 ? 3 : 2 : 1));
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        Workspace workspace = (Workspace) this.f70933b;
        int i5 = Workspace.f20990m1;
        int iM0 = workspace.M0((CellLayout) view.getParent().getParent());
        if (iM0 == eVar.f57292d) {
            return false;
        }
        eVar.f57292d = iM0;
        p0 p0Var = workspace.f21013s0.f80002c0;
        p0Var.getClass();
        p0Var.k(eVar, eVar.f57291c, eVar.f57292d, eVar.f57293e, eVar.f57294f);
        return false;
    }

    @Override // fi.e
    public void onComplete(Task task) {
        switch (this.f70932a) {
            case 25:
                tm.x.b((Intent) this.f70933b);
                break;
            case 26:
                ((tm.z) this.f70933b).f89540b.c(null);
                break;
            default:
                ((ScheduledFuture) this.f70933b).cancel(false);
                break;
        }
    }

    @Override // fi.g
    public void onSuccess(Object obj) {
        switch (this.f70932a) {
            case 2:
                ((jt.e) this.f70933b).invoke(obj);
                break;
            default:
                ((b10.r) this.f70933b).invoke(obj);
                break;
        }
    }

    @Override // bm.e
    public Object q(bm.t tVar) {
        return FirebaseMessagingRegistrar.lambda$getComponents$0((bm.r) this.f70933b, tVar);
    }

    @Override // s90.b1
    /* renamed from: run */
    public void mo109run() throws Exception {
        switch (this.f70932a) {
            case 20:
                ((q90.a) this.f70933b).close();
                break;
            default:
                x0 x0Var = (x0) this.f70933b;
                a1 a1Var = x0Var.f87058d;
                if (a1Var.f86858f.compareAndSet(1, 4)) {
                    x0Var.f87055a.onResponseStarted(a1Var, a1Var.o);
                    break;
                }
                break;
        }
    }

    @Override // fi.c
    public Object then(Task task) throws IOException {
        ((bn.i) this.f70933b).getClass();
        Bundle bundle = (Bundle) task.n();
        if (bundle == null) {
            throw new IOException("SERVICE_NOT_AVAILABLE");
        }
        String string = bundle.getString("registration_id");
        if (string != null) {
            return string;
        }
        String string2 = bundle.getString("unregistered");
        if (string2 != null) {
            return string2;
        }
        String string3 = bundle.getString("error");
        if ("RST".equals(string3)) {
            throw new IOException("INSTANCE_ID_RESET");
        }
        if (string3 != null) {
            throw new IOException(string3);
        }
        Log.w("FirebaseMessaging", "Unexpected response: " + bundle, new Throwable());
        throw new IOException("SERVICE_NOT_AVAILABLE");
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        int i5 = this.f70932a;
        Object obj = this.f70933b;
        switch (i5) {
            case 3:
                break;
            case 7:
                int i11 = EditShortcutFloatingView.f45599v;
                ((EditShortcutFloatingView) obj).g0(h2Var);
                break;
            default:
                AllAppsContainerView allAppsContainerView = (AllAppsContainerView) obj;
                NovaLauncher novaLauncher = (NovaLauncher) allAppsContainerView.f21023e;
                novaLauncher.getClass();
                if (novaLauncher.t0(l2.o) && o9.a.P(novaLauncher, 7471103) == null) {
                    boolean z11 = h2Var.f296a.g(8).bottom > 0;
                    allAppsContainerView.O = z11;
                    allAppsContainerView.w(z11);
                    break;
                }
                break;
        }
        return h2Var;
    }

    @Override // kw.p
    public kw.q a() {
        return ((com.stripe.android.paymentsheet.addresselement.i) this.f70933b).f44735b;
    }

    @Override // androidx.webkit.WebViewCompat.WebViewStartUpCallback
    public void onSuccess(WebViewStartUpResult webViewStartUpResult) {
        WebViewCompat.WebViewStartUpCallback webViewStartUpCallback = (WebViewCompat.WebViewStartUpCallback) this.f70933b;
        Uri uri = WebViewCompat.f15309a;
        new Handler(Looper.getMainLooper()).post(new kz.c(7, webViewStartUpCallback, webViewStartUpResult));
    }
}
