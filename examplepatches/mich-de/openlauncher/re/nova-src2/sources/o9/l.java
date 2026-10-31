package o9;

import android.app.ActivityOptions;
import android.app.WallpaperManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.LauncherApps;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.os.Process;
import android.os.StrictMode;
import android.os.Trace;
import android.os.UserHandle;
import android.util.Log;
import android.view.ActionMode;
import android.view.View;
import com.android.launcher3.BubbleTextView;
import com.google.android.gms.internal.measurement.ag;
import com.teslacoilsw.launcher.NovaLauncher;
import java.util.ArrayList;

/* loaded from: classes.dex */
public abstract class l extends k implements ya.d {
    public static final Object H = new Object();
    public ActionMode C;
    public boolean D;
    public final aa.h E = new aa.h();
    public int F = 2132082707;
    public final g30.i G;

    public l() {
        this.G = g3.f79850e ? new g30.i(this, 1) : null;
    }

    @Override // ya.d
    public final void I(Context context, ya.e eVar, int i5) {
        if ((i5 & 2) == 0 || !this.f79934x.t(this)) {
            return;
        }
        p0();
    }

    public View.OnClickListener Q() {
        return ua.g.f90762b;
    }

    @Override // za.d
    public final boolean m() {
        ActionMode actionMode = this.C;
        if (actionMode == null || H != actionMode.getTag()) {
            return false;
        }
        this.C.finish();
        return true;
    }

    public final y90.f m0(View view) {
        int i5;
        int i11;
        int i12;
        int iHeight;
        aa.n nVar;
        this.E.h(new g.p(new aa.h(), 23));
        if (!g3.a()) {
            return new y90.f(ActivityOptions.makeCustomAnimation(this, 0, 0));
        }
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        if (!(view instanceof BubbleTextView) || (nVar = ((BubbleTextView) view).f20869f) == null) {
            i5 = measuredWidth;
            i11 = 0;
            i12 = 0;
            iHeight = measuredHeight;
        } else {
            Rect bounds = nVar.getBounds();
            int iWidth = (measuredWidth - bounds.width()) / 2;
            int paddingTop = view.getPaddingTop();
            int iWidth2 = bounds.width();
            i11 = iWidth;
            iHeight = bounds.height();
            i12 = paddingTop;
            i5 = iWidth2;
        }
        e10.y2.f51877a.getClass();
        return new y90.f(((e10.f) e10.y2.m().l()).g(this, view, i11, i12, i5, iHeight));
    }

    public abstract View n0();

    public boolean o0(Intent intent, ga.e eVar) {
        return false;
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onActionModeFinished(ActionMode actionMode) {
        super.onActionModeFinished(actionMode);
        this.C = null;
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final void onActionModeStarted(ActionMode actionMode) {
        super.onActionModeStarted(actionMode);
        this.C = actionMode;
    }

    @Override // g.o, android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.F != ya.l0.c(this)) {
            recreate();
        }
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Trace.beginSection("isSafeMode");
        try {
            boolean zIsSafeMode = getPackageManager().isSafeMode();
            Trace.endSection();
            this.D = zIsSafeMode;
            ((ya.g) ya.g.f97130h.h(this)).f97135e.add(this);
            if (g3.f79850e) {
                try {
                    ((WallpaperManager) getSystemService(WallpaperManager.class)).addOnColorsChangedListener(this.G, ya.j.f97147b.f97215a);
                } catch (Exception e3) {
                    mc0.d.b(e3);
                }
            }
            int iC = ya.l0.c(this);
            if (iC != this.F) {
                this.F = iC;
                setTheme(iC);
            }
        } catch (Throwable th2) {
            Trace.endSection();
            throw th2;
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        if (g3.f79850e) {
            ((WallpaperManager) getSystemService(WallpaperManager.class)).removeOnColorsChangedListener(this.G);
        }
        ((ya.g) ya.g.f97130h.h(this)).f97135e.remove(this);
    }

    @Override // o9.k, androidx.fragment.app.m0, android.app.Activity
    public void onResume() {
        super.onResume();
        aa.h hVar = this.E;
        ArrayList arrayList = (ArrayList) hVar.f593b;
        if (arrayList != null) {
            hVar.f593b = null;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                ((Runnable) arrayList.get(i5)).run();
            }
        }
    }

    public abstract void p0();

