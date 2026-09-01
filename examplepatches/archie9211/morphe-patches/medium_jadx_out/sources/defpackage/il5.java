package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class il5 implements x27 {
    public final int a;
    public final int b;
    public final String c;
    public final List d;

    public il5(int i, int i2, String str, List list) {
        str.getClass();
        list.getClass();
        this.a = i;
        this.b = i2;
        this.c = str;
        this.d = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof il5)) {
            return false;
        }
        il5 il5Var = (il5) obj;
        return this.a == il5Var.a && this.b == il5Var.b && g76.L(this.c, il5Var.c) && g76.L(this.d, il5Var.d);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return "highlight_response";
    }

    public final int hashCode() {
        return this.d.hashCode() + wgd.o(((this.a * 31) + this.b) * 31, 31, this.c);
    }

    public final String toString() {
        StringBuilder sbB = ev6.B(this.a, this.b, "HighlightResponseUiModel(startOffset=", ", endOffset=", ", paragraphText=");
        sbB.append(this.c);
        sbB.append(", paragraphMarkups=");
        sbB.append(this.d);
        sbB.append(")");
        return sbB.toString();
    }
}
