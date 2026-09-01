package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gj0 {
    public final Object a;
    public final z0a b;
    public final ak0 c;

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof gj0)) {
            return false;
        }
        gj0 gj0Var = (gj0) obj;
        if (!this.a.equals(gj0Var.a) || !this.b.equals(gj0Var.b)) {
            return false;
        }
        ak0 ak0Var = gj0Var.c;
        ak0 ak0Var2 = this.c;
        return ak0Var2 == null ? ak0Var == null : ak0Var2.equals(ak0Var);
    }

    public final int hashCode() {
        int iHashCode = ((((1000003 * 1000003) ^ this.a.hashCode()) * 1000003) ^ this.b.hashCode()) * 1000003;
        ak0 ak0Var = this.c;
        return ((ak0Var == null ? 0 : ak0Var.hashCode()) ^ iHashCode) * 1000003;
    }

    public final String toString() {
        return "Event{code=null, payload=" + this.a + ", priority=" + this.b + ", productData=" + this.c + ", eventContext=null}";
    }

    public gj0(Object obj, z0a z0aVar, ak0 ak0Var) {
        this.a = obj;
        if (z0aVar != null) {
            this.b = z0aVar;
            this.c = ak0Var;
        } else {
            z72.c(OphtYB.mPib);
            throw null;
        }
    }
}
