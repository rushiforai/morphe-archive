package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final z2.n f70555a;

    public a(z2.n nVar) {
        this.f70555a = nVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f70555a, ((a) obj).f70555a);
    }

    public final int hashCode() {
        return this.f70555a.hashCode();
    }

    public final String toString() {
        return "Value(alignmentLine=" + this.f70555a + ')';
    }
}
