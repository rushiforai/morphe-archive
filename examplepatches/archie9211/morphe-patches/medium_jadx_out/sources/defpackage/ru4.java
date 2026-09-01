package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ru4 implements uu4 {
    public final String a;
    public final EntityType b;
    public final String c;

    public ru4(String str, EntityType entityType, String str2) {
        str.getClass();
        entityType.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ru4)) {
            return false;
        }
        ru4 ru4Var = (ru4) obj;
        return g76.L(this.a, ru4Var.a) && this.b == ru4Var.b && g76.L(this.c, ru4Var.c);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return ka1.v(km4.D("EmailAddressSharingDisallowed(entityId=", this.b, this.a, ", entityType=", ", newsletterId="), this.c, ")");
    }
}
