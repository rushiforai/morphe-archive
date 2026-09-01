package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ft9 implements ou9 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;
    public final String e;

    public ft9(String str, EntityType entityType, String str2, String str3, String str4) {
        str.getClass();
        entityType.getClass();
        str2.getClass();
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
        if (!(obj instanceof ft9)) {
            return false;
        }
        ft9 ft9Var = (ft9) obj;
        return g76.L(this.a, ft9Var.a) && this.b == ft9Var.b && g76.L(this.c, ft9Var.c) && g76.L(this.d, ft9Var.d) && this.e.equals(ft9Var.e);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.e.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("NavigateToSubscribeToNewsletterConsent(entityId=", this.b, this.a, ", entityType=", ", entityName=");
        ka1.C(sbD, this.c, ", newsletterId=", this.d, ", source=");
        return ka1.v(sbD, this.e, ")");
    }
}
