package hq;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends h {

    /* renamed from: c, reason: collision with root package name */
    public final String f59969c;

    public g(String value) {
        Intrinsics.g(value, "value");
        this.f59969c = value;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Intrinsics.b(this.f59969c, ((g) obj).f59969c);
    }

    public final int hashCode() {
        return this.f59969c.hashCode();
    }

    public final String toString() {
        return c0.l("Validated(value=", this.f59969c, ")");
    }
}
