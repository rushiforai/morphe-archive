package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellPromoId;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.graphql.fragment.PostMetaData;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rw9 extends p4d implements e55 {
    public /* synthetic */ tu9 b;
    public /* synthetic */ ztd c;
    public /* synthetic */ Boolean d;
    public /* synthetic */ zv7 e;
    public final /* synthetic */ sw9 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rw9(sw9 sw9Var, n92 n92Var) {
        super(5, n92Var);
        this.f = sw9Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        String str;
        Object objA = this.b;
        ztd ztdVar = this.c;
        Boolean bool = this.d;
        zv7 zv7Var = this.e;
        br7.v(obj);
        if (!(objA instanceof qu9) && !(objA instanceof ru9)) {
            if (!(objA instanceof su9)) {
                ygf.a();
                return null;
            }
            if (ztdVar instanceof ytd) {
                su9 su9Var = (su9) objA;
                ytd ytdVar = (ytd) ztdVar;
                objA = su9.a(su9Var, null, mq9.a(su9Var.f, ytdVar.d && ytdVar.a.a.equals(su9Var.a.getPostMetaData().getId()), 0, false, null, null, null, null, 524271), iv0.a(su9Var.g, null, null, 191), 159);
            } else {
                if (!g76.L(ztdVar, xtd.a)) {
                    ygf.a();
                    return null;
                }
                objA = (su9) objA;
            }
        }
        if (objA instanceof su9) {
            su9 su9Var2 = (su9) objA;
            iv0 iv0Var = su9Var2.g;
            zu0 zu0Var = iv0Var.c;
            if (zu0Var instanceof xu0) {
                objA = su9.a(su9Var2, null, null, iv0.a(iv0Var, xu0.c((xu0) zu0Var, g76.L(bool, Boolean.FALSE), null, 6), null, 251), 191);
            }
        }
        if (!(objA instanceof su9)) {
            return objA;
        }
        su9 su9Var3 = (su9) objA;
        List list = su9Var3.c;
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list) {
            if (obj2 instanceof yn8) {
                arrayList.add(obj2);
            }
        }
        yn8 yn8Var = (yn8) bu1.z0(arrayList);
        ArrayList arrayList2 = new ArrayList();
        for (Object obj3 : list) {
            if (!(((que) obj3) instanceof yn8)) {
                arrayList2.add(obj3);
            }
        }
        PostMetaData postMetaData = su9Var3.b;
        UpsellReferrer upsellReferrer = UpsellReferrer.POST;
        UpsellPromoId upsellPromoId = UpsellPromoId.INTRO_OFFER;
        String id = postMetaData.getId();
        PostMetaData.Creator creator = postMetaData.getCreator();
        String id2 = creator != null ? creator.getId() : null;
        PostMetaData.Creator creator2 = postMetaData.getCreator();
        UpsellInfo upsellInfo = new UpsellInfo(upsellReferrer, "post_top_nav_upsell", upsellPromoId, id, id2, creator2 != null ? creator2.getUsername() : null);
        sw9 sw9Var = this.f;
        SourceParameter sourceParameter = sw9Var.E0;
        xn8 xn8Var = (zv7Var == null || ((str = zv7Var.b) == null && zv7Var.f == null && zv7Var.d == null)) ? null : new xn8(str, zv7Var.f, zv7Var.d, zv7Var.c, upsellInfo, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : "post_top_nav_upsell", ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : postMetaData.getId(), ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : upsellPromoId.getValue(), ((-9) & 256) != 0 ? sourceParameter.index : null, ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
        yn8 yn8Var2 = xn8Var == null ? null : new yn8(xn8Var, new cv9(sw9Var));
        if (yn8Var2 == null) {
            return su9.a(su9Var3, arrayList2, null, null, 251);
        }
        if (yn8Var != null) {
            if (!yn8Var.b.equals(yn8Var2.b)) {
                yn8Var = null;
            }
            if (yn8Var != null) {
                yn8Var2 = yn8Var;
            }
        }
        return su9.a(su9Var3, bu1.Q0(arrayList2, d46.R(yn8Var2, new ni3(new mi3(8.0f, a0.x, 9)))), null, null, 251);
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        rw9 rw9Var = new rw9(this.f, (n92) obj5);
        rw9Var.b = (tu9) obj;
        rw9Var.c = (ztd) obj2;
        rw9Var.d = (Boolean) obj3;
        rw9Var.e = (zv7) obj4;
        return rw9Var.invokeSuspend(c1e.a);
    }
}
