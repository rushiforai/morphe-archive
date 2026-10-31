package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f81445a;

    public h1(String str) {
        this.f81445a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h1) && Intrinsics.b(this.f81445a, ((h1) obj).f81445a);
    }

    public final int hashCode() {
        return this.f81445a.hashCode();
    }

    public final String toString() {
        return h6.c1.t(new StringBuilder("OpaqueKey(key="), this.f81445a, ')');
    }
}
