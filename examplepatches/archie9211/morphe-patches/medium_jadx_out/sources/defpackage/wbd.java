package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wbd {
    public final w7d a;
    public final int b;
    public final List c;

    public wbd(w7d w7dVar, int i, List list) {
        this.a = w7dVar;
        this.b = i;
        this.c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wbd)) {
            return false;
        }
        wbd wbdVar = (wbd) obj;
        return this.a.equals(wbdVar.a) && this.b == wbdVar.b && this.c.equals(wbdVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + this.b) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("TagTree(tag=");
        sb.append(this.a);
        sb.append(", tagDepth=");
        sb.append(this.b);
        sb.append(", childTagTrees=");
        return b09.B(sb, this.c, ")");
    }
}
