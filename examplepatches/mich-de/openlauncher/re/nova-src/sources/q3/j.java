package q3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final n f83569a;

    public j(n nVar) {
        this.f83569a = nVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && Intrinsics.b(this.f83569a, ((j) obj).f83569a);
    }

    public final int hashCode() {
        return this.f83569a.hashCode() * 31;
    }

    public final String toString() {
        return "Key(font=" + this.f83569a + ", loaderKey=null)";
    }
}
