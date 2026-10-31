package q3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Object f83568a;

    public final boolean equals(Object obj) {
        if (obj instanceof i) {
            return Intrinsics.b(this.f83568a, ((i) obj).f83568a);
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.f83568a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        return "AsyncTypefaceResult(result=" + this.f83568a + ')';
    }
}
