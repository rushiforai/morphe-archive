package io.branch.search.internal;

import android.content.Context;
import android.content.IntentFilter;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.Build;
import android.os.Handler;
import android.os.UserHandle;
import io.branch.engage.sesame_lite.internal.data.UserCacheEntity;
import io.branch.search.internal.C3373sf;
import io.branch.search.internal.InterfaceC3183ha;
import java.util.List;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P7 implements InterfaceC3183ha {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f63072a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3166ga f63073b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final C3373sf.a f63074c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Handler f63075d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3356rf f63076e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final R8 f63077f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final LauncherApps f63078g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public volatile InterfaceC3183ha.a f63079h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final N7 f63080i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final O7 f63081j;

    public P7(@NotNull Context context, @NotNull C3448x5 adapter, @NotNull C3373sf.a profiles, @NotNull Handler bgHandler, @NotNull C3356rf userHandleRepository, @NotNull R8 localShortcutPermissionManager, @NotNull LauncherApps launcherApps) {
        Intrinsics.g(context, "context");
        Intrinsics.g(adapter, "adapter");
        Intrinsics.g(profiles, "profiles");
        Intrinsics.g(bgHandler, "bgHandler");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        Intrinsics.g(localShortcutPermissionManager, "localShortcutPermissionManager");
        Intrinsics.g(launcherApps, "launcherApps");
        this.f63072a = context;
        this.f63073b = adapter;
        this.f63074c = profiles;
        this.f63075d = bgHandler;
        this.f63076e = userHandleRepository;
        this.f63077f = localShortcutPermissionManager;
        this.f63078g = launcherApps;
        this.f63080i = new N7(this);
        this.f63081j = new O7(this);
    }

    @Override // io.branch.search.internal.InterfaceC3183ha
    @Nullable
    public final List a(@Nullable String str, @Nullable UserHandle userHandle) {
        InterfaceC3166ga interfaceC3166ga = this.f63073b;
        List<LauncherActivityInfo> activityList = this.f63078g.getActivityList(str, userHandle);
        Intrinsics.f(activityList, "launcherApps.getActivityList(pkg, user)");
        return interfaceC3166ga.a(activityList);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0059  */
    @Override // io.branch.search.internal.InterfaceC3183ha
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final List b(@Nullable String str, @NotNull UserHandle userHandle) {
        List<ShortcutInfo> shortcuts;
        InterfaceC3166ga interfaceC3166ga = this.f63073b;
        R8 r82 = this.f63077f;
        if (r82.f63271c == null) {
            r82.f63271c = Boolean.valueOf(r82.f63270b.hasShortcutHostPermission());
        }
        Boolean bool = r82.f63271c;
        Intrinsics.d(bool);
        if (bool.booleanValue()) {
            C3356rf c3356rf = this.f63076e;
            c3356rf.getClass();
            Intrinsics.g(userHandle, "userHandle");
            UserCacheEntity cacheEntity = c3356rf.f65680a.getCacheEntity(userHandle);
            if (cacheEntity == null || !cacheEntity.isQuietModeEnabled()) {
                try {
                    LauncherApps launcherApps = this.f63078g;
                    LauncherApps.ShortcutQuery shortcutQuery = new LauncherApps.ShortcutQuery();
                    shortcutQuery.setQueryFlags(11);
                    shortcutQuery.setPackage(str);
                    Unit unit = Unit.f71706a;
                    shortcuts = launcherApps.getShortcuts(shortcutQuery, userHandle);
                    if (shortcuts == null) {
                        shortcuts = EmptyList.f71733a;
                    }
                } catch (IllegalStateException unused) {
                    shortcuts = EmptyList.f71733a;
                } catch (SecurityException unused2) {
                    shortcuts = EmptyList.f71733a;
                }
            } else {
                shortcuts = EmptyList.f71733a;
            }
        }
        return interfaceC3166ga.b(shortcuts);
    }

    @Override // io.branch.search.internal.InterfaceC3183ha
    @Nullable
    public final List a() {
        return this.f63074c.a();
    }

    @Override // io.branch.search.internal.InterfaceC3183ha
    public final void a(@NotNull C3267ma cb2) {
        Intrinsics.g(cb2, "cb");
        if (this.f63079h == null) {
            this.f63079h = cb2;
            if (Build.VERSION.SDK_INT >= 33) {
                Context context = this.f63072a;
                O7 o72 = this.f63081j;
                IntentFilter intentFilter = new IntentFilter();
                intentFilter.addAction("android.intent.action.MANAGED_PROFILE_ADDED");
                intentFilter.addAction("android.intent.action.MANAGED_PROFILE_REMOVED");
                intentFilter.addAction("android.intent.action.MANAGED_PROFILE_AVAILABLE");
                intentFilter.addAction("android.intent.action.MANAGED_PROFILE_UNAVAILABLE");
                Unit unit = Unit.f71706a;
                context.registerReceiver(o72, intentFilter, null, this.f63075d, 4);
            } else {
                Context context2 = this.f63072a;
                O7 o73 = this.f63081j;
                IntentFilter intentFilter2 = new IntentFilter();
                intentFilter2.addAction("android.intent.action.MANAGED_PROFILE_ADDED");
                intentFilter2.addAction("android.intent.action.MANAGED_PROFILE_REMOVED");
                intentFilter2.addAction("android.intent.action.MANAGED_PROFILE_AVAILABLE");
                intentFilter2.addAction("android.intent.action.MANAGED_PROFILE_UNAVAILABLE");
                Unit unit2 = Unit.f71706a;
                context2.registerReceiver(o73, intentFilter2, null, this.f63075d);
            }
            this.f63078g.registerCallback(this.f63080i, this.f63075d);
            return;
        }
        throw new IllegalStateException();
    }

    @Override // io.branch.search.internal.InterfaceC3183ha
    public final void b() {
        this.f63078g.unregisterCallback(this.f63080i);
        this.f63072a.unregisterReceiver(this.f63081j);
        this.f63079h = null;
    }
}
