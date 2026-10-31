package qw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x extends y {

    /* renamed from: a, reason: collision with root package name */
    public final n2.c f84424a;

    public x(n2.c painter) {
        Intrinsics.g(painter, "painter");
        this.f84424a = painter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x) && Intrinsics.b(this.f84424a, ((x) obj).f84424a);
    }

    public final int hashCode() {
        return this.f84424a.hashCode();
    }

    public final String toString() {
        return "Success(painter=" + this.f84424a + ")";
    }
}
