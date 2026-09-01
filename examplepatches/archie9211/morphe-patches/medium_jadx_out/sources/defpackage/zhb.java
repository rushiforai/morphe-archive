package defpackage;

import com.medium.android.core.navigation.ResponsesReference;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zhb extends aib {
    public final ArrayList c;
    public final long d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final boolean h;
    public final boolean i;
    public final bib j;
    public final boolean k;
    public final String l;
    public final ResponsesReference.ResponseViewType m;
    public final String n;
    public final String o;
    public final String p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zhb(ArrayList arrayList, long j, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, bib bibVar, boolean z6, String str, ResponsesReference.ResponseViewType responseViewType, String str2, String str3, String str4) {
        super(responseViewType, str4);
        bibVar.getClass();
        responseViewType.getClass();
        str3.getClass();
        this.c = arrayList;
        this.d = j;
        this.e = z;
        this.f = z2;
        this.g = z3;
        this.h = z4;
        this.i = z5;
        this.j = bibVar;
        this.k = z6;
        this.l = str;
        this.m = responseViewType;
        this.n = str2;
        this.o = str3;
        this.p = str4;
    }

    @Override // defpackage.aib
    public final String a() {
        return this.p;
    }

    @Override // defpackage.aib
    public final String b() {
        return this.o;
    }

    @Override // defpackage.aib
    public final String c() {
        return this.n;
    }

    @Override // defpackage.aib
    public final ResponsesReference.ResponseViewType d() {
        return this.m;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zhb)) {
            return false;
        }
        zhb zhbVar = (zhb) obj;
        return this.c.equals(zhbVar.c) && this.d == zhbVar.d && this.e == zhbVar.e && this.f == zhbVar.f && this.g == zhbVar.g && this.h == zhbVar.h && this.i == zhbVar.i && g76.L(this.j, zhbVar.j) && this.k == zhbVar.k && g76.L(this.l, zhbVar.l) && this.m == zhbVar.m && this.n.equals(zhbVar.n) && g76.L(this.o, zhbVar.o) && g76.L(this.p, zhbVar.p);
    }

    public final int hashCode() {
        int iHashCode = this.c.hashCode() * 31;
        long j = this.d;
        int iHashCode2 = (((this.j.hashCode() + ((((((((((((iHashCode + ((int) (j ^ (j >>> 32)))) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31) + (this.h ? 1231 : 1237)) * 31) + (this.i ? 1231 : 1237)) * 31)) * 31) + (this.k ? 1231 : 1237)) * 31;
        String str = this.l;
        int iO = wgd.o(wgd.o((this.m.hashCode() + ((iHashCode2 + (str == null ? 0 : str.hashCode())) * 31)) * 31, 31, this.n), 31, this.o);
        String str2 = this.p;
        return iO + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Responses(uiModels=");
        sb.append(this.c);
        sb.append(", responsesCount=");
        sb.append(this.d);
        sb.append(", isRefreshing=");
        sb.append(this.e);
        sb.append(", isLocked=");
        sb.append(this.f);
        sb.append(", canLock=");
        sb.append(this.g);
        sb.append(", canHide=");
        sb.append(this.h);
        sb.append(", canManage=");
        sb.append(this.i);
        sb.append(", writeState=");
        sb.append(this.j);
        sb.append(", usePostCopies=");
        sb.append(this.k);
        sb.append(", spotlightResponseId=");
        sb.append(this.l);
        sb.append(", viewType=");
        sb.append(this.m);
        sb.append(", source=");
        sb.append(this.n);
        ka1.C(sb, ", rootId=", this.o, ", postVersionId=", this.p);
        sb.append(")");
        return sb.toString();
    }
}
