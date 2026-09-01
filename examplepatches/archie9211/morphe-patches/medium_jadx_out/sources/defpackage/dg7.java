package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dg7 implements fg7 {
    public final List a;
    public final lv0 b;

    public dg7(f17 f17Var, lv0 lv0Var) {
        f17Var.getClass();
        lv0Var.getClass();
        this.a = f17Var;
        this.b = lv0Var;
    }

    @Override // defpackage.fg7
    public final List a() {
        return this.a;
    }

    @Override // defpackage.fg7
    public final lv0 b() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dg7)) {
            return false;
        }
        dg7 dg7Var = (dg7) obj;
        return this.a.equals(dg7Var.a) && this.b == dg7Var.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Loading(bottomBarItems=" + this.a + ", selectedBottomBarItem=" + this.b + ")";
    }
}
