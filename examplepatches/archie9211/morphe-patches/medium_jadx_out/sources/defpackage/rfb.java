package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rfb {
    public final String a;
    public final String b;
    public final List c;

    public rfb(String str, String str2, List list) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof rfb)) {
            return false;
        }
        rfb rfbVar = (rfb) obj;
        return g76.L(this.a, rfbVar.a) && this.b.equals(rfbVar.b) && g76.L(this.c, rfbVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        return b09.B(y30.u("Paragraph(id=", this.a, ", text=", this.b, ", markups="), this.c, ")");
    }
}
