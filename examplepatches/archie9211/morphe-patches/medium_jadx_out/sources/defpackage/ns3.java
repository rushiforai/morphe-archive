package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ns3 implements ps3 {
    public final String a;
    public final i06 b;
    public final rg1 c;
    public final rr3 d;
    public final rp3 e;

    public ns3(String str, i06 i06Var, rg1 rg1Var, rr3 rr3Var, rp3 rp3Var) {
        this.a = str;
        this.b = i06Var;
        this.c = rg1Var;
        this.d = rr3Var;
        this.e = rp3Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ns3)) {
            return false;
        }
        ns3 ns3Var = (ns3) obj;
        return this.a.equals(ns3Var.a) && g76.L(this.b, ns3Var.b) && g76.L(this.c, ns3Var.c) && this.d.equals(ns3Var.d) && this.e.equals(ns3Var.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        i06 i06Var = this.b;
        int iHashCode2 = (iHashCode + (i06Var == null ? 0 : i06Var.hashCode())) * 31;
        rg1 rg1Var = this.c;
        return this.e.hashCode() + ((this.d.hashCode() + ((iHashCode2 + (rg1Var != null ? rg1Var.hashCode() : 0)) * 31)) * 31);
    }

    public final String toString() {
        return "Loaded(source=" + this.a + ", inResponseToPostUiModel=" + this.b + ", inResponseToCatalogUiModel=" + this.c + HrUBqHumRuLe.wftY + this.d + ", bottomBarUiModel=" + this.e + ")";
    }
}
