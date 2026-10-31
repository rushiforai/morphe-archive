package io.branch.search.internal;

import android.content.pm.ShortcutInfo;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.y0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3460y0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final ShortcutInfo f66302a;

    public C3460y0(@NotNull ShortcutInfo info) {
        Intrinsics.g(info, "info");
        this.f66302a = info;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof C3460y0) && Intrinsics.b(this.f66302a, ((C3460y0) obj).f66302a);
    }

    public final int hashCode() {
        return this.f66302a.hashCode();
    }

    @NotNull
    public final String toString() {
        return "AppShortcut(info=" + this.f66302a + ')';
    }
}
