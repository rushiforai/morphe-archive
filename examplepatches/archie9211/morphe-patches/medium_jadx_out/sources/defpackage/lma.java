package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.android.postpublishing.ui.publicationSelection.d;
import com.medium.android.postpublishing.ui.publicationSelection.e;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Llma;", "Lque;", "jr2", "kma", "gma", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class lma extends que {
    public final String b;
    public final t51 c;
    public final ad5 d;
    public final na5 e;
    public final xpc f;
    public final xpc g;
    public String h;
    public final xpc i;
    public final r6c j;
    public final uua k;
    public final wua l;

    public lma(String str, t51 t51Var, ad5 ad5Var, na5 na5Var, kb2 kb2Var) {
        str.getClass();
        this.b = str;
        this.c = t51Var;
        this.d = ad5Var;
        this.e = na5Var;
        xpc xpcVarJ = vv2.j(0);
        this.f = xpcVarJ;
        n92 n92Var = null;
        xpc xpcVarJ2 = vv2.j(null);
        this.g = xpcVarJ2;
        xpc xpcVarJ3 = vv2.j(Boolean.FALSE);
        this.i = xpcVarJ3;
        r6c r6cVarX = k40.x(0, 7, null);
        this.j = r6cVarX;
        this.k = bo.z(r6cVarX);
        d dVar = new d(this, null);
        int i = ip4.a;
        int i2 = 3;
        this.l = bo.e0(w2g.r(k40.S(ip4.b(xpcVarJ, new gd1(dVar, n92Var, i2)), ip4.b(xpcVarJ, new gd1(new xi7(this, n92Var, 10), n92Var, i2)), xpcVarJ2, xpcVarJ3, new e(this, null)), kb2Var), f76.F(this), l7c.b, jma.a);
    }

    public final void e(PublicationData publicationData, boolean z) {
        xpc xpcVar;
        Object value;
        if (z) {
            this.h = publicationData != null ? publicationData.getId() : null;
            do {
                xpcVar = this.f;
                value = xpcVar.getValue();
            } while (!xpcVar.k(value, Integer.valueOf(((Number) value).intValue() + 1)));
        }
        this.g.l(publicationData != null ? publicationData.getId() : null);
    }
}
