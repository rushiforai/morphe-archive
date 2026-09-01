package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dpd {
    public final String a;
    public final String b;
    public final String c;
    public final String d;

    public dpd(String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = str4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof dpd)) {
            return false;
        }
        dpd dpdVar = (dpd) obj;
        return g76.L(this.a, dpdVar.a) && g76.L(this.b, dpdVar.b) && this.c.equals(dpdVar.c) && this.d.equals(dpdVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        return km4.C(y30.u("TopicUiModel(topicId=", this.a, ", topicSlug=", this.b, ", topicName="), this.c, ", source=", this.d, ")");
    }
}
