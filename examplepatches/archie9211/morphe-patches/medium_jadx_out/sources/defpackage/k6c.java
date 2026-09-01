package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.RectF;
import android.graphics.drawable.ColorDrawable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.catalogs.addnotetolistitem.AddNoteToListItemDialogFragment;
import com.medium.android.catalogs.catalogdetail.CatalogDetailFragment;
import com.medium.android.catalogs.createCatalog.CreateCatalogBottomSheetDialogFragment;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.reader.R;
import com.medium.refinerecommendations.following.seeall.collections.AllFollowedCollectionsFragment;
import com.medium.refinerecommendations.following.seeall.tags.AllFollowedTagsFragment;
import com.medium.refinerecommendations.following.seeall.writers.AllFollowedWritersFragment;
import com.medium.refinerecommendations.muted.seeall.collections.AllMutedCollectionsFragment;
import com.medium.refinerecommendations.muted.seeall.writers.AllMutedWritersFragment;
import defpackage.as7;
import defpackage.c1e;
import defpackage.fg;
import defpackage.g76;
import defpackage.guc;
import defpackage.hl0;
import defpackage.ke;
import defpackage.lv8;
import defpackage.n01;
import defpackage.o28;
import defpackage.p65;
import defpackage.rx0;
import defpackage.vj3;
import defpackage.vpc;
import defpackage.vq6;
import defpackage.w2g;
import defpackage.x12;
import defpackage.xz5;
import defpackage.yi2;
import defpackage.zg7;
import defpackage.zm7;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class k6c implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ k6c(lid lidVar, int i) {
        this.a = 27;
        this.b = lidVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        boolean zG;
        boolean z;
        boolean z2;
        int i = this.a;
        int i2 = 5;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        int i3 = 2;
        c1e c1eVar = c1e.a;
        int i4 = 1;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                rx5 rx5Var = (rx5) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    ur7.a(rx5Var, null, jfc.c, null, v82.a, 0.0f, null, 0, p65Var, 1573296, 1976);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                yc9 yc9Var = (yc9) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    nx5 nx5Var = new nx5((Context) p65Var2.j(eo.b));
                    nx5Var.c = yc9Var.c;
                    rx5 rx5VarA = nx5Var.a();
                    sw5 sw5Var = yc9Var.c;
                    ur7.a(rx5VarA, sw5Var != null ? sw5Var.getAlt() : null, jfc.c, null, v82.a, 0.0f, null, 0, p65Var2, 1573248, 1976);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                q qVar = (q) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else if (((Boolean) p65Var3.j(l36.a)).booleanValue()) {
                    p65Var3.Y(-1674894619);
                    dy0.a(flb.a0(w2g.C(jfc.l(o28Var, 48.0f), 12.0f), ((zo7) p65Var3.j(kt7.b)).o, rv8.r), p65Var3, 0);
                    p65Var3.p(false);
                } else {
                    p65Var3.Y(-1675270308);
                    String str = qVar.b;
                    ur7.a(str != null ? new ax5(str) : null, qVar.c, jfc.l(o28Var, 24.0f), null, null, 0.0f, new bs0(5, ((zo7) p65Var3.j(kt7.b)).o), 0, p65Var3, 384, 1784);
                    p65Var3.p(false);
                }
                return c1eVar;
            case 3:
                String str2 = (String) obj;
                SourceParameter sourceParameter = (SourceParameter) obj2;
                str2.getClass();
                sourceParameter.getClass();
                vaa vaaVar = ((iaa) obj3).b;
                if (vaaVar.s.add(str2)) {
                    vaaVar.i.g(str2, vaaVar.c, gp7.u(sourceParameter), vaaVar.o);
                }
                return c1eVar;
            case 4:
                AddNoteToListItemDialogFragment addNoteToListItemDialogFragment = (AddNoteToListItemDialogFragment) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                    return c1eVar;
                }
                wue wueVarA = e67.a(p65Var4);
                if (wueVarA != null) {
                    jt7.a(false, pxf.E(715069313, new r((ua) to7.z(n1b.a.b(ua.class), wueVarA, null, wueVarA instanceof pi5 ? ((pi5) wueVarA).getDefaultViewModelCreationExtras() : og2.b, p65Var4), i3, addNoteToListItemDialogFragment), p65Var4), p65Var4, 48, 1);
                    return c1eVar;
                }
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return null;
            case 5:
                gc gcVar = (gc) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    k50.p(gcVar, null, p65Var5, 0);
                } else {
                    p65Var5.S();
                }
                return c1eVar;
            case 6:
                final AllFollowedCollectionsFragment allFollowedCollectionsFragment = (AllFollowedCollectionsFragment) obj3;
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Integer) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    jt7.a(false, pxf.E(214176352, new b55() { // from class: com.medium.refinerecommendations.following.seeall.collections.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            AllFollowedCollectionsFragment allFollowedCollectionsFragment2 = allFollowedCollectionsFragment;
                            vq6 vq6Var = allFollowedCollectionsFragment2.u0;
                            x12 x12Var7 = (x12) obj4;
                            int iIntValue7 = ((Integer) obj5).intValue();
                            p65 p65Var7 = (p65) x12Var7;
                            if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                                vpc vpcVarS = ((MainActivity) allFollowedCollectionsFragment2.Q()).s();
                                hl0 hl0Var = as7.a;
                                rx0.d(((AllFollowedCollectionsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AllFollowedCollectionsFragment.BundleInfo) vq6Var.getValue()).getTotal(), new ke(allFollowedCollectionsFragment2), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var7, 0).getValue()).a, 7), null, p65Var7, 0);
                            } else {
                                p65Var7.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var6), p65Var6, 48, 1);
                } else {
                    p65Var6.S();
                }
                return c1eVar;
            case 7:
                ze zeVar = (ze) obj3;
                Integer num = (Integer) obj;
                num.getClass();
                CollectionPreviewData collectionPreviewData = (CollectionPreviewData) obj2;
                collectionPreviewData.getClass();
                ot1 ot1Var = zeVar.e;
                mt1 mt1Var = mt1.FOLLOW;
                SourceParameter sourceParameter2 = zeVar.l;
                return ot1Var.a(collectionPreviewData, mt1Var, sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : null, ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : num, ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : null, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null), false);
            case 8:
                final AllFollowedTagsFragment allFollowedTagsFragment = (AllFollowedTagsFragment) obj3;
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Integer) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    jt7.a(false, pxf.E(2146159650, new b55() { // from class: com.medium.refinerecommendations.following.seeall.tags.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            AllFollowedTagsFragment allFollowedTagsFragment2 = allFollowedTagsFragment;
                            vq6 vq6Var = allFollowedTagsFragment2.u0;
                            x12 x12Var8 = (x12) obj4;
                            int iIntValue8 = ((Integer) obj5).intValue();
                            p65 p65Var8 = (p65) x12Var8;
                            if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                                vpc vpcVarS = ((MainActivity) allFollowedTagsFragment2.Q()).s();
                                hl0 hl0Var = as7.a;
                                n01.e(((AllFollowedTagsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AllFollowedTagsFragment.BundleInfo) vq6Var.getValue()).getTotal(), new zg7(6, allFollowedTagsFragment2), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var8, 0).getValue()).a, 7), null, p65Var8, 0);
                            } else {
                                p65Var8.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var7), p65Var7, 48, 1);
                } else {
                    p65Var7.S();
                }
                return c1eVar;
            case 9:
                final AllFollowedWritersFragment allFollowedWritersFragment = (AllFollowedWritersFragment) obj3;
                x12 x12Var8 = (x12) obj;
                int iIntValue8 = ((Integer) obj2).intValue();
                p65 p65Var8 = (p65) x12Var8;
                if (p65Var8.P(iIntValue8 & 1, (iIntValue8 & 3) != 2)) {
                    jt7.a(false, pxf.E(1276610079, new b55() { // from class: com.medium.refinerecommendations.following.seeall.writers.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            AllFollowedWritersFragment allFollowedWritersFragment2 = allFollowedWritersFragment;
                            vq6 vq6Var = allFollowedWritersFragment2.u0;
                            x12 x12Var9 = (x12) obj4;
                            int iIntValue9 = ((Integer) obj5).intValue();
                            p65 p65Var9 = (p65) x12Var9;
                            if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                                vpc vpcVarS = ((MainActivity) allFollowedWritersFragment2.Q()).s();
                                hl0 hl0Var = as7.a;
                                yi2.e(((AllFollowedWritersFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AllFollowedWritersFragment.BundleInfo) vq6Var.getValue()).getTotal(), new zm7(2, allFollowedWritersFragment2), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) lv8.k(56.0f, vpcVarS, p65Var9, 0).getValue()).a, 7), null, p65Var9, 0);
                            } else {
                                p65Var9.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var8), p65Var8, 48, 1);
                } else {
                    p65Var8.S();
                }
                return c1eVar;
            case 10:
                eg egVar = (eg) obj3;
                Integer num2 = (Integer) obj;
                num2.getClass();
                CreatorPreviewData creatorPreviewData = (CreatorPreviewData) obj2;
                creatorPreviewData.getClass();
                kne kneVar = egVar.e;
                ine ineVar = ine.FOLLOW;
                SourceParameter sourceParameter3 = egVar.k;
                return kneVar.a(creatorPreviewData, ineVar, sourceParameter3.copy(((-9) & 1) != 0 ? sourceParameter3.name : null, ((-9) & 2) != 0 ? sourceParameter3.user_id : null, ((-9) & 4) != 0 ? sourceParameter3.timestamp : null, ((-9) & 8) != 0 ? sourceParameter3.dimension : null, ((-9) & 16) != 0 ? sourceParameter3.collection_id : null, ((-9) & 32) != 0 ? sourceParameter3.post_id : null, ((-9) & 64) != 0 ? sourceParameter3.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter3.promo_id : null, ((-9) & 256) != 0 ? sourceParameter3.index : num2, ((-9) & 512) != 0 ? sourceParameter3.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter3.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter3.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter3.author_id : null, ((-9) & 8192) != 0 ? sourceParameter3.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter3.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter3.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter3.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter3.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter3.post_source : null, ((-9) & 524288) != 0 ? sourceParameter3.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter3.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter3.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter3.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter3.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter3.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter3.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter3.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter3.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter3.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter3.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter3.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter3.notification_type : null, (8191 & 1) != 0 ? sourceParameter3.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter3.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter3.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter3.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter3.email_location : null, (8191 & 32) != 0 ? sourceParameter3.book_id : null, (8191 & 64) != 0 ? sourceParameter3.edition_id : null, (8191 & 128) != 0 ? sourceParameter3.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter3.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter3.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter3.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter3.item_type : null, (8191 & 4096) != 0 ? sourceParameter3.unknownFields() : null));
            case 11:
                final AllMutedCollectionsFragment allMutedCollectionsFragment = (AllMutedCollectionsFragment) obj3;
                x12 x12Var9 = (x12) obj;
                int iIntValue9 = ((Integer) obj2).intValue();
                p65 p65Var9 = (p65) x12Var9;
                if (p65Var9.P(iIntValue9 & 1, (iIntValue9 & 3) != 2)) {
                    jt7.a(false, pxf.E(2094058256, new b55() { // from class: com.medium.refinerecommendations.muted.seeall.collections.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            AllMutedCollectionsFragment allMutedCollectionsFragment2 = allMutedCollectionsFragment;
                            vq6 vq6Var = allMutedCollectionsFragment2.u0;
                            x12 x12Var10 = (x12) obj4;
                            int iIntValue10 = ((Integer) obj5).intValue();
                            p65 p65Var10 = (p65) x12Var10;
                            if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                                xz5.d(((AllMutedCollectionsFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AllMutedCollectionsFragment.BundleInfo) vq6Var.getValue()).getTotal(), new fg(allMutedCollectionsFragment2), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) allMutedCollectionsFragment2.Q()).s(), p65Var10, 0).getValue()).a, 7), null, p65Var10, 0);
                            } else {
                                p65Var10.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var9), p65Var9, 48, 1);
                } else {
                    p65Var9.S();
                }
                return c1eVar;
            case 12:
                final AllMutedWritersFragment allMutedWritersFragment = (AllMutedWritersFragment) obj3;
                x12 x12Var10 = (x12) obj;
                int iIntValue10 = ((Integer) obj2).intValue();
                p65 p65Var10 = (p65) x12Var10;
                if (p65Var10.P(iIntValue10 & 1, (iIntValue10 & 3) != 2)) {
                    jt7.a(false, pxf.E(-292987461, new b55() { // from class: com.medium.refinerecommendations.muted.seeall.writers.b
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            AllMutedWritersFragment allMutedWritersFragment2 = allMutedWritersFragment;
                            vq6 vq6Var = allMutedWritersFragment2.u0;
                            x12 x12Var11 = (x12) obj4;
                            int iIntValue11 = ((Integer) obj5).intValue();
                            p65 p65Var11 = (p65) x12Var11;
                            if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                                g76.b(((AllMutedWritersFragment.BundleInfo) vq6Var.getValue()).getReferrerSource(), ((AllMutedWritersFragment.BundleInfo) vq6Var.getValue()).getTotal(), new zg7(7, allMutedWritersFragment2), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) guc.z(((MainActivity) allMutedWritersFragment2.Q()).s(), p65Var11, 0).getValue()).a, 7), null, p65Var11, 0);
                            } else {
                                p65Var11.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var10), p65Var10, 48, 1);
                } else {
                    p65Var10.S();
                }
                return c1eVar;
            case 13:
                oh ohVar = (oh) obj3;
                x12 x12Var11 = (x12) obj;
                int iIntValue11 = ((Integer) obj2).intValue();
                p65 p65Var11 = (p65) x12Var11;
                if (p65Var11.P(iIntValue11 & 1, (iIntValue11 & 3) != 2)) {
                    String strR = vo7.R(p65Var11, R.string.refine_recommendations_view_friends_on_medium);
                    boolean zF = p65Var11.f(ohVar);
                    Object objM = p65Var11.M();
                    if (zF || objM == uobVar) {
                        vf vfVar = new vf(0, ohVar, oh.class, "onBackPressed", "onBackPressed()V", 0, 11);
                        p65Var11.j0(vfVar);
                        objM = vfVar;
                    }
                    qk7.g(null, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var11, 0, 505);
                } else {
                    p65Var11.S();
                }
                return c1eVar;
            case 14:
                hi hiVar = (hi) obj3;
                x12 x12Var12 = (x12) obj;
                int iIntValue12 = ((Integer) obj2).intValue();
                p65 p65Var12 = (p65) x12Var12;
                if (p65Var12.P(iIntValue12 & 1, (iIntValue12 & 3) != 2)) {
                    String strR2 = vo7.R(p65Var12, R.string.refine_recommendations_who_to_follow);
                    boolean zF2 = p65Var12.f(hiVar);
                    Object objM2 = p65Var12.M();
                    if (zF2 || objM2 == uobVar) {
                        vf vfVar2 = new vf(0, hiVar, hi.class, "onBackPressed", "onBackPressed()V", 0, 14);
                        p65Var12.j0(vfVar2);
                        objM2 = vfVar2;
                    }
                    qk7.g(null, strR2, (m45) ((qh6) objM2), null, null, null, 0L, 0L, null, p65Var12, 0, 505);
                } else {
                    p65Var12.S();
                }
                return c1eVar;
            case 15:
                ti tiVar = (ti) obj3;
                x12 x12Var13 = (x12) obj;
                int iIntValue13 = ((Integer) obj2).intValue();
                p65 p65Var13 = (p65) x12Var13;
                if (p65Var13.P(iIntValue13 & 1, (iIntValue13 & 3) != 2)) {
                    String strR3 = vo7.R(p65Var13, R.string.refine_recommendations_topics_to_follow);
                    boolean zF3 = p65Var13.f(tiVar);
                    Object objM3 = p65Var13.M();
                    if (zF3 || objM3 == uobVar) {
                        vf vfVar3 = new vf(0, tiVar, ti.class, "onBackPressed", "onBackPressed()V", 0, 18);
                        p65Var13.j0(vfVar3);
                        objM3 = vfVar3;
                    }
                    qk7.g(null, strR3, (m45) ((qh6) objM3), null, null, null, 0L, 0L, null, p65Var13, 0, 505);
                } else {
                    p65Var13.S();
                }
                return c1eVar;
            case 16:
                fj fjVar = (fj) obj3;
                x12 x12Var14 = (x12) obj;
                int iIntValue14 = ((Integer) obj2).intValue();
                p65 p65Var14 = (p65) x12Var14;
                if (p65Var14.P(iIntValue14 & 1, (iIntValue14 & 3) != 2)) {
                    String strR4 = vo7.R(p65Var14, R.string.refine_recommendations_who_to_follow);
                    boolean zF4 = p65Var14.f(fjVar);
                    Object objM4 = p65Var14.M();
                    if (zF4 || objM4 == uobVar) {
                        vf vfVar4 = new vf(0, fjVar, fj.class, "onBackPressed", "onBackPressed()V", 0, 22);
                        p65Var14.j0(vfVar4);
                        objM4 = vfVar4;
                    }
                    qk7.g(null, strR4, (m45) ((qh6) objM4), null, null, null, 0L, 0L, null, p65Var14, 0, 505);
                } else {
                    p65Var14.S();
                }
                return c1eVar;
            case 17:
                zwa zwaVarG = kk7.G((RectF) obj);
                zwa zwaVarG2 = kk7.G((RectF) obj2);
                switch (((ywb) obj3).a) {
                    case 6:
                        zG = zwaVarG.g(zwaVarG2);
                        break;
                    default:
                        zG = zwaVarG2.a(zwaVarG.b());
                        break;
                }
                return Boolean.valueOf(zG);
            case 18:
                c55 c55Var = (c55) obj3;
                x12 x12Var15 = (x12) obj;
                int iIntValue15 = ((Integer) obj2).intValue();
                p65 p65Var15 = (p65) x12Var15;
                if (p65Var15.P(iIntValue15 & 1, (iIntValue15 & 3) != 2)) {
                    r28 r28VarC = jfc.c(o28Var, 1.0f);
                    omb ombVarA = nmb.a(qb8.b, z46.n, p65Var15, 54);
                    int iS = w2g.s(p65Var15);
                    i89 i89VarL = p65Var15.l();
                    r28 r28VarR = gx1.R(p65Var15, r28VarC);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var15.c0();
                    if (p65Var15.S) {
                        p65Var15.k(ot2Var);
                    } else {
                        p65Var15.m0();
                    }
                    tp7.B(p65Var15, q12.f, ombVarA);
                    tp7.B(p65Var15, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var15.S || !g76.L(p65Var15.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var15, iS, cuVar);
                    }
                    tp7.B(p65Var15, q12.d, r28VarR);
                    c55Var.f(qmb.a, p65Var15, 6);
                    p65Var15.p(true);
                } else {
                    p65Var15.S();
                }
                return c1eVar;
            case 19:
                wp wpVar = (wp) obj3;
                x12 x12Var16 = (x12) obj;
                int iIntValue16 = ((Integer) obj2).intValue();
                p65 p65Var16 = (p65) x12Var16;
                if (p65Var16.P(iIntValue16 & 1, (iIntValue16 & 3) != 2)) {
                    if (wpVar != null) {
                        p65Var16.Y(1033526305);
                        w2g.f(wpVar, null, p65Var16, 252);
                        z = false;
                    } else {
                        z = false;
                        p65Var16.Y(1032647734);
                    }
                    p65Var16.p(z);
                } else {
                    p65Var16.S();
                }
                return c1eVar;
            case 20:
                pu0 pu0Var = (pu0) obj3;
                x12 x12Var17 = (x12) obj;
                int iIntValue17 = ((Integer) obj2).intValue();
                p65 p65Var17 = (p65) x12Var17;
                if (p65Var17.P(iIntValue17 & 1, (iIntValue17 & 3) != 2)) {
                    kx kxVarW = ho2.w(p65Var17, -861505901);
                    kxVarW.d(vo7.R(p65Var17, R.string.post_page_repost_educational_tooltip));
                    kxVarW.d("\n\n");
                    p65Var17.Y(-861501079);
                    int iH = kxVarW.h(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439));
                    try {
                        kxVarW.d(vo7.R(p65Var17, R.string.common_ok_got_it));
                        kxVarW.f(iH);
                        p65Var17.p(false);
                        mx mxVarI = kxVarW.i();
                        p65Var17.p(false);
                        r28 r28VarD = jfc.d(o28Var, 1.0f);
                        boolean zF5 = p65Var17.f(pu0Var);
                        Object objM5 = p65Var17.M();
                        if (zF5 || objM5 == uobVar) {
                            objM5 = new sc0(0, pu0Var, pu0.class, "onRepostEducationalTooltipDismissed", "onRepostEducationalTooltipDismissed()V", 0, 5);
                            p65Var17.j0(objM5);
                        }
                        jjd.c(mxVarI, bgf.N(hlg.r(r28VarD, false, null, null, (m45) ((qh6) objM5), 15), "post_page_repost_tooltip_dismiss"), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, null, p65Var17, 0, 0, 524284);
                    } catch (Throwable th) {
                        kxVarW.f(iH);
                        throw th;
                    }
                } else {
                    p65Var17.S();
                }
                return c1eVar;
            case 21:
                CatalogDetailFragment catalogDetailFragment = (CatalogDetailFragment) obj3;
                x12 x12Var18 = (x12) obj;
                int iIntValue18 = ((Integer) obj2).intValue();
                p65 p65Var18 = (p65) x12Var18;
                if (p65Var18.P(iIntValue18 & 1, (iIntValue18 & 3) != 2)) {
                    l78 l78VarZ = guc.z(((MainActivity) catalogDetailFragment.Q()).s(), p65Var18, 0);
                    Object objM6 = p65Var18.M();
                    if (objM6 == uobVar) {
                        objM6 = new w81(catalogDetailFragment);
                        p65Var18.j0(objM6);
                    }
                    jt7.a(false, pxf.E(1243065292, new af0(catalogDetailFragment, (w81) objM6, l78VarZ, i2), p65Var18), p65Var18, 48, 1);
                } else {
                    p65Var18.S();
                }
                return c1eVar;
            case 22:
                ga1 ga1Var = (ga1) obj3;
                x12 x12Var19 = (x12) obj;
                int iIntValue19 = ((Integer) obj2).intValue();
                p65 p65Var19 = (p65) x12Var19;
                if (p65Var19.P(iIntValue19 & 1, (iIntValue19 & 3) != 2)) {
                    qv5.b(vn7.J(ga1Var.j.booleanValue() ? R.drawable.ic_followed_list : R.drawable.ic_follow_list, 0, p65Var19), vo7.R(p65Var19, ga1Var.j.booleanValue() ? R.string.common_unfollow_catalog : R.string.common_follow_catalog), null, ((zo7) p65Var19.j(kt7.b)).o, p65Var19, 8, 4);
                } else {
                    p65Var19.S();
                }
                return c1eVar;
            case 23:
                rg1 rg1Var = (rg1) obj3;
                x12 x12Var20 = (x12) obj;
                int iIntValue20 = ((Integer) obj2).intValue();
                p65 p65Var20 = (p65) x12Var20;
                if (p65Var20.P(iIntValue20 & 1, (iIntValue20 & 3) != 2)) {
                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var20), vo7.Q(R.string.common_content_description_more_options_for_catalog_item, new Object[]{af1.a(rg1Var.f, p65Var20)}, p65Var20), null, 0L, p65Var20, 8, 12);
                } else {
                    p65Var20.S();
                }
                return c1eVar;
            case 24:
                ihc ihcVar = (ihc) obj3;
                x12 x12Var21 = (x12) obj;
                int iIntValue21 = ((Integer) obj2).intValue();
                p65 p65Var21 = (p65) x12Var21;
                if (p65Var21.P(iIntValue21 & 1, (iIntValue21 & 3) != 2)) {
                    jjd.b(ihcVar.a.a(), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var21, 0, 0, 262142);
                } else {
                    p65Var21.S();
                }
                return c1eVar;
            case 25:
                l3b l3bVar = (l3b) obj3;
                ((Integer) obj).getClass();
                if (obj2 instanceof f12) {
                    f12 f12Var = (f12) obj2;
                    g78 g78Var = (g78) l3bVar.h;
                    if (g78Var == null) {
                        g78 g78Var2 = iqb.a;
                        g78Var = new g78();
                        l3bVar.h = g78Var;
                    }
                    g78Var.k(f12Var);
                    ((o78) l3bVar.e).b(f12Var);
                }
                if (obj2 instanceof t65) {
                    l3bVar.f((t65) obj2);
                }
                if (obj2 instanceof mwa) {
                    ((mwa) obj2).d();
                }
                return c1eVar;
            case 26:
                r92 r92Var = (r92) obj3;
                x12 x12Var22 = (x12) obj;
                int iIntValue22 = ((Integer) obj2).intValue();
                p65 p65Var22 = (p65) x12Var22;
                if (!p65Var22.P(iIntValue22 & 1, (iIntValue22 & 3) != 2)) {
                    p65Var22.S();
                    return c1eVar;
                }
                r28 r28VarD2 = jfc.d(o28Var, 1.0f);
                omb ombVarA2 = nmb.a(qb8.a, z46.n, p65Var22, 48);
                long j = p65Var22.T;
                int i5 = (int) (j ^ (j >>> 32));
                i89 i89VarL2 = p65Var22.l();
                r28 r28VarR2 = gx1.R(p65Var22, r28VarD2);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var22.c0();
                if (p65Var22.S) {
                    p65Var22.k(ot2Var2);
                } else {
                    p65Var22.m0();
                }
                cu cuVar2 = q12.f;
                tp7.B(p65Var22, cuVar2, ombVarA2);
                cu cuVar3 = q12.e;
                tp7.B(p65Var22, cuVar3, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar4 = q12.g;
                tp7.B(p65Var22, cuVar4, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var22, fnVar);
                cu cuVar5 = q12.d;
                tp7.B(p65Var22, cuVar5, r28VarR2);
                r28 r28VarF = w2g.F(new sq6(1.0f, true), 12.0f, 16.0f, 8.0f, 16.0f);
                wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var22, 0);
                long j2 = p65Var22.T;
                int i6 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL3 = p65Var22.l();
                r28 r28VarR3 = gx1.R(p65Var22, r28VarF);
                p65Var22.c0();
                if (p65Var22.S) {
                    p65Var22.k(ot2Var2);
                } else {
                    p65Var22.m0();
                }
                tp7.B(p65Var22, cuVar2, wv1VarA);
                tp7.B(p65Var22, cuVar3, i89VarL3);
                ka1.z(i6, p65Var22, cuVar4, p65Var22, fnVar);
                tp7.B(p65Var22, cuVar5, r28VarR3);
                String strR5 = vo7.R(p65Var22, R.string.continue_reading_notif_title);
                sn3 sn3Var = jt7.c;
                jjd.b(strR5, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var22.j(sn3Var)).o, ((zo7) p65Var22.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var22, 0, 0, 131070);
                hp7.t(p65Var22, jfc.l(o28Var, 4.0f));
                String strD = r92Var.getPostTitle();
                String strW = (strD == null || muc.b0(strD)) ? null : strD;
                if (strW == null) {
                    strW = km4.w(p65Var22, -433396108, R.string.common_untitled_story, p65Var22, false);
                } else {
                    p65Var22.Y(-433399518);
                    p65Var22.p(false);
                }
                jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, ((bu7) p65Var22.j(sn3Var)).e, p65Var22, 0, 24960, 110590);
                p65Var22.p(true);
                final sw5 sw5VarC = r92Var.getPostPreviewImageData();
                if (sw5VarC != null) {
                    p65Var22.Y(91194252);
                    final r28 r28VarY = r40.y(jfc.l(o28Var, 90.0f), bmb.c(0.0f, 4.0f, 4.0f, 0.0f, 9));
                    sn3 sn3Var2 = z22.h;
                    final float fZ = ((m73) p65Var22.j(sn3Var2)).Z(4.0f);
                    final int iI0 = ((m73) p65Var22.j(sn3Var2)).i0(90.0f);
                    final boolean z3 = p65Var22.j(z22.n) == ip6.Rtl;
                    k40.c(u57.a.a(new l90((Resources) p65Var22.j(eo.c), i4)), pxf.E(-1578441365, new b55() { // from class: q92
                        @Override // defpackage.b55
                        public final Object invoke(Object obj4, Object obj5) {
                            x12 x12Var23 = (x12) obj4;
                            int iIntValue23 = ((Integer) obj5).intValue();
                            p65 p65Var23 = (p65) x12Var23;
                            if (p65Var23.P(iIntValue23 & 1, (iIntValue23 & 3) != 2)) {
                                sn3 sn3Var3 = eo.b;
                                nx5 nx5Var2 = new nx5((Context) p65Var23.j(sn3Var3));
                                sw5 sw5Var2 = sw5VarC;
                                nx5Var2.c = sw5Var2;
                                int i7 = iI0;
                                nx5Var2.c(kk7.o(i7, i7));
                                nx5Var2.r = dqb.FILL;
                                rx5 rx5VarA2 = nx5Var2.a();
                                String alt = sw5Var2.getAlt();
                                nx5 nx5Var3 = new nx5((Context) p65Var23.j(sn3Var3));
                                nx5Var3.c = new ColorDrawable(op8.n0(((zo7) p65Var23.j(kt7.b)).c));
                                boolean z4 = z3;
                                float f = fZ;
                                float f2 = !z4 ? f : 0.0f;
                                float f3 = !z4 ? f : 0.0f;
                                float f4 = z4 ? f : 0.0f;
                                if (!z4) {
                                    f = 0.0f;
                                }
                                ord[] ordVarArr = {new gmb(f4, f2, f, f3)};
                                q84 q84Var = tx5.a;
                                tx5.b(nx5Var3, k80.Q0(ordVarArr));
                                ur7.b(rx5VarA2, alt, r28VarY, dm2.S(nx5Var3.a(), yec.a((Context) p65Var23.j(sn3Var3)), p65Var23), null, null, null, null, null, null, p65Var23, 0, 0, 32752);
                            } else {
                                p65Var23.S();
                            }
                            return c1e.a;
                        }
                    }, p65Var22), p65Var22, 56);
                    z2 = false;
                } else {
                    z2 = false;
                    p65Var22.Y(87579218);
                }
                p65Var22.p(z2);
                p65Var22.p(true);
                return c1eVar;
            case 27:
                ((Integer) obj2).getClass();
                rv8.p((lid) obj3, (x12) obj, tr7.y(1));
                return c1eVar;
            case 28:
                CreateCatalogBottomSheetDialogFragment createCatalogBottomSheetDialogFragment = (CreateCatalogBottomSheetDialogFragment) obj3;
                x12 x12Var23 = (x12) obj;
                int iIntValue23 = ((Integer) obj2).intValue();
                p65 p65Var23 = (p65) x12Var23;
                if (p65Var23.P(iIntValue23 & 1, (iIntValue23 & 3) != 2)) {
                    wue wueVarA2 = e67.a(p65Var23);
                    if (wueVarA2 == null) {
                        ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                        return null;
                    }
                    jt7.a(false, pxf.E(784009653, new ag1((we2) to7.z(n1b.a.b(we2.class), wueVarA2, null, wueVarA2 instanceof pi5 ? ((pi5) wueVarA2).getDefaultViewModelCreationExtras() : og2.b, p65Var23), i2, createCatalogBottomSheetDialogFragment), p65Var23), p65Var23, 48, 1);
                } else {
                    p65Var23.S();
                }
                return c1eVar;
            default:
                jl2 jl2Var = (jl2) obj3;
                x12 x12Var24 = (x12) obj;
                int iIntValue24 = ((Integer) obj2).intValue();
                p65 p65Var24 = (p65) x12Var24;
                if (p65Var24.P(iIntValue24 & 1, (iIntValue24 & 3) != 2)) {
                    u36.d(jl2Var, null, p65Var24, 0);
                } else {
                    p65Var24.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ k6c(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
