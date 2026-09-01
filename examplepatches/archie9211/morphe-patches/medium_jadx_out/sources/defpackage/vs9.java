package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vs9 implements ou9 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final SourceParameter d;

    public vs9(String str, EntityType entityType, String str2, SourceParameter sourceParameter) {
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
        if (!(obj instanceof vs9)) {
            return false;
        }
        vs9 vs9Var = (vs9) obj;
        return g76.L(this.a, vs9Var.a) && this.b == vs9Var.b && g76.L(this.c, vs9Var.c) && g76.L(this.d, vs9Var.d);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        return this.d.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("NavigateToFollowSubscribeModal(entityId=", this.b, this.a, ", entityType=", ", newsletterId=");
        sbD.append(this.c);
        sbD.append(", sourceParameter=");
        sbD.append(this.d);
        sbD.append(")");
        return sbD.toString();
    }
}
