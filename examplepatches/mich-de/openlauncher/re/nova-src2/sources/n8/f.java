package n8;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f extends h {

    /* renamed from: a, reason: collision with root package name */
    public final n2.c f77981a;

    public f(n2.c cVar) {
        this.f77981a = cVar;
    }

    @Override // n8.h
    public final n2.c a() {
        return this.f77981a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f77981a, ((f) obj).f77981a);
    }

    public final int hashCode() {
        n2.c cVar = this.f77981a;
        if (cVar == null) {
            return 0;
        }
        return cVar.hashCode();
    }

    public final String toString() {
        return "Loading(painter=" + this.f77981a + ')';
    }
}
