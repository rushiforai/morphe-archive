package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p0e implements r0e {
    public final String a;
    public final EntityType b;
    public final String c;
    public final Throwable d;

    public p0e(String str, EntityType entityType, String str2, Throwable th) {
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
        if (!(obj instanceof p0e)) {
            return false;
        }
        p0e p0eVar = (p0e) obj;
        return g76.L(this.a, p0eVar.a) && this.b == p0eVar.b && g76.L(this.c, p0eVar.c) && this.d.equals(p0eVar.d);
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
