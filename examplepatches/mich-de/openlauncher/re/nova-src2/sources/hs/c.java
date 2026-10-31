package hs;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements g {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f60047a;

    public c(Throwable th2) {
        this.f60047a = th2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f60047a, ((c) obj).f60047a);
    }

    public final int hashCode() {
        return this.f60047a.hashCode();
    }

    public final String toString() {
        return fq.c.d("AccountError(error=", ")", this.f60047a);
    }
}
