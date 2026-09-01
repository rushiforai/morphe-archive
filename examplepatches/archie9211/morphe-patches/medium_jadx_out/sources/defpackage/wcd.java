package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wcd implements xcd {
    public final vcd a;
    public final vcd b;
    public final ucd c;
    public final vcd d;
    public final String e;
    public final String f;

    public wcd(vcd vcdVar, vcd vcdVar2, ucd ucdVar, vcd vcdVar3, String str, String str2) {
        this.a = vcdVar;
        this.b = vcdVar2;
        this.c = ucdVar;
        this.d = vcdVar3;
        this.e = str;
        this.f = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wcd)) {
            return false;
        }
        wcd wcdVar = (wcd) obj;
        return this.a.equals(wcdVar.a) && this.b.equals(wcdVar.b) && g76.L(this.c, wcdVar.c) && this.d.equals(wcdVar.d) && this.e.equals(wcdVar.e) && this.f.equals(wcdVar.f);
    }

    public final int hashCode() {
        int iHashCode = (this.b.hashCode() + (this.a.hashCode() * 31)) * 31;
        ucd ucdVar = this.c;
        return this.f.hashCode() + wgd.o((this.d.hashCode() + ((iHashCode + (ucdVar == null ? 0 : ucdVar.hashCode())) * 31)) * 31, 31, this.e);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Sections(recommendedStories=");
        sb.append(this.a);
        sb.append(", latestStories=");
        sb.append(this.b);
        sb.append(", curatedList=");
        sb.append(this.c);
        sb.append(", whoToFollowItems=");
        sb.append(this.d);
        sb.append(", tagSlug=");
        return km4.C(sb, this.e, ", source=", this.f, ")");
    }
}
