package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class aae implements bae {
    public final String a;
    public final String b;
    public final String c;
    public final boolean d;
    public final long e;
    public final dr9 f;
    public final String g;
    public final String h;
    public final String i;
    public final String j;
    public final String k;
    public final String l;
    public final mx m;
    public final SourceParameter n;

    public aae(String str, String str2, String str3, boolean z, long j, dr9 dr9Var, String str4, String str5, String str6, String str7, String str8, String str9, mx mxVar, SourceParameter sourceParameter) {
        b09.I(str, str4, str9);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = z;
        this.e = j;
        this.f = dr9Var;
        this.g = str4;
        this.h = str5;
        this.i = str6;
        this.j = str7;
        this.k = str8;
        this.l = str9;
        this.m = mxVar;
        this.n = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof aae)) {
            return false;
        }
        aae aaeVar = (aae) obj;
        return g76.L(this.a, aaeVar.a) && g76.L(this.b, aaeVar.b) && g76.L(this.c, aaeVar.c) && this.d == aaeVar.d && this.e == aaeVar.e && this.f.equals(aaeVar.f) && g76.L(this.g, aaeVar.g) && g76.L(this.h, aaeVar.h) && g76.L(this.i, aaeVar.i) && g76.L(this.j, aaeVar.j) && this.k.equals(aaeVar.k) && g76.L(this.l, aaeVar.l) && this.m.equals(aaeVar.m) && this.n.equals(aaeVar.n);
    }

    @Override // defpackage.bae
    public final String getId() {
        return this.a;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        int i = this.d ? 1231 : 1237;
        long j = this.e;
        int iO = wgd.o((this.f.hashCode() + ((((iHashCode3 + i) * 31) + ((int) (j ^ (j >>> 32)))) * 31)) * 31, 31, this.g);
        String str3 = this.h;
        int iHashCode4 = (iO + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.i;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.j;
        return this.n.hashCode() + ((this.m.hashCode() + wgd.o(wgd.o((iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 31, 31, this.k), 31, this.l)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ResponseToResponse(id=", this.a, ", actorName=", this.b, KLTXZbnQvj.BkKdA);
        ka1.D(sbU, this.c, ", isCurrentUser=", this.d, ", occurredAt=");
        sbU.append(this.e);
        sbU.append(", postUiModel=");
        sbU.append(this.f);
        ka1.C(sbU, ", respondedResponseId=", this.g, ", respondedResponseAuthorId=", this.h);
        ka1.C(sbU, ", respondedResponseAuthorName=", this.i, ", respondedResponseAuthorImageId=", this.j);
        ka1.C(sbU, ", respondedResponseContent=", this.k, ", responseId=", this.l);
        sbU.append(", responseContent=");
        sbU.append((Object) this.m);
        sbU.append(", sourceParameter=");
        sbU.append(this.n);
        sbU.append(")");
        return sbU.toString();
    }
}
