package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final v f81642a;

    public y(v vVar) {
        this.f81642a = vVar;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof y) {
            return Intrinsics.b(this.f81642a, ((y) obj).f81642a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f81642a.hashCode() * 31;
    }
}
