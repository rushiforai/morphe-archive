package fs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f55801a;

    public l0(Throwable th2) {
        this.f55801a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l0) && Intrinsics.b(this.f55801a, ((l0) obj).f55801a);
    }

    public final int hashCode() {
        return this.f55801a.hashCode();
    }

    public final String toString() {
        return fq.c.d("AccountError(error=", ")", this.f55801a);
    }
}
