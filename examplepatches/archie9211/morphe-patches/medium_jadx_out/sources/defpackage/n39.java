package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.LinkMetadataList;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n39 extends que {
    public final ParagraphData b;
    public final j09 c;
    public final LinkMetadataList d;
    public final String e;
    public final ev9 f;
    public final cv9 g;
    public final String h;
    public final boolean i;
    public final boolean j;
    public final String k;
    public final eh3 l;
    public final pu7 m;
    public final qi1 n;
    public final tg1 o;
    public final cxd p;
    public final uq0 q;
    public final zm8 r;
    public final r6c s;
    public final uua t;

    public n39(ParagraphData paragraphData, j09 j09Var, LinkMetadataList linkMetadataList, String str, ev9 ev9Var, cv9 cv9Var, String str2, boolean z, boolean z2, String str3, eh3 eh3Var, pu7 pu7Var, qi1 qi1Var, tg1 tg1Var, cxd cxdVar) {
        paragraphData.getClass();
        linkMetadataList.getClass();
        str2.getClass();
        str3.getClass();
        eh3Var.getClass();
        pu7Var.getClass();
        qi1Var.getClass();
        tg1Var.getClass();
        cxdVar.getClass();
        this.b = paragraphData;
        this.c = j09Var;
        this.d = linkMetadataList;
        this.e = str;
        this.f = ev9Var;
        this.g = cv9Var;
        this.h = str2;
        this.i = z;
        this.j = z2;
        this.k = str3;
        this.l = eh3Var;
        this.m = pu7Var;
        this.n = qi1Var;
        this.o = tg1Var;
        this.p = cxdVar;
        uq0 uq0Var = new uq0(j09Var);
        this.q = uq0Var;
        this.r = new zm8(uq0Var, new o19(4, new c29(this, 2)), 3);
        r6c r6cVarX = k40.x(0, 7, null);
        this.s = r6cVarX;
        this.t = bo.z(r6cVarX);
    }

    public final void e(Highlight highlight) {
        highlight.getClass();
        uq0 uq0Var = this.q;
        Object obj = uq0Var.c.get();
        Object value = (hj8.isComplete(obj) || hj8.isError(obj)) ? null : hj8.getValue(obj);
        if (value == null) {
            ay0.e("ParagraphContextBuilder must not be null");
            return;
        }
        j09 j09Var = (j09) value;
        j09Var.c = bu1.R0(j09Var.c, highlight);
        uq0Var.onNext(j09Var);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof n39)) {
            return false;
        }
        ParagraphData paragraphData = ((n39) obj).b;
        ParagraphType type = paragraphData.getType();
        ParagraphData paragraphData2 = this.b;
        if (type == paragraphData2.getType()) {
            return tuc.L(paragraphData.getId(), "_preview", "").equals(tuc.L(paragraphData2.getId(), "_preview", "")) && g76.L(paragraphData.getText(), paragraphData2.getText());
        }
        return false;
    }

    public final int hashCode() {
        ParagraphData paragraphData = this.b;
        int iHashCode = paragraphData.getId().hashCode() * 31;
        String text = paragraphData.getText();
        int iHashCode2 = (iHashCode + (text != null ? text.hashCode() : 0)) * 31;
        ParagraphType type = paragraphData.getType();
        return iHashCode2 + (type != null ? type.hashCode() : 0);
    }
}
