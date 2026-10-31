package o9;

import android.content.ComponentName;
import android.content.Context;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.LauncherApps;
import android.os.Build;
import android.os.Handler;
import android.service.notification.NotificationListenerService;
import com.android.launcher3.model.ModelDelegate;
import com.teslacoilsw.launcher.notificationlistener.NotificationListener;
import java.util.List;
import java.util.Objects;

/* loaded from: classes.dex */
public final class t1 implements ya.j0 {

    /* renamed from: h, reason: collision with root package name */
    public static final x7.c f80131h = new x7.c(new ll.i(13));

    /* renamed from: a, reason: collision with root package name */
    public final Context f80132a;

    /* renamed from: b, reason: collision with root package name */
    public final c2 f80133b;

    /* renamed from: c, reason: collision with root package name */
    public final fz.h0 f80134c;

    /* renamed from: d, reason: collision with root package name */
    public final fz.d0 f80135d;

    /* renamed from: e, reason: collision with root package name */
    public final z0 f80136e;

    /* renamed from: f, reason: collision with root package name */
    public final aa.h f80137f;

    /* renamed from: g, reason: collision with root package name */
    public final s1 f80138g;

    public t1(Context context) {
        Context applicationContext = context.getApplicationContext();
        List list = v1.f80192a;
        aa.h hVar = new aa.h();
        this.f80137f = hVar;
        this.f80132a = applicationContext;
        z0 z0Var = (z0) z0.f80267w.h(applicationContext);
        this.f80136e = z0Var;
        Context context2 = mx.g0.f77088a;
        fz.d0 d0VarG = mx.g0.g();
        this.f80135d = d0VarG;
        this.f80134c = d0VarG.O();
        c2 c2Var = new c2(applicationContext, this, d0VarG);
        this.f80133b = c2Var;
        hVar.h(new ae.m(d0VarG, 20));
        mx.g0.j(context.getApplicationContext());
        y0 y0Var = new y0() { // from class: o9.q1
            @Override // o9.y0
            public final void v(boolean z11) {
                t1 t1Var = this.f80076a;
                if (z11) {
                    synchronized (aa.g0.f589p) {
                        aa.g0.f590q = null;
                        aa.g0.f591r++;
                    }
                    fz.d0 d0Var = t1Var.f80135d;
                    z0 z0Var2 = t1Var.f80136e;
                    d0Var.f559e.post(new ba.a(d0Var, z0Var2.f80271d, z0Var2.f80270c, 0));
                    t1Var.f80133b.d();
                }
            }
        };
        synchronized (z0Var) {
            z0Var.f80287v.add(y0Var);
        }
        ((LauncherApps) applicationContext.getSystemService(LauncherApps.class)).registerCallback(c2Var);
        n10.a aVar = new n10.a(new r1(c2Var, 0));
        String[] strArr = {"android.intent.action.LOCALE_CHANGED", "android.intent.action.MANAGED_PROFILE_AVAILABLE", "android.intent.action.MANAGED_PROFILE_UNAVAILABLE", "android.intent.action.MANAGED_PROFILE_UNLOCKED"};
        IntentFilter intentFilter = new IntentFilter();
        for (int i5 = 0; i5 < 4; i5++) {
            intentFilter.addAction(strArr[i5]);
        }
        int i11 = Build.VERSION.SDK_INT;
        if (i11 >= 34) {
            applicationContext.registerReceiver(aVar, intentFilter, 0);
        } else {
            applicationContext.registerReceiver(aVar, intentFilter);
        }
        this.f80137f.h(new b80.a(13, this, aVar));
        bb.b bVar = (bb.b) bb.b.f17790h.h(this.f80132a);
        c2 c2Var2 = this.f80133b;
        Objects.requireNonNull(c2Var2);
        bVar.f17797f = new r1(c2Var2, 1);
        ja.h hVar2 = (ja.h) ja.h.f69294h.h(this.f80132a);
        c2 c2Var3 = this.f80133b;
        Objects.requireNonNull(c2Var3);
        this.f80137f.h(new ae.m(hVar2.a(new ae.m(c2Var3, 21)), 22));
        s1 s1Var = new s1(this);
        this.f80138g = s1Var;
        fz.h0 h0Var = this.f80134c;
        ya.x xVar = ya.j.f97149d;
        Handler handler = xVar.f97215a;
        h0Var.getClass();
        this.f80137f.h(new ae.m(new aa.e0(h0Var, s1Var, handler), 23));
        xVar.execute(new ae.m(s1Var, 24));
        if (u9.b.f90698k.b()) {
            SharedPreferences sharedPreferencesL = g3.l(this.f80132a);
            sharedPreferencesL.registerOnSharedPreferenceChangeListener(s1Var);
            this.f80137f.h(new b80.a(14, sharedPreferencesL, s1Var));
        }
        ja.a aVar2 = (ja.a) ja.a.f69271f.h(context);
        c2 c2Var4 = this.f80133b;
        aVar2.getClass();
        ja.c cVar = new ja.c(aVar2, c2Var4, aVar2.f69274c, aVar2.f69272a);
        if (i11 < 29) {
            cVar.f69280d.registerSessionCallback(cVar, xVar.f97215a);
        } else {
            cVar.f69281e.registerPackageInstallerSessionCallback(xVar, cVar);
        }
        this.f80137f.h(new ae.m(cVar, 19));
        if (e10.a3.f51435a.f51555k) {
            NotificationListenerService.requestRebind(new ComponentName(this.f80132a, (Class<?>) NotificationListener.class));
        }
    }

    public static z0 a(Context context) {
        return (z0) z0.f80267w.h(context);
    }

    public static t1 c(Context context) {
        return (t1) f80131h.h(context);
    }

    public static t1 d() {
        return (t1) f80131h.f95127b;
    }

    public final fz.d0 b() {
        return this.f80135d;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        c2 c2Var = this.f80133b;
        c2Var.f79792f = true;
        ya.x xVar = ya.j.f97149d;
        ModelDelegate modelDelegate = c2Var.f79796j;
        Objects.requireNonNull(modelDelegate);
        xVar.execute(new g.p(modelDelegate, 27));
        Context context = this.f80132a;
        ((LauncherApps) context.getSystemService(LauncherApps.class)).unregisterCallback(c2Var);
        ((bb.b) bb.b.f17790h.h(context)).f17797f = null;
        this.f80137f.j();
    }
}
