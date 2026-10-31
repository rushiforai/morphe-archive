package rw;

import kotlin.jvm.internal.Intrinsics;
import p6.n;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final n f86449a;

    /* renamed from: b, reason: collision with root package name */
    public final n f86450b;

    public a(n nVar, n nVar2) {
        this.f86449a = nVar;
        this.f86450b = nVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f86449a, aVar.f86449a) && Intrinsics.b(this.f86450b, aVar.f86450b);
    }

    public final int hashCode() {
        n nVar = this.f86449a;
        int iHashCode = (nVar == null ? 0 : nVar.hashCode()) * 31;
        n nVar2 = this.f86450b;
        return iHashCode + (nVar2 != null ? nVar2.hashCode() : 0);
    }

    public final String toString() {
        return "NavBackStackEntryUpdate(previousBackStackEntry=" + this.f86449a + ", currentBackStackEntry=" + this.f86450b + ")";
    }
}
