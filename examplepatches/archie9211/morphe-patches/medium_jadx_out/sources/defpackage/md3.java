package defpackage;

import android.app.PendingIntent;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.navigation.s;
import com.medium.android.core.share.PostShareData;
import com.medium.android.explore.ui.ExploreFragment;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.home.ui.home.HomeFragment;
import com.medium.android.publication.ui.main.PublicationFragment;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.android.yourfollowingfeed.ui.FollowedType;
import com.medium.android.yourfollowingfeed.ui.YourFollowingFeedFragment;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostDensity;
import gen.model.SourceParameter;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class md3 implements sh9 {
    public final /* synthetic */ int a;
    public final Object b;
    public final /* synthetic */ Object c;

    public md3(sw9 sw9Var, LinkedHashSet linkedHashSet) {
        this.a = 4;
        this.c = sw9Var;
        this.b = linkedHashSet;
    }

    @Override // defpackage.sh9
    public final void A(SourceParameter sourceParameter, String str, String str2, boolean z) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 1:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 2:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 3:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 4:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 5:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 6:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 7:
                b09.a(sourceParameter, str, str2);
                throw null;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new oz(z, cieVar, str, str2, sourceParameter, null, 4), 3);
                return;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                xpc xpcVar = kbfVar.i;
                if (z) {
                    xpcVar.l(null);
                    vx0.c0(f76.F(kbfVar), null, null, new kyc(kbfVar, str, str2, sourceParameter, (n92) null, 12), 3);
                    return;
                } else {
                    q53 q53Var = new q53(sourceParameter, str, str2);
                    xpcVar.getClass();
                    xpcVar.m(null, q53Var);
                    return;
                }
            case 10:
                b09.a(sourceParameter, str, str2);
                throw null;
            default:
                ho2.O(sourceParameter, str, str2);
                sff sffVar = (sff) obj;
                vx0.c0(f76.F(sffVar), null, null, new oz(z, sffVar, str, str2, sourceParameter, null, 7), 3);
                return;
        }
    }

    @Override // defpackage.sh9
    public final void B(String str, PostClientVisibilityState postClientVisibilityState, SourceParameter sourceParameter) {
        Object gdfVar;
        int i = this.a;
        n92 n92Var = null;
        Object obj = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj2;
                if (qe3Var.q.add(str)) {
                    b09.Y(qe3Var.i, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, qe3Var.b, gp7.u(sourceParameter), qe3Var.n, false, 448);
                }
                break;
            case 1:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj2;
                if (f74Var.v.add(str)) {
                    b09.Y(f74Var.n, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, f74Var.b, gp7.u(sourceParameter), f74Var.o, false, 448);
                }
                break;
            case 2:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj2;
                if (ap5Var.n.add(str)) {
                    b09.Y(ap5Var.i, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, ap5Var.b, gp7.u(sourceParameter), ap5Var.o, false, 448);
                    vx0.c0(f76.F(ap5Var), null, null, new xs3(ap5Var, str, n92Var, 16), 3);
                }
                break;
            case 3:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj2;
                if (bq5Var.p.add(str)) {
                    b09.Y(bq5Var.i, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, bq5Var.b, gp7.u(sourceParameter), bq5Var.q, false, 448);
                    vx0.c0(f76.F(bq5Var), null, null, new xs3(bq5Var, str, n92Var, 18), 3);
                }
                break;
            case 4:
                sw9 sw9Var = (sw9) obj2;
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                if (((LinkedHashSet) obj).add(str)) {
                    b09.Y(sw9Var.n, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, sw9Var.d, gp7.u(sourceParameter), sw9Var.D0, false, 448);
                }
                break;
            case 5:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) obj;
                if (qx9Var.q.add(str)) {
                    b09.Y(qx9Var.g, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, qx9Var.b, gp7.u(sourceParameter), qx9Var.r, false, 448);
                }
                break;
            case 6:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj2;
                if (rjaVar.n.add(str)) {
                    b09.Y(rjaVar.f, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, rjaVar.b, gp7.u(sourceParameter), rjaVar.k, false, 448);
                }
                break;
            case 7:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj2;
                if (pkaVar.r.add(str)) {
                    b09.Y(pkaVar.j, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, pkaVar.c, gp7.u(sourceParameter), pkaVar.o, false, 448);
                }
                break;
            case 8:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj2;
                if (cieVar.t.add(str)) {
                    ty2 ty2Var = cieVar.h;
                    String strU = gp7.u(sourceParameter);
                    b09.Y(ty2Var, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, cieVar.c, strU, cieVar.q, false, 448);
                }
                break;
            case 9:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj2;
                if (kbfVar.s.add(str)) {
                    ty2 ty2Var2 = kbfVar.e;
                    String strU2 = gp7.u(sourceParameter);
                    b09.Y(ty2Var2, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, kbfVar.b, strU2, kbfVar.t, false, 448);
                }
                break;
            case 10:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj2;
                LinkedHashMap linkedHashMap = refVar.I;
                vob vobVar = refVar.c;
                FollowedType followedType = (FollowedType) vobVar.a("selected_followed_type");
                if (followedType == null) {
                    followedType = FollowedType.WRITERS_AND_PUBLICATIONS;
                }
                int i2 = bef.b[followedType.ordinal()];
                if (i2 == 1) {
                    gdfVar = new gdf((d04) vobVar.a("selected_entity_id"));
                } else if (i2 != 2) {
                    ygf.a();
                } else {
                    gdfVar = new hdf((String) vobVar.a("selected_tag_id"), refVar.e());
                }
                Object linkedHashSet = linkedHashMap.get(gdfVar);
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                    linkedHashMap.put(gdfVar, linkedHashSet);
                }
                if (((Set) linkedHashSet).add(str)) {
                    b09.Y(refVar.o, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, refVar.b, gp7.u(sourceParameter), refVar.q, false, 448);
                }
                break;
            default:
                postClientVisibilityState.getClass();
                sourceParameter.getClass();
                sff sffVar = (sff) obj2;
                if (sffVar.l.add(str)) {
                    b09.Y(sffVar.e, str, postClientVisibilityState, PostDensity.POST_DENSITY_LARGE_PREVIEW, sffVar.b, gp7.u(sourceParameter), sffVar.i, false, 448);
                }
                break;
        }
    }

    @Override // defpackage.sh9
    public final void C(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        str.getClass();
        sourceParameter.getClass();
        switch (i) {
            case 0:
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new ne3(qe3Var, str, sourceParameter, null, 3), 3);
                break;
            case 1:
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, null, 3), 3);
                break;
            case 2:
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new xo5(ap5Var, str, sourceParameter, null, 3), 3);
                break;
            case 3:
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 6), 3);
                break;
            case 4:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 5), 3);
                break;
            case 5:
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new mx9(qx9Var, str, sourceParameter, null, 3), 3);
                break;
            case 6:
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new nja(rjaVar, str, sourceParameter, null, 3), 3);
                break;
            case 7:
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new kka(pkaVar, str, sourceParameter, null, 3), 3);
                break;
            case 8:
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new xhe(cieVar, str, sourceParameter, null, 3), 3);
                break;
            case 9:
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new bbf(kbfVar, str, sourceParameter, null, 3), 3);
                break;
            case 10:
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new fef(refVar, str, sourceParameter, null, 3), 3);
                break;
        }
    }

    @Override // defpackage.sh9
    public final /* bridge */ void D(SourceParameter sourceParameter, String str, String str2, String str3) {
        switch (this.a) {
            case 0:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 1:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 2:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 3:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 4:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 5:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 6:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 7:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 8:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 9:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            case 10:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
            default:
                b09.c(sourceParameter, str, str2, str3);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void E(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                ((uef) obj2).j(str, gp7.u(sourceParameter));
                return;
            case 1:
                ((b64) obj2).a(str, sourceParameter);
                return;
            case 2:
                ((rq5) obj2).e(str, sourceParameter);
                return;
            case 3:
                ((rq5) obj2).e(str, sourceParameter);
                return;
            case 4:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 2), 3);
                return;
            case 5:
                ((htb) ((fub) obj).b).a(str, sourceParameter);
                return;
            case 6:
                throw new UnsupportedOperationException("Don't show publications on post previews in publication home screen");
            case 7:
                throw new UnsupportedOperationException("Don't show publications on post previews in PublicationNewsletterScreen");
            case 8:
                ((ihe) obj2).i(str, sourceParameter);
                return;
            case 9:
                ((d2f) obj2).S(str, sourceParameter);
                return;
            case 10:
                ((acf) obj2).a(str, sourceParameter);
                return;
            default:
                return;
        }
    }

    @Override // defpackage.sh9
    public final void F(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new qa((que) qe3Var, str, true, sourceParameter, (n92) null, 2), 3);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new qa((que) f74Var, str, true, sourceParameter, (n92) null, 3), 3);
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new qa((que) ap5Var, str, true, sourceParameter, (n92) null, 4), 3);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new qa((que) bq5Var, str, true, sourceParameter, (n92) null, 5), 3);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                ((sw9) obj).y(sourceParameter, str, true);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new qa((que) qx9Var, str, true, sourceParameter, (n92) null, 8), 3);
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qa((que) rjaVar, str, true, sourceParameter, (n92) null, 10), 3);
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new qa((que) pkaVar, str, true, sourceParameter, (n92) null, 11), 3);
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new qa((que) cieVar, str, true, sourceParameter, (n92) null, 21), 3);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new qa((que) kbfVar, str, true, sourceParameter, (n92) null, 23), 3);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new qa((que) refVar, str, true, sourceParameter, (n92) null, 24), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final /* bridge */ void G(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        switch (this.a) {
            case 0:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 1:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 2:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 3:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 4:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 5:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 6:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 7:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 8:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 9:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            case 10:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
            default:
                b09.e(sourceParameter, str, str2, str3, str4);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void H(SourceParameter sourceParameter, String str, String str2) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                ho2.O(sourceParameter, str, str2);
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new oe3(qe3Var, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 1:
                ho2.O(sourceParameter, str, str2);
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new e74(f74Var, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 2:
                ho2.O(sourceParameter, str, str2);
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new yo5(ap5Var, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 3:
                ho2.O(sourceParameter, str, str2);
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new aq5(bq5Var, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 4:
                ho2.O(sourceParameter, str, str2);
                ((sw9) obj).x(sourceParameter, str, str2, true);
                break;
            case 5:
                ho2.O(sourceParameter, str, str2);
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new px9(qx9Var, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 6:
                ho2.O(sourceParameter, str, str2);
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qja(rjaVar, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 7:
                ho2.O(sourceParameter, str, str2);
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new mka(pkaVar, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new aie(cieVar, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new jbf(kbfVar, true, str, str2, sourceParameter, null, 1), 3);
                break;
            case 10:
                ho2.O(sourceParameter, str, str2);
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new pef(refVar, true, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                break;
        }
    }

    @Override // defpackage.sh9
    public final void I(SourceParameter sourceParameter, String str, String str2) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                ho2.O(sourceParameter, str, str2);
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new oe3(qe3Var, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 1:
                ho2.O(sourceParameter, str, str2);
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new e74(f74Var, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 2:
                ho2.O(sourceParameter, str, str2);
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new yo5(ap5Var, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 3:
                ho2.O(sourceParameter, str, str2);
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new aq5(bq5Var, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 4:
                ho2.O(sourceParameter, str, str2);
                ((sw9) obj).x(sourceParameter, str, str2, false);
                break;
            case 5:
                ho2.O(sourceParameter, str, str2);
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new px9(qx9Var, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 6:
                ho2.O(sourceParameter, str, str2);
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qja(rjaVar, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 7:
                ho2.O(sourceParameter, str, str2);
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new mka(pkaVar, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new aie(cieVar, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new jbf(kbfVar, false, str, str2, sourceParameter, null, 1), 3);
                break;
            case 10:
                ho2.O(sourceParameter, str, str2);
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new pef(refVar, false, str, str2, sourceParameter, null, 1), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                break;
        }
    }

    @Override // defpackage.sh9
    public final void J(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                str2.getClass();
                sourceParameter.getClass();
                ((uef) obj2).K(str, str2, gp7.u(sourceParameter));
                break;
            case 1:
                str2.getClass();
                sourceParameter.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                s sVarZ = exploreFragment.Z();
                ((p13) sVarZ).p0(exploreFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 2:
                str2.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).j(sourceParameter, str, str2);
                break;
            case 3:
                str2.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).j(sourceParameter, str, str2);
                break;
            case 4:
                str2.getClass();
                sourceParameter.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str, str2, sourceParameter, null, 2), 3);
                break;
            case 5:
                str2.getClass();
                sourceParameter.getClass();
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).p0(searchFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 6:
                str2.getClass();
                sourceParameter.getClass();
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                ((p13) publicationFragment.Z()).p0(publicationFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 7:
                str2.getClass();
                sourceParameter.getClass();
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                ((p13) publicationFragment2.Z()).p0(publicationFragment2.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 8:
                str2.getClass();
                sourceParameter.getClass();
                ((ihe) obj2).l(sourceParameter, str, str2);
                break;
            case 9:
                str2.getClass();
                sourceParameter.getClass();
                ((d2f) obj2).l(sourceParameter, str, str2);
                break;
            case 10:
                str2.getClass();
                sourceParameter.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).p0(yourFollowingFeedFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            default:
                str2.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void K(SourceParameter sourceParameter, String str, String str2, boolean z) {
        switch (this.a) {
            case 0:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 1:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 2:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 3:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 4:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 5:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 6:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 7:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 8:
                b09.k(sourceParameter, str, str2);
                throw null;
            case 9:
                str2.getClass();
                sourceParameter.getClass();
                ((d2f) this.b).p(sourceParameter, str, str2, z);
                return;
            case 10:
                b09.k(sourceParameter, str, str2);
                throw null;
            default:
                b09.k(sourceParameter, str, str2);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void L(SourceParameter sourceParameter, String str, String str2) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                ho2.O(sourceParameter, str, str2);
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new oe3(qe3Var, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 1:
                ho2.O(sourceParameter, str, str2);
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new e74(f74Var, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 2:
                ho2.O(sourceParameter, str, str2);
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new yo5(ap5Var, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 3:
                ho2.O(sourceParameter, str, str2);
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new aq5(bq5Var, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 4:
                ho2.O(sourceParameter, str, str2);
                ((sw9) obj).w(sourceParameter, str, str2, true);
                break;
            case 5:
                ho2.O(sourceParameter, str, str2);
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new px9(qx9Var, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 6:
                ho2.O(sourceParameter, str, str2);
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qja(rjaVar, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 7:
                ho2.O(sourceParameter, str, str2);
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new mka(pkaVar, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new aie(cieVar, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new jbf(kbfVar, true, str, str2, sourceParameter, null, 0), 3);
                break;
            case 10:
                ho2.O(sourceParameter, str, str2);
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new pef(refVar, true, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                break;
        }
    }

    @Override // defpackage.sh9
    public final /* bridge */ void M(lj3 lj3Var, SourceParameter sourceParameter) {
        switch (this.a) {
            case 0:
                b09.d(sourceParameter);
                throw null;
            case 1:
                b09.d(sourceParameter);
                throw null;
            case 2:
                b09.d(sourceParameter);
                throw null;
            case 3:
                b09.d(sourceParameter);
                throw null;
            case 4:
                b09.d(sourceParameter);
                throw null;
            case 5:
                b09.d(sourceParameter);
                throw null;
            case 6:
                b09.d(sourceParameter);
                throw null;
            case 7:
                b09.d(sourceParameter);
                throw null;
            case 8:
                b09.d(sourceParameter);
                throw null;
            case 9:
                b09.d(sourceParameter);
                throw null;
            case 10:
                b09.d(sourceParameter);
                throw null;
            default:
                b09.d(sourceParameter);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void N(SourceParameter sourceParameter, String str, String str2) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                ho2.O(sourceParameter, str, str2);
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new fl2(qe3Var, str2, str, sourceParameter, null, 4), 3);
                break;
            case 1:
                ho2.O(sourceParameter, str, str2);
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new z64(f74Var, str2, str, sourceParameter, null, 1), 3);
                break;
            case 2:
                ho2.O(sourceParameter, str, str2);
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new zo5(ap5Var, str2, str, sourceParameter, null, 0), 3);
                break;
            case 3:
                ho2.O(sourceParameter, str, str2);
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new zo5(bq5Var, str2, str, sourceParameter, null, 1), 3);
                break;
            case 4:
                ho2.O(sourceParameter, str, str2);
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str2, str, sourceParameter, null, 4), 3);
                break;
            case 5:
                ho2.O(sourceParameter, str, str2);
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new zo5(qx9Var, str2, str, sourceParameter, null, 16), 3);
                break;
            case 6:
                ho2.O(sourceParameter, str, str2);
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new zo5(rjaVar, str2, str, sourceParameter, null, 27), 3);
                break;
            case 7:
                ho2.O(sourceParameter, str, str2);
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new lka(pkaVar, str2, str, sourceParameter, null, 1), 3);
                break;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new gbd(cieVar, str2, str, sourceParameter, null, 16), 3);
                break;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new gbd(kbfVar, str2, str, sourceParameter, null, 22), 3);
                break;
            case 10:
                ho2.O(sourceParameter, str, str2);
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new gbd(refVar, str2, str, sourceParameter, null, 25), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                break;
        }
    }

    @Override // defpackage.sh9
    public final void O(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new ne3(qe3Var, str, sourceParameter, null, 0), 3);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, null, 0), 3);
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new xo5(ap5Var, str, sourceParameter, null, 0), 3);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 0), 3);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                ((sw9) obj).k(str, sourceParameter);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new mx9(qx9Var, str, sourceParameter, null, 0), 3);
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new nja(rjaVar, str, sourceParameter, null, 0), 3);
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new kka(pkaVar, str, sourceParameter, null, 0), 3);
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new xhe(cieVar, str, sourceParameter, null, 0), 3);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new bbf(kbfVar, str, sourceParameter, null, 0), 3);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new fef(refVar, str, sourceParameter, null, 0), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void P(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                b09.j(str, sourceParameter);
                throw null;
            case 1:
                b09.j(str, sourceParameter);
                throw null;
            case 2:
                b09.j(str, sourceParameter);
                throw null;
            case 3:
                b09.j(str, sourceParameter);
                throw null;
            case 4:
                b09.j(str, sourceParameter);
                throw null;
            case 5:
                b09.j(str, sourceParameter);
                throw null;
            case 6:
                b09.j(str, sourceParameter);
                throw null;
            case 7:
                b09.j(str, sourceParameter);
                throw null;
            case 8:
                sourceParameter.getClass();
                ((ihe) obj).G(str, sourceParameter);
                return;
            case 9:
                sourceParameter.getClass();
                ((d2f) obj).G(str, sourceParameter);
                return;
            case 10:
                b09.j(str, sourceParameter);
                throw null;
            default:
                b09.j(str, sourceParameter);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void b(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.b;
        Object obj2 = this.c;
        sourceParameter.getClass();
        switch (i) {
            case 0:
                qe3 qe3Var = (qe3) obj2;
                qe3Var.g.s(sourceParameter, str, str2, qe3Var.b, qe3Var.n);
                ((uef) obj).g(str, str2, gp7.u(sourceParameter));
                break;
            case 1:
                f74 f74Var = (f74) obj2;
                f74Var.e.s(sourceParameter, str, str2, f74Var.b, f74Var.o);
                ExploreFragment exploreFragment = ((b64) obj).a;
                ((p13) exploreFragment.Z()).j0(exploreFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 2:
                ap5 ap5Var = (ap5) obj2;
                ap5Var.e.s(sourceParameter, str, str2, ap5Var.b, ap5Var.o);
                ((rq5) obj).i(sourceParameter, str, str2);
                break;
            case 3:
                bq5 bq5Var = (bq5) obj2;
                bq5Var.d.s(sourceParameter, str, str2, bq5Var.b, bq5Var.q);
                ((rq5) obj).i(sourceParameter, str, str2);
                break;
            case 4:
                sw9 sw9Var = (sw9) obj2;
                vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str, str2, sourceParameter, null, 3), 3);
                break;
            case 5:
                qx9 qx9Var = (qx9) obj;
                qx9Var.d.s(sourceParameter, str, str2, qx9Var.b, qx9Var.r);
                SearchFragment searchFragment = ((htb) ((fub) obj2).b).a;
                ((p13) searchFragment.Z()).j0(searchFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 6:
                rja rjaVar = (rja) obj2;
                rjaVar.e.s(sourceParameter, str, str2, rjaVar.b, rjaVar.k);
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj).a)).a;
                ((p13) publicationFragment.Z()).j0(publicationFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 7:
                pka pkaVar = (pka) obj2;
                pkaVar.i.s(sourceParameter, str, str2, pkaVar.c, pkaVar.o);
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj).b)).a;
                ((p13) publicationFragment2.Z()).j0(publicationFragment2.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 8:
                cie cieVar = (cie) obj2;
                cieVar.e.s(sourceParameter, str, str2, cieVar.c, cieVar.q);
                ((ihe) obj).E(sourceParameter, str, str2);
                break;
            case 9:
                kbf kbfVar = (kbf) obj2;
                kbfVar.c.s(sourceParameter, str, str2, kbfVar.b, kbfVar.t);
                ((d2f) obj).z(sourceParameter, str, str2);
                break;
            case 10:
                ref refVar = (ref) obj2;
                refVar.m.s(sourceParameter, str, str2, refVar.b, refVar.q);
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj).a;
                ((p13) yourFollowingFeedFragment.Z()).j0(yourFollowingFeedFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
        }
    }

    @Override // defpackage.sh9
    public final void c(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.b;
        Object obj2 = this.c;
        sourceParameter.getClass();
        switch (i) {
            case 0:
                qe3 qe3Var = (qe3) obj2;
                qe3Var.g.r(sourceParameter, str, str2, qe3Var.b, qe3Var.n);
                ((uef) obj).g(str, str2, gp7.u(sourceParameter));
                break;
            case 1:
                f74 f74Var = (f74) obj2;
                f74Var.e.r(sourceParameter, str, str2, f74Var.b, f74Var.o);
                ExploreFragment exploreFragment = ((b64) obj).a;
                ((p13) exploreFragment.Z()).j0(exploreFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 2:
                ap5 ap5Var = (ap5) obj2;
                ap5Var.e.r(sourceParameter, str, str2, ap5Var.b, ap5Var.o);
                ((rq5) obj).i(sourceParameter, str, str2);
                break;
            case 3:
                bq5 bq5Var = (bq5) obj2;
                bq5Var.d.r(sourceParameter, str, str2, bq5Var.b, bq5Var.q);
                ((rq5) obj).i(sourceParameter, str, str2);
                break;
            case 4:
                sw9 sw9Var = (sw9) obj2;
                vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str, str2, sourceParameter, null, 0), 3);
                break;
            case 5:
                qx9 qx9Var = (qx9) obj;
                qx9Var.d.r(sourceParameter, str, str2, qx9Var.b, qx9Var.r);
                SearchFragment searchFragment = ((htb) ((fub) obj2).b).a;
                ((p13) searchFragment.Z()).j0(searchFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 6:
                rja rjaVar = (rja) obj2;
                rjaVar.e.r(sourceParameter, str, str2, rjaVar.b, rjaVar.k);
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj).a)).a;
                ((p13) publicationFragment.Z()).j0(publicationFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 7:
                pka pkaVar = (pka) obj2;
                pkaVar.i.r(sourceParameter, str, str2, pkaVar.c, pkaVar.o);
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj).b)).a;
                ((p13) publicationFragment2.Z()).j0(publicationFragment2.S(), str, str2, gp7.u(sourceParameter));
                break;
            case 8:
                cie cieVar = (cie) obj2;
                cieVar.e.r(sourceParameter, str, str2, cieVar.c, cieVar.q);
                ((ihe) obj).E(sourceParameter, str, str2);
                break;
            case 9:
                kbf kbfVar = (kbf) obj2;
                kbfVar.c.r(sourceParameter, str, str2, kbfVar.b, kbfVar.t);
                ((d2f) obj).z(sourceParameter, str, str2);
                break;
            case 10:
                ref refVar = (ref) obj2;
                refVar.m.r(sourceParameter, str, str2, refVar.b, refVar.q);
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj).a;
                ((p13) yourFollowingFeedFragment.Z()).j0(yourFollowingFeedFragment.S(), str, str2, gp7.u(sourceParameter));
                break;
        }
    }

    @Override // defpackage.sh9
    public final void e(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new ne3(qe3Var, str, sourceParameter, null, 1), 3);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, null, 2), 3);
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new xo5(ap5Var, str, sourceParameter, null, 1), 3);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 4), 3);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                ((sw9) obj).D(str, sourceParameter);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new mx9(qx9Var, str, sourceParameter, null, 1), 3);
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new nja(rjaVar, str, sourceParameter, null, 1), 3);
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new kka(pkaVar, str, sourceParameter, null, 1), 3);
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new xhe(cieVar, str, sourceParameter, null, 1), 3);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new bbf(kbfVar, str, sourceParameter, null, 1), 3);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new fef(refVar, str, sourceParameter, null, 1), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void i(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                ((uef) obj2).b(str, gp7.u(sourceParameter));
                return;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                ((p13) exploreFragment.Z()).Q(exploreFragment.S(), str, gp7.u(sourceParameter));
                return;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).f(str, sourceParameter);
                return;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).f(str, sourceParameter);
                return;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 0), 3);
                return;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).Q(searchFragment.S(), str, gp7.u(sourceParameter));
                return;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                ((kia) ((sja) ((my6) obj2).a)).d(str, sourceParameter);
                return;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                ((kia) ((sja) ((zm7) obj2).b)).d(str, sourceParameter);
                return;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                throw new IllegalStateException("onAuthorSelected should not be called in UserProfilePostsScreen");
            case 9:
                str.getClass();
                sourceParameter.getClass();
                ((d2f) obj2).u(str, sourceParameter);
                return;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).Q(yourFollowingFeedFragment.S(), str, gp7.u(sourceParameter));
                return;
            default:
                str.getClass();
                sourceParameter.getClass();
                ((uef) obj2).b(str, gp7.u(sourceParameter));
                return;
        }
    }

    @Override // defpackage.sh9
    public final void n(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                sourceParameter.getClass();
                ((uef) obj2).M(str, gp7.u(sourceParameter));
                break;
            case 1:
                sourceParameter.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                ((p13) exploreFragment.Z()).u0(exploreFragment.S(), str, gp7.u(sourceParameter));
                break;
            case 2:
                sourceParameter.getClass();
                ((rq5) obj2).l(str, sourceParameter);
                break;
            case 3:
                sourceParameter.getClass();
                ((rq5) obj2).l(str, sourceParameter);
                break;
            case 4:
                sourceParameter.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 4), 3);
                break;
            case 5:
                sourceParameter.getClass();
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).u0(searchFragment.S(), str, gp7.u(sourceParameter));
                break;
            case 6:
                sourceParameter.getClass();
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                ((p13) publicationFragment.Z()).u0(publicationFragment.S(), str, gp7.u(sourceParameter));
                break;
            case 7:
                sourceParameter.getClass();
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                ((p13) publicationFragment2.Z()).u0(publicationFragment2.S(), str, gp7.u(sourceParameter));
                break;
            case 8:
                sourceParameter.getClass();
                ((ihe) obj2).m(str, sourceParameter);
                break;
            case 9:
                sourceParameter.getClass();
                ((d2f) obj2).m(str, sourceParameter);
                break;
            case 10:
                sourceParameter.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).u0(yourFollowingFeedFragment.S(), str, gp7.u(sourceParameter));
                break;
            default:
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void o(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new qa((que) qe3Var, str, false, sourceParameter, (n92) null, 2), 3);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new qa((que) f74Var, str, false, sourceParameter, (n92) null, 3), 3);
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new qa((que) ap5Var, str, false, sourceParameter, (n92) null, 4), 3);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new qa((que) bq5Var, str, false, sourceParameter, (n92) null, 5), 3);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                ((sw9) obj).y(sourceParameter, str, false);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new qa((que) qx9Var, str, false, sourceParameter, (n92) null, 8), 3);
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qa((que) rjaVar, str, false, sourceParameter, (n92) null, 10), 3);
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new qa((que) pkaVar, str, false, sourceParameter, (n92) null, 11), 3);
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new qa((que) cieVar, str, false, sourceParameter, (n92) null, 21), 3);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new qa((que) kbfVar, str, false, sourceParameter, (n92) null, 23), 3);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new qa((que) refVar, str, false, sourceParameter, (n92) null, 24), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final /* bridge */ void p(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 0:
                b09.f(str, sourceParameter);
                throw null;
            case 1:
                b09.f(str, sourceParameter);
                throw null;
            case 2:
                b09.f(str, sourceParameter);
                throw null;
            case 3:
                b09.f(str, sourceParameter);
                throw null;
            case 4:
                b09.f(str, sourceParameter);
                throw null;
            case 5:
                b09.f(str, sourceParameter);
                throw null;
            case 6:
                b09.f(str, sourceParameter);
                throw null;
            case 7:
                b09.f(str, sourceParameter);
                throw null;
            case 8:
                b09.f(str, sourceParameter);
                throw null;
            case 9:
                b09.f(str, sourceParameter);
                throw null;
            case 10:
                b09.f(str, sourceParameter);
                throw null;
            default:
                b09.f(str, sourceParameter);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void q(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 0:
                b09.g(str, sourceParameter);
                throw null;
            case 1:
                b09.g(str, sourceParameter);
                throw null;
            case 2:
                b09.g(str, sourceParameter);
                throw null;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                rq5 rq5Var = (rq5) this.b;
                rq5Var.getClass();
                HomeFragment homeFragment = ((dq5) rq5Var.b).a;
                ((p13) homeFragment.Z()).N(homeFragment.S(), str, gp7.u(sourceParameter));
                return;
            case 4:
                b09.g(str, sourceParameter);
                throw null;
            case 5:
                b09.g(str, sourceParameter);
                throw null;
            case 6:
                b09.g(str, sourceParameter);
                throw null;
            case 7:
                b09.g(str, sourceParameter);
                throw null;
            case 8:
                b09.g(str, sourceParameter);
                throw null;
            case 9:
                b09.g(str, sourceParameter);
                throw null;
            case 10:
                b09.g(str, sourceParameter);
                throw null;
            default:
                b09.g(str, sourceParameter);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void r(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                b09.b(str, sourceParameter);
                throw null;
            case 1:
                b09.b(str, sourceParameter);
                throw null;
            case 2:
                b09.b(str, sourceParameter);
                throw null;
            case 3:
                b09.b(str, sourceParameter);
                throw null;
            case 4:
                b09.b(str, sourceParameter);
                throw null;
            case 5:
                b09.b(str, sourceParameter);
                throw null;
            case 6:
                b09.b(str, sourceParameter);
                throw null;
            case 7:
                b09.b(str, sourceParameter);
                throw null;
            case 8:
                sourceParameter.getClass();
                ((ihe) obj).v(str, sourceParameter);
                return;
            case 9:
                sourceParameter.getClass();
                ((d2f) obj).v(str, sourceParameter);
                return;
            case 10:
                b09.b(str, sourceParameter);
                throw null;
            default:
                sourceParameter.getClass();
                ((uef) obj).v(str, sourceParameter);
                return;
        }
    }

    @Override // defpackage.sh9
    public final void s(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                sourceParameter.getClass();
                ((uef) obj2).e(CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            case 1:
                sourceParameter.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                ((p13) exploreFragment.Z()).m0(exploreFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            case 2:
                sourceParameter.getClass();
                ((rq5) obj2).h(str, sourceParameter);
                break;
            case 3:
                sourceParameter.getClass();
                ((rq5) obj2).h(str, sourceParameter);
                break;
            case 4:
                sourceParameter.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 1), 3);
                break;
            case 5:
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) obj2;
                vx0.c0(f76.F(qx9Var), null, null, new nx9(qx9Var, str, null, 0), 3);
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).m0(searchFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            case 6:
                sourceParameter.getClass();
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                ((p13) publicationFragment.Z()).m0(publicationFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            case 7:
                sourceParameter.getClass();
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                ((p13) publicationFragment2.Z()).m0(publicationFragment2.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            case 8:
                sourceParameter.getClass();
                ((ihe) obj2).c(CatalogItemType.POST, str, sourceParameter);
                break;
            case 9:
                sourceParameter.getClass();
                ((d2f) obj2).c(CatalogItemType.POST, str, sourceParameter);
                break;
            case 10:
                sourceParameter.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).m0(yourFollowingFeedFragment.S(), CatalogItemType.POST, str, gp7.u(sourceParameter));
                break;
            default:
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void t(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 0:
                b09.h(str, sourceParameter);
                throw null;
            case 1:
                b09.h(str, sourceParameter);
                throw null;
            case 2:
                b09.h(str, sourceParameter);
                throw null;
            case 3:
                b09.h(str, sourceParameter);
                throw null;
            case 4:
                b09.h(str, sourceParameter);
                throw null;
            case 5:
                b09.h(str, sourceParameter);
                throw null;
            case 6:
                b09.h(str, sourceParameter);
                throw null;
            case 7:
                b09.h(str, sourceParameter);
                throw null;
            case 8:
                b09.h(str, sourceParameter);
                throw null;
            case 9:
                sourceParameter.getClass();
                ((d2f) this.b).A(str, sourceParameter);
                return;
            case 10:
                b09.h(str, sourceParameter);
                throw null;
            default:
                b09.h(str, sourceParameter);
                throw null;
        }
    }

    @Override // defpackage.sh9
    public final void u(PostShareData postShareData, g08 g08Var) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                postShareData.getClass();
                g08Var.getClass();
                ((uef) obj2).O(postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            case 1:
                postShareData.getClass();
                g08Var.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                ((p13) exploreFragment.Z()).t0(exploreFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            case 2:
                postShareData.getClass();
                g08Var.getClass();
                ((rq5) obj2).k(postShareData, g08Var);
                break;
            case 3:
                postShareData.getClass();
                g08Var.getClass();
                ((rq5) obj2).k(postShareData, g08Var);
                break;
            case 4:
                postShareData.getClass();
                g08Var.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new mo5(sw9Var, postShareData, g08Var, null, 24), 3);
                break;
            case 5:
                postShareData.getClass();
                g08Var.getClass();
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).t0(searchFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            case 6:
                postShareData.getClass();
                g08Var.getClass();
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                ((p13) publicationFragment.Z()).t0(publicationFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            case 7:
                postShareData.getClass();
                g08Var.getClass();
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                ((p13) publicationFragment2.Z()).t0(publicationFragment2.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            case 8:
                postShareData.getClass();
                g08Var.getClass();
                ((ihe) obj2).e(postShareData, g08Var);
                break;
            case 9:
                postShareData.getClass();
                g08Var.getClass();
                ((d2f) obj2).e(postShareData, g08Var);
                break;
            case 10:
                postShareData.getClass();
                g08Var.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).t0(yourFollowingFeedFragment.S(), postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
            default:
                postShareData.getClass();
                g08Var.getClass();
                ((uef) obj2).O(postShareData, g08Var.a, g08Var.d, g08Var.c);
                break;
        }
    }

    @Override // defpackage.sh9
    public final void v(String str, SourceParameter sourceParameter) {
        switch (this.a) {
            case 0:
                sourceParameter.getClass();
                break;
            case 1:
                sourceParameter.getClass();
                break;
            case 2:
                sourceParameter.getClass();
                break;
            case 3:
                sourceParameter.getClass();
                break;
            case 4:
                sourceParameter.getClass();
                break;
            case 5:
                sourceParameter.getClass();
                break;
            case 6:
                sourceParameter.getClass();
                break;
            case 7:
                sourceParameter.getClass();
                break;
            case 8:
                sourceParameter.getClass();
                break;
            case 9:
                sourceParameter.getClass();
                break;
            case 10:
                sourceParameter.getClass();
                break;
            default:
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void w(SourceParameter sourceParameter, String str, String str2) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                ((uef) obj2).N(str, EntityType.AUTHOR, sourceParameter);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                EntityType entityType = EntityType.AUTHOR;
                entityType.getClass();
                ExploreFragment exploreFragment = ((b64) obj2).a;
                ((p13) exploreFragment.Z()).j(exploreFragment.S(), str, entityType, gp7.u(sourceParameter));
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).c(str, EntityType.AUTHOR, sourceParameter);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                ((rq5) obj2).c(str, EntityType.AUTHOR, sourceParameter);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new fs9(sw9Var, str, str2, sourceParameter, null, 1), 3);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                EntityType entityType2 = EntityType.AUTHOR;
                entityType2.getClass();
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                ((p13) searchFragment.Z()).j(searchFragment.S(), str, entityType2, gp7.u(sourceParameter));
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                EntityType entityType3 = EntityType.AUTHOR;
                entityType3.getClass();
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                ((p13) publicationFragment.Z()).j(publicationFragment.S(), str, entityType3, gp7.u(sourceParameter));
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                EntityType entityType4 = EntityType.AUTHOR;
                entityType4.getClass();
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                ((p13) publicationFragment2.Z()).j(publicationFragment2.S(), str, entityType4, gp7.u(sourceParameter));
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                ((ihe) obj2).k(str, sourceParameter);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                ((d2f) obj2).k(str, sourceParameter);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                EntityType entityType5 = EntityType.AUTHOR;
                entityType5.getClass();
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                ((p13) yourFollowingFeedFragment.Z()).j(yourFollowingFeedFragment.S(), str, entityType5, gp7.u(sourceParameter));
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void x(SourceParameter sourceParameter, String str, String str2) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                ho2.O(sourceParameter, str, str2);
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new oe3(qe3Var, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 1:
                ho2.O(sourceParameter, str, str2);
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new e74(f74Var, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 2:
                ho2.O(sourceParameter, str, str2);
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new yo5(ap5Var, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 3:
                ho2.O(sourceParameter, str, str2);
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new aq5(bq5Var, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 4:
                ho2.O(sourceParameter, str, str2);
                ((sw9) obj).w(sourceParameter, str, str2, false);
                break;
            case 5:
                ho2.O(sourceParameter, str, str2);
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new px9(qx9Var, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 6:
                ho2.O(sourceParameter, str, str2);
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new qja(rjaVar, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 7:
                ho2.O(sourceParameter, str, str2);
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new mka(pkaVar, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 8:
                ho2.O(sourceParameter, str, str2);
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new aie(cieVar, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 9:
                ho2.O(sourceParameter, str, str2);
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new jbf(kbfVar, false, str, str2, sourceParameter, null, 0), 3);
                break;
            case 10:
                ho2.O(sourceParameter, str, str2);
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new pef(refVar, false, str, str2, sourceParameter, null, 0), 3);
                break;
            default:
                ho2.O(sourceParameter, str, str2);
                break;
        }
    }

    @Override // defpackage.sh9
    public final void y(String str, SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                qe3 qe3Var = (qe3) obj;
                vx0.c0(f76.F(qe3Var), null, null, new ne3(qe3Var, str, sourceParameter, null, 2), 3);
                break;
            case 1:
                str.getClass();
                sourceParameter.getClass();
                f74 f74Var = (f74) obj;
                vx0.c0(f76.F(f74Var), null, null, new y64(f74Var, str, sourceParameter, null, 4), 3);
                break;
            case 2:
                str.getClass();
                sourceParameter.getClass();
                ap5 ap5Var = (ap5) obj;
                vx0.c0(f76.F(ap5Var), null, null, new xo5(ap5Var, str, sourceParameter, null, 2), 3);
                break;
            case 3:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) obj;
                vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 5), 3);
                break;
            case 4:
                str.getClass();
                sourceParameter.getClass();
                ((sw9) obj).F(str, sourceParameter);
                break;
            case 5:
                str.getClass();
                sourceParameter.getClass();
                qx9 qx9Var = (qx9) this.b;
                vx0.c0(f76.F(qx9Var), null, null, new mx9(qx9Var, str, sourceParameter, null, 2), 3);
                break;
            case 6:
                str.getClass();
                sourceParameter.getClass();
                rja rjaVar = (rja) obj;
                vx0.c0(f76.F(rjaVar), null, null, new nja(rjaVar, str, sourceParameter, null, 2), 3);
                break;
            case 7:
                str.getClass();
                sourceParameter.getClass();
                pka pkaVar = (pka) obj;
                vx0.c0(f76.F(pkaVar), null, null, new kka(pkaVar, str, sourceParameter, null, 2), 3);
                break;
            case 8:
                str.getClass();
                sourceParameter.getClass();
                cie cieVar = (cie) obj;
                vx0.c0(f76.F(cieVar), null, null, new xhe(cieVar, str, sourceParameter, null, 2), 3);
                break;
            case 9:
                str.getClass();
                sourceParameter.getClass();
                kbf kbfVar = (kbf) obj;
                vx0.c0(f76.F(kbfVar), null, null, new bbf(kbfVar, str, sourceParameter, null, 2), 3);
                break;
            case 10:
                str.getClass();
                sourceParameter.getClass();
                ref refVar = (ref) obj;
                vx0.c0(f76.F(refVar), null, null, new fef(refVar, str, sourceParameter, null, 2), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                break;
        }
    }

    @Override // defpackage.sh9
    public final void z(String str, SourceParameter sourceParameter) throws PendingIntent.CanceledException {
        int i = this.a;
        Object obj = this.c;
        Object obj2 = this.b;
        str.getClass();
        sourceParameter.getClass();
        switch (i) {
            case 0:
                ((uef) obj2).c(str, gp7.u(sourceParameter));
                break;
            case 1:
                ExploreFragment exploreFragment = ((b64) obj2).a;
                b09.O(exploreFragment.Z(), exploreFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
                break;
            case 2:
                ((rq5) obj2).d(str, sourceParameter);
                break;
            case 3:
                ((rq5) obj2).d(str, sourceParameter);
                break;
            case 4:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new gs9(sw9Var, str, sourceParameter, null, 3), 3);
                break;
            case 5:
                qx9 qx9Var = (qx9) obj2;
                vx0.c0(f76.F(qx9Var), null, null, new nx9(qx9Var, str, null, 0), 3);
                SearchFragment searchFragment = ((htb) ((fub) obj).b).a;
                b09.O(searchFragment.Z(), searchFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
                break;
            case 6:
                PublicationFragment publicationFragment = ((kia) ((sja) ((my6) obj2).a)).a;
                b09.O(publicationFragment.Z(), publicationFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
                break;
            case 7:
                PublicationFragment publicationFragment2 = ((kia) ((sja) ((zm7) obj2).b)).a;
                b09.O(publicationFragment2.Z(), publicationFragment2.S(), str, gp7.u(sourceParameter), null, null, null, 120);
                break;
            case 8:
                ((ihe) obj2).j(str, sourceParameter);
                break;
            case 9:
                ((d2f) obj2).j(str, sourceParameter);
                break;
            case 10:
                YourFollowingFeedFragment yourFollowingFeedFragment = ((acf) obj2).a;
                b09.O(yourFollowingFeedFragment.Z(), yourFollowingFeedFragment.S(), str, gp7.u(sourceParameter), null, null, null, 120);
                break;
            default:
                ((uef) obj2).c(str, gp7.u(sourceParameter));
                break;
        }
    }

    public /* synthetic */ md3(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    private final void a(String str, SourceParameter sourceParameter) {
    }
}
