package p10;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f81828a;

    public l1(String str) {
        this.f81828a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l1) && Intrinsics.b(this.f81828a, ((l1) obj).f81828a);
    }

    public final int hashCode() {
        return this.f81828a.hashCode();
    }

    public final String toString() {
        return b.c0.l("NotEarned(reason=", this.f81828a, ")");
    }
}
