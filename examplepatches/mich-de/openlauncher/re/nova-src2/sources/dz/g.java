package dz;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.PowerManager;
import android.os.RemoteException;
import android.os.SystemClock;
import bh.k;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import com.google.android.gms.internal.measurement.k2;
import com.teslacoilsw.launcher.NovaLauncher;
import e10.q0;
import e10.u2;
import e10.y2;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Iterator;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Ref;
import kotlin.reflect.KProperty;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;
import w20.m;

/* loaded from: classes4.dex */
public final class g implements LauncherOverlayManager, LauncherOverlayManager.LauncherOverlay, j0 {

    /* renamed from: b, reason: collision with root package name */
    public final NovaLauncher f49884b;

    /* renamed from: c, reason: collision with root package name */
    public LauncherOverlayManager.LauncherOverlayCallbacks f49885c;

    /* renamed from: d, reason: collision with root package name */
    public yi.d f49886d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f49887e;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y70.d f49883a = k0.b();

    /* renamed from: f, reason: collision with root package name */
    public long f49888f = Long.MIN_VALUE;

    /* renamed from: g, reason: collision with root package name */
    public int f49889g = 1000;

    /* renamed from: h, reason: collision with root package name */
    public long f49890h = Long.MIN_VALUE;

    public g(NovaLauncher novaLauncher) {
        this.f49884b = novaLauncher;
    }

    public static final void a(g gVar, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, Ref.ObjectRef objectRef) {
        yi.d dVar = gVar.f49886d;
        if (dVar != null) {
            Object obj = objectRef.f71863a;
            boolean z11 = obj == q0.f51754b || (obj == q0.f51755c && booleanRef.f71859a);
            boolean z12 = booleanRef2.f71859a;
            Bundle bundle = dVar.o;
            bundle.clear();
            if (z12) {
                bundle.putInt("system_ui_visibility", 4);
            }
            bundle.putBoolean("is_background_dark", z11);
            if (yi.d.f97329p >= 7) {
                dVar.g();
            }
        }
    }

