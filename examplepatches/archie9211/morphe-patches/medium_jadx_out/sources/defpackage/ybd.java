package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ybd implements x27 {
    public final String a;
    public final String b;
    public final Integer c;
    public final Long d;
    public final xbd e;
    public final SourceParameter f;
    public final String g;

    public ybd(String str, String str2, Integer num, Long l, xbd xbdVar, SourceParameter sourceParameter) {
        str2.getClass();
        xbdVar.getClass();
        this.a = str;
        this.b = str2;
        this.c = num;
        this.d = l;
        this.e = xbdVar;
        this.f = sourceParameter;
        this.g = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ybd)) {
            return false;
        }
        ybd ybdVar = (ybd) obj;
        return this.a.equals(ybdVar.a) && g76.L(this.b, ybdVar.b) && g76.L(this.c, ybdVar.c) && g76.L(this.d, ybdVar.d) && g76.L(this.e, ybdVar.e) && this.f.equals(ybdVar.f);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.g;
    }

    public final int hashCode() {
        int iO = wgd.o(this.a.hashCode() * 31, 31, this.b);
        Integer num = this.c;
        int iHashCode = (iO + (num == null ? 0 : num.hashCode())) * 31;
        Long l = this.d;
        return this.f.hashCode() + ka1.a(this.e.a, (iHashCode + (l != null ? l.hashCode() : 0)) * 31, 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("TagUiModel(tagId=", this.a, ", tagTitle=", this.b, ", followCount=");
        sbU.append(this.c);
        sbU.append(", postCount=");
        sbU.append(this.d);
        sbU.append(", itemAction=");
        sbU.append(this.e);
        sbU.append(", sourceParameter=");
        sbU.append(this.f);
        sbU.append(")");
        return sbU.toString();
    }
}
