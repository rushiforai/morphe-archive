package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class y implements b0 {

    /* renamed from: a, reason: collision with root package name */
    public final n f49823a;

    public y(n nVar) {
        this.f49823a = nVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof y) && Intrinsics.b(this.f49823a, ((y) obj).f49823a);
    }

    public final int hashCode() {
        return this.f49823a.hashCode();
    }

    public final String toString() {
        return "Failed(error=" + this.f49823a + ")";
    }
}
