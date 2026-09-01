package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class su4 implements uu4 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final Throwable d;

    public su4(String str, EntityType entityType, String str2, Throwable th) {
        str.getClass();
        entityType.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof su4)) {
            return false;
        }
        su4 su4Var = (su4) obj;
        return g76.L(this.a, su4Var.a) && this.b == su4Var.b && g76.L(this.c, su4Var.c) && this.d.equals(su4Var.d);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        String str = this.c;
        return this.d.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("Failure(entityId=", this.b, this.a, ", entityType=", ", newsletterId=");
        sbD.append(this.c);
        sbD.append(", e=");
        sbD.append(this.d);
        sbD.append(")");
        return sbD.toString();
    }
}
