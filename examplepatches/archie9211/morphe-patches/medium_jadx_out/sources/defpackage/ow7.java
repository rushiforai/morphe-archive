package defpackage;

import com.medium.android.core.models.BillingPeriod;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ow7 {
    public final BillingPeriod a;
    public final zv7 b;
    public final ArrayList c;

    public ow7(BillingPeriod billingPeriod, zv7 zv7Var, ArrayList arrayList) {
        billingPeriod.getClass();
        this.a = billingPeriod;
        this.b = zv7Var;
        this.c = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ow7)) {
            return false;
        }
        ow7 ow7Var = (ow7) obj;
        return this.a == ow7Var.a && g76.L(this.b, ow7Var.b) && this.c.equals(ow7Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        zv7 zv7Var = this.b;
        return this.c.hashCode() + ((iHashCode + (zv7Var == null ? 0 : zv7Var.hashCode())) * 31);
    }

    public final String toString() {
        return "MembershipPlansConfig(defaultFrequency=" + this.a + ", offer=" + this.b + ", plans=" + this.c + ")";
    }
}
