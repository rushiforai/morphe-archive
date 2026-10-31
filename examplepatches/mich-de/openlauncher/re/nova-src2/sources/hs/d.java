package hs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements g {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f60048a;

    public d(Throwable th2) {
        this.f60048a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f60048a, ((d) obj).f60048a);
    }

    public final int hashCode() {
        return this.f60048a.hashCode();
    }

    public final String toString() {
        return fq.c.d("AttestationFailed(error=", ")", this.f60048a);
    }
}
