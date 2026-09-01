package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.followers.FollowersFragment;
import com.medium.android.following.FollowingFragment;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class hm4 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ hm4(jy8 jy8Var, ymc ymcVar, g70 g70Var) {
        this.a = 19;
        this.b = jy8Var;
        this.c = g70Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        boolean z;
        l78 l78VarY;
        int i;
        boolean z2;
        boolean z3;
        int iH;
        int i2 = this.a;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i2) {
            case 0:
                lm4 lm4Var = (lm4) obj4;
                l78 l78Var = (l78) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    boolean z4 = !muc.b0((String) l78Var.getValue());
                    xn7 xn7Var = xn7.S;
                    r28 r28VarG = w2g.G(o28.b, 0.0f, 30.0f, 0.0f, 0.0f, 13);
                    boolean zF = p65Var.f(lm4Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new gd3(lm4Var, 12, l78Var);
                        p65Var.j0(objM);
                    }
                    fo7.j((m45) objM, "Add", xn7Var, r28VarG, z4, null, p65Var, 3504, 32);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                ((Integer) obj2).getClass();
                k40.p((lm4) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 2:
                lm4 lm4Var2 = (lm4) obj4;
                rm4 rm4Var = (rm4) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    boolean zF2 = p65Var2.f(lm4Var2) | p65Var2.f(rm4Var);
                    Object objM2 = p65Var2.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new gd3(lm4Var2, 11, rm4Var);
                        p65Var2.j0(objM2);
                    }
                    f49.l((m45) objM2, new qse(z46.n), false, null, null, kyd.b, p65Var2, 1572864, 60);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 3:
                FollowersFragment followersFragment = (FollowersFragment) obj4;
                vq6 vq6Var = followersFragment.u0;
                upc upcVar = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    vx0.m(((FollowersFragment.BundleInfo) vq6Var.getValue()).getUserId(), ((FollowersFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), new rz2(13, followersFragment), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) upcVar.getValue()).a, 7), null, p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            case 4:
                FollowingFragment followingFragment = (FollowingFragment) obj4;
                bx4 bx4Var = (bx4) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    m15 m15VarQ = followingFragment.Q();
                    if (m15VarQ instanceof MainActivity) {
                        p65Var4.Y(1927548179);
                        vpc vpcVarS = ((MainActivity) m15VarQ).s();
                        hl0 hl0Var = as7.a;
                        z = false;
                        l78VarY = guc.x(vpcVarS, new vj3(56.0f), p65Var4, 0);
                        p65Var4.p(false);
                    } else {
                        z = false;
                        p65Var4.Y(1927551768);
                        l78VarY = qo7.y(new vj3(0.0f), p65Var4);
                        p65Var4.p(false);
                    }
                    jt7.a(z, pxf.E(-2083781813, new wp3(followingFragment, bx4Var, l78VarY, 24), p65Var4), p65Var4, 48, 1);
                } else {
                    p65Var4.S();
                }
                return c1eVar;
            case 5:
                Integer num = (Integer) obj;
                num.getClass();
                CollectionPreviewData collectionPreviewData = (CollectionPreviewData) obj2;
                collectionPreviewData.getClass();
                mt1 mt1Var = mt1.FOLLOW;
                SourceParameter sourceParameter = ((sx4) obj3).j;
                return ((ot1) obj4).a(collectionPreviewData, mt1Var, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : num, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), false);
            case 6:
                Integer num2 = (Integer) obj;
                num2.getClass();
                CreatorPreviewData creatorPreviewData = (CreatorPreviewData) obj2;
                creatorPreviewData.getClass();
                ine ineVar = ine.FOLLOW;
                SourceParameter sourceParameter2 = ((sy4) obj3).k;
                return ((kne) obj4).a(creatorPreviewData, ineVar, sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : null, ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : num2, ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : null, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null));
            case 7:
                boolean z5 = ((ub0) obj4).i;
                i3c i3cVar = (i3c) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    qv5.b(vn7.J(z5 ? R.drawable.ic_play : R.drawable.ic_pause, 0, p65Var5), vo7.R(p65Var5, z5 ? R.string.play : R.string.pause), er7.A(jfc.l(o28Var, 56.0f), i3cVar), uu1.d, p65Var5, 3080, 0);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 8:
                l3b l3bVar = (l3b) obj4;
                igc igcVar = (igc) obj3;
                int iIntValue6 = ((Integer) obj).intValue();
                if (obj2 instanceof f12) {
                    ((o78) l3bVar.e).b((f12) obj2);
                } else if (!(obj2 instanceof sjb)) {
                    if (obj2 instanceof t65) {
                        ht2.A0(igcVar, iIntValue6, obj2);
                        l3bVar.f((t65) obj2);
                    } else if (obj2 instanceof mwa) {
                        ht2.A0(igcVar, iIntValue6, obj2);
                        ((mwa) obj2).d();
                    }
                }
                return c1eVar;
            case 9:
                ((Integer) obj2).getClass();
                sgg.u((String) obj4, (az5) obj3, o28Var, (x12) obj, tr7.y(1));
                return c1eVar;
            case 10:
                ((Integer) obj2).getClass();
                gx1.v((il5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 11:
                ((Integer) obj2).getClass();
                dm2.f((ll5) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 12:
                ((Integer) obj2).getClass();
                bo.o((ol5) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 13:
                vq5 vq5Var = (vq5) obj4;
                rq5 rq5Var = (rq5) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    upc upcVarA = zu.a(vq5Var.i ? 102.0f : 0.0f, null, null, p65Var6, 0, 14);
                    boolean zF3 = p65Var6.f(rq5Var) | p65Var6.f(vq5Var);
                    Object objM3 = p65Var6.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new nq5(rq5Var, vq5Var, 1);
                        p65Var6.j0(objM3);
                    }
                    mq7.s((m45) objM3, w2g.G(rv8.X(o28Var, rv8.w), 0.0f, 0.0f, 0.0f, ((vj3) upcVarA.getValue()).a, 7), null, 0L, 0L, null, p65Var6, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 14:
                ((Integer) obj2).getClass();
                o7f.h((f86) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 15:
                ((Integer) obj2).getClass();
                bgf.o((h86) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 16:
                ut6 ut6Var = (ut6) obj4;
                tt6 tt6Var = (tt6) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    wt6 wt6Var = (wt6) ut6Var.b.invoke();
                    int iE = tt6Var.c;
                    Object obj5 = tt6Var.a;
                    if ((iE >= wt6Var.a() || !wt6Var.c(iE).equals(obj5)) && (iE = wt6Var.e(obj5)) != -1) {
                        tt6Var.c = iE;
                    }
                    int i3 = iE;
                    if (i3 != -1) {
                        p65Var7.Y(-1664741271);
                        s42.E(wt6Var, ut6Var.a, i3, tt6Var.a, p65Var7, 0);
                        p65Var7.p(false);
                    } else {
                        p65Var7.Y(-1664505826);
                        p65Var7.p(false);
                    }
                    boolean zH = p65Var7.h(tt6Var);
                    Object objM4 = p65Var7.M();
                    if (zH || objM4 == uobVar) {
                        objM4 = new ff4(17, tt6Var);
                        p65Var7.j0(objM4);
                    }
                    kyd.h(obj5, (x45) objM4, p65Var7);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 17:
                return ((xt6) obj3).a(new yt6((ut6) obj4, (lvc) obj), ((f72) obj2).a);
            case 18:
                mz1 mz1Var = (mz1) obj4;
                sv6 sv6Var = (sv6) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    mz1Var.f(sv6Var, p65Var8, 0);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 19:
                jy8 jy8Var = (jy8) obj4;
                g70 g70Var = (g70) obj3;
                m73 m73Var = (m73) obj;
                f72 f72Var = (f72) obj2;
                if (f72.h(f72Var.a) == Integer.MAX_VALUE) {
                    e26.a(mBTDfueQiGWRV.OkMpNsXe);
                }
                ip6 ip6Var = ip6.Ltr;
                int iH2 = f72.h(f72Var.a) - m73Var.i0(w2g.n(jy8Var, ip6Var) + w2g.o(jy8Var, ip6Var));
                int iI0 = iH2 - m73Var.i0(g70Var.f());
                int i4 = iI0 / 2;
                int i5 = 2;
                int i6 = iI0 % 2;
                int[] iArr = new int[2];
                int i7 = 0;
                while (i7 < i5) {
                    if (i4 < 0) {
                        i = 0;
                    } else {
                        i = (i7 < i6 ? 1 : 0) + i4;
                    }
                    iArr[i7] = i;
                    i7++;
                    i5 = 2;
                }
                int[] iArr2 = new int[i5];
                g70Var.w(m73Var, iH2, iArr, ip6.Ltr, iArr2);
                return new hx4(iArr2, 13, iArr);
            case 20:
                ((Integer) obj2).getClass();
                k50.H((k57) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 21:
                ((Integer) obj2).getClass();
                g01.w((ld7) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 22:
                ((Integer) obj2).getClass();
                g01.v((ud7) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 23:
                myd mydVar = (myd) obj4;
                mz1 mz1Var2 = (mz1) obj3;
                x12 x12Var9 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    kjd.a(mydVar.i, pxf.E(905505767, new dd(mz1Var2, 6), p65Var9), p65Var9, 48);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 24:
                ((Integer) obj2).getClass();
                fo7.b((xn7) obj4, (mz1) obj3, (x12) obj, tr7.y(49));
                return c1eVar;
            case 25:
                ((Integer) obj2).getClass();
                mo7.b((yn7) obj4, (mz1) obj3, (x12) obj, tr7.y(49));
                return c1eVar;
            case 26:
                ((Integer) obj2).getClass();
                vo7.d((gx7) obj4, (ek8) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 27:
                ub0 ub0Var = (ub0) obj4;
                ye7 ye7Var = (ye7) obj3;
                x12 x12Var10 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (!p65Var10.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    p65Var10.S();
                    return c1eVar;
                }
                rz5 rz5Var = qb8.c;
                yq0 yq0Var = z46.p;
                wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var10, 0);
                long j = p65Var10.T;
                int i8 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var10.l();
                r28 r28VarR = gx1.R(p65Var10, o28Var);
                r12.W.getClass();
                ot2 ot2Var = q12.b;
                p65Var10.c0();
                if (p65Var10.S) {
                    p65Var10.k(ot2Var);
                } else {
                    p65Var10.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var10, cuVar, wv1VarA);
                cu cuVar2 = q12.e;
                tp7.B(p65Var10, cuVar2, i89VarL);
                Integer numValueOf = Integer.valueOf(i8);
                cu cuVar3 = q12.g;
                tp7.B(p65Var10, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var10, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var10, cuVar4, r28VarR);
                float f = ub0Var.g;
                tb0 tb0Var = ub0Var.e;
                tb0 tb0Var2 = ub0Var.d;
                float f2 = ub0Var.h - 1.0f;
                if (f2 < 1.0f) {
                    f2 = 1.0f;
                }
                float fFloatValue = ((Number) zu.b(f / f2, f76.Q(1500, 0, ao3.a, 2), "progress", p65Var10, 3072, 20).getValue()).floatValue();
                r28 r28VarE = jfc.e(jfc.d(o28Var, 1.0f), 1.0f);
                sn3 sn3Var = kt7.b;
                xz5.p(r28VarE, Float.valueOf(fFloatValue), ((zo7) p65Var10.j(sn3Var)).n, ((zo7) p65Var10.j(sn3Var)).z, 0, 0.0f, null, p65Var10, 6, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                r28 r28VarU = km4.u(1.0f, jfc.d(o28Var, 1.0f), true);
                omb ombVarA = nmb.a(qb8.a, z46.n, p65Var10, 48);
                long j2 = p65Var10.T;
                int i9 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var10.l();
                r28 r28VarR2 = gx1.R(p65Var10, r28VarU);
                p65Var10.c0();
                if (p65Var10.S) {
                    p65Var10.k(ot2Var);
                } else {
                    p65Var10.m0();
                }
                tp7.B(p65Var10, cuVar, ombVarA);
                tp7.B(p65Var10, cuVar2, i89VarL2);
                ka1.z(i9, p65Var10, cuVar3, p65Var10, fnVar);
                tp7.B(p65Var10, cuVar4, r28VarR2);
                iq7.d(ub0Var.c, p65Var10, 0);
                sq6 sq6Var = new sq6(1.0f, true);
                wv1 wv1VarA2 = uv1.a(qb8.e, yq0Var, p65Var10, 6);
                long j3 = p65Var10.T;
                int i10 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL3 = p65Var10.l();
                r28 r28VarR3 = gx1.R(p65Var10, sq6Var);
                p65Var10.c0();
                if (p65Var10.S) {
                    p65Var10.k(ot2Var);
                } else {
                    p65Var10.m0();
                }
                tp7.B(p65Var10, cuVar, wv1VarA2);
                tp7.B(p65Var10, cuVar2, i89VarL3);
                ka1.z(i10, p65Var10, cuVar3, p65Var10, fnVar);
                tp7.B(p65Var10, cuVar4, r28VarR3);
                if (tb0Var2 == null && tb0Var == null) {
                    p65Var10.Y(1154940424);
                } else {
                    p65Var10.Y(1158798901);
                    p65Var10.Y(-655355258);
                    kx kxVar = new kx();
                    if (tb0Var2 != null) {
                        p65Var10.Y(-1581022772);
                        iH = kxVar.h(new skc(((zo7) p65Var10.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
                        try {
                            kxVar.d(tb0Var2.b);
                            kxVar.f(iH);
                            z2 = false;
                        } finally {
                        }
                    } else {
                        z2 = false;
                        p65Var10.Y(-1584963368);
                    }
                    p65Var10.p(z2);
                    if (tb0Var2 == null || tb0Var == null) {
                        p65Var10.Y(-1584963368);
                    } else {
                        p65Var10.Y(-1580707998);
                        kxVar.d(vo7.R(p65Var10, R.string.author_in_publication));
                    }
                    p65Var10.p(z2);
                    if (tb0Var != null) {
                        p65Var10.Y(-1580526617);
                        iH = kxVar.h(new skc(((zo7) p65Var10.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
                        try {
                            kxVar.d(tb0Var.b);
                            kxVar.f(iH);
                            z3 = false;
                        } finally {
                        }
                    } else {
                        z3 = false;
                        p65Var10.Y(-1584963368);
                    }
                    p65Var10.p(z3);
                    mx mxVarI = kxVar.i();
                    p65Var10.p(z3);
                    jjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, mkd.a(((bu7) p65Var10.j(jt7.c)).n, ((zo7) p65Var10.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var10, 0, 24960, 241662);
                }
                p65Var10.p(false);
                hp7.t(p65Var10, jfc.e(o28Var, 4.0f));
                String strW = ub0Var.f;
                if (strW == null) {
                    strW = km4.w(p65Var10, -655313592, R.string.common_untitled_story, p65Var10, false);
                } else {
                    p65Var10.Y(-655314181);
                    p65Var10.p(false);
                }
                jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(((bu7) p65Var10.j(jt7.c)).m, 0L, 0L, d05.h, null, null, 0L, 0L, null, 0, 0L, null, null, 16777211), p65Var10, 0, 24960, 110590);
                p65Var10.p(true);
                boolean zF4 = p65Var10.f(ub0Var) | p65Var10.f(ye7Var) | p65Var10.f("");
                Object objM5 = p65Var10.M();
                if (zF4 || objM5 == uobVar) {
                    objM5 = new ps5(ub0Var, 13, ye7Var);
                    p65Var10.j0(objM5);
                }
                f49.l((m45) objM5, null, false, null, null, pxf.E(-1874436062, new v08(0, ub0Var), p65Var10), p65Var10, 1572864, 62);
                boolean zF5 = p65Var10.f(ye7Var);
                Object objM6 = p65Var10.M();
                if (zF5 || objM6 == uobVar) {
                    objM6 = new qv7(0, ye7Var, ye7.class, "onClose", "onClose()V", 0, 2);
                    p65Var10.j0(objM6);
                }
                f49.l((m45) ((qh6) objM6), null, false, null, null, rv8.j, p65Var10, 1572864, 62);
                hp7.t(p65Var10, jfc.p(o28Var, 8.0f));
                p65Var10.p(true);
                p65Var10.p(true);
                return c1eVar;
            case 28:
                ((Integer) obj2).getClass();
                mo7.x((nob) obj4, (mz1) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            default:
                ((Integer) obj2).getClass();
                xk8.e((vk8) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
        }
    }

    public /* synthetic */ hm4(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public /* synthetic */ hm4(Object obj, Object obj2, int i, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
    }
}
