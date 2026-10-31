package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class xu0 implements b.a1 {

    /* renamed from: b, reason: collision with root package name */
    public final Object f11834b;

    public xu0(Object obj) {
        this.f11834b = obj;
    }

    public final Object a() {
        return this.f11834b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof xu0) && Intrinsics.b(this.f11834b, ((xu0) obj).f11834b);
    }

    public final int hashCode() {
        Object obj = this.f11834b;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        return "Success(result=" + this.f11834b + ")";
    }
}
