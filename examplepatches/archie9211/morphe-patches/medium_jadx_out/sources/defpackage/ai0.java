package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ai0 extends sc2 {
    public final String a;
    public final String b;

    public ai0(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof sc2)) {
            return false;
        }
        ai0 ai0Var = (ai0) ((sc2) obj);
        return this.a.equals(ai0Var.a) && this.b.equals(ai0Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("CustomAttribute{key=");
        sb.append(this.a);
        sb.append(", value=");
        return ka1.v(sb, this.b, "}");
    }
}
