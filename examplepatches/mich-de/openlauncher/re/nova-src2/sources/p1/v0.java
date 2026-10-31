package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f81600a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f81601b;

    public v0(Integer num, Object obj) {
        this.f81600a = num;
        this.f81601b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        return this.f81600a.equals(v0Var.f81600a) && Intrinsics.b(this.f81601b, v0Var.f81601b);
    }

    public final int hashCode() {
        int iHashCode = this.f81600a.hashCode() * 31;
        Object obj = this.f81601b;
        return (obj instanceof Enum ? ((Enum) obj).ordinal() : obj != null ? obj.hashCode() : 0) + iHashCode;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("JoinedKey(left=");
        sb2.append(this.f81600a);
        sb2.append(", right=");
        return com.google.android.gms.internal.measurement.k2.j(sb2, this.f81601b, ')');
    }
}
