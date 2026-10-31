package y20;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final o2.g f96594a;

    public c(o2.g gVar) {
        this.f96594a = gVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f96594a, ((c) obj).f96594a);
    }

    public final int hashCode() {
        return this.f96594a.hashCode();
    }

    public final String toString() {
        return "Vector(image=" + this.f96594a + ")";
    }
}
