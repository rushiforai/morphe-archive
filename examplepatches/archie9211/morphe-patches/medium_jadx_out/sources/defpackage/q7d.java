package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q7d {
    public final String a;
    public final String b;
    public final String c;
    public final List d;
    public final List e;

    public q7d(String str, String str2, String str3, List list, List list2) {
        b09.I(str, str2, str3);
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = list;
        this.e = list2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q7d)) {
            return false;
        }
        q7d q7dVar = (q7d) obj;
        if (g76.L(this.a, q7dVar.a) && g76.L(this.b, q7dVar.b) && g76.L(this.c, q7dVar.c) && this.d.equals(q7dVar.d)) {
            return this.e.equals(q7dVar.e);
        }
        return false;
    }

    public final int hashCode() {
        return this.e.hashCode() + wgd.p(wgd.o(wgd.o(this.a.hashCode() * 31, 31, this.b), 31, this.c), 31, this.d);
    }

    public final String toString() {
        return nuc.A(nuc.C("\n            |ForeignKey {\n            |   referenceTable = '" + this.a + "',\n            |   onDelete = '" + this.b + "',\n            |   onUpdate = '" + this.c + "',\n            |   columnNames = {" + mk7.D(bu1.e1(this.d)) + "\n            |   referenceColumnNames = {" + mk7.C(bu1.e1(this.e)) + "\n            |}\n        "));
    }
}
