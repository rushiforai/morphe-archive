package y5;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final String f96729a;

    public f(String name) {
        Intrinsics.g(name, "name");
        this.f96729a = name;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof f)) {
            return false;
        }
        return Intrinsics.b(this.f96729a, ((f) obj).f96729a);
    }

    public final int hashCode() {
        return this.f96729a.hashCode();
    }

    public final String toString() {
        return this.f96729a;
    }
}
