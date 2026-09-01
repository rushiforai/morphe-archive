package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kkd {
    public final String a;
    public String b;
    public boolean c = false;
    public g29 d = null;

    public kkd(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kkd)) {
            return false;
        }
        kkd kkdVar = (kkd) obj;
        return g76.L(this.a, kkdVar.a) && g76.L(this.b, kkdVar.b) && this.c == kkdVar.c && g76.L(this.d, kkdVar.d);
    }

    public final int hashCode() {
        int iO = (wgd.o(this.a.hashCode() * 31, 31, this.b) + (this.c ? 1231 : 1237)) * 31;
        g29 g29Var = this.d;
        return iO + (g29Var == null ? 0 : g29Var.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TextSubstitution(layoutCache=");
        sb.append(this.d);
        sb.append(", isShowingSubstitution=");
        return ev6.A(sb, this.c, ')');
    }
}
