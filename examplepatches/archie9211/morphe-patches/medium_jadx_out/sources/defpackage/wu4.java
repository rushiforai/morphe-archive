package defpackage;

import com.medium.android.core.models.EntityType;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class wu4 {
    public final String a;
    public final String b;
    public final EntityType c;
    public final bt4 d;
    public final cg8 e;
    public final SourceParameter f;

    public wu4(String str, String str2, EntityType entityType, bt4 bt4Var, cg8 cg8Var, SourceParameter sourceParameter) {
        entityType.getClass();
        bt4Var.getClass();
        cg8Var.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = str2;
        this.c = entityType;
        this.d = bt4Var;
        this.e = cg8Var;
        this.f = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wu4)) {
            return false;
        }
        wu4 wu4Var = (wu4) obj;
        return g76.L(this.a, wu4Var.a) && g76.L(this.b, wu4Var.b) && this.c == wu4Var.c && this.d == wu4Var.d && g76.L(this.e, wu4Var.e) && g76.L(this.f, wu4Var.f);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        return this.f.hashCode() + ((this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("FollowSubscribeUiModel(entityId=", this.a, ", entityName=", this.b, ", entityType=");
        sbU.append(this.c);
        sbU.append(", followState=");
        sbU.append(this.d);
        sbU.append(mBTDfueQiGWRV.CGYZdZj);
        sbU.append(this.e);
        sbU.append(", sourceParameter=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
