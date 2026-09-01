package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nu9 implements ou9 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;
    public final String e;

    public nu9(String str, EntityType entityType, String str2, String str3, String str4) {
        str.getClass();
        entityType.getClass();
        str2.getClass();
        str3.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = str3;
        this.e = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nu9)) {
            return false;
        }
        nu9 nu9Var = (nu9) obj;
        return g76.L(this.a, nu9Var.a) && this.b == nu9Var.b && g76.L(this.c, nu9Var.c) && g76.L(this.d, nu9Var.d) && this.e.equals(nu9Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + wgd.o(wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c), 31, this.d);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("UnsubscribedToNewsletterSuccess(entityName=", this.b, this.a, ", entityType=", ", entityId=");
        ka1.C(sbD, this.c, ", newsletterId=", this.d, ", source=");
        return ka1.v(sbD, this.e, ")");
    }
}
