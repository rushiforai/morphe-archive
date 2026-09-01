package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.domain.post.models.Highlight;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ugb {
    public final String a;
    public final long b;
    public final List c;
    public final Highlight d;
    public final rgb e;
    public final sgb f;
    public final int g;
    public final boolean h;
    public final int i;
    public final boolean j;
    public final boolean k;
    public final boolean l;
    public final List m;
    public final agb n;
    public final int o;
    public final String p;
    public final String q;
    public final Integer r;
    public final boolean s;
    public final int t;
    public final boolean u;

    public ugb(String str, long j, List list, Highlight highlight, rgb rgbVar, sgb sgbVar, int i, boolean z, int i2, boolean z2, boolean z3, boolean z4, List list2, agb agbVar, int i3, String str2, String str3, Integer num, boolean z5, int i4) {
        str.getClass();
        this.a = str;
        this.b = j;
        this.c = list;
        this.d = highlight;
        this.e = rgbVar;
        this.f = sgbVar;
        this.g = i;
        this.h = z;
        this.i = i2;
        this.j = z2;
        this.k = z3;
        this.l = z4;
        this.m = list2;
        this.n = agbVar;
        this.o = i3;
        this.p = str2;
        this.q = str3;
        this.r = num;
        this.s = z5;
        this.t = i4;
        boolean z6 = false;
        if (!list2.isEmpty()) {
            Iterator it2 = list2.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                } else if (((ugb) it2.next()).k) {
                    z6 = true;
                    break;
                }
            }
        }
        this.u = z6;
    }

    public static ugb a(ugb ugbVar, rgb rgbVar, sgb sgbVar, int i, boolean z, List list, agb agbVar, int i2, boolean z2, int i3) {
        Integer num;
        boolean z3;
        String str = ugbVar.a;
        long j = ugbVar.b;
        List list2 = ugbVar.c;
        Highlight highlight = ugbVar.d;
        rgb rgbVar2 = (i3 & 16) != 0 ? ugbVar.e : rgbVar;
        sgb sgbVar2 = (i3 & 32) != 0 ? ugbVar.f : sgbVar;
        int i4 = (i3 & 64) != 0 ? ugbVar.g : i;
        boolean z4 = ugbVar.h;
        rgb rgbVar3 = rgbVar2;
        sgb sgbVar3 = sgbVar2;
        int i5 = i4;
        int i6 = ugbVar.i;
        boolean z5 = ugbVar.j;
        boolean z6 = (i3 & 1024) != 0 ? ugbVar.k : z;
        boolean z7 = ugbVar.l;
        List list3 = (i3 & 4096) != 0 ? ugbVar.m : list;
        agb agbVar2 = (i3 & 8192) != 0 ? ugbVar.n : agbVar;
        int i7 = (i3 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? ugbVar.o : i2;
        String str2 = ugbVar.p;
        String str3 = ugbVar.q;
        Integer num2 = ugbVar.r;
        if ((i3 & 262144) != 0) {
            num = num2;
            z3 = ugbVar.s;
        } else {
            num = num2;
            z3 = z2;
        }
        int i8 = ugbVar.t;
        ugbVar.getClass();
        str.getClass();
        list3.getClass();
        return new ugb(str, j, list2, highlight, rgbVar3, sgbVar3, i5, z4, i6, z5, z6, z7, list3, agbVar2, i7, str2, str3, num, z3, i8);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ugb)) {
            return false;
        }
        ugb ugbVar = (ugb) obj;
        return g76.L(this.a, ugbVar.a) && this.b == ugbVar.b && this.c.equals(ugbVar.c) && g76.L(this.d, ugbVar.d) && g76.L(this.e, ugbVar.e) && this.f.equals(ugbVar.f) && this.g == ugbVar.g && this.h == ugbVar.h && this.i == ugbVar.i && this.j == ugbVar.j && this.k == ugbVar.k && this.l == ugbVar.l && this.m.equals(ugbVar.m) && g76.L(this.n, ugbVar.n) && this.o == ugbVar.o && g76.L(this.p, ugbVar.p) && g76.L(this.q, ugbVar.q) && g76.L(this.r, ugbVar.r) && this.s == ugbVar.s && this.t == ugbVar.t;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        int iP = wgd.p((iHashCode + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c);
        Highlight highlight = this.d;
        int iHashCode2 = (iP + (highlight == null ? 0 : highlight.hashCode())) * 31;
        rgb rgbVar = this.e;
        int iP2 = wgd.p((((((((((((((this.f.hashCode() + ((iHashCode2 + (rgbVar == null ? 0 : rgbVar.hashCode())) * 31)) * 31) + this.g) * 31) + (this.h ? 1231 : 1237)) * 31) + this.i) * 31) + (this.j ? 1231 : 1237)) * 31) + (this.k ? 1231 : 1237)) * 31) + (this.l ? 1231 : 1237)) * 31, 31, this.m);
        agb agbVar = this.n;
        int iHashCode3 = (((iP2 + (agbVar == null ? 0 : agbVar.hashCode())) * 31) + this.o) * 31;
        String str = this.p;
        int iHashCode4 = (iHashCode3 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.q;
        int iHashCode5 = (iHashCode4 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.r;
        return ((((iHashCode5 + (num != null ? num.hashCode() : 0)) * 31) + (this.s ? 1231 : 1237)) * 31) + this.t;
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, Plbho.RRTZVfF, this.a, ", publicationDate=");
        sbI.append(", textParagraphs=");
        sbI.append(this.c);
        sbI.append(peNPu.hSnEDXSwSFlYfP);
        sbI.append(this.d);
        sbI.append(", author=");
        sbI.append(this.e);
        sbI.append(", clapsState=");
        sbI.append(this.f);
        sbI.append(", responsesCount=");
        sbI.append(this.g);
        sbI.append(", isEdited=");
        sbI.append(this.h);
        sbI.append(", nestingLevel=");
        sbI.append(this.i);
        sbI.append(", shouldBeRenderedAsStoryCard=");
        sbI.append(this.j);
        sbI.append(", isVisible=");
        sbI.append(this.k);
        sbI.append(", isAutoExpanded=");
        sbI.append(this.l);
        sbI.append(", responses=");
        sbI.append(this.m);
        sbI.append(", nextPage=");
        sbI.append(this.n);
        sbI.append(", moreResponsesCount=");
        sbI.append(this.o);
        sbI.append(", rootPostId=");
        sbI.append(this.p);
        sbI.append(", parentPostId=");
        sbI.append(this.q);
        sbI.append(", threadDepth=");
        sbI.append(this.r);
        sbI.append(", moreResponsesLoading=");
        sbI.append(this.s);
        sbI.append(", latestRevision=");
        sbI.append(this.t);
        sbI.append(")");
        return sbI.toString();
    }
}
