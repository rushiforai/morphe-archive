package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ng6 implements fm6 {
    public static final gm6 c = new gm6(n1b.a.b(ng6.class));
    public boolean a;
    public final ArrayList b = new ArrayList();

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!ng6.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        ng6 ng6Var = (ng6) obj;
        return this.a == ng6Var.a && this.b.equals(ng6Var.b);
    }

    @Override // defpackage.fm6
    public final gm6 getType() {
        return c;
    }

    public final int hashCode() {
        return this.b.hashCode() + ((this.a ? 1231 : 1237) * 31);
    }
}
