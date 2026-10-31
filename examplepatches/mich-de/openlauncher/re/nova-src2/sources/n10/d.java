package n10;

import android.content.pm.LauncherApps;
import android.os.UserHandle;
import db0.c0;
import db0.j0;
import db0.m;
import db0.n0;

/* loaded from: classes.dex */
public final class d extends LauncherApps.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n0 f77684a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f77685b;

    public d(n0 n0Var, e eVar) {
        this.f77684a = n0Var;
        this.f77685b = eVar;
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageAdded(String str, UserHandle userHandle) throws Throwable {
        this.f77684a.invoke(m.b(c0.Companion, j0.f49163b, str, this.f77685b.e(userHandle)));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageChanged(String str, UserHandle userHandle) throws Throwable {
        this.f77684a.invoke(m.b(c0.Companion, j0.f49165d, str, this.f77685b.e(userHandle)));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageRemoved(String str, UserHandle userHandle) throws Throwable {
        this.f77684a.invoke(m.b(c0.Companion, j0.f49164c, str, this.f77685b.e(userHandle)));
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesAvailable(String[] strArr, UserHandle userHandle, boolean z11) {
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesUnavailable(String[] strArr, UserHandle userHandle, boolean z11) {
    }
}
