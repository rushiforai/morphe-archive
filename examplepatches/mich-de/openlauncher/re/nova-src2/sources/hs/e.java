package hs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e implements g {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f60049a;

    public e(Throwable th2) {
        this.f60049a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f60049a, ((e) obj).f60049a);
    }

    public final int hashCode() {
        return this.f60049a.hashCode();
    }

    public final String toString() {
        return fq.c.d("Error(error=", ")", this.f60049a);
    }
}
