package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.z7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3484z7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final C3484z7 f66357e = new C3484z7(1.0f, 0, 0, B7.UNKNOWN);

    /* renamed from: a, reason: collision with root package name */
    public final float f66358a;

    /* renamed from: b, reason: collision with root package name */
    public final int f66359b;

    /* renamed from: c, reason: collision with root package name */
    public final int f66360c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final B7 f66361d;

    /* renamed from: io.branch.search.internal.z7$a */
    public static final class a {
    }

    public C3484z7(float f11, int i5, int i11, @NotNull B7 shape) {
        Intrinsics.g(shape, "shape");
        this.f66358a = f11;
        this.f66359b = i5;
        this.f66360c = i11;
        this.f66361d = shape;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3484z7)) {
            return false;
        }
        C3484z7 c3484z7 = (C3484z7) obj;
        return Float.valueOf(this.f66358a).equals(Float.valueOf(c3484z7.f66358a)) && this.f66359b == c3484z7.f66359b && this.f66360c == c3484z7.f66360c && this.f66361d == c3484z7.f66361d;
    }

    public final int hashCode() {
        return this.f66361d.hashCode() + C3214j8.a(this.f66360c, C3214j8.a(this.f66359b, Float.hashCode(this.f66358a) * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        return "IconNormalizationResult(scale=" + this.f66358a + ", horizontalOffset=" + this.f66359b + ", verticalOffset=" + this.f66360c + ", shape=" + this.f66361d + ')';
    }
}
