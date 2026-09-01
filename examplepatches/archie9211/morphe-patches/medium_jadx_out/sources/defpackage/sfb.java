package defpackage;

import com.medium.android.domain.post.models.Highlight;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sfb implements x27 {
    public final String a;
    public final long b;
    public final List c;
    public final Highlight d;
    public final qfb e;
    public final xm1 f;
    public final int g;
    public final boolean h;
    public final boolean i;
    public final boolean j;
    public final int k;
    public final boolean l;
    public final String m;
    public final boolean n;
    public final String o;
    public final boolean p;

    public sfb(String str, long j, List list, Highlight highlight, qfb qfbVar, xm1 xm1Var, int i, boolean z, boolean z2, boolean z3, int i2, boolean z4, String str2, boolean z5) {
        str.getClass();
        list.getClass();
        xm1Var.getClass();
        this.a = str;
        this.b = j;
        this.c = list;
        this.d = highlight;
        this.e = qfbVar;
        this.f = xm1Var;
        this.g = i;
        this.h = z;
        this.i = z2;
        this.j = z3;
        this.k = i2;
        this.l = z4;
        this.m = str2;
        this.n = z5;
        this.o = str;
        this.p = i2 == 2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sfb)) {
            return false;
        }
        sfb sfbVar = (sfb) obj;
        return g76.L(this.a, sfbVar.a) && this.b == sfbVar.b && g76.L(this.c, sfbVar.c) && g76.L(this.d, sfbVar.d) && g76.L(this.e, sfbVar.e) && g76.L(this.f, sfbVar.f) && this.g == sfbVar.g && this.h == sfbVar.h && this.i == sfbVar.i && this.j == sfbVar.j && this.k == sfbVar.k && this.l == sfbVar.l && this.m.equals(sfbVar.m) && this.n == sfbVar.n;
    }

    @Override // defpackage.qzd
    public final String getKey() {
        return this.o;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        int iP = wgd.p((iHashCode + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c);
        Highlight highlight = this.d;
        int iHashCode2 = (iP + (highlight == null ? 0 : highlight.hashCode())) * 31;
        qfb qfbVar = this.e;
        return wgd.o((((((((((((((this.f.hashCode() + ((iHashCode2 + (qfbVar != null ? qfbVar.hashCode() : 0)) * 31)) * 31) + this.g) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31) + (this.j ? 1231 : 1237)) * 31) + this.k) * 31) + (this.l ? 1231 : 1237)) * 31, 31, this.m) + (this.n ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "ResponseUiModel(id=", this.a, ", publicationDate=");
        sbI.append(", textParagraphs=");
        sbI.append(this.c);
        sbI.append(", highlight=");
        sbI.append(this.d);
        sbI.append(", author=");
        sbI.append(this.e);
        sbI.append(", clapsState=");
        sbI.append(this.f);
        sbI.append(", responsesCount=");
        sbI.append(this.g);
        sbI.append(", isEdited=");
        sbI.append(this.h);
        sbI.append(", isAnyReplyVisible=");
        sbI.append(this.i);
        sbI.append(", isAutoExpanded=");
        sbI.append(this.j);
        sbI.append(", nestingLevel=");
        sbI.append(this.k);
        sbI.append(", shouldBeRenderedAsStoryCard=");
        sbI.append(this.l);
        sbI.append(", source=");
        sbI.append(this.m);
        sbI.append(", isLastThreadedItem=");
        sbI.append(this.n);
        sbI.append(")");
        return sbI.toString();
    }
}
