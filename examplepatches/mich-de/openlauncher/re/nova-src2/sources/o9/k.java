package o9;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.LauncherApps;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.UserHandle;
import android.util.Log;
import com.android.launcher3.logging.StatsLogManager;
import java.util.ArrayList;

/* loaded from: classes.dex */
public abstract class k extends androidx.fragment.app.m0 implements za.d {
    public int A;

    /* renamed from: x, reason: collision with root package name */
    public mx.j0 f79934x;

    /* renamed from: y, reason: collision with root package name */
    public StatsLogManager f79935y;

    /* renamed from: z, reason: collision with root package name */
    public x80.n f79936z;
    public boolean o = false;

    /* renamed from: p, reason: collision with root package name */
    public boolean f79926p = false;

    /* renamed from: q, reason: collision with root package name */
    public boolean f79927q = false;

    /* renamed from: r, reason: collision with root package name */
    public boolean f79928r = false;

    /* renamed from: s, reason: collision with root package name */
    public boolean f79929s = false;

    /* renamed from: t, reason: collision with root package name */
    public boolean f79930t = false;

    /* renamed from: u, reason: collision with root package name */
    public boolean f79931u = false;

    /* renamed from: v, reason: collision with root package name */
    public final ArrayList f79932v = new ArrayList();

    /* renamed from: w, reason: collision with root package name */
    public final ArrayList f79933w = new ArrayList();
    public final vm.c B = new vm.c(29);

    public static k Y(Context context) {
        if (context instanceof k) {
            return (k) context;
        }
        if (context instanceof py.a) {
            return Y(((py.a) context).f83127b);
        }
        if (context instanceof ContextWrapper) {
            return Y(((ContextWrapper) context).getBaseContext());
        }
        throw new IllegalArgumentException("Cannot find BaseActivity in parent tree. " + context);
    }

    @Override // za.d
    public StatsLogManager O() {
        if (this.f79935y == null) {
            this.f79935y = StatsLogManager.b(this);
        }
        return this.f79935y;
    }

    @Override // za.d
    public final mx.j0 P() {
        return this.f79934x;
    }

    public final x80.n Z() {
        if (this.f79936z == null) {
            this.f79936z = new x80.n(getWindow());
        }
        return this.f79936z;
    }

    public final boolean a0() {
        return (this.A & 1) != 0;
    }

    public void b0() {
        this.f79930t = true;
        this.f79931u = true;
    }

    public void c0() {
        this.f79931u = true;
    }

    public final void d0() {
        super.onPause();
        this.f79929s = false;
        this.f79930t = false;
        this.f79926p = false;
    }

    public final void e0() {
        super.onResume();
        this.f79929s = true;
    }

    public final void f0() {
        super.onStart();
        this.f79928r = true;
        if (this.o) {
            j0();
        } else {
            this.f79927q = true;
        }
    }

    public final void g0() {
        super.onStop();
        this.f79928r = false;
        this.f79927q = false;
    }

    public final void h0(boolean z11) {
        this.o = z11;
        super.onWindowFocusChanged(z11);
        if (z11) {
            if (this.f79927q) {
                j0();
            }
            if (this.f79926p) {
                i0();
            }
        }
    }

    public final void i0() {
        this.f79926p = false;
        this.f79931u = false;
        b0();
        if (this.f79931u) {
            return;
        }
        throw new androidx.fragment.app.g2("Activity " + getComponentName().toShortString() + " did not call through to super.onFocusedResume()");
    }

    @Override // za.d
    public final vm.c j() {
        return this.B;
    }

    public final void j0() {
        this.f79927q = false;
        this.f79931u = false;
        c0();
        if (this.f79931u) {
            return;
        }
        throw new androidx.fragment.app.g2("Activity " + getComponentName().toShortString() + " did not call through to super.onFocusedStart()");
    }

    public final void k0(int i5) {
        this.A = (~i5) & this.A;
    }

    public void l0(String str, String str2, Rect rect, Bundle bundle, UserHandle userHandle) {
        try {
            ((LauncherApps) getSystemService(LauncherApps.class)).startShortcut(str, str2, rect, bundle, userHandle);
        } catch (IllegalArgumentException | IllegalStateException | SecurityException e3) {
            Log.e("BaseActivity", "Failed to start shortcut", e3);
        }
    }

    @Override // g.o, android.app.Activity
    public void onMultiWindowModeChanged(boolean z11, Configuration configuration) {
        super.onMultiWindowModeChanged(z11, configuration);
        ArrayList arrayList = this.f79933w;
        int size = arrayList.size() - 1;
        if (size < 0) {
            return;
        }
        b.c0.y(arrayList.get(size));
        throw null;
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onPause() {
        k0(6);
        d0();
        Z().f(3, 0);
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onPostResume() {
        super.onPostResume();
        if (this.o) {
            i0();
        } else {
            this.f79926p = true;
        }
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onResume() {
        this.A |= 18;
        k0(32);
        e0();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onStart() {
        this.A |= 1;
        f0();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onStop() {
        k0(17);
        g0();
        Z().f(3, 0);
    }

    @Override // g.o, android.app.Activity
    public final void onUserLeaveHint() {
        k0(16);
        super.onUserLeaveHint();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z11) {
        h0(z11);
        if (z11) {
            this.A |= 8;
        } else {
            k0(8);
        }
    }
}
