package io.branch.search.internal;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import java.util.List;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.q7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3332q7 {

    @NotNull
    public static final a Companion = a.f65563a;

    /* renamed from: io.branch.search.internal.q7$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ a f65563a = new a();

        /* renamed from: b, reason: collision with root package name */
        @NotNull
        public static final C0348a f65564b = new C0348a();

        /* renamed from: io.branch.search.internal.q7$a$a, reason: collision with other inner class name */
        public static final class C0348a implements InterfaceC3332q7 {
            @Override // io.branch.search.internal.InterfaceC3332q7
            @NotNull
            public final C3458xf a(@NotNull Context context, @NotNull String id2, @NotNull String packageName, @NotNull UserHandle userHandle) {
                Intrinsics.g(context, "context");
                Intrinsics.g(id2, "id");
                Intrinsics.g(packageName, "packageName");
                Intrinsics.g(userHandle, "userHandle");
                LauncherApps launcherApps = (LauncherApps) context.getSystemService(LauncherApps.class);
                try {
                    LauncherApps.ShortcutQuery shortcutQuery = new LauncherApps.ShortcutQuery();
                    shortcutQuery.setQueryFlags(11);
                    shortcutQuery.setPackage(packageName);
                    List<ShortcutInfo> shortcuts = launcherApps.getShortcuts(shortcutQuery, userHandle);
                    if (shortcuts != null && !shortcuts.isEmpty()) {
                        for (ShortcutInfo shortcutInfo : shortcuts) {
                            if (shortcutInfo.isEnabled() && Intrinsics.b(shortcutInfo.getId(), id2)) {
                                C3458xf.Companion.getClass();
                                return C3458xf.f66299c;
                            }
                        }
                    }
                    C3458xf.Companion.getClass();
                    return new C3458xf("Shortcut invalid.", false);
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "IBranchShortcutHandler.validateShortcut");
                    C3458xf.Companion.getClass();
                    return new C3458xf("Shortcut validation error.", false);
                }
            }

            @Override // io.branch.search.internal.InterfaceC3332q7
            public final boolean b(@NotNull Context context, @NotNull String id2, @NotNull String packageName, @NotNull UserHandle userHandle) {
                Intrinsics.g(context, "context");
                Intrinsics.g(id2, "id");
                Intrinsics.g(packageName, "packageName");
                Intrinsics.g(userHandle, "userHandle");
                try {
                    ((LauncherApps) context.getSystemService(LauncherApps.class)).startShortcut(packageName, id2, null, null, userHandle);
                    return true;
                } catch (Exception e3) {
                    C3296o5.a(UUID.randomUUID().toString(), e3, "IBranchShortcutHandler.launchShortcut");
                    return false;
                }
            }
        }
    }

    @NotNull
    C3458xf a(@NotNull Context context, @NotNull String str, @NotNull String str2, @NotNull UserHandle userHandle);

    boolean b(@NotNull Context context, @NotNull String str, @NotNull String str2, @NotNull UserHandle userHandle);
}
