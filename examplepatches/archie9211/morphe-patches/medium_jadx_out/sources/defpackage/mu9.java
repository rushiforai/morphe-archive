package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mu9 implements ou9 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;
    public final b24 e;
    public final String f;

    public mu9(String str, EntityType entityType, String str2, String str3, b24 b24Var, String str4) {
        str.getClass();
        entityType.getClass();
        str2.getClass();
        str3.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = str3;
        this.e = b24Var;
        this.f = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mu9)) {
            return false;
        }
        mu9 mu9Var = (mu9) obj;
        return g76.L(this.a, mu9Var.a) && this.b == mu9Var.b && g76.L(this.c, mu9Var.c) && g76.L(this.d, mu9Var.d) && this.e.equals(mu9Var.e) && this.f.equals(mu9Var.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + ((this.e.hashCode() + wgd.o(wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c), 31, this.d)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("UnsubscribedToNewsletterFailure(entityName=", this.b, this.a, ", entityType=", ", entityId=");
        ka1.C(sbD, this.c, ", newsletterId=", this.d, ", errorState=");
        sbD.append(this.e);
        sbD.append(", source=");
        sbD.append(this.f);
        sbD.append(")");
        return sbD.toString();
    }
}
