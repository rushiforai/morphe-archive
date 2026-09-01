package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vk5 implements yk5 {
    public final String a;
    public final long b;
    public final uk5 c;
    public final String d;
    public final String e;
    public final long f;
    public final String g;
    public final List h;
    public final String i;

    public vk5(String str, long j, uk5 uk5Var, String str2, String str3, long j2, String str4, List list, String str5) {
        str3.getClass();
        str4.getClass();
        list.getClass();
        this.a = str;
        this.b = j;
        this.c = uk5Var;
        this.d = str2;
        this.e = str3;
        this.f = j2;
        this.g = str4;
        this.h = list;
        this.i = str5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vk5)) {
            return false;
        }
        vk5 vk5Var = (vk5) obj;
        return this.a.equals(vk5Var.a) && this.b == vk5Var.b && this.c.equals(vk5Var.c) && this.d.equals(vk5Var.d) && g76.L(this.e, vk5Var.e) && this.f == vk5Var.f && g76.L(this.g, vk5Var.g) && g76.L(this.h, vk5Var.h) && this.i.equals(vk5Var.i);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        int iO = wgd.o(wgd.o((this.c.hashCode() + ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31)) * 31, 31, this.d), 31, this.e);
        long j2 = this.f;
        return this.i.hashCode() + wgd.p(wgd.o((iO + ((int) (j2 ^ (j2 >>> 32)))) * 31, 31, this.g), 31, this.h);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "Content(authorName=", this.a, ", clapCount=");
        sbI.append(", highlightState=");
        sbI.append(this.c);
        sbI.append(", postTitle=");
        sbI.append(this.d);
        sbI.append(", postVersionId=");
        sbI.append(this.e);
        sbI.append(", responsesCount=");
        sbI.append(this.f);
        sbI.append(", currentUserId=");
        sbI.append(this.g);
        sbI.append(", highlights=");
        sbI.append(this.h);
        sbI.append(", source=");
        sbI.append(this.i);
        sbI.append(")");
        return sbI.toString();
    }
}
