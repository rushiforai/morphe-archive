package xz;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final List f96486a;

    public e(List list) {
        this.f96486a = list;
    }

    public final List a() {
        return this.f96486a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f96486a, ((e) obj).f96486a);
    }

    public final int hashCode() {
        return this.f96486a.hashCode();
    }

    public final String toString() {
        return "RecommendationResult(tracks=" + this.f96486a + ")";
    }
}
