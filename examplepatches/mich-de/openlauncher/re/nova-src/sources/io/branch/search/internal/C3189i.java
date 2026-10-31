package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.i, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3189i {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64692a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64693b;

    public C3189i(@NotNull String packageName, @NotNull String type) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(type, "type");
        this.f64692a = packageName;
        this.f64693b = type;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3189i)) {
            return false;
        }
        C3189i c3189i = (C3189i) obj;
        return Intrinsics.b(this.f64692a, c3189i.f64692a) && Intrinsics.b(this.f64693b, c3189i.f64693b);
    }

    public final int hashCode() {
        return this.f64693b.hashCode() + (this.f64692a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Ad(packageName=");
        sb2.append(this.f64692a);
        sb2.append(", type=");
        return Z.a(sb2, this.f64693b, ')');
    }
}
