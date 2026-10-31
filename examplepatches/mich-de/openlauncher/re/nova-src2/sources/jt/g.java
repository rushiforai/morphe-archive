package jt;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g extends h {

    /* renamed from: a, reason: collision with root package name */
    public final String f69788a;

    public g(String str) {
        this.f69788a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Intrinsics.b(this.f69788a, ((g) obj).f69788a);
    }

    public final int hashCode() {
        String str = this.f69788a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return b.c0.l("Success(originalDnsCacheTtl=", this.f69788a, ")");
    }
}
