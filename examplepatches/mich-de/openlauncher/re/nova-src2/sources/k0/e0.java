package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e0 extends d {

    /* renamed from: i, reason: collision with root package name */
    public final b2.j f70594i;

    public e0(b2.j jVar) {
        this.f70594i = jVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e0) && Intrinsics.b(this.f70594i, ((e0) obj).f70594i);
    }

    public final int hashCode() {
        return Float.hashCode(this.f70594i.f17013a);
    }

    @Override // k0.d
    public final int i(int i5, y3.n nVar, z2.i1 i1Var, int i11) {
        return this.f70594i.a(0, i5);
    }

    public final String toString() {
        return "VerticalCrossAxisAlignment(vertical=" + this.f70594i + ')';
    }
}
