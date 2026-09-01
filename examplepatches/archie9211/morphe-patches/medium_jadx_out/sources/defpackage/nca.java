package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class nca implements boc {
    public final String a;
    public final String b;
    public final String c;
    public final String d;
    public final Integer e;
    public final az5 f;
    public final int g;
    public final int h;
    public final az5 i;
    public final SourceParameter j;

    public nca(String str, String str2, String str3, String str4, Integer num, az5 az5Var, int i, int i2, az5 az5Var2, SourceParameter sourceParameter) {
        str.getClass();
        str2.getClass();
        az5Var.getClass();
        az5Var2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
        this.e = num;
        this.f = az5Var;
        this.g = i;
        this.h = i2;
        this.i = az5Var2;
        this.j = sourceParameter;
    }

    @Override // defpackage.boc
    public final SourceParameter a() {
        return this.j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nca)) {
            return false;
        }
        nca ncaVar = (nca) obj;
        return g76.L(this.a, ncaVar.a) && g76.L(this.b, ncaVar.b) && g76.L(this.c, ncaVar.c) && g76.L(this.d, ncaVar.d) && g76.L(this.e, ncaVar.e) && g76.L(this.f, ncaVar.f) && this.g == ncaVar.g && this.h == ncaVar.h && g76.L(this.i, ncaVar.i) && this.j.equals(ncaVar.j);
    }

    @Override // defpackage.boc
    public final String getId() {
        return this.a;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.a;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        String str = this.c;
        int iHashCode = (iO + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.e;
        return this.j.hashCode() + ka1.b(this.i, (((ka1.b(this.f, (iHashCode2 + (num != null ? num.hashCode() : 0)) * 31, 31) + this.g) * 31) + this.h) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PublicationCardUiModel(id=", this.a, ", name=", this.b, ", description=");
        ka1.C(sbU, this.c, ", avatarImageId=", this.d, ", followerCount=");
        sbU.append(this.e);
        sbU.append(", writerAvatarImageIds=");
        sbU.append(this.f);
        sbU.append(", writerCount=");
        sbU.append(this.g);
        sbU.append(", editorCount=");
        sbU.append(this.h);
        sbU.append(", popularPosts=");
        sbU.append(this.i);
        sbU.append(", sourceParameter=");
        sbU.append(this.j);
        sbU.append(")");
        return sbU.toString();
    }
}
