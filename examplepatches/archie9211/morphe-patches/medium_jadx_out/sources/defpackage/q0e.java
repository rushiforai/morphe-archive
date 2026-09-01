package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q0e implements r0e {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;

    public q0e(String str, EntityType entityType, String str2, String str3) {
        str.getClass();
        entityType.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0e)) {
            return false;
        }
        q0e q0eVar = (q0e) obj;
        return g76.L(this.a, q0eVar.a) && this.b == q0eVar.b && this.c.equals(q0eVar.c) && g76.L(this.d, q0eVar.d);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return km4.C(km4.D("Success(entityId=", this.b, this.a, ", entityType=", ", entityName="), this.c, ", newsletterId=", this.d, ")");
    }
}
