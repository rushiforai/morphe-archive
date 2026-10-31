package cs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements u {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f47852a;

    public s(Throwable error) {
        Intrinsics.g(error, "error");
        this.f47852a = error;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s) && Intrinsics.b(this.f47852a, ((s) obj).f47852a);
    }

    public final int hashCode() {
        return this.f47852a.hashCode();
    }

    public final String toString() {
        return fq.c.d("Failure(error=", ")", this.f47852a);
    }
}
