package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final String f49792a;

    public static void a(String id2) {
        Intrinsics.g(id2, "id");
        if (r70.k.U0(id2)) {
            throw new IllegalArgumentException("AdPlacement id must not be blank");
        }
    }

    public static String b(String str) {
        return b.c0.l("AdPlacement(id=", str, ")");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof t) {
            return Intrinsics.b(this.f49792a, ((t) obj).f49792a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f49792a.hashCode();
    }

    public final String toString() {
        return b(this.f49792a);
    }
}
