package v70;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: b, reason: collision with root package name */
    public static final q f92193b = new q();

    /* renamed from: a, reason: collision with root package name */
    public final Object f92194a;

    public static final Object a(Object obj) {
        if (obj instanceof q) {
            return null;
        }
        return obj;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof r) {
            return Intrinsics.b(this.f92194a, ((r) obj).f92194a);
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.f92194a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        Object obj = this.f92194a;
        if (obj instanceof p) {
            return ((p) obj).toString();
        }
        return "Value(" + obj + ')';
    }
}
