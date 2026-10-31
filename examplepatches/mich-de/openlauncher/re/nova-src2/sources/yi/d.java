package yi;

import ai.r4;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.os.RemoteException;
import android.view.WindowManager;
import b.u4;
import bh.k;
import dz.g;
import e10.f0;
import e10.y2;
import mx.g0;
import o9.d4;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: p, reason: collision with root package name */
    public static int f97329p = -1;

    /* renamed from: a, reason: collision with root package name */
    public final Activity f97330a;

    /* renamed from: b, reason: collision with root package name */
    public final g f97331b;

    /* renamed from: c, reason: collision with root package name */
    public final c00.d f97332c;

    /* renamed from: d, reason: collision with root package name */
    public final c00.d f97333d;

    /* renamed from: e, reason: collision with root package name */
    public final e f97334e;

    /* renamed from: f, reason: collision with root package name */
    public final a f97335f;

    /* renamed from: g, reason: collision with root package name */
    public final r4 f97336g;

    /* renamed from: h, reason: collision with root package name */
    public aj.a f97337h;

    /* renamed from: i, reason: collision with root package name */
    public int f97338i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f97339j;

    /* renamed from: k, reason: collision with root package name */
    public int f97340k;

    /* renamed from: l, reason: collision with root package name */
    public final int f97341l;

    /* renamed from: m, reason: collision with root package name */
    public WindowManager.LayoutParams f97342m;
    public c n;
    public final Bundle o = new Bundle();

    public d(Activity activity, g gVar, k kVar) {
        c00.d dVar = new c00.d("Client", 20);
        this.f97332c = dVar;
        this.f97333d = new c00.d("Service", 10);
        r4 r4Var = new r4(this, 6);
        this.f97336g = r4Var;
        this.f97338i = 0;
        this.f97339j = false;
        this.f97340k = 0;
        this.f97330a = activity;
        this.f97331b = gVar;
        this.f97334e = new e(activity, 65);
        this.f97341l = kVar.f17909a;
        a aVarN = a.n(activity);
        this.f97335f = aVarN;
        this.f97337h = aVarN.o(this);
        IntentFilter intentFilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        intentFilter.addDataScheme("package");
        intentFilter.addDataSchemeSpecificPart("com.google.android.googlequicksearchbox", 0);
        intentFilter.addDataSchemeSpecificPart("com.teslacoilsw.launcherclientproxy", 0);
        activity.registerReceiver(r4Var, intentFilter);
        if (f97329p <= 0) {
            a(activity);
        }
        e();
        if (activity.getWindow() == null || activity.getWindow().peekDecorView() == null || !activity.getWindow().peekDecorView().isAttachedToWindow() || this.f97339j) {
            return;
        }
        dVar.e("attachedToWindow");
        f(activity.getWindow().getAttributes());
    }

    public static void a(Context context) {
        Bundle bundle;
        y2.f51877a.getClass();
        ResolveInfo resolveInfoResolveService = context.getPackageManager().resolveService(c(context, (f0) y2.e0().l()), 128);
        if (resolveInfoResolveService == null || (bundle = resolveInfoResolveService.serviceInfo.metaData) == null) {
            f97329p = 1;
        } else {
            f97329p = bundle.getInt("service.api.version", 1);
        }
    }

    public static Intent b(Context context) {
        y2.f51877a.getClass();
        f0 f0Var = (f0) y2.e0().l();
        Context context2 = g0.f77088a;
        if (g0.o() || f0Var == f0.f51518d) {
            return c(context, f0Var);
        }
        Intent className = new Intent().setClassName("com.teslacoilsw.launcherclientproxy", "com.teslacoilsw.launcherclientproxy.GoogleOverlayProxyService");
        className.putExtra("googleServiceApiVersion", 9);
        return className;
    }

    public static Intent c(Context context, f0 f0Var) {
        String packageName = context.getPackageName();
        Intent intent = new Intent("com.android.launcher3.WINDOW_OVERLAY").setPackage(f0Var == f0.f51517c ? "com.google.android.googlequicksearchbox" : f0Var == f0.f51518d ? "com.kieronquinn.app.smartspacer" : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        StringBuilder sbK = u4.k("app://", packageName, ":");
        sbK.append(Process.myUid());
        return intent.setData(Uri.parse(sbK.toString()).buildUpon().appendQueryParameter("v", Integer.toString(9)).appendQueryParameter("cv", Integer.toString(14)).build());
    }

    public final void d(int i5) {
        if (this.f97340k != i5) {
            this.f97340k = i5;
            this.f97331b.b((i5 & 1) != 0);
        }
    }

    public final void e() {
        if (this.f97339j) {
            return;
        }
        if (this.f97335f.l() && this.f97334e.l()) {
            return;
        }
        this.f97330a.runOnUiThread(new d4(this, 21));
    }

    public final void f(WindowManager.LayoutParams layoutParams) {
        if (this.f97342m != layoutParams) {
            this.f97342m = layoutParams;
            if (layoutParams != null) {
                g();
                return;
            }
            aj.a aVar = this.f97337h;
            if (aVar != null) {
                try {
                    ((aj.c) aVar).W(this.f97330a.isChangingConfigurations());
                } catch (RemoteException unused) {
                }
                this.f97337h = null;
            }
        }
    }

    public final void g() {
        if (this.f97337h != null) {
            try {
                if (this.n == null) {
                    this.n = new c();
                }
                this.n.Y(this);
                int i5 = f97329p;
                int i11 = this.f97341l;
                if (i5 < 3) {
                    ((aj.c) this.f97337h).U(this.f97342m, this.n, i11);
                } else {
                    Bundle bundle = new Bundle();
                    bundle.putParcelable("layout_params", this.f97342m);
                    bundle.putParcelable("configuration", this.f97330a.getResources().getConfiguration());
                    bundle.putInt("client_options", i11);
                    bundle.putAll(this.o);
                    ((aj.c) this.f97337h).V(bundle, this.n);
                }
                if (f97329p >= 4) {
                    ((aj.c) this.f97337h).a0(this.f97338i);
                } else if ((this.f97338i & 2) != 0) {
                    ((aj.c) this.f97337h).Y();
                } else {
                    ((aj.c) this.f97337h).X();
                }
            } catch (RemoteException unused) {
            }
        }
    }
}
