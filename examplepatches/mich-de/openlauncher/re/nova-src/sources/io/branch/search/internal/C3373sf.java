package io.branch.search.internal;

import android.content.Context;
import android.content.pm.LauncherApps;
import android.os.UserHandle;
import android.os.UserManager;
import java.util.List;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.sf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3373sf {

    /* renamed from: io.branch.search.internal.sf$a */
    public static final class a {

        /* renamed from: a, reason: collision with root package name */
        @NotNull
        public final LauncherApps f65797a;

        public a(@NotNull Context context) {
            Intrinsics.g(context, "context");
            Object systemService = context.getSystemService((Class<Object>) LauncherApps.class);
            Intrinsics.f(systemService, "context.getSystemService(LauncherApps::class.java)");
            this.f65797a = (LauncherApps) systemService;
            Object systemService2 = context.getSystemService((Class<Object>) UserManager.class);
            Intrinsics.f(systemService2, "context.getSystemService(UserManager::class.java)");
        }

        @NotNull
        public final List<UserHandle> a() {
            List<UserHandle> profiles = this.f65797a.getProfiles();
            Intrinsics.f(profiles, "launcherApps.profiles");
            return profiles;
        }
    }

    @JvmStatic
    @NotNull
    public static final a a(@NotNull Context context) {
        Intrinsics.g(context, "context");
        return new a(context);
    }
}
