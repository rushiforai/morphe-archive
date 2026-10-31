package io.branch.search.internal;

import java.util.HashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class G6 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62514a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62515b;

    /* renamed from: c, reason: collision with root package name */
    public final long f62516c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f62517d;

    public G6(@NotNull String message, long j11, @NotNull HashMap extras) {
        Intrinsics.g(message, "message");
        Intrinsics.g(extras, "extras");
        this.f62514a = "BranchCrashReport";
        this.f62515b = message;
        this.f62516c = j11;
        this.f62517d = extras;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof G6)) {
            return false;
        }
        G6 g62 = (G6) obj;
        return Intrinsics.b(this.f62514a, g62.f62514a) && Intrinsics.b(this.f62515b, g62.f62515b) && this.f62516c == g62.f62516c && Intrinsics.b(this.f62517d, g62.f62517d);
    }

    public final int hashCode() {
        return this.f62517d.hashCode() + C3231k8.a(this.f62516c, C3248l8.a(this.f62515b, this.f62514a.hashCode() * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FailureData(source=");
        sb2.append(this.f62514a);
        sb2.append(", message=");
        sb2.append(this.f62515b);
        sb2.append(", timeStamp=");
        sb2.append(this.f62516c);
        sb2.append(", extras=");
        return b.c9.l(sb2, this.f62517d, ')');
    }
}
