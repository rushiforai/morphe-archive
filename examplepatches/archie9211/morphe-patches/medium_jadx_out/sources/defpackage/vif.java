package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vif {
    public final gz a;
    public final da4 b;

    public /* synthetic */ vif(gz gzVar, da4 da4Var) {
        this.a = gzVar;
        this.b = da4Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof vif)) {
            return false;
        }
        vif vifVar = (vif) obj;
        return en7.u(this.a, vifVar.a) && en7.u(this.b, vifVar.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.a, this.b});
    }

    public final String toString() {
        hx4 hx4Var = new hx4(this);
        hx4Var.a("key", this.a);
        hx4Var.a("feature", this.b);
        return hx4Var.toString();
    }
}
