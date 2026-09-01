package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kl5 implements qzd {
    public final String a;
    public final int b;
    public final int c;
    public final String d;
    public final String e;
    public final String f;
    public final String g;
    public final String h;
    public final ArrayList i;
    public final String j;

    public kl5(String str, int i, int i2, String str2, String str3, String str4, String str5, String str6, ArrayList arrayList, String str7) {
        str.getClass();
        str4.getClass();
        this.a = str;
        this.b = i;
        this.c = i2;
        this.d = str2;
        this.e = str3;
        this.f = str4;
        this.g = str5;
        this.h = str6;
        this.i = arrayList;
        this.j = str7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kl5)) {
            return false;
        }
        kl5 kl5Var = (kl5) obj;
        return g76.L(this.a, kl5Var.a) && this.b == kl5Var.b && this.c == kl5Var.c && this.d.equals(kl5Var.d) && this.e.equals(kl5Var.e) && g76.L(this.f, kl5Var.f) && this.g.equals(kl5Var.g) && this.h.equals(kl5Var.h) && this.i.equals(kl5Var.i) && this.j.equals(kl5Var.j);
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.a;
    }

    public final int hashCode() {
        return this.j.hashCode() + b09.p(this.i, wgd.o(wgd.o(wgd.o(wgd.o(wgd.o(((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31, 31, this.d), 31, this.e), 31, this.f), 31, this.g), 31, this.h), 31);
    }

    public final String toString() {
        StringBuilder sbT = y30.t(this.b, "HighlightUiModel(quoteId=", this.a, ", startOffset=", ", endOffset=");
        sbT.append(this.c);
        sbT.append(", postId=");
        sbT.append(this.d);
        sbT.append(", postTitle=");
        ka1.C(sbT, this.e, ", paragraphId=", this.f, ", paragraphName=");
        ka1.C(sbT, this.g, ", paragraphText=", this.h, ", markups=");
        sbT.append(this.i);
        sbT.append(", source=");
        sbT.append(this.j);
        sbT.append(")");
        return sbT.toString();
    }
}
