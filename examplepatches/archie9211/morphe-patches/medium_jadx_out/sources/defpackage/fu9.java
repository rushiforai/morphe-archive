package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fu9 implements ou9 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;
    public final b24 e;
    public final String f;

    public fu9(String str, EntityType entityType, String str2, String str3, b24 b24Var, String str4) {
        str.getClass();
        entityType.getClass();
        str2.getClass();
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
        if (!(obj instanceof fu9)) {
            return false;
        }
        fu9 fu9Var = (fu9) obj;
        return g76.L(this.a, fu9Var.a) && this.b == fu9Var.b && g76.L(this.c, fu9Var.c) && g76.L(this.d, fu9Var.d) && this.e.equals(fu9Var.e) && this.f.equals(fu9Var.f);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        return this.f.hashCode() + ((this.e.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("SubscribedToNewsletterFailure(entityName=", this.b, this.a, ", entityType=", ", entityId=");
        ka1.C(sbD, this.c, ", newsletterId=", this.d, ", errorState=");
        sbD.append(this.e);
        sbD.append(", source=");
        sbD.append(this.f);
        sbD.append(")");
        return sbD.toString();
    }
}
