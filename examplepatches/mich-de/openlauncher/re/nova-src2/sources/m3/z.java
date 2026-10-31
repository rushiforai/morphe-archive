package m3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public final y f75990a;

    /* renamed from: b, reason: collision with root package name */
    public final x f75991b;

    public z(y yVar, x xVar) {
        this.f75990a = yVar;
        this.f75991b = xVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return Intrinsics.b(this.f75991b, zVar.f75991b) && Intrinsics.b(this.f75990a, zVar.f75990a);
    }

    public final int hashCode() {
        y yVar = this.f75990a;
        int iHashCode = (yVar != null ? yVar.hashCode() : 0) * 31;
        x xVar = this.f75991b;
        return iHashCode + (xVar != null ? xVar.hashCode() : 0);
    }

    public final String toString() {
        return "PlatformTextStyle(spanStyle=" + this.f75990a + ", paragraphSyle=" + this.f75991b + ')';
    }

    public z(boolean z11) {
        this(null, new x(z11));
    }
}
