package defpackage;

import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lnna;", "Lque;", "kr2", "ena", "ina", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class nna extends que {
    public final PublicationReference b;
    public final String c;
    public final PublicationTab d;
    public final jz1 e;
    public final gg5 f;
    public final o2b g;
    public final o2b h;
    public final a1a i;
    public final eoc j;
    public final rz2 k;
    public final wjc l;
    public final oxe m;
    public final mya n;
    public final kla o;
    public final ax2 p;
    public final tz7 q;
    public final dm4 r;
    public final vob s;
    public final r6c t;
    public final uua u;
    public String v;
    public final wua w;
    public final wua x;
    public final String y;
    public final String z;

    public nna(PublicationReference publicationReference, String str, PublicationTab publicationTab, jz1 jz1Var, gg5 gg5Var, o2b o2bVar, o2b o2bVar2, a1a a1aVar, eoc eocVar, rz2 rz2Var, wjc wjcVar, oxe oxeVar, mya myaVar, kla klaVar, ax2 ax2Var, tz7 tz7Var, dm4 dm4Var, vob vobVar, kb2 kb2Var) {
        publicationReference.getClass();
        str.getClass();
        publicationTab.getClass();
        dm4Var.getClass();
        vobVar.getClass();
        this.b = publicationReference;
        this.c = str;
        this.d = publicationTab;
        this.e = jz1Var;
        this.f = gg5Var;
        this.g = o2bVar;
        this.h = o2bVar2;
        this.i = a1aVar;
        this.j = eocVar;
        this.k = rz2Var;
        this.l = wjcVar;
        this.m = oxeVar;
        this.n = myaVar;
        this.o = klaVar;
        this.p = ax2Var;
        this.q = tz7Var;
        this.r = dm4Var;
        this.s = vobVar;
        r6c r6cVarX = k40.x(0, 7, null);
        this.t = r6cVarX;
        this.u = bo.z(r6cVarX);
        this.w = vobVar.c("selected_tab", publicationTab);
        this.x = bo.e0(w2g.r(ip4.b(new u50(12, new mna(this, null)), new yk(11, (n92) null, this)), kb2Var), f76.F(this), l7c.b, gna.a);
        this.y = "pub_entity";
        this.z = "pub_entity";
    }

    public final SourceParameter e() {
        String str;
        String str2 = this.v;
        if (str2 == null) {
            str = null;
        } else {
            if (str2 == null) {
                g76.g0("publicationId");
                throw null;
            }
            str = str2;
        }
        return new SourceParameter(this.y, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -18, 8191, null);
    }
}
