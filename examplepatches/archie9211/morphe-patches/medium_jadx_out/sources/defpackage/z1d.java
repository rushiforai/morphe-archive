package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class z1d implements c2d {
    public final ArrayList a;
    public final ArrayList b;
    public final ArrayList c;
    public final ArrayList d;

    public z1d(ArrayList arrayList, ArrayList arrayList2, ArrayList arrayList3, ArrayList arrayList4) {
        this.a = arrayList;
        this.b = arrayList2;
        this.c = arrayList3;
        this.d = arrayList4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z1d)) {
            return false;
        }
        z1d z1dVar = (z1d) obj;
        return this.a.equals(z1dVar.a) && this.b.equals(z1dVar.b) && this.c.equals(z1dVar.c) && this.d.equals(z1dVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + b09.p(this.c, b09.p(this.b, this.a.hashCode() * 31, 31), 31);
    }

    public final String toString() {
        return "ContentItems(writers=" + this.a + ", publications=" + this.b + ", tags=" + this.c + ", friends=" + this.d + ")";
    }
}