    public final void b(boolean z11) {
        this.f49889g = 1000;
        y2.f51877a.getClass();
        if (!((Boolean) y2.Y0().l()).booleanValue()) {
            NovaLauncher novaLauncher = this.f49884b;
            if (z11 != (novaLauncher.O.S0 != null)) {
                novaLauncher.setLauncherOverlay(z11 ? this : null);
            }
        }
        if (z11) {
            return;
        }
        LauncherOverlayManager.LauncherOverlayCallbacks launcherOverlayCallbacks = this.f49885c;
        if (launcherOverlayCallbacks != null) {
            launcherOverlayCallbacks.onScrollChanged(0.0f);
        }
        this.f49887e = false;
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void dump(String str, PrintWriter printWriter) {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            printWriter.println(String.valueOf(str).concat("LauncherClient"));
            String strConcat = String.valueOf(str).concat("  ");
            StringBuilder sbK = k2.k(strConcat, "isConnected: ");
            sbK.append(dVar.f97337h != null);
            printWriter.println(sbK.toString());
            printWriter.println(strConcat + "act.isBound: " + dVar.f97334e.f97345c);
            printWriter.println(strConcat + "app.isBound: " + dVar.f97335f.f97345c);
            printWriter.println(strConcat + "serviceVersion: " + yi.d.f97329p);
            printWriter.println(strConcat + "clientVersion: 14");
            printWriter.println(strConcat + "mActivityState: " + dVar.f97338i);
            String str2 = strConcat + "mServiceStatus: " + dVar.f97340k;
            StringBuilder sbK2 = k2.k(strConcat, "mCurrentServiceConnectionOptions: ");
            sbK2.append(dVar.f97341l);
            Iterator it = Arrays.asList(str2, sbK2.toString()).iterator();
            while (it.hasNext()) {
                printWriter.println((String) it.next());
            }
            dVar.f97332c.k(strConcat, printWriter);
            dVar.f97333d.k(strConcat, printWriter);
        }
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f49883a.f96790a;
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void hideOverlay(boolean z11) {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.f("hideOverlay", z11);
            aj.a aVar = dVar.f97337h;
            if (aVar != null) {
                try {
                    aj.c cVar = (aj.c) aVar;
                    Parcel parcelT = cVar.T();
                    parcelT.writeInt(z11 ? 1 : 0);
                    cVar.Z(parcelT, 6);
                } catch (RemoteException unused) {
                }
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final boolean isShowing() {
        return this.f49887e;
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityCreated(Activity activity, Bundle bundle) {
        this.f49886d = new yi.d(this.f49884b, this, new k(8));
        this.f49887e = false;
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        y2 y2Var = y2.f51877a;
        y2Var.getClass();
        u2 u2Var = y2.f51884b2;
        KProperty kProperty = y2.f51881b[154];
        u2Var.getClass();
        objectRef.f71863a = u2Var.l();
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        py.c.f83128b.getClass();
        booleanRef.f71859a = py.c.d();
        Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
        booleanRef2.f71859a = ((Boolean) y2Var.w1().l()).booleanValue();
        m0.t(this, null, null, new b(this, null, booleanRef, booleanRef2, objectRef), 3);
        m0.t(this, null, null, new d(this, null, booleanRef2, booleanRef, objectRef), 3);
        m0.t(this, null, null, new f(this, null, booleanRef, booleanRef2, objectRef), 3);
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityDestroyed(Activity activity) {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            Activity activity2 = dVar.f97330a;
            boolean zIsChangingConfigurations = activity2.isChangingConfigurations();
            if (!dVar.f97339j) {
                activity2.unregisterReceiver(dVar.f97336g);
            }
            dVar.f97339j = true;
            dVar.f97334e.m();
            yi.c cVar = dVar.n;
            if (cVar != null) {
                cVar.f97325c = null;
                cVar.f97326d = null;
                cVar.f97328f = null;
                dVar.n = null;
            }
            yi.a aVar = dVar.f97335f;
            WeakReference weakReference = aVar.f97317e;
            yi.d dVar2 = weakReference != null ? (yi.d) weakReference.get() : null;
            if (dVar2 != null && dVar2.equals(dVar)) {
                aVar.f97317e = null;
                if (!zIsChangingConfigurations) {
                    aVar.m();
                    if (yi.a.f97315g == aVar) {
                        yi.a.f97315g = null;
                    }
                }
            }
        }
        this.f49886d = null;
        k0.c(this, null);
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void onActivityFocusedResumed(Activity activity) {
        PowerManager powerManager = (PowerManager) activity.getApplicationContext().getSystemService(PowerManager.class);
        NovaLauncher novaLauncher = this.f49884b;
        if (novaLauncher.R0() && powerManager.isInteractive()) {
            if (("samsung".equalsIgnoreCase(Build.MANUFACTURER) || "ASUS".equalsIgnoreCase(Build.BRAND) || m.f93691a || m.f93697g) && SystemClock.elapsedRealtime() > this.f49890h + 86400000) {
                Intent intent = new Intent("com.teslacoilsw.BLANK_ACTIVITY");
                intent.setClassName("com.teslacoilsw.launcherclientproxy", "com.teslacoilsw.launcherclientproxy.BlankActivity");
                intent.addFlags(268500992);
                a80.e eVar = y0.f88884a;
                m0.t(novaLauncher, a80.d.f488c, null, new ar.d(this, intent, null, 19), 2);
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityPaused(Activity activity) {
        yi.d dVar = this.f49886d;
        if (dVar == null || dVar.f97339j) {
            return;
        }
        int i5 = dVar.f97338i & (-3);
        dVar.f97338i = i5;
        aj.a aVar = dVar.f97337h;
        if (aVar != null && dVar.f97342m != null) {
            try {
                if (yi.d.f97329p < 4) {
                    ((aj.c) aVar).X();
                } else {
                    ((aj.c) aVar).a0(i5);
                }
            } catch (RemoteException unused) {
            }
        }
        dVar.f97332c.b(dVar.f97338i, "stateChanged ");
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityResumed(Activity activity) {
        yi.d dVar = this.f49886d;
        if (dVar != null && !dVar.f97339j) {
            int i5 = dVar.f97338i | 2;
            dVar.f97338i = i5;
            aj.a aVar = dVar.f97337h;
            if (aVar != null && dVar.f97342m != null) {
                try {
                    if (yi.d.f97329p < 4) {
                        ((aj.c) aVar).Y();
                    } else {
                        ((aj.c) aVar).a0(i5);
                    }
                } catch (RemoteException unused) {
                }
            }
            dVar.f97332c.b(dVar.f97338i, "stateChanged ");
        }
        PowerManager powerManager = (PowerManager) activity.getSystemService(PowerManager.class);
        NovaLauncher novaLauncher = this.f49884b;
        if ((novaLauncher.A & 2) == 0 || !powerManager.isInteractive() || this.f49888f + this.f49889g >= SystemClock.uptimeMillis()) {
            return;
        }
        a80.e eVar = y0.f88884a;
        m0.t(novaLauncher, a80.d.f488c, null, new c4.k(this, activity, null, 6), 2);
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStarted(Activity activity) {
        yi.d dVar = this.f49886d;
        if (dVar == null || dVar.f97339j) {
            return;
        }
        dVar.f97335f.f97318f = false;
        dVar.e();
        int i5 = dVar.f97338i | 1;
        dVar.f97338i = i5;
        aj.a aVar = dVar.f97337h;
        if (aVar != null && dVar.f97342m != null) {
            try {
                ((aj.c) aVar).a0(i5);
            } catch (RemoteException unused) {
            }
        }
        dVar.f97332c.b(dVar.f97338i, "stateChanged ");
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager, android.app.Application.ActivityLifecycleCallbacks
    public final void onActivityStopped(Activity activity) {
        yi.d dVar = this.f49886d;
        if (dVar != null && !dVar.f97339j) {
            yi.a aVar = dVar.f97335f;
            aVar.f97318f = true;
            if (aVar.f97316d == null) {
                aVar.m();
            }
            dVar.f97334e.m();
            int i5 = dVar.f97338i;
            dVar.f97338i = i5;
            aj.a aVar2 = dVar.f97337h;
            if (aVar2 != null && dVar.f97342m != null) {
                try {
                    ((aj.c) aVar2).a0(i5);
                } catch (RemoteException unused) {
                }
            }
            dVar.f97332c.b(dVar.f97338i, "stateChanged ");
        }
        LauncherOverlayManager.LauncherOverlayCallbacks launcherOverlayCallbacks = this.f49885c;
        if (launcherOverlayCallbacks != null) {
            launcherOverlayCallbacks.onScrollChanged(0.0f);
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void onAttachedToWindow() {
        yi.d dVar = this.f49886d;
        if (dVar == null || dVar.f97339j) {
            return;
        }
        dVar.f97332c.e("attachedToWindow");
        dVar.f(dVar.f97330a.getWindow().getAttributes());
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void onDetachedFromWindow() {
        yi.d dVar = this.f49886d;
        if (dVar == null || dVar.f97339j) {
            return;
        }
        dVar.f97332c.e("detachedFromWindow");
        dVar.f(null);
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void onDeviceProvideChanged() {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.e("reattachOverlay");
            if (dVar.f97342m == null || yi.d.f97329p < 7) {
                return;
            }
            dVar.g();
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlay
    public final void onScrollChange(float f11, boolean z11) {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.d(1, "updateMove", f11);
            aj.a aVar = dVar.f97337h;
            if (aVar != null) {
                try {
                    aj.c cVar = (aj.c) aVar;
                    Parcel parcelT = cVar.T();
                    parcelT.writeFloat(f11);
                    cVar.Z(parcelT, 2);
                } catch (RemoteException unused) {
                }
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlay
    public final void onScrollInteractionBegin() {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.e("startMove");
            aj.a aVar = dVar.f97337h;
            if (aVar != null) {
                try {
                    aj.c cVar = (aj.c) aVar;
                    cVar.Z(cVar.T(), 1);
                } catch (RemoteException unused) {
                }
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlay
    public final void onScrollInteractionEnd() {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.e("endMove");
            aj.a aVar = dVar.f97337h;
            if (aVar != null) {
                try {
                    aj.c cVar = (aj.c) aVar;
                    cVar.Z(cVar.T(), 3);
                } catch (RemoteException unused) {
                }
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager
    public final void openOverlay() {
        yi.d dVar = this.f49886d;
        if (dVar != null) {
            dVar.f97332c.f("showOverlay", true);
            aj.a aVar = dVar.f97337h;
            if (aVar != null) {
                try {
                    aj.c cVar = (aj.c) aVar;
                    Parcel parcelT = cVar.T();
                    parcelT.writeInt(1);
                    cVar.Z(parcelT, 9);
                } catch (RemoteException unused) {
                }
            }
        }
    }

    @Override // com.android.systemui.plugins.shared.LauncherOverlayManager.LauncherOverlay
    public final void setOverlayCallbacks(LauncherOverlayManager.LauncherOverlayCallbacks launcherOverlayCallbacks) {
        this.f49885c = launcherOverlayCallbacks;
    }
}
