package fs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f55810a;

    public n0(Throwable th2) {
        this.f55810a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n0) && Intrinsics.b(this.f55810a, ((n0) obj).f55810a);
    }

    public final int hashCode() {
        return this.f55810a.hashCode();
    }

    public final String toString() {
        return fq.c.d("Error(error=", ")", this.f55810a);
    }
}
