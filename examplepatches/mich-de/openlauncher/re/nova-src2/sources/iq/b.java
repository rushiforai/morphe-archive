package iq;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements e {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f67962a;

    public b(Throwable th2) {
        this.f67962a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f67962a, ((b) obj).f67962a);
    }

    public final int hashCode() {
        return this.f67962a.hashCode();
    }

    public final String toString() {
        return fq.c.d("Error(cause=", ")", this.f67962a);
    }
}
