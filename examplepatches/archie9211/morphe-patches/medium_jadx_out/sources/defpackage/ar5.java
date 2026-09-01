package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.graphql.UnreadNotificationsCountQuery;
import com.medium.proto.event.ReactivateMembershipConfirmationViewed;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001:\u0002\u0002\u0003¨\u0006\u0004"}, d2 = {"Lar5;", "Lque;", "lq2", "vq5", "home_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ar5 extends que {
    public final String b;
    public final vr7 c;
    public final yx2 d;
    public final zg7 e;
    public final cr0 f;
    public final ub5 g;
    public final slc h;
    public final zxc i;
    public final vob j;
    public boolean k;
    public final String l;
    public final SourceParameter m;
    public final UpsellInfo n;
    public final SourceParameter o;
    public boolean p;
    public boolean q;
    public final xpc r;
    public final wua s;

    public ar5(String str, bye byeVar, mya myaVar, vwa vwaVar, uj8 uj8Var, vr7 vr7Var, yx2 yx2Var, zg7 zg7Var, cr0 cr0Var, ub5 ub5Var, slc slcVar, zxc zxcVar, kb2 kb2Var, vob vobVar) {
        str.getClass();
        uj8Var.getClass();
        vr7Var.getClass();
        cr0Var.getClass();
        slcVar.getClass();
        vobVar.getClass();
        this.b = str;
        this.c = vr7Var;
        this.d = yx2Var;
        this.e = zg7Var;
        this.f = cr0Var;
        this.g = ub5Var;
        this.h = slcVar;
        this.i = zxcVar;
        this.j = vobVar;
        n92 n92Var = null;
        vx0.c0(f76.F(this), null, null, new m1(this, n92Var, 22), 3);
        this.l = "home_for_you";
        SourceParameter sourceParameter = new SourceParameter("home_for_you", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.m = sourceParameter;
        UpsellReferrer upsellReferrer = UpsellReferrer.HOME;
        UpsellPromoId upsellPromoId = UpsellPromoId.INTRO_OFFER;
        this.n = new UpsellInfo(upsellReferrer, "top_nav_upsell", upsellPromoId, null, null, null, 56, null);
        this.o = sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : "top_nav_upsell", ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : upsellPromoId.getValue(), ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null);
        uq5 uq5Var = uq5.ForYou;
        wua wuaVarC = vobVar.c("selected_tab", uq5Var);
        this.r = vv2.j(Boolean.FALSE);
        u50 u50Var = new u50(12, new xs3(20, n92Var, this));
        e00 e00Var = uj8Var.a;
        UnreadNotificationsCountQuery unreadNotificationsCountQuery = new UnreadNotificationsCountQuery();
        e00Var.getClass();
        uz uzVar = new uz(e00Var, unreadNotificationsCountQuery);
        yd4 yd4Var = yd4.CacheFirst;
        int i = 8;
        zz zzVar = new zz(new xz(gr7.F((uz) gr7.x((h68) gr7.i(uzVar, yd4Var), yd4.CacheOnly)), yd4Var, i), 0);
        to4 to4VarA = byeVar.a();
        to4 to4VarW = mya.w(myaVar, null, 7);
        bo4 bo4Var = vr7Var.k;
        bo4 bo4VarT = vwaVar.t();
        zq5 zq5Var = new zq5(this, null);
        bo4Var.getClass();
        bo4VarT.getClass();
        this.s = bo.e0(w2g.r(new pc1(new bo4[]{zzVar, to4VarA, to4VarW, bo4Var, wuaVarC, u50Var, bo4VarT}, i, zq5Var), kb2Var), f76.F(this), l7c.b, new vq5(d46.R(uq5Var, uq5.Featured), (uq5) wuaVarC.a.getValue(), false, null, null, sourceParameter, str, null, false));
    }

    public final void f() {
        String strU = gp7.u(this.m);
        yx2 yx2Var = this.d;
        yx2Var.getClass();
        String str = this.b;
        str.getClass();
        String str2 = this.l;
        str2.getClass();
        rqd.a(yx2Var.a, new ReactivateMembershipConfirmationViewed(null, null, null, 7, null), str, strU, false, null, str2, 24);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.rj2 r7, defpackage.p92 r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof defpackage.yq5
            if (r0 == 0) goto L13
            r0 = r8
            yq5 r0 = (defpackage.yq5) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yq5 r0 = new yq5
            r0.<init>(r6, r8)
        L18:
            java.lang.Object r8 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 2
            c1e r4 = defpackage.c1e.a
            r5 = 1
            if (r2 == 0) goto L3b
            if (r2 == r5) goto L37
            if (r2 != r3) goto L30
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r6 = r8.a
            return r4
        L30:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L37:
            defpackage.br7.v(r8)
            goto L4e
        L3b:
            defpackage.br7.v(r8)
            boolean r8 = r6.p
            if (r8 == 0) goto L43
            goto L6a
        L43:
            r0.d = r5
            zxc r8 = r6.i
            java.lang.Object r8 = r8.b(r7, r0)
            if (r8 != r1) goto L4e
            goto L69
        L4e:
            java.lang.Boolean r8 = (java.lang.Boolean) r8
            boolean r7 = r8.booleanValue()
            if (r7 != 0) goto L57
            goto L6a
        L57:
            r6.p = r5
            nl4 r7 = defpackage.nl4.INTRODUCTORY_OFFERS
            java.lang.String r7 = r7.getServerId()
            r0.d = r3
            zg7 r6 = r6.e
            java.lang.Object r6 = r6.p0(r7, r0)
            if (r6 != r1) goto L6a
        L69:
            return r1
        L6a:
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ar5.g(rj2, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object e(defpackage.ww7 r15, long r16, defpackage.rj2 r18, defpackage.p92 r19) {
        /*
            Method dump skipped, instruction units count: 372
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ar5.e(ww7, long, rj2, p92):java.lang.Object");
    }
}
