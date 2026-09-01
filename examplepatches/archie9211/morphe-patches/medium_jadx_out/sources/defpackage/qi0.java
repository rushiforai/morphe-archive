package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qi0 extends cd2 {
    public final String a;
    public final int b;
    public final List c;

    public qi0(List list, int i, String str) {
        this.a = str;
        this.b = i;
        this.c = list;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof cd2) {
            qi0 qi0Var = (qi0) ((cd2) obj);
            if (this.a.equals(qi0Var.a) && this.b == qi0Var.b && this.c.equals(qi0Var.c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.c.hashCode() ^ ((((this.a.hashCode() ^ 1000003) * 1000003) ^ this.b) * 1000003);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Thread{name=");
        sb.append(this.a);
        sb.append(", importance=");
        sb.append(this.b);
        sb.append(", frames=");
        return b09.B(sb, this.c, "}");
    }
}
