package e0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public i2.f f50089a = null;

    /* renamed from: b, reason: collision with root package name */
    public i2.b f50090b = null;

    /* renamed from: c, reason: collision with root package name */
    public k2.b f50091c = null;

    /* renamed from: d, reason: collision with root package name */
    public i2.h f50092d = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f50089a, pVar.f50089a) && Intrinsics.b(this.f50090b, pVar.f50090b) && Intrinsics.b(this.f50091c, pVar.f50091c) && Intrinsics.b(this.f50092d, pVar.f50092d);
    }

    public final i2.n0 g() {
        i2.h hVar = this.f50092d;
        if (hVar != null) {
            return hVar;
        }
        i2.h hVarA = i2.k.a();
        this.f50092d = hVarA;
        return hVarA;
    }

    public final int hashCode() {
        i2.f fVar = this.f50089a;
        int iHashCode = (fVar == null ? 0 : fVar.hashCode()) * 31;
        i2.b bVar = this.f50090b;
        int iHashCode2 = (iHashCode + (bVar == null ? 0 : bVar.hashCode())) * 31;
        k2.b bVar2 = this.f50091c;
        int iHashCode3 = (iHashCode2 + (bVar2 == null ? 0 : bVar2.hashCode())) * 31;
        i2.h hVar = this.f50092d;
        return iHashCode3 + (hVar != null ? hVar.hashCode() : 0);
    }

    public final String toString() {
        return "BorderCache(imageBitmap=" + this.f50089a + ", canvas=" + this.f50090b + ", canvasDrawScope=" + this.f50091c + ", borderPath=" + this.f50092d + ')';
    }
}
