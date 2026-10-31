package mt;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x implements a0 {

    /* renamed from: a, reason: collision with root package name */
    public final v f76811a;

    public x(v vVar) {
        this.f76811a = vVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x) && Intrinsics.b(this.f76811a, ((x) obj).f76811a);
    }

    public final int hashCode() {
        return this.f76811a.hashCode();
    }

    public final String toString() {
        return "Complete(result=" + this.f76811a + ")";
    }
}
