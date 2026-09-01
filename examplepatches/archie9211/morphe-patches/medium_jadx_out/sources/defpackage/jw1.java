package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jw1 implements yw1 {
    public final String a;
    public final String b;

    public jw1(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jw1)) {
            return false;
        }
        jw1 jw1Var = (jw1) obj;
        return g76.L(this.a, jw1Var.a) && this.b.equals(jw1Var.b);
    }

    @Override // defpackage.yw1
    public final String getParagraphName() {
        return null;
    }

    public final int hashCode() {
        String str = this.a;
        return this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return ev6.y("CreateLink(text=", this.a, ", link=", this.b, ")");
    }
}
