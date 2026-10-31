package p1;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f0 implements b3 {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f81408a;

    public f0(Function1 function1) {
        this.f81408a = function1;
    }

    @Override // p1.b3
    public final Object a(n1 n1Var) {
        return this.f81408a.invoke(n1Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f0) && Intrinsics.b(this.f81408a, ((f0) obj).f81408a);
    }

    public final int hashCode() {
        return this.f81408a.hashCode();
    }

    public final String toString() {
        return "ComputedValueHolder(compute=" + this.f81408a + ')';
    }
}
