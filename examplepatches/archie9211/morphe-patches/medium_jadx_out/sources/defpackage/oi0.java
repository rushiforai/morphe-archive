package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oi0 extends zc2 {
    public final String a;
    public final String b;
    public final List c;
    public final zc2 d;
    public final int e;

    public oi0(String str, String str2, List list, zc2 zc2Var, int i) {
        this.a = str;
        this.b = str2;
        this.c = list;
        this.d = zc2Var;
        this.e = i;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof zc2) {
            oi0 oi0Var = (oi0) ((zc2) obj);
            if (this.a.equals(oi0Var.a)) {
                String str = oi0Var.b;
                String str2 = this.b;
                if (str2 != null ? str2.equals(str) : str == null) {
                    if (this.c.equals(oi0Var.c)) {
                        zc2 zc2Var = oi0Var.d;
                        zc2 zc2Var2 = this.d;
                        if (zc2Var2 != null ? zc2Var2.equals(zc2Var) : zc2Var == null) {
                            if (this.e == oi0Var.e) {
                                return true;
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = (this.a.hashCode() ^ 1000003) * 1000003;
        String str = this.b;
        int iHashCode2 = (((iHashCode ^ (str == null ? 0 : str.hashCode())) * 1000003) ^ this.c.hashCode()) * 1000003;
        zc2 zc2Var = this.d;
        return this.e ^ ((iHashCode2 ^ (zc2Var != null ? zc2Var.hashCode() : 0)) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Exception{type=");
        sb.append(this.a);
        sb.append(", reason=");
        sb.append(this.b);
        sb.append(", frames=");
        sb.append(this.c);
        sb.append(", causedBy=");
        sb.append(this.d);
        sb.append(", overflowCount=");
        return ho2.H(sb, this.e, "}");
    }
}
