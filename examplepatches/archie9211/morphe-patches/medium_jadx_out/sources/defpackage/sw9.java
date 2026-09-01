package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.core.share.PostShareData;
import com.medium.android.data.post.TargetPost;
import com.medium.android.graphql.FullPostQuery;
import com.medium.android.graphql.PostCatalogsConnectionQuery;
import com.medium.android.graphql.fragment.PostFooterCountData;
import com.medium.android.graphql.fragment.PostMetaData;
import com.medium.android.graphql.fragment.ResponseCountData;
import com.medium.android.graphql.type.CatalogItemType;
import com.medium.android.graphql.type.CatalogType;
import com.medium.android.graphql.type.PostMeteringOptions;
import com.medium.android.graphql.type.PostVisibilityType;
import com.medium.android.graphql.type.UserDismissableFlags;
import com.medium.proto.event.PostClientVisibilityState;
import com.medium.proto.event.PostRead;
import com.medium.proto.event.PostViewedContext;
import gen.model.SourceParameter;
import java.util.Iterator;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0001\u0018\u00002\u00020\u0001:\u0007\u0002\u0003\u0004\u0005\u0006\u0007\b¨\u0006\t"}, d2 = {"Lsw9;", "Lque;", "xq2", "ou9", "es9", "tu9", "rr9", "md3", "pu9", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class sw9 extends que {
    public final wjc A;
    public final wua A0;
    public final oxe B;
    public final r6c B0;
    public final a1a C;
    public String C0;
    public final mya D;
    public final String D0;
    public final mya E;
    public final SourceParameter E0;
    public final a1a F;
    public final String F0;
    public final sye G;
    public final g08 G0;
    public final f88 H;
    public boolean H0;
    public final a1a I;
    public final LinkedHashSet I0;
    public final hha J;
    public final LinkedHashSet J0;
    public final x53 K;
    public final LinkedHashSet K0;
    public final hye L;
    public final LinkedHashSet L0;
    public final nec M;
    public final wua M0;
    public final ae2 N;
    public enc N0;
    public final q8c O;
    public enc O0;
    public final vd4 P;
    public enc P0;
    public final ku3 Q;
    public enc Q0;
    public final o2b R;
    public enc R0;
    public final y8b S;
    public enc S0;
    public final y8b T;
    public enc T0;
    public final a1a U;
    public boolean U0;
    public final xxe V;
    public boolean V0;
    public final cxe W;
    public final zz W0;
    public final rz2 X;
    public final zz X0;
    public final og3 Y;
    public final zz Y0;
    public final ub5 Z;
    public final md3 Z0;
    public final kh9 a0;
    public final md3 a1;
    public final TargetPost b;
    public final fr9 b0;
    public final md3 b1;
    public final ReadingContext c;
    public final xo9 c0;
    public final iv9 c1;
    public final String d;
    public final tg1 d0;
    public final fv9 d1;
    public final qi1 e;
    public final ax9 e0;
    public boolean e1;
    public final vr7 f;
    public final kb2 f0;
    public final cv9 f1;
    public final pu7 g;
    public final hu7 g0;
    public final eh3 h;
    public final iu7 h0;
    public final gn9 i;
    public final vob i0;
    public final ble j;
    public final pz2 j0;
    public final ax2 k;
    public final ax2 k0;
    public final ax2 l;
    public final cxd l0;
    public final ty2 m;
    public final dm4 m0;
    public final ty2 n;
    public final zg7 n0;
    public final ax2 o;
    public final slc o0;
    public final yx2 p;
    public boolean p0;
    public final ax2 q;
    public boolean q0;
    public final bud r;
    public boolean r0;
    public final tl s;
    public boolean s0;
    public final n0c t;
    public boolean t0;
    public final l95 u;
    public boolean u0;
    public final m50 v;
    public boolean v0;
    public final yzd w;
    public boolean w0;
    public final jf2 x;
    public final r6c x0;
    public final o2b y;
    public final uua y0;
    public final eoc z;
    public final xpc z0;

    public sw9(TargetPost targetPost, ReadingContext readingContext, String str, qi1 qi1Var, vr7 vr7Var, pu7 pu7Var, eh3 eh3Var, gn9 gn9Var, ble bleVar, ax2 ax2Var, ax2 ax2Var2, ty2 ty2Var, ty2 ty2Var2, ax2 ax2Var3, yx2 yx2Var, ax2 ax2Var4, bud budVar, tl tlVar, n0c n0cVar, l95 l95Var, m50 m50Var, yzd yzdVar, jf2 jf2Var, o2b o2bVar, eoc eocVar, wjc wjcVar, oxe oxeVar, a1a a1aVar, mya myaVar, mya myaVar2, a1a a1aVar2, sye syeVar, f88 f88Var, a1a a1aVar3, hha hhaVar, x53 x53Var, hye hyeVar, nec necVar, ae2 ae2Var, q8c q8cVar, vd4 vd4Var, ku3 ku3Var, o2b o2bVar2, y8b y8bVar, y8b y8bVar2, a1a a1aVar4, xxe xxeVar, cxe cxeVar, rz2 rz2Var, hha hhaVar2, og3 og3Var, ub5 ub5Var, vwa vwaVar, kh9 kh9Var, fr9 fr9Var, xo9 xo9Var, tg1 tg1Var, ax9 ax9Var, kb2 kb2Var, iu7 iu7Var, vob vobVar, pz2 pz2Var, ax2 ax2Var5, cxd cxdVar, dm4 dm4Var, zg7 zg7Var, slc slcVar) {
        pu7 pu7Var2 = eh3Var.a;
        i03 i03Var = i03.a;
        targetPost.getClass();
        readingContext.getClass();
        str.getClass();
        qi1Var.getClass();
        vr7Var.getClass();
        pu7Var.getClass();
        gn9Var.getClass();
        budVar.getClass();
        syeVar.getClass();
        vobVar.getClass();
        pz2Var.getClass();
        cxdVar.getClass();
        dm4Var.getClass();
        slcVar.getClass();
        this.b = targetPost;
        this.c = readingContext;
        this.d = str;
        this.e = qi1Var;
        this.f = vr7Var;
        this.g = pu7Var;
        this.h = eh3Var;
        this.i = gn9Var;
        this.j = bleVar;
        this.k = ax2Var;
        this.l = ax2Var2;
        this.m = ty2Var;
        this.n = ty2Var2;
        this.o = ax2Var3;
        this.p = yx2Var;
        this.q = ax2Var4;
        this.r = budVar;
        this.s = tlVar;
        this.t = n0cVar;
        this.u = l95Var;
        this.v = m50Var;
        this.w = yzdVar;
        this.x = jf2Var;
        this.y = o2bVar;
        this.z = eocVar;
        this.A = wjcVar;
        this.B = oxeVar;
        this.C = a1aVar;
        this.D = myaVar;
        this.E = myaVar2;
        this.F = a1aVar2;
        this.G = syeVar;
        this.H = f88Var;
        this.I = a1aVar3;
        this.J = hhaVar;
        this.K = x53Var;
        this.L = hyeVar;
        this.M = necVar;
        this.N = ae2Var;
        this.O = q8cVar;
        this.P = vd4Var;
        this.Q = ku3Var;
        this.R = o2bVar2;
        this.S = y8bVar;
        this.T = y8bVar2;
        this.U = a1aVar4;
        this.V = xxeVar;
        this.W = cxeVar;
        this.X = rz2Var;
        this.Y = og3Var;
        this.Z = ub5Var;
        this.a0 = kh9Var;
        this.b0 = fr9Var;
        this.c0 = xo9Var;
        this.d0 = tg1Var;
        this.e0 = ax9Var;
        this.f0 = kb2Var;
        this.g0 = i03Var;
        this.h0 = iu7Var;
        this.i0 = vobVar;
        this.j0 = pz2Var;
        this.k0 = ax2Var5;
        this.l0 = cxdVar;
        this.m0 = dm4Var;
        this.n0 = zg7Var;
        this.o0 = slcVar;
        n92 n92Var = null;
        int i = 3;
        vx0.c0(f76.F(this), null, null, new nr9(0, n92Var, this), 3);
        vx0.c0(f76.F(this), null, null, new nr9(11, n92Var, this), 3);
        r6c r6cVarX = k40.x(0, 7, null);
        this.x0 = r6cVarX;
        this.y0 = bo.z(r6cVarX);
        xpc xpcVarJ = vv2.j(null);
        this.z0 = xpcVarJ;
        this.A0 = bo.A(xpcVarJ);
        this.B0 = k40.x(0, 7, null);
        this.D0 = "post_page";
        SourceParameter sourceParameter = new SourceParameter("post_page", null, null, null, null, targetPost.getId(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null);
        this.E0 = sourceParameter;
        this.F0 = gp7.u(sourceParameter);
        g08 g08Var = new g08(sourceParameter, str, "post_page");
        this.G0 = g08Var;
        this.I0 = new LinkedHashSet();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        LinkedHashSet linkedHashSet2 = new LinkedHashSet();
        LinkedHashSet linkedHashSet3 = new LinkedHashSet();
        this.J0 = new LinkedHashSet();
        this.K0 = new LinkedHashSet();
        this.L0 = new LinkedHashSet();
        String id = targetPost.getId();
        String shareKey = targetPost.getShareKey();
        id.getClass();
        this.M0 = bo.e0(k40.S(ip4.b(kyd.H(new to4(new nr9(1, n92Var, this), m40.J(new to4(ip4.b(new to4(new kd7(id, n92Var, 19), new u50(10, new hi1(gn9Var.d, id, 1))), new wc5(n92Var, gn9Var, id, new FullPostQuery(id, new yv8(new PostMeteringOptions(null, null, shareKey == null ? xv8.a : new yv8(shareKey), null, 11, null))), 1)), new gm9(gn9Var, id, null), i)))), new yk(8, n92Var, this)), bo.A(((y23) budVar).o), hhaVar2.k(UserDismissableFlags.POST_PAGE_REPOST_TOOLTIP), vwaVar.t(), new rw9(this, null)), f76.F(this), new ync(5000L, Long.MAX_VALUE), new ru9(new iv0(vm1.a, bv0.a, wu0.a, su0.a, gv0.a, targetPost.getId(), false, g08Var)));
        pu7Var2.getClass();
        int i2 = 5;
        this.W0 = new zz(new zz(pu7Var2.L(ek6.SETTINGS_TEXT_SIZE, null), 11), i2);
        this.X0 = new zz(new zz(pu7Var2.L(ek6.SETTINGS_FONT_FAMILY, null), 9), i2);
        this.Y0 = new zz(pu7Var2.I(ek6.SETTINGS_HIGHLIGHTS_FROM_OTHERS, true), i2);
        this.Z0 = new md3(this, linkedHashSet);
        this.a1 = new md3(this, linkedHashSet2);
        this.b1 = new md3(this, linkedHashSet3);
        this.c1 = new iv9(this);
        this.d1 = new fv9(this);
        this.f1 = new cv9(this);
    }

    public static UpsellInfo e(PostMetaData postMetaData, String str, UpsellPromoId upsellPromoId) {
        UpsellReferrer upsellReferrer = UpsellReferrer.POST;
        String id = postMetaData.getId();
        PostMetaData.Creator creator = postMetaData.getCreator();
        String id2 = creator != null ? creator.getId() : null;
        PostMetaData.Creator creator2 = postMetaData.getCreator();
        return new UpsellInfo(upsellReferrer, str, upsellPromoId, id, id2, creator2 != null ? creator2.getUsername() : null);
    }

    public final void A() {
        v49 v49Var;
        Object value = this.M0.a.getValue();
        String string = null;
        su9 su9Var = value instanceof su9 ? (su9) value : null;
        boolean z = su9Var != null ? su9Var.e : false;
        if (su9Var != null) {
            PostMetaData postMetaData = su9Var.b;
            if (this.p0 || z) {
                return;
            }
            this.p0 = true;
            String id = postMetaData.getId();
            boolean z2 = this.H0;
            PostMetaData.Collection collection = postMetaData.getCollection();
            String id2 = collection != null ? collection.getId() : null;
            PostMetaData.Collection collection2 = postMetaData.getCollection();
            String slug = collection2 != null ? collection2.getSlug() : null;
            boolean zIsProxyPost = postMetaData.isProxyPost();
            PostViewedContext postViewedContext = PostViewedContext.STANDALONE;
            ax9 ax9Var = this.e0;
            ax9Var.getClass();
            PostClientVisibilityState postClientVisibilityStateA = ax9Var.a(postMetaData.getPostVisibilityData());
            ty2 ty2Var = this.n;
            ty2Var.getClass();
            id.getClass();
            postViewedContext.getClass();
            postClientVisibilityStateA.getClass();
            String str = this.F0;
            String str2 = this.d;
            b09.I(str, str2, this.D0);
            rqd.a(ty2Var.a, new PostRead(null, id, id2, slug, postViewedContext, Boolean.valueOf(zIsProxyPost), postClientVisibilityStateA, Boolean.valueOf(z2), null, 257, null), str2, str, false, null, null, 56);
            rj2 rj2VarA = this.u.a();
            if (rj2VarA != null) {
                zw7 zw7Var = rj2VarA.i;
                Long l = rj2VarA.j;
                Long l2 = rj2VarA.k;
                String id3 = postMetaData.getId();
                String mediumUrl = postMetaData.getMediumUrl();
                u49 u49Var = rj2VarA.v;
                if (u49Var != null && (v49Var = u49Var.a) != null) {
                    string = v49Var.toString();
                }
                slc slcVar = this.o0;
                slcVar.getClass();
                zw7Var.getClass();
                id3.getClass();
                nl4 nl4Var = nl4.ENABLE_SPRIG_EVENT_USER_POST_CLIENT_READ;
                dh7 dh7Var = new dh7();
                dh7Var.put("membership.tier", zw7Var.toString());
                dh7Var.put("membership.memberSince", String.valueOf(l));
                dh7Var.put("membership.friendSince", String.valueOf(l2));
                dh7Var.put("latest.post.clientRead.postId", id3);
                dh7Var.put("latest.post.clientRead.source", str);
                if (mediumUrl != null) {
                }
                if (string == null) {
                    string = "NOT_ENROLLED";
                }
                dh7Var.put("partnerProgramEnrollment.status", string);
                slcVar.a("user.postClientRead", nl4Var, dh7Var.b());
            }
        }
    }

    public final void B(int i) {
        vx0.c0(f76.F(this), null, null, new qw9(i, null, this), 3);
    }

    public final void C(String str, String str2, boolean z) {
        str.getClass();
        vx0.c0(f76.F(this), null, null, new i13(this, str, str2, z, (n92) null), 3);
    }

    public final void D(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new gs9(this, str, sourceParameter, null, 18), 3);
    }

    public final void E(String str, String str2) {
        str.getClass();
        str2.getClass();
        vx0.c0(f76.F(this), null, null, new av9(this, str, str2, null, 17), 3);
    }

    public final void F(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new gs9(this, str, sourceParameter, null, 19), 3);
    }

    public final void G(String str, EntityType entityType, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        entityType.getClass();
        vx0.c0(f76.F(this), null, null, new nz(this, str, str2, entityType, str3, str4, (n92) null, 16), 3);
    }

    public final ro4 H(String str) {
        CatalogType catalogType = CatalogType.LISTS;
        str.getClass();
        CatalogItemType.Companion companion = CatalogItemType.INSTANCE;
        qi1 qi1Var = this.e;
        qi1Var.getClass();
        catalogType.getClass();
        PostCatalogsConnectionQuery postCatalogsConnectionQuery = new PostCatalogsConnectionQuery(str, catalogType);
        e00 e00Var = qi1Var.a;
        e00Var.getClass();
        uz uzVar = (uz) gr7.x(new uz(e00Var, postCatalogsConnectionQuery), yd4.CacheFirst);
        uzVar.b.i = Boolean.FALSE;
        int i = 1;
        return new ro4(new u50(i, new vh1(gr7.F(uzVar), 0)), new er9(3, i, null), i);
    }

    public final SourceParameter f(String str, UpsellPromoId upsellPromoId) {
        String value = upsellPromoId != null ? upsellPromoId.getValue() : null;
        SourceParameter sourceParameter = this.E0;
        return sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : str, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : value, ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null);
    }

    public final iv0 g(PostMetaData postMetaData, PostFooterCountData postFooterCountData, boolean z, boolean z2, boolean z3, boolean z4, String str, Integer num, boolean z5) {
        dv0 av0Var;
        xm1 um1Var = (z || z2) ? (z || of9.b(postFooterCountData) <= 0) ? new um1(of9.a(postFooterCountData), of9.b(postFooterCountData)) : new wm1(of9.a(postFooterCountData), of9.b(postFooterCountData)) : new sm1(of9.a(postFooterCountData), of9.b(postFooterCountData));
        if (z) {
            ResponseCountData.PostResponses postResponses = postFooterCountData.getResponseCountData().getPostResponses();
            av0Var = new av0(postResponses != null ? postResponses.getCount() : null);
        } else {
            ResponseCountData.PostResponses postResponses2 = postFooterCountData.getResponseCountData().getPostResponses();
            av0Var = new cv0(postResponses2 != null ? postResponses2.getCount() : null);
        }
        dv0 dv0Var = av0Var;
        postMetaData.getClass();
        zu0 uu0Var = postMetaData.getInResponseToEntityType() != null ? vu0.a : z2 ? new uu0(num, true, 8) : !z3 ? new uu0(num, true, 4) : (z || postMetaData.getLatestPublishedVersion().length() == 0 || !(postMetaData.getVisibility() == PostVisibilityType.PUBLIC || postMetaData.getVisibility() == PostVisibilityType.LOCKED)) ? new uu0(num, true, 12) : z4 ? new yu0(num, true, str) : new xu0(false, num, true);
        tu0 ru0Var = (postMetaData.getLatestPublishedVersion().length() != 0 && (postMetaData.getVisibility() == PostVisibilityType.PUBLIC || postMetaData.getVisibility() == PostVisibilityType.LOCKED) && !z) ? new ru0(z5) : qu0.a;
        PostShareData postShareDataA = this.c0.a(postMetaData, ey3.a, null);
        return new iv0(um1Var, dv0Var, uu0Var, ru0Var, postShareDataA != null ? new fv0(postShareDataA) : ev0.a, postMetaData.getId(), false, this.G0);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object h(com.medium.android.graphql.fragment.PostMetaData r26, defpackage.rj2 r27, defpackage.p92 r28) {
        /*
            Method dump skipped, instruction units count: 494
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.h(com.medium.android.graphql.fragment.PostMetaData, rj2, p92):java.lang.Object");
    }

    public final void j(String str, String str2) {
        str.getClass();
        str2.getClass();
        vx0.c0(f76.F(this), null, null, new av9(this, str, str2, null, 8), 3);
    }

    public final void k(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new gs9(this, str, sourceParameter, null, 16), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable l(com.medium.android.graphql.fragment.PostMetaData r65, defpackage.yd4 r66, defpackage.p92 r67) {
        /*
            Method dump skipped, instruction units count: 448
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.l(com.medium.android.graphql.fragment.PostMetaData, yd4, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object n(com.medium.android.graphql.fragment.PostMetaData r17, boolean r18, defpackage.yd4 r19, defpackage.p92 r20) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 225
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.n(com.medium.android.graphql.fragment.PostMetaData, boolean, yd4, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r2v4 */
    /* JADX WARN: Type inference failed for: r2v5, types: [java.util.Collection, java.util.List] */
    /* JADX WARN: Type inference failed for: r2v7, types: [java.util.ArrayList] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.io.Serializable o(java.lang.String r63, defpackage.yd4 r64, defpackage.p92 r65) {
        /*
            Method dump skipped, instruction units count: 352
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.o(java.lang.String, yd4, p92):java.io.Serializable");
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0021  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0127  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void p(com.medium.android.graphql.FullPostQuery.Data r29, boolean r30, java.util.ArrayList r31) {
        /*
            Method dump skipped, instruction units count: 546
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.p(com.medium.android.graphql.FullPostQuery$Data, boolean, java.util.ArrayList):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00b9 A[PHI: r3 r4
      0x00b9: PHI (r3v4 int) = (r3v3 int), (r3v3 int), (r3v7 int) binds: [B:27:0x009e, B:29:0x00b6, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]
      0x00b9: PHI (r4v3 java.lang.Object) = (r4v2 java.lang.Object), (r4v2 java.lang.Object), (r4v10 java.lang.Object) binds: [B:27:0x009e, B:29:0x00b6, B:19:0x0052] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00fa A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object q(int r17, defpackage.p92 r18) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.q(int, p92):java.lang.Object");
    }

    public final void r(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new i13(this, str, new g08(sourceParameter, this.d, this.D0), z, str2, null), 3);
    }

    public final void s(String str, String str2, boolean z) {
        str.getClass();
        if (!z) {
            C(str, str2, false);
        } else {
            vx0.c0(f76.F(this), null, null, new av9(this, str, str2, null, 11), 3);
        }
    }

    public final void t(String str) {
        tu9 tu9Var = (tu9) this.M0.a.getValue();
        if (tu9Var instanceof su9) {
            Iterator it2 = ((su9) tu9Var).c.iterator();
            int i = 0;
            while (true) {
                if (!it2.hasNext()) {
                    i = -1;
                    break;
                }
                que queVar = (que) it2.next();
                if ((queVar instanceof n39) && g76.L(((n39) queVar).b.getName(), str)) {
                    break;
                } else {
                    i++;
                }
            }
            if (i != -1) {
                vx0.c0(f76.F(this), null, null, new qu6(this, i, null, 1), 3);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object u(defpackage.su9 r21, defpackage.p92 r22) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 230
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.u(su9, p92):java.lang.Object");
    }

    public final void v(String str, EntityType entityType, String str2, String str3, String str4) {
        str2.getClass();
        str3.getClass();
        entityType.getClass();
        vx0.c0(f76.F(this), null, null, new yu(this, str, str2, entityType, str3, str4, null, 19), 3);
    }

    public final void w(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new pw9(this, z, str, str2, sourceParameter, null, 0), 3);
    }

    public final void x(SourceParameter sourceParameter, String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new pw9(this, z, str, str2, sourceParameter, null, 1), 3);
    }

    public final void y(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        vx0.c0(f76.F(this), null, null, new i13(this, str, z, sourceParameter, (n92) null), 3);
    }

    public final void z() {
        vx0.c0(f76.F(this), null, null, new kd7(this, null, 28), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:118:0x0444, code lost:
    
        r1 = java.lang.Integer.valueOf(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x0448, code lost:
    
        if (r4 < 0) goto L121;
     */
    /* JADX WARN: Code restructure failed: missing block: B:120:0x044a, code lost:
    
        r4 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x044c, code lost:
    
        r4 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x044d, code lost:
    
        if (r4 != null) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x044f, code lost:
    
        r1 = new defpackage.n46(0, r108.size(), 1).iterator();
        r4 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0462, code lost:
    
        if (((defpackage.m46) r1).c == false) goto L454;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x0464, code lost:
    
        r11 = ((defpackage.g46) r1).nextInt();
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x046b, code lost:
    
        if (r4 < 0) goto L455;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x0471, code lost:
    
        if (r0.i(r11) == false) goto L131;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x0474, code lost:
    
        r4 = r4 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x0477, code lost:
    
        defpackage.d46.i0();
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x047a, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x047b, code lost:
    
        r4 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x047d, code lost:
    
        r0 = java.lang.Integer.valueOf(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x0481, code lost:
    
        if (r4 < 0) goto L138;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0483, code lost:
    
        r4 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x0485, code lost:
    
        r4 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x0486, code lost:
    
        r0 = r24.getInResponseToPostResult();
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x048a, code lost:
    
        if (r0 == null) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x048c, code lost:
    
        r0 = r0.getInResponseToPost();
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x0490, code lost:
    
        if (r0 == null) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0496, code lost:
    
        if (r0.getTitle() == null) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x0498, code lost:
    
        r1 = r0.getCreator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x049c, code lost:
    
        if (r1 == null) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x049e, code lost:
    
        r1 = r1.getName();
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x04a3, code lost:
    
        r1 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:149:0x04a4, code lost:
    
        if (r1 == null) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x04a7, code lost:
    
        r0 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x04a8, code lost:
    
        if (r0 == null) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x04aa, code lost:
    
        r11 = new defpackage.q58(r103, 23, r0);
        r0 = r24;
        r12.add(new defpackage.j06(r0, r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x04bc, code lost:
    
        r0 = r24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x04be, code lost:
    
        r1 = r23.iterator();
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x04c7, code lost:
    
        if (r1.hasNext() == false) goto L456;
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:0x04c9, code lost:
    
        r11 = r1.next();
        r20 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x04cf, code lost:
    
        if (r5 < 0) goto L457;
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x04d1, code lost:
    
        r11 = (defpackage.n39) r11;
        r36 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x04d5, code lost:
    
        if (r5 != 0) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x04d7, code lost:
    
        r13 = r22.a();
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x04db, code lost:
    
        if (r5 != 0) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:164:0x04dd, code lost:
    
        r13 = r13.j(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x04e1, code lost:
    
        if (r13 == null) goto L167;
     */
    /* JADX WARN: Code restructure failed: missing block: B:166:0x04e3, code lost:
    
        r13 = r13.getType();
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x04e8, code lost:
    
        r13 = r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x04ec, code lost:
    
        if (r13 != com.medium.android.graphql.type.ParagraphType.IMG) goto L171;
     */
    /* JADX WARN: Code restructure failed: missing block: B:170:0x04ee, code lost:
    
        r6 = r101;
        r12.add(r6);
        r12.add(r11);
        p(r104, r106, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:171:0x04fa, code lost:
    
        r6 = r101;
     */
    /* JADX WARN: Code restructure failed: missing block: B:172:0x04fc, code lost:
    
        if (r5 != 0) goto L178;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x04fe, code lost:
    
        if (r4 != null) goto L175;
     */
    /* JADX WARN: Code restructure failed: missing block: B:176:0x0505, code lost:
    
        if (r4.intValue() != 0) goto L178;
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x0507, code lost:
    
        p(r104, r106, r12);
        r12.add(r11);
        r12.add(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:178:0x0511, code lost:
    
        if (r5 != 0) goto L181;
     */
    /* JADX WARN: Code restructure failed: missing block: B:179:0x0513, code lost:
    
        if (r4 != null) goto L181;
     */
    /* JADX WARN: Code restructure failed: missing block: B:180:0x0515, code lost:
    
        p(r104, r106, r12);
        r12.add(r15);
        r12.add(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:181:0x051f, code lost:
    
        if (r5 != 0) goto L186;
     */
    /* JADX WARN: Code restructure failed: missing block: B:182:0x0521, code lost:
    
        p(r104, r106, r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:183:0x0528, code lost:
    
        if (r12.isEmpty() == false) goto L185;
     */
    /* JADX WARN: Code restructure failed: missing block: B:184:0x052a, code lost:
    
        r12.add(r6);
     */
    /* JADX WARN: Code restructure failed: missing block: B:185:0x052d, code lost:
    
        r12.add(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:186:0x0531, code lost:
    
        if (r4 != null) goto L188;
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x0538, code lost:
    
        if (r5 != r4.intValue()) goto L191;
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:0x053a, code lost:
    
        r12.add(r11);
        r12.add(r15);
     */
    /* JADX WARN: Code restructure failed: missing block: B:191:0x0541, code lost:
    
        r12.add(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:192:0x0544, code lost:
    
        r101 = r6;
        r5 = r20;
        r13 = r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:193:0x054d, code lost:
    
        r36 = r13;
        defpackage.d46.i0();
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x0552, code lost:
    
        throw r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x0553, code lost:
    
        r36 = r13;
        r1 = r27.a();
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x0559, code lost:
    
        if (r1 == null) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:197:0x055b, code lost:
    
        r1 = r1.i;
     */
    /* JADX WARN: Code restructure failed: missing block: B:198:0x055d, code lost:
    
        if (r1 == null) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:200:0x0564, code lost:
    
        if (r1.isMember() != true) goto L202;
     */
    /* JADX WARN: Code restructure failed: missing block: B:202:0x0568, code lost:
    
        if (r107 != false) goto L263;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x056a, code lost:
    
        r1 = defpackage.z6e.a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x0570, code lost:
    
        if (r12.isEmpty() == false) goto L206;
     */
    /* JADX WARN: Code restructure failed: missing block: B:205:0x0572, code lost:
    
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:206:0x0574, code lost:
    
        r1 = r12.iterator();
        r5 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:208:0x057d, code lost:
    
        if (r1.hasNext() == false) goto L473;
     */
    /* JADX WARN: Code restructure failed: missing block: B:210:0x0587, code lost:
    
        if ((((defpackage.que) r1.next()) instanceof defpackage.n39) == false) goto L477;
     */
    /* JADX WARN: Code restructure failed: missing block: B:211:0x0589, code lost:
    
        r5 = r5 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:212:0x058b, code lost:
    
        if (r5 < 0) goto L475;
     */
    /* JADX WARN: Code restructure failed: missing block: B:214:0x058e, code lost:
    
        defpackage.d46.h0();
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x0591, code lost:
    
        throw r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x0592, code lost:
    
        r1 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:217:0x0593, code lost:
    
        if (r5 > 2) goto L219;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x0595, code lost:
    
        r4 = r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x0599, code lost:
    
        r4 = r12.size() / 2;
        r5 = defpackage.d46.J(r12);
        r6 = new java.util.ArrayList(defpackage.cu1.k0(r5, 10));
        r5 = r5.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:221:0x05b6, code lost:
    
        if (((defpackage.m46) r5).c == false) goto L464;
     */
    /* JADX WARN: Code restructure failed: missing block: B:222:0x05b8, code lost:
    
        r8 = ((defpackage.g46) r5).nextInt();
        r13 = defpackage.z6e.a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:223:0x05c3, code lost:
    
        if (r8 < r1) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:225:0x05c9, code lost:
    
        if (r8 >= r12.size()) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:226:0x05cb, code lost:
    
        r13 = r8 - 1;
        r15 = defpackage.z6e.a((defpackage.que) r12.get(r13));
     */
    /* JADX WARN: Code restructure failed: missing block: B:227:0x05d7, code lost:
    
        if (r15 != null) goto L229;
     */
    /* JADX WARN: Code restructure failed: missing block: B:229:0x05da, code lost:
    
        r1 = defpackage.z6e.a((defpackage.que) r12.get(r8));
     */
    /* JADX WARN: Code restructure failed: missing block: B:230:0x05e4, code lost:
    
        if (r1 != null) goto L232;
     */
    /* JADX WARN: Code restructure failed: missing block: B:232:0x05e7, code lost:
    
        r7 = defpackage.z6e.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:233:0x05ed, code lost:
    
        if (r7.contains(r15) == false) goto L237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:235:0x05f3, code lost:
    
        if (r7.contains(r1) == false) goto L237;
     */
    /* JADX WARN: Code restructure failed: missing block: B:237:0x05f6, code lost:
    
        r1 = defpackage.z6e.a((defpackage.que) r12.get(r13));
        r7 = defpackage.z6e.a((defpackage.que) r12.get(r8));
        r13 = java.lang.Math.abs(r8 - r4);
        r15 = com.medium.android.graphql.type.ParagraphType.P;
     */
    /* JADX WARN: Code restructure failed: missing block: B:238:0x0612, code lost:
    
        if (r1 != r15) goto L241;
     */
    /* JADX WARN: Code restructure failed: missing block: B:239:0x0614, code lost:
    
        if (r7 != r15) goto L241;
     */
    /* JADX WARN: Code restructure failed: missing block: B:240:0x0616, code lost:
    
        r1 = 1000 - r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:241:0x0619, code lost:
    
        if (r1 == null) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:243:0x0621, code lost:
    
        if (defpackage.z6e.a.contains(r1) != false) goto L245;
     */
    /* JADX WARN: Code restructure failed: missing block: B:244:0x0623, code lost:
    
        r1 = 500 - r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:245:0x0626, code lost:
    
        r1 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:246:0x0628, code lost:
    
        r6.add(new defpackage.y6e(r8, r1));
        r1 = 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:247:0x0633, code lost:
    
        r1 = new java.util.ArrayList();
        r4 = r6.iterator();
     */
    /* JADX WARN: Code restructure failed: missing block: B:249:0x0640, code lost:
    
        if (r4.hasNext() == false) goto L468;
     */
    /* JADX WARN: Code restructure failed: missing block: B:250:0x0642, code lost:
    
        r5 = r4.next();
     */
    /* JADX WARN: Code restructure failed: missing block: B:251:0x064b, code lost:
    
        if (((defpackage.y6e) r5).b <= 0) goto L471;
     */
    /* JADX WARN: Code restructure failed: missing block: B:252:0x064d, code lost:
    
        r1.add(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:253:0x0651, code lost:
    
        r1 = (defpackage.y6e) defpackage.bu1.z0(defpackage.bu1.f1(r1, new defpackage.lva(10)));
     */
    /* JADX WARN: Code restructure failed: missing block: B:254:0x0662, code lost:
    
        if (r1 == null) goto L218;
     */
    /* JADX WARN: Code restructure failed: missing block: B:255:0x0664, code lost:
    
        r4 = java.lang.Integer.valueOf(r1.a);
     */
    /* JADX WARN: Code restructure failed: missing block: B:256:0x066a, code lost:
    
        if (r4 == 0) goto L263;
     */
    /* JADX WARN: Code restructure failed: missing block: B:257:0x066c, code lost:
    
        r1 = r3.getPostPromotionBannerData().getViewerEdge().getPromotionBanner();
     */
    /* JADX WARN: Code restructure failed: missing block: B:258:0x0678, code lost:
    
        if (r1 != null) goto L260;
     */
    /* JADX WARN: Code restructure failed: missing block: B:259:0x067a, code lost:
    
        r5 = r36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:260:0x067d, code lost:
    
        r34 = e(r3.getPostMetaData(), r1.getDimension(), r36);
        r33 = f(r1.getDimension(), r36);
        r29 = r1.getActionUrl();
        r30 = r1.getAltText();
        r31 = r1.getMiroId().getLarge();
        r31.getClass();
        r32 = r1.getMiroId().getSmall();
        r32.getClass();
        r5 = new defpackage.ii9(new defpackage.oh8(r29, r30, r31, r32, r33, r34), new defpackage.md5(28, (java.lang.Object) r103));
     */
    /* JADX WARN: Code restructure failed: missing block: B:261:0x06c4, code lost:
    
        if (r5 == 0) goto L263;
     */
    /* JADX WARN: Code restructure failed: missing block: B:262:0x06c6, code lost:
    
        r12.add(r4.intValue(), r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:263:0x06cd, code lost:
    
        if (r107 == false) goto L269;
     */
    /* JADX WARN: Code restructure failed: missing block: B:264:0x06cf, code lost:
    
        r1 = r27.a();
        r10.b = r12;
        r10.c = r3;
        r10.d = r0;
        r10.e = r14;
        r10.f = r12;
        r10.g = r107;
        r10.j = 1;
        r1 = h(r0, r1, r10);
     */
    /* JADX WARN: Code restructure failed: missing block: B:265:0x06e8, code lost:
    
        if (r1 != r26) goto L267;
     */
    /* JADX WARN: Code restructure failed: missing block: B:266:0x06ea, code lost:
    
        return r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:267:0x06eb, code lost:
    
        r9 = r0;
        r0 = r1;
        r1 = r107;
        r11 = r3;
        r7 = r12;
        r10 = r7;
        r8 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:269:0x06fa, code lost:
    
        r6 = r0;
        r11 = r3;
        r1 = r107;
        r0 = r12;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001e  */
    /* JADX WARN: Type inference failed for: r103v0, types: [java.lang.Object, que, sw9] */
    /* JADX WARN: Type inference failed for: r36v1, types: [com.medium.android.core.membership.UpsellPromoId, java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r36v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r4v124 */
    /* JADX WARN: Type inference failed for: r4v39, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r4v40 */
    /* JADX WARN: Type inference failed for: r5v28, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v29 */
    /* JADX WARN: Type inference failed for: r5v80 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(com.medium.android.graphql.FullPostQuery.Data r104, defpackage.bx6 r105, boolean r106, boolean r107, defpackage.p92 r108) {
        /*
            Method dump skipped, instruction units count: 3060
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.i(com.medium.android.graphql.FullPostQuery$Data, bx6, boolean, boolean, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m(java.lang.String r19, defpackage.yd4 r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 308
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sw9.m(java.lang.String, yd4, p92):java.lang.Object");
    }
}
