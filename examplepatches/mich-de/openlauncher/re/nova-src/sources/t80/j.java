package t80;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final String f88923a;

    /* renamed from: b, reason: collision with root package name */
    public final k f88924b;

    public j(String uriString, k kVar) {
        Intrinsics.g(uriString, "uriString");
        this.f88923a = uriString;
        this.f88924b = kVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f88923a, jVar.f88923a) && this.f88924b == jVar.f88924b;
    }

    public final int hashCode() {
        return this.f88924b.hashCode() + (this.f88923a.hashCode() * 31);
    }

    public final String toString() {
        return "EventInfoExtraCallToAction(uriString=" + this.f88923a + ", type=" + this.f88924b + ")";
    }
}
