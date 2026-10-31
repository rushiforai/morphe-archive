package p6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f82173a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f82174b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f82175c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f82176d;

    public h(x0 x0Var, boolean z11, Object obj, boolean z12) {
        if (!x0Var.f82296a && z11) {
            throw new IllegalArgumentException(x0Var.b().concat(" does not allow nullable values").toString());
        }
        if (!z11 && z12 && obj == null) {
            throw new IllegalArgumentException(("Argument with type " + x0Var.b() + " has null value but is not nullable.").toString());
        }
        this.f82173a = x0Var;
        this.f82174b = z11;
        this.f82176d = obj;
        this.f82175c = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !h.class.equals(obj.getClass())) {
            return false;
        }
        h hVar = (h) obj;
        Object obj2 = hVar.f82176d;
        if (this.f82174b != hVar.f82174b || this.f82175c != hVar.f82175c || !this.f82173a.equals(hVar.f82173a)) {
            return false;
        }
        Object obj3 = this.f82176d;
        return obj3 != null ? obj3.equals(obj2) : obj2 == null;
    }

    public final int hashCode() {
        int iHashCode = ((((this.f82173a.hashCode() * 31) + (this.f82174b ? 1 : 0)) * 31) + (this.f82175c ? 1 : 0)) * 31;
        Object obj = this.f82176d;
        return iHashCode + (obj != null ? obj.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(h.class.getSimpleName());
        sb2.append(" Type: " + this.f82173a);
        sb2.append(" Nullable: " + this.f82174b);
        if (this.f82175c) {
            sb2.append(" DefaultValue: " + this.f82176d);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
