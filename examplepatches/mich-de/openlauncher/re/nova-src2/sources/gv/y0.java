package gv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y0 {

    /* renamed from: a, reason: collision with root package name */
    public final ps.v f57996a;

    /* renamed from: b, reason: collision with root package name */
    public final ou.o0 f57997b;

    public y0(ps.v vVar, ou.o0 theme) {
        Intrinsics.g(theme, "theme");
        this.f57996a = vVar;
        this.f57997b = theme;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y0)) {
            return false;
        }
        y0 y0Var = (y0) obj;
        return Intrinsics.b(this.f57996a, y0Var.f57996a) && this.f57997b == y0Var.f57997b;
    }

    public final int hashCode() {
        return this.f57997b.hashCode() + (this.f57996a.hashCode() * 31);
    }

    public final String toString() {
        return "Link(state=" + this.f57996a + ", theme=" + this.f57997b + ")";
    }
}
