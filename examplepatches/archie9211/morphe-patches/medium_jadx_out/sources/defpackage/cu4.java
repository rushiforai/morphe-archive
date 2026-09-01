package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cu4 implements fu4 {
    public final EntityType a;
    public final String b;

    public cu4(EntityType entityType, String str) {
        entityType.getClass();
        this.a = entityType;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof cu4)) {
            return false;
        }
        cu4 cu4Var = (cu4) obj;
        return this.a == cu4Var.a && this.b.equals(cu4Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "UnfollowSuccess(entityType=" + this.a + ", entityName=" + this.b + ")";
    }
}
