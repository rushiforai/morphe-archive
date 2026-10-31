package io.branch.search.internal;

import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import io.branch.search.internal.InterfaceC3183ha;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class N7 extends LauncherApps.Callback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ P7 f62974a;

    public N7(P7 p72) {
        this.f62974a = p72;
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageAdded(@NotNull String packageName, @NotNull UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.a(packageName, user);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageChanged(@NotNull String packageName, @NotNull UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.b(packageName, user);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackageRemoved(@NotNull String packageName, @NotNull UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.d(packageName, user);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesAvailable(@NotNull String[] packageNames, @NotNull UserHandle user, boolean z11) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.b(packageNames, user, z11);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesSuspended(@NotNull String[] packageNames, @NotNull UserHandle user) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.b(packageNames, user);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesUnavailable(@NotNull String[] packageNames, @NotNull UserHandle user, boolean z11) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.a(packageNames, user, z11);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onPackagesUnsuspended(@NotNull String[] packageNames, @NotNull UserHandle user) {
        Intrinsics.g(packageNames, "packageNames");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.a(packageNames, user);
            Unit unit = Unit.f71706a;
        }
    }

    @Override // android.content.pm.LauncherApps.Callback
    public final void onShortcutsChanged(@NotNull String packageName, @NotNull List<ShortcutInfo> shortcutInfo, @NotNull UserHandle user) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(shortcutInfo, "shortcutInfo");
        Intrinsics.g(user, "user");
        InterfaceC3183ha.a aVar = this.f62974a.f63079h;
        if (aVar != null) {
            aVar.c(packageName, user);
            Unit unit = Unit.f71706a;
        }
    }
}
