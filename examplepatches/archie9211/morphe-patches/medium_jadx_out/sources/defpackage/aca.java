package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aca implements dca {
    public final List a;
    public final Integer b;
    public final rba c;
    public final List d;
    public final String e;
    public final zba f;

    public aca(List list, Integer num, rba rbaVar, List list2, String str, zba zbaVar) {
        list.getClass();
        rbaVar.getClass();
        list2.getClass();
        zbaVar.getClass();
        this.a = list;
        this.b = num;
        this.c = rbaVar;
        this.d = list2;
        this.e = str;
        this.f = zbaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aca)) {
            return false;
        }
        aca acaVar = (aca) obj;
        return g76.L(this.a, acaVar.a) && g76.L(this.b, acaVar.b) && this.c == acaVar.c && g76.L(this.d, acaVar.d) && g76.L(this.e, acaVar.e) && g76.L(this.f, acaVar.f);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Integer num = this.b;
        int iP = wgd.p((this.c.hashCode() + ((iHashCode + (num == null ? 0 : num.hashCode())) * 31)) * 31, 31, this.d);
        String str = this.e;
        return this.f.hashCode() + ((iP + (str != null ? str.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "Content(years=" + this.a + ", selectedYear=" + this.b + ", selectedSort=" + this.c + ", tags=" + this.d + ", selectedTagId=" + this.e + ", postsState=" + this.f + ")";
    }
}
