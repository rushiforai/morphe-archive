package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hu implements y3f {
    public final int a;
    public final String b;
    public final k49 c = qo7.u(b36.e);
    public final k49 d = qo7.u(Boolean.TRUE);

    public hu(int i, String str) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        return e().b;
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        return e().c;
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        return e().d;
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        return e().a;
    }

    public final b36 e() {
        return (b36) this.c.getValue();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof hu) {
            return this.a == ((hu) obj).a;
        }
        return false;
    }

    public final void f(boolean z) {
        this.d.setValue(Boolean.valueOf(z));
    }

    public final void g(z4f z4fVar, int i) {
        int i2 = this.a;
        if (i == 0 || (i & i2) != 0) {
            this.c.setValue(z4fVar.a.i(i2));
            f(z4fVar.a.u(i2));
        }
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(this.b);
        sb.append('(');
        sb.append(e().a);
        sb.append(", ");
        sb.append(e().b);
        sb.append(", ");
        sb.append(e().c);
        sb.append(", ");
        return km4.A(sb, e().d, ')');
    }
}
