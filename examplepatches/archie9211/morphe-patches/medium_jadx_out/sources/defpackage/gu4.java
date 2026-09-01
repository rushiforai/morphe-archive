package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gu4 implements ju4 {
    public final String a;
    public final EntityType b;
    public final String c;
    public final String d;
    public final zw7 e;
    public final String f;
    public final boolean g;
    public final boolean h;
    public final SourceParameter i;

    public gu4(String str, EntityType entityType, String str2, String str3, zw7 zw7Var, String str4, boolean z, boolean z2, SourceParameter sourceParameter) {
        str.getClass();
        entityType.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = entityType;
        this.c = str2;
        this.d = str3;
        this.e = zw7Var;
        this.f = str4;
        this.g = z;
        this.h = z2;
        this.i = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gu4)) {
            return false;
        }
        gu4 gu4Var = (gu4) obj;
        return g76.L(this.a, gu4Var.a) && this.b == gu4Var.b && this.c.equals(gu4Var.c) && g76.L(this.d, gu4Var.d) && this.e == gu4Var.e && g76.L(this.f, gu4Var.f) && this.g == gu4Var.g && this.h == gu4Var.h && g76.L(this.i, gu4Var.i);
    }

    public final int hashCode() {
        int iO = wgd.o((this.b.hashCode() + (this.a.hashCode() * 31)) * 31, 31, this.c);
        String str = this.d;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        zw7 zw7Var = this.e;
        int iHashCode2 = (iHashCode + (zw7Var == null ? 0 : zw7Var.hashCode())) * 31;
        String str2 = this.f;
        return this.i.hashCode() + ((((((iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = km4.D("Content(entityId=", this.b, this.a, ", entityType=", ", entityName=");
        ka1.C(sbD, this.c, ", entityImageId=", this.d, ", entityMembershipType=");
        sbD.append(this.e);
        sbD.append(", newsletterId=");
        sbD.append(this.f);
        sbD.append(", saving=");
        ho2.R(sbD, this.g, ", isSubscribedToNewsletter=", this.h, ", sourceParameter=");
        return y30.r(sbD, this.i, ")");
    }
}
