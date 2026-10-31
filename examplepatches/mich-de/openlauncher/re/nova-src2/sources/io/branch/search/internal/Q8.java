package io.branch.search.internal;

import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Q8 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @JvmField
    @NotNull
    public final String f63219a;

    /* renamed from: b, reason: collision with root package name */
    @JvmField
    public final long f63220b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f63221c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f63222d;

    /* renamed from: e, reason: collision with root package name */
    @JvmField
    @NotNull
    public final String f63223e;

    /* renamed from: f, reason: collision with root package name */
    public final int f63224f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f63225g;

    public static final class a {
    }

    public Q8(int i5, long j11, @NotNull String packageName, @NotNull String id2, @NotNull String hashedId, @NotNull String label, boolean z11) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(id2, "id");
        Intrinsics.g(hashedId, "hashedId");
        Intrinsics.g(label, "label");
        this.f63219a = packageName;
        this.f63220b = j11;
        this.f63221c = id2;
        this.f63222d = hashedId;
        this.f63223e = label;
        this.f63224f = i5;
        this.f63225g = z11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!Q8.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type io.branch.search.internal.sqlite.LocalShortcut");
        Q8 q82 = (Q8) obj;
        return Intrinsics.b(this.f63219a, q82.f63219a) && this.f63220b == q82.f63220b && Intrinsics.b(this.f63221c, q82.f63221c);
    }
}
