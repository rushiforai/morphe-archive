package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m9e {
    public final boolean a;
    public final w9e b;
    public final List c;
    public final k9e d;

    public m9e(boolean z, w9e w9eVar, g04 g04Var, k9e k9eVar) {
        w9eVar.getClass();
        g04Var.getClass();
        this.a = z;
        this.b = w9eVar;
        this.c = g04Var;
        this.d = k9eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m9e)) {
            return false;
        }
        m9e m9eVar = (m9e) obj;
        return this.a == m9eVar.a && this.b == m9eVar.b && this.c.equals(m9eVar.c) && this.d.equals(m9eVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.p((this.b.hashCode() + ((this.a ? 1231 : 1237) * 31)) * 31, 31, this.c);
    }

    public final String toString() {
        return "ViewState(showActivityTypeSelector=" + this.a + ", selectedActivityType=" + this.b + ", availableActivityTypes=" + this.c + ", activitiesState=" + this.d + ")";
    }
}
