package fs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f55805a;

    public m0(Throwable th2) {
        this.f55805a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m0) && Intrinsics.b(this.f55805a, ((m0) obj).f55805a);
    }

    public final int hashCode() {
        return this.f55805a.hashCode();
    }

    public final String toString() {
        return fq.c.d("AttestationFailed(error=", ")", this.f55805a);
    }
}
