package tw;

import b.c0;
import b.u4;
import i2.n;
import i2.t;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f89609a;

    /* renamed from: b, reason: collision with root package name */
    public final int f89610b;

    /* renamed from: c, reason: collision with root package name */
    public final t f89611c;

    public a(int i5, int i11, n nVar) {
        this.f89609a = i5;
        this.f89610b = i11;
        this.f89611c = nVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f89609a == aVar.f89609a && this.f89610b == aVar.f89610b && Intrinsics.b(this.f89611c, aVar.f89611c);
    }

    public final int hashCode() {
        int iA = u4.a(this.f89610b, Integer.hashCode(this.f89609a) * 31, 31);
        t tVar = this.f89611c;
        return iA + (tVar == null ? 0 : tVar.hashCode());
    }

    public final String toString() {
        StringBuilder sbT = c0.t(this.f89609a, "Drawable(id=", ", contentDescription=", this.f89610b, ", colorFilter=");
        sbT.append(this.f89611c);
        sbT.append(")");
        return sbT.toString();
    }
}
