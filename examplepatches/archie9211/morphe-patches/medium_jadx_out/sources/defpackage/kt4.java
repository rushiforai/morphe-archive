package defpackage;

import com.medium.android.core.models.EntityType;
import com.squareup.wire.sjIw.ezwlgQm;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class kt4 implements nt4 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final SourceParameter d;

    public kt4(String str, EntityType entityType, String str2, SourceParameter sourceParameter) {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kt4)) {
            return false;
        }
        kt4 kt4Var = (kt4) obj;
        return g76.L(this.a, kt4Var.a) && this.b == kt4Var.b && g76.L(this.c, kt4Var.c) && g76.L(this.d, kt4Var.d);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        return this.d.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("SubscribeToNewsletter(entityId=", this.b, this.a, ", entityType=", ", newsletterId=");
        sbD.append(this.c);
        sbD.append(ezwlgQm.hAz);
        sbD.append(this.d);
        sbD.append(")");
        return sbD.toString();
    }
}
