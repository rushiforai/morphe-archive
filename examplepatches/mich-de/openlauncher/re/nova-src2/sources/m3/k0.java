package m3;

import b.c9;
import b.u4;
import com.google.android.gms.internal.measurement.k2;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final g f75914a;

    /* renamed from: b, reason: collision with root package name */
    public final p0 f75915b;

    /* renamed from: c, reason: collision with root package name */
    public final List f75916c;

    /* renamed from: d, reason: collision with root package name */
    public final int f75917d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f75918e;

    /* renamed from: f, reason: collision with root package name */
    public final int f75919f;

    /* renamed from: g, reason: collision with root package name */
    public final y3.c f75920g;

    /* renamed from: h, reason: collision with root package name */
    public final y3.n f75921h;

    /* renamed from: i, reason: collision with root package name */
    public final q3.o f75922i;

    /* renamed from: j, reason: collision with root package name */
    public final long f75923j;

    public k0(g gVar, p0 p0Var, List list, int i5, boolean z11, int i11, y3.c cVar, y3.n nVar, q3.o oVar, long j11) {
        this.f75914a = gVar;
        this.f75915b = p0Var;
        this.f75916c = list;
        this.f75917d = i5;
        this.f75918e = z11;
        this.f75919f = i11;
        this.f75920g = cVar;
        this.f75921h = nVar;
        this.f75922i = oVar;
        this.f75923j = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k0)) {
            return false;
        }
        k0 k0Var = (k0) obj;
        return Intrinsics.b(this.f75914a, k0Var.f75914a) && Intrinsics.b(this.f75915b, k0Var.f75915b) && Intrinsics.b(this.f75916c, k0Var.f75916c) && this.f75917d == k0Var.f75917d && this.f75918e == k0Var.f75918e && this.f75919f == k0Var.f75919f && Intrinsics.b(this.f75920g, k0Var.f75920g) && this.f75921h == k0Var.f75921h && Intrinsics.b(this.f75922i, k0Var.f75922i) && y3.a.b(this.f75923j, k0Var.f75923j);
    }

    public final int hashCode() {
        return Long.hashCode(this.f75923j) + ((this.f75922i.hashCode() + ((this.f75921h.hashCode() + ((this.f75920g.hashCode() + u4.a(this.f75919f, c9.f((u4.c(k2.g(this.f75914a.hashCode() * 31, 31, this.f75915b), 31, this.f75916c) + this.f75917d) * 31, 31, this.f75918e), 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextLayoutInput(text=");
        sb2.append((Object) this.f75914a);
        sb2.append(", style=");
        sb2.append(this.f75915b);
        sb2.append(", placeholders=");
        sb2.append(this.f75916c);
        sb2.append(", maxLines=");
        sb2.append(this.f75917d);
        sb2.append(", softWrap=");
        sb2.append(this.f75918e);
        sb2.append(", overflow=");
        int i5 = this.f75919f;
        sb2.append((Object) (i5 == 1 ? "Clip" : i5 == 2 ? "Ellipsis" : i5 == 5 ? "MiddleEllipsis" : i5 == 3 ? "Visible" : i5 == 4 ? "StartEllipsis" : "Invalid"));
        sb2.append(", density=");
        sb2.append(this.f75920g);
        sb2.append(", layoutDirection=");
        sb2.append(this.f75921h);
        sb2.append(", fontFamilyResolver=");
        sb2.append(this.f75922i);
        sb2.append(", constraints=");
        sb2.append((Object) y3.a.k(this.f75923j));
        sb2.append(')');
        return sb2.toString();
    }
}
