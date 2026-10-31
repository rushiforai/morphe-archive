package io.branch.search.internal;

import android.content.SharedPreferences;
import android.content.pm.LauncherApps;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class R8 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f63269a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final LauncherApps f63270b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public Boolean f63271c;

    public static final class a {
    }

    public R8(@NotNull SharedPreferences prefs, @NotNull LauncherApps launcherApps) {
        Intrinsics.g(prefs, "prefs");
        Intrinsics.g(launcherApps, "launcherApps");
        this.f63269a = prefs;
        this.f63270b = launcherApps;
    }

    public final boolean a() {
        Boolean boolValueOf = Boolean.valueOf(this.f63270b.hasShortcutHostPermission());
        this.f63271c = boolValueOf;
        if (boolValueOf.equals(Boolean.TRUE) && !this.f63269a.getBoolean("had_shortcut_permission", false)) {
            b.c9.q(this.f63269a, "had_shortcut_permission", true);
            return true;
        }
        if (!Intrinsics.b(this.f63271c, Boolean.FALSE) || !this.f63269a.getBoolean("had_shortcut_permission", false)) {
            return false;
        }
        b.c9.q(this.f63269a, "had_shortcut_permission", false);
        return true;
    }
}
