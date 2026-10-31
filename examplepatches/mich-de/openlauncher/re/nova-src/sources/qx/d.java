package qx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d extends e {

    /* renamed from: a, reason: collision with root package name */
    public final String f84461a;

    public d(String str) {
        this.f84461a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d) && Intrinsics.b(this.f84461a, ((d) obj).f84461a);
    }

    public final int hashCode() {
        return this.f84461a.hashCode();
    }

    public final String toString() {
        return b.c0.l("Unknown(message=", this.f84461a, ")");
    }
}
