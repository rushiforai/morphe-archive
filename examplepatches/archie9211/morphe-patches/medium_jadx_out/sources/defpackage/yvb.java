package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yvb implements x27 {
    public final String a;
    public final int b;
    public final int c;
    public final String d;
    public final String e;

    public yvb(String str, int i, int i2, String str2) {
        str.getClass();
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = str2;
        this.e = "see_more:".concat(str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yvb)) {
            return false;
        }
        yvb yvbVar = (yvb) obj;
        return g76.L(this.a, yvbVar.a) && this.b == yvbVar.b && this.c == yvbVar.c && this.d.equals(yvbVar.d);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.e;
    }

    public final int hashCode() {
        return this.d.hashCode() + (((((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31) + 1231) * 31);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "SeeMoreRepliesUiModel(id=", this.a, ", nestingLevel=", ", count=");
        sbT.append(this.c);
        sbT.append(", isLastThreadedItem=true, source=");
        sbT.append(this.d);
        sbT.append(")");
        return sbT.toString();
    }
}
