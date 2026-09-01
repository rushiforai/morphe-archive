package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uga implements vga {
    public final String a;
    public final sw5 b;
    public final String c;
    public final String d;
    public final String e;
    public final String f;
    public final az5 g;
    public final rga h;
    public final sga i;
    public final eea j;
    public final PublicationData k;
    public final qvc l;
    public final boolean m;
    public final List n;
    public final boolean o;
    public final qga p;
    public final qga q;

    public uga(String str, sw5 sw5Var, String str2, String str3, String str4, String str5, az5 az5Var, rga rgaVar, sga sgaVar, eea eeaVar, PublicationData publicationData, qvc qvcVar, boolean z, List list, boolean z2, qga qgaVar, qga qgaVar2) {
        str.getClass();
        str5.getClass();
        az5Var.getClass();
        this.a = str;
        this.b = sw5Var;
        this.c = str2;
        this.d = str3;
        this.e = str4;
        this.f = str5;
        this.g = az5Var;
        this.h = rgaVar;
        this.i = sgaVar;
        this.j = eeaVar;
        this.k = publicationData;
        this.l = qvcVar;
        this.m = z;
        this.n = list;
        this.o = z2;
        this.p = qgaVar;
        this.q = qgaVar2;
    }

    public static uga a(uga ugaVar, String str, sw5 sw5Var, String str2, az5 az5Var, rga rgaVar, sga sgaVar, eea eeaVar, PublicationData publicationData, qvc qvcVar, ArrayList arrayList, qga qgaVar, qga qgaVar2, int i) {
        String str3 = (i & 1) != 0 ? ugaVar.a : str;
        sw5 sw5Var2 = (i & 2) != 0 ? ugaVar.b : sw5Var;
        String str4 = (i & 4) != 0 ? ugaVar.c : str2;
        String str5 = ugaVar.d;
        String str6 = ugaVar.e;
        String str7 = ugaVar.f;
        az5 az5Var2 = (i & 64) != 0 ? ugaVar.g : az5Var;
        rga rgaVar2 = (i & 128) != 0 ? ugaVar.h : rgaVar;
        sga sgaVar2 = (i & 256) != 0 ? ugaVar.i : sgaVar;
        eea eeaVar2 = (i & 512) != 0 ? ugaVar.j : eeaVar;
        PublicationData publicationData2 = (i & 1024) != 0 ? ugaVar.k : publicationData;
        qvc qvcVar2 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? ugaVar.l : qvcVar;
        boolean z = ugaVar.m;
        List list = (i & 8192) != 0 ? ugaVar.n : arrayList;
        boolean z2 = ugaVar.o;
        qga qgaVar3 = (i & 32768) != 0 ? ugaVar.p : qgaVar;
        qga qgaVar4 = (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? ugaVar.q : qgaVar2;
        ugaVar.getClass();
        str3.getClass();
        str7.getClass();
        az5Var2.getClass();
        sgaVar2.getClass();
        return new uga(str3, sw5Var2, str4, str5, str6, str7, az5Var2, rgaVar2, sgaVar2, eeaVar2, publicationData2, qvcVar2, z, list, z2, qgaVar3, qgaVar4);
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean equals(java.lang.Object r5) {
        /*
            Method dump skipped, instruction units count: 203
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uga.equals(java.lang.Object):boolean");
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        sw5 sw5Var = this.b;
        int iHashCode2 = (iHashCode + (sw5Var == null ? 0 : sw5Var.hashCode())) * 31;
        String str = this.c;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.e;
        int iHashCode5 = (this.i.hashCode() + ((this.h.hashCode() + ka1.b(this.g, wgd.o((iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31, 31, this.f), 31)) * 31)) * 31;
        eea eeaVar = this.j;
        int iHashCode6 = (iHashCode5 + (eeaVar == null ? 0 : eeaVar.hashCode())) * 31;
        PublicationData publicationData = this.k;
        int iHashCode7 = (iHashCode6 + (publicationData == null ? 0 : publicationData.hashCode())) * 31;
        qvc qvcVar = this.l;
        int iP = (wgd.p((((iHashCode7 + (qvcVar == null ? 0 : qvcVar.hashCode())) * 31) + (this.m ? 1231 : 1237)) * 31, 31, this.n) + (this.o ? 1231 : 1237)) * 31;
        qga qgaVar = this.p;
        int iHashCode8 = (iP + (qgaVar == null ? 0 : qgaVar.hashCode())) * 31;
        qga qgaVar2 = this.q;
        return iHashCode8 + (qgaVar2 != null ? qgaVar2.hashCode() : 0);
    }

    public final String toString() {
        String str = this.e;
        String strA = str == null ? "null" : ax5.a(str);
        StringBuilder sb = new StringBuilder("MainScreenData(title=");
        sb.append(this.a);
        sb.append(", previewImage=");
        sb.append(this.b);
        sb.append(", subtitle=");
        ka1.C(sb, this.c, ", creatorName=", this.d, ", creatorImageId=");
        ka1.C(sb, strA, ", creatorId=", this.f, ", selectedTopics=");
        sb.append(this.g);
        sb.append(", meterConfigurationData=");
        sb.append(this.h);
        sb.append(", newsletterConfigurationData=");
        sb.append(this.i);
        sb.append(", publicationFlowPostVisibility=");
        sb.append(this.j);
        sb.append(", publicationInfo=");
        sb.append(this.k);
        sb.append(", submissionStatus=");
        sb.append(this.l);
        sb.append(", canSelectPublication=");
        sb.append(this.m);
        sb.append(", selectableImages=");
        sb.append(this.n);
        sb.append(", isPublished=");
        sb.append(this.o);
        sb.append(", primaryButtonAction=");
        sb.append(this.p);
        sb.append(", secondaryButtonAction=");
        sb.append(this.q);
        sb.append(")");
        return sb.toString();
    }
}
