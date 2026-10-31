package r3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f0 {

    /* renamed from: a, reason: collision with root package name */
    public final m3.g f85439a;

    /* renamed from: b, reason: collision with root package name */
    public final s f85440b;

    public f0(m3.g gVar, s sVar) {
        this.f85439a = gVar;
        this.f85440b = sVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0)) {
            return false;
        }
        f0 f0Var = (f0) obj;
        return Intrinsics.b(this.f85439a, f0Var.f85439a) && Intrinsics.b(this.f85440b, f0Var.f85440b);
    }

    public final int hashCode() {
        return this.f85440b.hashCode() + (this.f85439a.hashCode() * 31);
    }

    public final String toString() {
        return "TransformedText(text=" + ((Object) this.f85439a) + ", offsetMapping=" + this.f85440b + ')';
    }
}
