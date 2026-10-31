package c3;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class g3 {

    /* renamed from: a, reason: collision with root package name */
    public final String f19302a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f19303b;

    public g3(String str, Object obj) {
        this.f19302a = str;
        this.f19303b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g3)) {
            return false;
        }
        g3 g3Var = (g3) obj;
        return Intrinsics.b(this.f19302a, g3Var.f19302a) && Intrinsics.b(this.f19303b, g3Var.f19303b);
    }

    public final int hashCode() {
        int iHashCode = this.f19302a.hashCode() * 31;
        Object obj = this.f19303b;
        return iHashCode + (obj == null ? 0 : obj.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ValueElement(name=");
        sb2.append(this.f19302a);
        sb2.append(", value=");
        return com.google.android.gms.internal.measurement.k2.j(sb2, this.f19303b, ')');
    }
}
