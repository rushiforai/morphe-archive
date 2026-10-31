package hq;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f59973a;

    public j(String value) {
        Intrinsics.g(value, "value");
        this.f59973a = value;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && Intrinsics.b(this.f59973a, ((j) obj).f59973a);
    }

    public final int hashCode() {
        return this.f59973a.hashCode();
    }

    public final String toString() {
        return c0.l("Validated(value=", this.f59973a, ")");
    }
}
