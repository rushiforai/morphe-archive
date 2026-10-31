package tx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 extends y0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f90057a;

    public x0(String str) {
        this.f90057a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x0) && Intrinsics.b(this.f90057a, ((x0) obj).f90057a);
    }

    public final int hashCode() {
        return this.f90057a.hashCode();
    }

    public final String toString() {
        return b.c0.l("Unavailable(reason=", this.f90057a, ")");
    }
}
