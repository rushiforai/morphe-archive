package io.branch.search.internal;

import android.content.pm.LauncherActivityInfo;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.x0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3443x0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final LauncherActivityInfo f66251a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final CharSequence f66252b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f66253c;

    public C3443x0(@NotNull LauncherActivityInfo info, @NotNull CharSequence label) {
        Intrinsics.g(info, "info");
        Intrinsics.g(label, "label");
        this.f66251a = info;
        this.f66252b = label;
        String packageName = info.getComponentName().getPackageName();
        Intrinsics.f(packageName, "info.componentName.packageName");
        this.f66253c = packageName;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3443x0)) {
            return false;
        }
        C3443x0 c3443x0 = (C3443x0) obj;
        return Intrinsics.b(this.f66251a, c3443x0.f66251a) && Intrinsics.b(this.f66252b, c3443x0.f66252b);
    }

    public final int hashCode() {
        return this.f66252b.hashCode() + (this.f66251a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        return "AppHome(info=" + this.f66251a + ", label=" + ((Object) this.f66252b) + ')';
    }
}
