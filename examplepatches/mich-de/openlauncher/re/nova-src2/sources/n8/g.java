package n8;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g extends h {

    /* renamed from: a, reason: collision with root package name */
    public final n2.c f77982a;

    /* renamed from: b, reason: collision with root package name */
    public final x8.r f77983b;

    public g(n2.c cVar, x8.r rVar) {
        this.f77982a = cVar;
        this.f77983b = rVar;
    }

    @Override // n8.h
    public final n2.c a() {
        return this.f77982a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f77982a, gVar.f77982a) && Intrinsics.b(this.f77983b, gVar.f77983b);
    }

    public final int hashCode() {
        return this.f77983b.hashCode() + (this.f77982a.hashCode() * 31);
    }

    public final String toString() {
        return "Success(painter=" + this.f77982a + ", result=" + this.f77983b + ')';
    }
}
