package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ypd {
    public final String a;
    public final String b;
    public final nr8 c;
    public final ArrayList d;

    public ypd(String str, String str2, nr8 nr8Var, ArrayList arrayList) {
        str.getClass();
        str2.getClass();
        nr8Var.getClass();
        this.a = str;
        this.b = str2;
        this.c = nr8Var;
        this.d = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ypd)) {
            return false;
        }
        ypd ypdVar = (ypd) obj;
        return g76.L(this.a, ypdVar.a) && g76.L(this.b, ypdVar.b) && g76.L(this.c, ypdVar.c) && this.d.equals(ypdVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b)) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("TopicCategoryUiModel(id=", this.a, ", name=", this.b, ", colors=");
        sbU.append(this.c);
        sbU.append(", topics=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
