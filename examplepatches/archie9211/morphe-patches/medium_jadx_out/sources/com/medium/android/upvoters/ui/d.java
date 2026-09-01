package com.medium.android.upvoters.ui;

import com.medium.android.graphql.CatalogUpVotersGlobalDataQuery;
import com.medium.android.graphql.PostUpVotersGlobalDataQuery;
import com.medium.android.upvoters.ui.UpVotersReference;
import defpackage.ax2;
import defpackage.bo;
import defpackage.e00;
import defpackage.f76;
import defpackage.gn9;
import defpackage.gr7;
import defpackage.h68;
import defpackage.hxe;
import defpackage.ibb;
import defpackage.ixe;
import defpackage.k40;
import defpackage.kb2;
import defpackage.kbe;
import defpackage.kne;
import defpackage.kxe;
import defpackage.l7c;
import defpackage.n92;
import defpackage.qi1;
import defpackage.que;
import defpackage.r6c;
import defpackage.s26;
import defpackage.sp4;
import defpackage.tg;
import defpackage.to4;
import defpackage.uua;
import defpackage.uye;
import defpackage.uz;
import defpackage.w2g;
import defpackage.w3e;
import defpackage.wua;
import defpackage.wye;
import defpackage.xz;
import defpackage.yd4;
import defpackage.ygf;
import defpackage.yj2;
import defpackage.zz;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/medium/android/upvoters/ui/d;", "Lque;", "y3e", "u3e", "lo2", "upvoters_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class d extends que {
    public final UpVotersReference b;
    public final String c;
    public final kxe d;
    public final wye e;
    public final kbe f;
    public final kne g;
    public final s26 h;
    public final ax2 i;
    public final LinkedHashSet j;
    public final String k;
    public final SourceParameter l;
    public boolean m;
    public final r6c n;
    public final uua o;
    public final wua p;

    public d(UpVotersReference upVotersReference, String str, kxe kxeVar, wye wyeVar, ixe ixeVar, uye uyeVar, kbe kbeVar, kne kneVar, s26 s26Var, ax2 ax2Var, kb2 kb2Var) {
        String str2;
        boolean z;
        to4 to4VarQ;
        hxe hxeVar;
        upVotersReference.getClass();
        str.getClass();
        this.b = upVotersReference;
        this.c = str;
        this.d = kxeVar;
        this.e = wyeVar;
        this.f = kbeVar;
        this.g = kneVar;
        this.h = s26Var;
        this.i = ax2Var;
        this.j = new LinkedHashSet();
        boolean z2 = upVotersReference instanceof UpVotersReference.Catalog;
        if (z2) {
            str2 = "list_clappers";
        } else {
            if (!(upVotersReference instanceof UpVotersReference.Post)) {
                ygf.a();
                throw null;
            }
            str2 = "post_clappers";
        }
        String str3 = str2;
        this.k = str3;
        boolean z3 = upVotersReference instanceof UpVotersReference.Post;
        n92 n92Var = null;
        this.l = new SourceParameter(str3, null, null, null, null, z3 ? ((UpVotersReference.Post) upVotersReference).getPostId() : null, null, null, null, z2 ? ((UpVotersReference.Catalog) upVotersReference).getCatalogId() : null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -546, 8191, null);
        int i = 0;
        r6c r6cVarX = k40.x(0, 7, null);
        this.n = r6cVarX;
        this.o = bo.z(r6cVarX);
        tg tgVar = new tg(19, null, this);
        if (z2) {
            String catalogId = ((UpVotersReference.Catalog) upVotersReference).getCatalogId();
            catalogId.getClass();
            z = z3;
            to4VarQ = kxeVar.b.Q(new yj2(kxeVar, catalogId, tgVar, n92Var, 18));
        } else {
            z = z3;
            if (!z) {
                ygf.a();
                throw null;
            }
            String postId = ((UpVotersReference.Post) upVotersReference).getPostId();
            postId.getClass();
            to4VarQ = wyeVar.b.Q(new yj2(wyeVar, postId, tgVar, n92Var, 20));
        }
        int i2 = 3;
        if (z2) {
            String catalogId2 = ((UpVotersReference.Catalog) upVotersReference).getCatalogId();
            catalogId2.getClass();
            qi1 qi1Var = ixeVar.a;
            yd4 yd4Var = yd4.CacheAndNetwork;
            qi1Var.getClass();
            yd4Var.getClass();
            e00 e00Var = qi1Var.a;
            CatalogUpVotersGlobalDataQuery catalogUpVotersGlobalDataQuery = new CatalogUpVotersGlobalDataQuery(catalogId2);
            e00Var.getClass();
            hxeVar = new hxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(new uz(e00Var, catalogUpVotersGlobalDataQuery), yd4Var), yd4.CacheOnly)), yd4Var, 4), 0), 0);
        } else {
            if (!z) {
                ygf.a();
                throw null;
            }
            String postId2 = ((UpVotersReference.Post) upVotersReference).getPostId();
            postId2.getClass();
            gn9 gn9Var = uyeVar.a;
            yd4 yd4Var2 = yd4.CacheAndNetwork;
            gn9Var.getClass();
            yd4Var2.getClass();
            e00 e00Var2 = gn9Var.b;
            PostUpVotersGlobalDataQuery postUpVotersGlobalDataQuery = new PostUpVotersGlobalDataQuery(postId2);
            e00Var2.getClass();
            hxeVar = new hxe(new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(new uz(e00Var2, postUpVotersGlobalDataQuery), yd4Var2), yd4.CacheOnly)), yd4Var2, 12), 0), 3);
        }
        this.p = bo.e0(w2g.r(new sp4(to4VarQ, hxeVar, new ibb(i2, 1, n92Var), i), kb2Var), f76.F(this), l7c.b, w3e.a);
    }
}
