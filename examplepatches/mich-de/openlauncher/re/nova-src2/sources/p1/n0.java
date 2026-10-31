package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n0 implements b3 {

    /* renamed from: a, reason: collision with root package name */
    public final e1 f81515a;

    public n0(e1 e1Var) {
        this.f81515a = e1Var;
    }

    @Override // p1.b3
    public final Object a(n1 n1Var) {
        return ((s2) this.f81515a).getValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n0) && Intrinsics.b(this.f81515a, ((n0) obj).f81515a);
    }

    public final int hashCode() {
        return this.f81515a.hashCode();
    }

    public final String toString() {
        return "DynamicValueHolder(state=" + this.f81515a + ')';
    }
}
