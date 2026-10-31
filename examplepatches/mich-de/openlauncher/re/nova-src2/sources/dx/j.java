package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements n {

    /* renamed from: a, reason: collision with root package name */
    public final String f49716a;

    public j(String message) {
        Intrinsics.g(message, "message");
        this.f49716a = message;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j) && Intrinsics.b(this.f49716a, ((j) obj).f49716a);
    }

    public final int hashCode() {
        return this.f49716a.hashCode();
    }

    public final String toString() {
        return b.c0.l("Internal(message=", this.f49716a, ")");
    }
}
