package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d0 extends d {

    /* renamed from: i, reason: collision with root package name */
    public final b2.e f70590i;

    public d0(b2.i iVar) {
        this.f70590i = iVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d0) && Intrinsics.b(this.f70590i, ((d0) obj).f70590i);
    }

    public final int hashCode() {
        return this.f70590i.hashCode();
    }

    @Override // k0.d
    public final int i(int i5, y3.n nVar, z2.i1 i1Var, int i11) {
        return this.f70590i.a(0, i5, nVar);
    }

    public final String toString() {
        return "HorizontalCrossAxisAlignment(horizontal=" + this.f70590i + ')';
    }
}
