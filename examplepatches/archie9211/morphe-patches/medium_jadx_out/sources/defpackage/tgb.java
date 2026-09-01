package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tgb {
    public final String a;
    public final String b;
    public final ArrayList c;

    public tgb(String str, String str2, ArrayList arrayList) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = arrayList;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tgb)) {
            return false;
        }
        tgb tgbVar = (tgb) obj;
        return g76.L(this.a, tgbVar.a) && this.b.equals(tgbVar.b) && this.c.equals(tgbVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Paragraph(id=", this.a, ", text=", this.b, ", markups=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
