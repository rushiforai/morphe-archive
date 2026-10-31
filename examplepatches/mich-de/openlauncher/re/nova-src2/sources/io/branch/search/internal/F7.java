package io.branch.search.internal;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class F7 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<String, P3> f62451a;

    public F7(@NotNull Map<String, P3> libs) {
        Intrinsics.g(libs, "libs");
        this.f62451a = libs;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof F7) && Intrinsics.b(this.f62451a, ((F7) obj).f62451a);
    }

    public final int hashCode() {
        return this.f62451a.hashCode();
    }

    @NotNull
    public final String toString() {
        return b.c9.l(new StringBuilder("ImageDownloaderDiagnostics(libs="), this.f62451a, ')');
    }
}
