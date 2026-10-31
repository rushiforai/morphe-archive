package a2;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final int f116a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f117b;

    public n(int i5, Integer num) {
        this.f116a = i5;
        this.f117b = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return this.f116a == nVar.f116a && Intrinsics.b(this.f117b, nVar.f117b);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f116a) * 31;
        Integer num = this.f117b;
        return iHashCode + (num == null ? 0 : num.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ObjectLocation(group=");
        sb2.append(this.f116a);
        sb2.append(", dataOffset=");
        return c.o(sb2, this.f117b, ')');
    }
}
