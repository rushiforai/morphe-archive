package n10;

import android.app.Activity;
import android.content.IntentFilter;
import android.content.pm.LauncherApps;
import android.os.UserHandle;
import android.os.UserManager;
import android.util.ArrayMap;
import db0.n0;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e implements c {

    /* renamed from: a, reason: collision with root package name */
    public ArrayMap f77686a;

    /* renamed from: b, reason: collision with root package name */
    public final a f77687b = new a(this, 2);

    /* renamed from: c, reason: collision with root package name */
    public final d f77688c;

    /* renamed from: d, reason: collision with root package name */
    public Activity f77689d;

    public e(n0 n0Var) {
        this.f77688c = new d(n0Var, this);
    }

    @Override // n10.c
    public final void a() {
        LauncherApps launcherApps;
        Activity activity = this.f77689d;
        if (activity != null) {
            activity.unregisterReceiver(this.f77687b);
        }
        Activity activity2 = this.f77689d;
        if (activity2 != null && (launcherApps = (LauncherApps) activity2.getSystemService(LauncherApps.class)) != null) {
            launcherApps.unregisterCallback(this.f77688c);
        }
        this.f77689d = null;
    }

    @Override // n10.c
    public final void b(Activity activity) {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.MANAGED_PROFILE_ADDED");
        intentFilter.addAction("android.intent.action.MANAGED_PROFILE_REMOVED");
        Unit unit = Unit.f71706a;
        activity.registerReceiver(this.f77687b, intentFilter);
        d((UserManager) activity.getSystemService(UserManager.class));
        ((LauncherApps) activity.getSystemService(LauncherApps.class)).registerCallback(this.f77688c);
        this.f77689d = activity;
    }

    @Override // n10.c
    public final List c() {
        return EmptyList.f71733a;
    }

    public final void d(UserManager userManager) {
        ArrayMap arrayMap = new ArrayMap();
        for (UserHandle userHandle : userManager.getUserProfiles()) {
            arrayMap.put(userHandle, Long.valueOf(userManager.getSerialNumberForUser(userHandle)));
        }
        synchronized (this) {
            this.f77686a = arrayMap;
            Unit unit = Unit.f71706a;
        }
    }

    public final long e(UserHandle userHandle) {
        ArrayMap arrayMap = this.f77686a;
        if (arrayMap == null) {
            Intrinsics.m("userToSerialMap");
            throw null;
        }
        Long l9 = (Long) arrayMap.get(userHandle);
        if (l9 != null) {
            return l9.longValue();
        }
        return -1L;
    }
}
