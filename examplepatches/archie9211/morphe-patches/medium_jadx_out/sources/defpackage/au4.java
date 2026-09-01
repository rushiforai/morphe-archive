package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class au4 implements fu4 {
    public final EntityType a;
    public final String b;

    public au4(EntityType entityType, String str) {
        entityType.getClass();
        str.getClass();
        this.a = entityType;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof au4)) {
            return false;
        }
        au4 au4Var = (au4) obj;
        return this.a == au4Var.a && g76.L(this.b, au4Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "SubscribeNewsletterSuccess(entityType=" + this.a + ", entityName=" + this.b + ")";
    }
}
