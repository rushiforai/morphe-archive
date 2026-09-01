package defpackage;

import com.medium.android.core.models.BillingPeriod;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gcb {
    public final BillingPeriod a;
    public final zv7 b;
    public final List c;

    public gcb(BillingPeriod billingPeriod, zv7 zv7Var, List list) {
        billingPeriod.getClass();
        this.a = billingPeriod;
        this.b = zv7Var;
        this.c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gcb)) {
            return false;
        }
        gcb gcbVar = (gcb) obj;
        return this.a == gcbVar.a && g76.L(this.b, gcbVar.b) && this.c.equals(gcbVar.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        zv7 zv7Var = this.b;
        return this.c.hashCode() + ((iHashCode + (zv7Var == null ? 0 : zv7Var.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ResolvedMembershipPlansConfig(defaultFrequency=");
        sb.append(this.a);
        sb.append(", offer=");
        sb.append(this.b);
        sb.append(", plans=");
        return b09.B(sb, this.c, ")");
    }
}
