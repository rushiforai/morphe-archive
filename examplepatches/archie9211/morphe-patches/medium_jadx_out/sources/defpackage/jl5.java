package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jl5 {
    public final int a;
    public final int b;
    public final String c;
    public final String d;
    public final List e;

    public jl5(int i, int i2, String str, String str2, List list) {
        str.getClass();
        str2.getClass();
        list.getClass();
        this.a = i;
        this.b = i2;
        this.c = str;
        this.d = str2;
        this.e = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jl5)) {
            return false;
        }
        jl5 jl5Var = (jl5) obj;
        return this.a == jl5Var.a && this.b == jl5Var.b && g76.L(this.c, jl5Var.c) && g76.L(this.d, jl5Var.d) && g76.L(this.e, jl5Var.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + wgd.o(wgd.o(((this.a * 31) + this.b) * 31, 31, this.c), 31, this.d);
    }

    public final String toString() {
        StringBuilder sbB = ev6.B(this.a, this.b, "HighlightResponsesData(startOffset=", ", endOffset=", ", paragraphName=");
        ka1.C(sbB, this.c, ", paragraphText=", this.d, ", paragraphMarkups=");
        return b09.B(sbB, this.e, ")");
    }
}
