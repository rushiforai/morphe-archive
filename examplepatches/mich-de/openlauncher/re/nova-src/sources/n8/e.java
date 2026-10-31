package n8;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e extends h {

    /* renamed from: a, reason: collision with root package name */
    public final n2.c f77979a;

    /* renamed from: b, reason: collision with root package name */
    public final x8.e f77980b;

    public e(n2.c cVar, x8.e eVar) {
        this.f77979a = cVar;
        this.f77980b = eVar;
    }

    @Override // n8.h
    public final n2.c a() {
        return this.f77979a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f77979a, eVar.f77979a) && Intrinsics.b(this.f77980b, eVar.f77980b);
    }

    public final int hashCode() {
        n2.c cVar = this.f77979a;
        return this.f77980b.hashCode() + ((cVar == null ? 0 : cVar.hashCode()) * 31);
    }

    public final String toString() {
        return "Error(painter=" + this.f77979a + ", result=" + this.f77980b + ')';
    }
}
