package pu;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final String f83093a;

    public u(String str) {
        this.f83093a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u) && Intrinsics.b(this.f83093a, ((u) obj).f83093a);
    }

    public final int hashCode() {
        String str = this.f83093a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return b.c0.l("Args(country=", this.f83093a, ")");
    }
}
