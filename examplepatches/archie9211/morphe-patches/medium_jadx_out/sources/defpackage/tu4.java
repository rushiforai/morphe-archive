package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tu4 implements uu4 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;

    public tu4(String str, EntityType entityType, String str2, String str3) {
        str.getClass();
        entityType.getClass();
        str3.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tu4)) {
            return false;
        }
        tu4 tu4Var = (tu4) obj;
        return g76.L(this.a, tu4Var.a) && this.b == tu4Var.b && this.c.equals(tu4Var.c) && g76.L(this.d, tu4Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
    }

    public final String toString() {
        return km4.C(km4.D("Success(entityId=", this.b, this.a, ", entityType=", ", entityName="), this.c, ", newsletterId=", this.d, ")");
    }
}
