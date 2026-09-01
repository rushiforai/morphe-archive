package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy6 implements y3f {
    public final y3f a;
    public final int b;

    public zy6(y3f y3fVar, int i) {
        this.a = y3fVar;
        this.b = i;
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        if ((this.b & 16) != 0) {
            return this.a.a(m73Var);
        }
        return 0;
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        if (((ip6Var == ip6.Ltr ? 4 : 1) & this.b) != 0) {
            return this.a.b(m73Var, ip6Var);
        }
        return 0;
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        if ((this.b & 32) != 0) {
            return this.a.c(m73Var);
        }
        return 0;
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        if (((ip6Var == ip6.Ltr ? 8 : 2) & this.b) != 0) {
            return this.a.d(m73Var, ip6Var);
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zy6)) {
            return false;
        }
        zy6 zy6Var = (zy6) obj;
        return g76.L(this.a, zy6Var.a) && this.b == zy6Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("(");
        sb.append(this.a);
        sb.append(" only ");
        StringBuilder sb2 = new StringBuilder("WindowInsetsSides(");
        StringBuilder sb3 = new StringBuilder();
        int i = this.b;
        int i2 = ur7.d;
        if ((i & i2) == i2) {
            ur7.F("Start", sb3);
        }
        int i3 = ur7.f;
        if ((i & i3) == i3) {
            ur7.F("Left", sb3);
        }
        if ((i & 16) == 16) {
            ur7.F("Top", sb3);
        }
        int i4 = ur7.e;
        if ((i & i4) == i4) {
            ur7.F("End", sb3);
        }
        int i5 = ur7.g;
        if ((i & i5) == i5) {
            ur7.F("Right", sb3);
        }
        if ((i & 32) == 32) {
            ur7.F("Bottom", sb3);
        }
        sb2.append(sb3.toString());
        sb2.append(')');
        sb.append((Object) sb2.toString());
        sb.append(')');
        return sb.toString();
    }
}
