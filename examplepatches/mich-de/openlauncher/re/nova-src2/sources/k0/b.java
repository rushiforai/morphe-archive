package k0;

import androidx.core.graphics.Insets;
import p1.s2;

/* loaded from: classes.dex */
public final class b implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final int f70563a;

    /* renamed from: b, reason: collision with root package name */
    public final String f70564b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.e1 f70565c = androidx.compose.runtime.d.k(Insets.NONE);

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f70566d = androidx.compose.runtime.d.k(Boolean.TRUE);

    public b(int i5, String str) {
        this.f70563a = i5;
        this.f70564b = str;
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        return e().left;
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        return e().right;
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        return e().bottom;
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        return e().top;
    }

    public final Insets e() {
        return (Insets) ((s2) this.f70565c).getValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof b) {
            return this.f70563a == ((b) obj).f70563a;
        }
        return false;
    }

    public final void f(a5.h2 h2Var, int i5) {
        int i11 = this.f70563a;
        if (i5 == 0 || (i5 & i11) != 0) {
            ((s2) this.f70565c).setValue(h2Var.f296a.g(i11));
            ((s2) this.f70566d).setValue(Boolean.valueOf(h2Var.f296a.q(i11)));
        }
    }

    public final int hashCode() {
        return this.f70563a;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f70564b);
        sb2.append('(');
        sb2.append(e().left);
        sb2.append(", ");
        sb2.append(e().top);
        sb2.append(", ");
        sb2.append(e().right);
        sb2.append(", ");
        return a2.c.m(sb2, e().bottom, ')');
    }
}