    /* JADX WARN: Removed duplicated region for block: B:37:0x0070 A[Catch: SecurityException -> 0x005f, ActivityNotFoundException -> 0x0062, NullPointerException -> 0x0065, TryCatch #2 {ActivityNotFoundException -> 0x0062, NullPointerException -> 0x0065, SecurityException -> 0x005f, blocks: (B:20:0x0049, B:22:0x004d, B:26:0x0054, B:37:0x0070, B:48:0x00e0, B:35:0x0068, B:39:0x0076, B:42:0x0081, B:44:0x0085, B:45:0x00c7, B:46:0x00db), top: B:63:0x0049 }] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0129  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean q0(View view, Intent intent, ga.e eVar) throws Exception {
        int i5;
        if (this.D && !x7.e.z(this, intent)) {
            com.google.android.gms.internal.consent_sdk.k0.w(this, 2132019440, 0).show();
            return false;
        }
        Bundle bundleG = view != null ? m0(view).g() : null;
        UserHandle userHandle = eVar != null ? eVar.o : null;
        if (bundleG == null) {
            bundleG = new Bundle();
        }
        bundleG.putInt("android.activity.splashScreenStyle", 1);
        intent.addFlags(268435456);
        if (view != null) {
            intent.setSourceBounds(g3.m(view));
        }
        try {
            if (!(eVar instanceof ga.j) || (((i5 = eVar.f57290b) != 1 && i5 != 6) || ((ga.j) eVar).O0(3))) {
                if (intent.hasCategory("com.android.launcher3.DEEP_SHORTCUT")) {
                    r0(intent, bundleG, eVar);
                } else if (userHandle == null || userHandle.equals(Process.myUserHandle())) {
                    startActivity(intent, bundleG);
                } else {
                    if (this instanceof NovaLauncher) {
                        db0.q0 q0Var = ((NovaLauncher) this).f45658f1;
                        String packageName = intent.getComponent().getPackageName();
                        String className = intent.getComponent().getClassName();
                        long jC = ((ja.h) ja.h.f69294h.h(this)).c(userHandle);
                        q0Var.getClass();
                        db0.m mVar = db0.c0.Companion;
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        mVar.getClass();
                        db0.f0.Companion.getClass();
                        q0Var.c(new db0.s(db0.e0.a(packageName), db0.e0.a(className), jC, jCurrentTimeMillis));
                    }
                    ((LauncherApps) getSystemService(LauncherApps.class)).startMainActivity(intent.getComponent(), userHandle, intent.getSourceBounds(), bundleG);
                }
            }
            if (eVar != null) {
                new ag(1, false).m();
                O().a().a(eVar).b(ea.d.LAUNCHER_APP_LAUNCH_TAP);
            }
            return true;
        } catch (ActivityNotFoundException e3) {
            e = e3;
            int i11 = e instanceof SecurityException ? 2132019101 : 2132017222;
            if (Looper.getMainLooper() != Looper.myLooper()) {
                (view != null ? view : getWindow().getDecorView()).post(new ab.k(this, i11, 8));
            } else {
                com.google.android.gms.internal.consent_sdk.k0.w(this, i11, 0).show();
            }
            Log.e("BaseDraggingActivity", "Unable to launch. tag=" + eVar + " intent=" + intent, e);
            return false;
        } catch (NullPointerException e11) {
            e = e11;
            if (e instanceof SecurityException) {
            }
            if (Looper.getMainLooper() != Looper.myLooper()) {
            }
            Log.e("BaseDraggingActivity", "Unable to launch. tag=" + eVar + " intent=" + intent, e);
            return false;
        } catch (SecurityException e12) {
            e = e12;
            if (e instanceof SecurityException) {
            }
            if (Looper.getMainLooper() != Looper.myLooper()) {
            }
            Log.e("BaseDraggingActivity", "Unable to launch. tag=" + eVar + " intent=" + intent, e);
            return false;
        }
    }

    public final void r0(Intent intent, Bundle bundle, ga.e eVar) throws Exception {
        try {
            StrictMode.VmPolicy vmPolicy = StrictMode.getVmPolicy();
            try {
                StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder().detectAll().penaltyLog().build());
                if (eVar != null && eVar.f57290b == 6 && intent.equals(eVar.d())) {
                    l0(intent.getPackage(), ((ga.j) eVar).M0(), intent.getSourceBounds(), bundle, eVar.o);
                } else if (intent.hasCategory("com.android.launcher3.DEEP_SHORTCUT")) {
                    String stringExtra = intent.getStringExtra("shortcut_id");
                    l0(intent.getPackage(), stringExtra, intent.getSourceBounds(), bundle, ((ja.h) ja.h.f69294h.h(this)).e(intent.getLongExtra("userHandle", -1L)));
                } else {
                    startActivity(intent, bundle);
                }
                StrictMode.setVmPolicy(vmPolicy);
            } catch (Throwable th2) {
                StrictMode.setVmPolicy(vmPolicy);
                throw th2;
            }
        } catch (Exception e3) {
            if (!o0(intent, eVar)) {
                throw e3;
            }
        }
    }
}
