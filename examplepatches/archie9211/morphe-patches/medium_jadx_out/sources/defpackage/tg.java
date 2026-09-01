package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.CatalogPreviewData;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.NotificationData;
import com.medium.android.graphql.fragment.NotificationDetail;
import com.medium.android.graphql.fragment.PostPreviewData;
import com.medium.android.graphql.fragment.TagData;
import com.medium.android.upvoters.ui.d;
import gen.model.SourceParameter;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class tg extends p4d implements c55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tg(Object obj, Object obj2, n92 n92Var, int i) {
        super(3, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }

    private final Object i(Object obj) {
        int i = this.c;
        PostPreviewData postPreviewData = (PostPreviewData) this.d;
        br7.v(obj);
        pka pkaVar = (pka) this.e;
        fr9 fr9Var = pkaVar.h;
        String str = pkaVar.c;
        SourceParameter sourceParameter = pkaVar.p;
        return fr9.a(fr9Var, postPreviewData, new g08(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), str, pkaVar.o), null, false, false, null, false, null, null, null, -16388);
    }

    private final Object n(Object obj) {
        int i = this.c;
        PostPreviewData postPreviewData = (PostPreviewData) this.d;
        br7.v(obj);
        nua nuaVar = (nua) this.e;
        fr9 fr9Var = nuaVar.d;
        String str = nuaVar.b;
        SourceParameter sourceParameter = nuaVar.j;
        return fr9.a(fr9Var, postPreviewData, new g08(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), str, nuaVar.i), null, false, false, null, false, null, null, null, -1343620);
    }

    private final Object o(Object obj) {
        int i = this.c;
        PostPreviewData postPreviewData = (PostPreviewData) this.d;
        br7.v(obj);
        odd oddVar = (odd) this.e;
        fr9 fr9Var = oddVar.x;
        String str = oddVar.c;
        SourceParameter sourceParameterF = oddVar.f();
        return fr9.a(fr9Var, postPreviewData, new g08(sourceParameterF.copy(((-9) & 1) != 0 ? sourceParameterF.name : null, ((-9) & 2) != 0 ? sourceParameterF.user_id : null, ((-9) & 4) != 0 ? sourceParameterF.timestamp : null, ((-9) & 8) != 0 ? sourceParameterF.dimension : "latest_stories", ((-9) & 16) != 0 ? sourceParameterF.collection_id : null, ((-9) & 32) != 0 ? sourceParameterF.post_id : null, ((-9) & 64) != 0 ? sourceParameterF.tag_slug : null, ((-9) & 128) != 0 ? sourceParameterF.promo_id : null, ((-9) & 256) != 0 ? sourceParameterF.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameterF.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameterF.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameterF.author_id : null, ((-9) & 8192) != 0 ? sourceParameterF.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameterF.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameterF.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameterF.rss_type : null, ((-9) & 131072) != 0 ? sourceParameterF.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameterF.post_source : null, ((-9) & 524288) != 0 ? sourceParameterF.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameterF.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameterF.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameterF.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameterF.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameterF.section_type : null, ((-9) & 33554432) != 0 ? sourceParameterF.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameterF.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameterF.email_id : null, ((-9) & 268435456) != 0 ? sourceParameterF.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameterF.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameterF.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameterF.notification_type : null, (8191 & 1) != 0 ? sourceParameterF.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameterF.local_date_sent : null, (8191 & 4) != 0 ? sourceParameterF.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameterF.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameterF.email_location : null, (8191 & 32) != 0 ? sourceParameterF.book_id : null, (8191 & 64) != 0 ? sourceParameterF.edition_id : null, (8191 & 128) != 0 ? sourceParameterF.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameterF.collection_section_id : null, (8191 & 512) != 0 ? sourceParameterF.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameterF.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.item_type : null, (8191 & 4096) != 0 ? sourceParameterF.unknownFields() : null), str, oddVar.P), null, false, false, null, false, null, null, null, -132);
    }

    private final Object r(Object obj) {
        int i = this.c;
        TagData tagData = (TagData) this.d;
        br7.v(obj);
        efd efdVar = (efd) this.e;
        nec necVar = efdVar.e;
        zbd zbdVar = zbd.FOLLOW;
        SourceParameter sourceParameter = efdVar.o;
        return necVar.g(tagData, zbdVar, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }

    private final Object u(Object obj) {
        int i = this.c;
        CreatorPreviewData creatorPreviewData = (CreatorPreviewData) this.d;
        br7.v(obj);
        d dVar = (d) this.e;
        kne kneVar = dVar.g;
        ine ineVar = ine.FOLLOW;
        SourceParameter sourceParameter = dVar.l;
        return kneVar.a(creatorPreviewData, ineVar, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }

    private final Object v(Object obj) {
        int i = this.c;
        CreatorPreviewData creatorPreviewData = (CreatorPreviewData) this.d;
        br7.v(obj);
        ooe ooeVar = (ooe) this.e;
        kne kneVar = ooeVar.e;
        ine ineVar = ine.FOLLOW;
        SourceParameter sourceParameter = ooeVar.p;
        return kneVar.a(creatorPreviewData, ineVar, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.e;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj).intValue();
                tg tgVar = new tg(0, (n92) obj3, (ug) obj4);
                tgVar.c = iIntValue;
                tgVar.d = (CollectionPreviewData) obj2;
                return tgVar.invokeSuspend(c1eVar);
            case 1:
                int iIntValue2 = ((Number) obj).intValue();
                tg tgVar2 = new tg(1, (n92) obj3, (gh) obj4);
                tgVar2.c = iIntValue2;
                tgVar2.d = (CreatorPreviewData) obj2;
                return tgVar2.invokeSuspend(c1eVar);
            case 2:
                int iIntValue3 = ((Number) obj).intValue();
                tg tgVar3 = new tg(2, (n92) obj3, (bi) obj4);
                tgVar3.c = iIntValue3;
                tgVar3.d = (CreatorPreviewData) obj2;
                return tgVar3.invokeSuspend(c1eVar);
            case 3:
                int iIntValue4 = ((Number) obj).intValue();
                tg tgVar4 = new tg(3, (n92) obj3, (si) obj4);
                tgVar4.c = iIntValue4;
                tgVar4.d = (CollectionPreviewData) obj2;
                return tgVar4.invokeSuspend(c1eVar);
            case 4:
                int iIntValue5 = ((Number) obj).intValue();
                tg tgVar5 = new tg(4, (n92) obj3, (ej) obj4);
                tgVar5.c = iIntValue5;
                tgVar5.d = (TagData) obj2;
                return tgVar5.invokeSuspend(c1eVar);
            case 5:
                int iIntValue6 = ((Number) obj).intValue();
                tg tgVar6 = new tg(5, (n92) obj3, (rj) obj4);
                tgVar6.c = iIntValue6;
                tgVar6.d = (CreatorPreviewData) obj2;
                return tgVar6.invokeSuspend(c1eVar);
            case 6:
                return new tg((rl) this.d, (ku2) obj4, (n92) obj3, 6).invokeSuspend(c1eVar);
            case 7:
                return new tg((rl) this.d, (ku2) obj4, (n92) obj3, 7).invokeSuspend(c1eVar);
            case 8:
                int iIntValue7 = ((Number) obj).intValue();
                tg tgVar7 = new tg(8, (n92) obj3, (mj1) obj4);
                tgVar7.c = iIntValue7;
                tgVar7.d = (CatalogPreviewData) obj2;
                return tgVar7.invokeSuspend(c1eVar);
            case 9:
                int iIntValue8 = ((Number) obj).intValue();
                tg tgVar8 = new tg(9, (n92) obj3, (ru1) obj4);
                tgVar8.c = iIntValue8;
                tgVar8.d = (CollectionPreviewData) obj2;
                return tgVar8.invokeSuspend(c1eVar);
            case 10:
                int iIntValue9 = ((Number) obj).intValue();
                tg tgVar9 = new tg(10, (n92) obj3, (f74) obj4);
                tgVar9.c = iIntValue9;
                tgVar9.d = (CreatorPreviewData) obj2;
                return tgVar9.invokeSuspend(c1eVar);
            case 11:
                int iIntValue10 = ((Number) obj).intValue();
                tg tgVar10 = new tg(11, (n92) obj3, (ap5) obj4);
                tgVar10.c = iIntValue10;
                tgVar10.d = (PostPreviewData) obj2;
                return tgVar10.invokeSuspend(c1eVar);
            case 12:
                int iIntValue11 = ((Number) obj).intValue();
                tg tgVar11 = new tg(12, (n92) obj3, (nl8) obj4);
                tgVar11.c = iIntValue11;
                tgVar11.d = (NotificationDetail) obj2;
                return tgVar11.invokeSuspend(c1eVar);
            case 13:
                int iIntValue12 = ((Number) obj).intValue();
                tg tgVar12 = new tg(13, (n92) obj3, (qx9) obj4);
                tgVar12.c = iIntValue12;
                tgVar12.d = (PostPreviewData) obj2;
                return tgVar12.invokeSuspend(c1eVar);
            case 14:
                int iIntValue13 = ((Number) obj).intValue();
                tg tgVar13 = new tg(14, (n92) obj3, (lca) obj4);
                tgVar13.c = iIntValue13;
                tgVar13.d = (PostPreviewData) obj2;
                return tgVar13.invokeSuspend(c1eVar);
            case 15:
                int iIntValue14 = ((Number) obj).intValue();
                tg tgVar14 = new tg(15, (n92) obj3, (pka) obj4);
                tgVar14.c = iIntValue14;
                tgVar14.d = (PostPreviewData) obj2;
                return tgVar14.invokeSuspend(c1eVar);
            case 16:
                int iIntValue15 = ((Number) obj).intValue();
                tg tgVar15 = new tg(16, (n92) obj3, (nua) obj4);
                tgVar15.c = iIntValue15;
                tgVar15.d = (PostPreviewData) obj2;
                return tgVar15.invokeSuspend(c1eVar);
            case 17:
                int iIntValue16 = ((Number) obj).intValue();
                tg tgVar16 = new tg(17, (n92) obj3, (odd) obj4);
                tgVar16.c = iIntValue16;
                tgVar16.d = (PostPreviewData) obj2;
                return tgVar16.invokeSuspend(c1eVar);
            case 18:
                int iIntValue17 = ((Number) obj).intValue();
                tg tgVar17 = new tg(18, (n92) obj3, (efd) obj4);
                tgVar17.c = iIntValue17;
                tgVar17.d = (TagData) obj2;
                return tgVar17.invokeSuspend(c1eVar);
            case 19:
                int iIntValue18 = ((Number) obj).intValue();
                tg tgVar18 = new tg(19, (n92) obj3, (d) obj4);
                tgVar18.c = iIntValue18;
                tgVar18.d = (CreatorPreviewData) obj2;
                return tgVar18.invokeSuspend(c1eVar);
            case 20:
                int iIntValue19 = ((Number) obj).intValue();
                tg tgVar19 = new tg(20, (n92) obj3, (ooe) obj4);
                tgVar19.c = iIntValue19;
                tgVar19.d = (CreatorPreviewData) obj2;
                return tgVar19.invokeSuspend(c1eVar);
            default:
                return new tg((t1f) this.d, (h00) obj4, (n92) obj3, 21).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        xi8 xi8Var;
        String notificationType;
        xi8 xi8VarC;
        NotificationData.Actor actorA;
        NotificationData.Post post;
        String title;
        NotificationData.Actor actorA2;
        NotificationData.Actor actorA3;
        NotificationData.Post post2;
        String title2;
        NotificationData.Actor actorA4;
        NotificationData.Post post3;
        String title3;
        NotificationData.Actor actorA5;
        NotificationData.Post post4;
        String title4;
        NotificationData.Actor actorA6;
        NotificationData.Post post5;
        String title5;
        NotificationData.Actor actorA7;
        NotificationData.Catalog catalog;
        NotificationData.Actor actorA8;
        NotificationData.Catalog catalog2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                int i2 = this.c;
                CollectionPreviewData collectionPreviewData = (CollectionPreviewData) this.d;
                br7.v(obj);
                ug ugVar = (ug) obj2;
                ot1 ot1Var = ugVar.d;
                mt1 mt1Var = mt1.MUTE;
                SourceParameter sourceParameter = ugVar.k;
                return ot1Var.a(collectionPreviewData, mt1Var, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i2), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), false);
            case 1:
                int i3 = this.c;
                CreatorPreviewData creatorPreviewData = (CreatorPreviewData) this.d;
                br7.v(obj);
                gh ghVar = (gh) obj2;
                kne kneVar = ghVar.d;
                ine ineVar = ine.MUTE;
                SourceParameter sourceParameter2 = ghVar.k;
                return kneVar.a(creatorPreviewData, ineVar, sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : null, ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : new Integer(i3), ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : null, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null));
            case 2:
                int i4 = this.c;
                CreatorPreviewData creatorPreviewData2 = (CreatorPreviewData) this.d;
                br7.v(obj);
                bi biVar = (bi) obj2;
                kne kneVar2 = biVar.d;
                ine ineVar2 = ine.FOLLOW;
                SourceParameter sourceParameter3 = biVar.j;
                return kneVar2.a(creatorPreviewData2, ineVar2, sourceParameter3.copy(((-9) & 1) != 0 ? sourceParameter3.name : null, ((-9) & 2) != 0 ? sourceParameter3.user_id : null, ((-9) & 4) != 0 ? sourceParameter3.timestamp : null, ((-9) & 8) != 0 ? sourceParameter3.dimension : null, ((-9) & 16) != 0 ? sourceParameter3.collection_id : null, ((-9) & 32) != 0 ? sourceParameter3.post_id : null, ((-9) & 64) != 0 ? sourceParameter3.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter3.promo_id : null, ((-9) & 256) != 0 ? sourceParameter3.index : new Integer(i4), ((-9) & 512) != 0 ? sourceParameter3.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter3.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter3.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter3.author_id : null, ((-9) & 8192) != 0 ? sourceParameter3.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter3.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter3.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter3.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter3.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter3.post_source : null, ((-9) & 524288) != 0 ? sourceParameter3.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter3.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter3.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter3.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter3.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter3.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter3.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter3.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter3.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter3.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter3.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter3.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter3.notification_type : null, (8191 & 1) != 0 ? sourceParameter3.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter3.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter3.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter3.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter3.email_location : null, (8191 & 32) != 0 ? sourceParameter3.book_id : null, (8191 & 64) != 0 ? sourceParameter3.edition_id : null, (8191 & 128) != 0 ? sourceParameter3.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter3.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter3.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter3.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter3.item_type : null, (8191 & 4096) != 0 ? sourceParameter3.unknownFields() : null));
            case 3:
                int i5 = this.c;
                CollectionPreviewData collectionPreviewData2 = (CollectionPreviewData) this.d;
                br7.v(obj);
                si siVar = (si) obj2;
                ot1 ot1Var2 = siVar.d;
                mt1 mt1Var2 = mt1.FOLLOW;
                SourceParameter sourceParameter4 = siVar.i;
                return ot1Var2.a(collectionPreviewData2, mt1Var2, sourceParameter4.copy(((-9) & 1) != 0 ? sourceParameter4.name : null, ((-9) & 2) != 0 ? sourceParameter4.user_id : null, ((-9) & 4) != 0 ? sourceParameter4.timestamp : null, ((-9) & 8) != 0 ? sourceParameter4.dimension : null, ((-9) & 16) != 0 ? sourceParameter4.collection_id : null, ((-9) & 32) != 0 ? sourceParameter4.post_id : null, ((-9) & 64) != 0 ? sourceParameter4.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter4.promo_id : null, ((-9) & 256) != 0 ? sourceParameter4.index : new Integer(i5), ((-9) & 512) != 0 ? sourceParameter4.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter4.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter4.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter4.author_id : null, ((-9) & 8192) != 0 ? sourceParameter4.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter4.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter4.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter4.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter4.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter4.post_source : null, ((-9) & 524288) != 0 ? sourceParameter4.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter4.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter4.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter4.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter4.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter4.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter4.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter4.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter4.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter4.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter4.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter4.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter4.notification_type : null, (8191 & 1) != 0 ? sourceParameter4.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter4.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter4.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter4.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter4.email_location : null, (8191 & 32) != 0 ? sourceParameter4.book_id : null, (8191 & 64) != 0 ? sourceParameter4.edition_id : null, (8191 & 128) != 0 ? sourceParameter4.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter4.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter4.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter4.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter4.item_type : null, (8191 & 4096) != 0 ? sourceParameter4.unknownFields() : null), false);
            case 4:
                int i6 = this.c;
                TagData tagData = (TagData) this.d;
                br7.v(obj);
                ej ejVar = (ej) obj2;
                nec necVar = ejVar.d;
                zbd zbdVar = zbd.FOLLOW;
                SourceParameter sourceParameter5 = ejVar.k;
                return necVar.g(tagData, zbdVar, sourceParameter5.copy(((-9) & 1) != 0 ? sourceParameter5.name : null, ((-9) & 2) != 0 ? sourceParameter5.user_id : null, ((-9) & 4) != 0 ? sourceParameter5.timestamp : null, ((-9) & 8) != 0 ? sourceParameter5.dimension : null, ((-9) & 16) != 0 ? sourceParameter5.collection_id : null, ((-9) & 32) != 0 ? sourceParameter5.post_id : null, ((-9) & 64) != 0 ? sourceParameter5.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter5.promo_id : null, ((-9) & 256) != 0 ? sourceParameter5.index : new Integer(i6), ((-9) & 512) != 0 ? sourceParameter5.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter5.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter5.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter5.author_id : null, ((-9) & 8192) != 0 ? sourceParameter5.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter5.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter5.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter5.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter5.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter5.post_source : null, ((-9) & 524288) != 0 ? sourceParameter5.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter5.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter5.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter5.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter5.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter5.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter5.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter5.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter5.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter5.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter5.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter5.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter5.notification_type : null, (8191 & 1) != 0 ? sourceParameter5.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter5.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter5.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter5.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter5.email_location : null, (8191 & 32) != 0 ? sourceParameter5.book_id : null, (8191 & 64) != 0 ? sourceParameter5.edition_id : null, (8191 & 128) != 0 ? sourceParameter5.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter5.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter5.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter5.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter5.item_type : null, (8191 & 4096) != 0 ? sourceParameter5.unknownFields() : null));
            case 5:
                int i7 = this.c;
                CreatorPreviewData creatorPreviewData3 = (CreatorPreviewData) this.d;
                br7.v(obj);
                rj rjVar = (rj) obj2;
                kne kneVar3 = rjVar.d;
                ine ineVar3 = ine.FOLLOW;
                SourceParameter sourceParameter6 = rjVar.j;
                return kneVar3.a(creatorPreviewData3, ineVar3, sourceParameter6.copy(((-9) & 1) != 0 ? sourceParameter6.name : null, ((-9) & 2) != 0 ? sourceParameter6.user_id : null, ((-9) & 4) != 0 ? sourceParameter6.timestamp : null, ((-9) & 8) != 0 ? sourceParameter6.dimension : null, ((-9) & 16) != 0 ? sourceParameter6.collection_id : null, ((-9) & 32) != 0 ? sourceParameter6.post_id : null, ((-9) & 64) != 0 ? sourceParameter6.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter6.promo_id : null, ((-9) & 256) != 0 ? sourceParameter6.index : new Integer(i7), ((-9) & 512) != 0 ? sourceParameter6.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter6.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter6.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter6.author_id : null, ((-9) & 8192) != 0 ? sourceParameter6.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter6.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter6.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter6.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter6.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter6.post_source : null, ((-9) & 524288) != 0 ? sourceParameter6.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter6.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter6.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter6.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter6.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter6.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter6.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter6.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter6.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter6.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter6.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter6.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter6.notification_type : null, (8191 & 1) != 0 ? sourceParameter6.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter6.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter6.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter6.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter6.email_location : null, (8191 & 32) != 0 ? sourceParameter6.book_id : null, (8191 & 64) != 0 ? sourceParameter6.edition_id : null, (8191 & 128) != 0 ? sourceParameter6.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter6.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter6.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter6.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter6.item_type : null, (8191 & 4096) != 0 ? sourceParameter6.unknownFields() : null));
            case 6:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    ql qlVar = ((rl) this.d).b;
                    this.c = 1;
                    return ((ku2) obj2).invoke(qlVar, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i8 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 7:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    ql qlVar2 = ((rl) this.d).b;
                    this.c = 1;
                    return ((ku2) obj2).invoke(qlVar2, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i9 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 8:
                int i10 = this.c;
                CatalogPreviewData catalogPreviewData = (CatalogPreviewData) this.d;
                br7.v(obj);
                mj1 mj1Var = (mj1) obj2;
                tg1 tg1Var = mj1Var.e;
                SourceParameter sourceParameter7 = mj1Var.o;
                return tg1Var.a(gp7.u(sourceParameter7.copy(((-9) & 1) != 0 ? sourceParameter7.name : null, ((-9) & 2) != 0 ? sourceParameter7.user_id : null, ((-9) & 4) != 0 ? sourceParameter7.timestamp : null, ((-9) & 8) != 0 ? sourceParameter7.dimension : null, ((-9) & 16) != 0 ? sourceParameter7.collection_id : null, ((-9) & 32) != 0 ? sourceParameter7.post_id : null, ((-9) & 64) != 0 ? sourceParameter7.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter7.promo_id : null, ((-9) & 256) != 0 ? sourceParameter7.index : new Integer(i10), ((-9) & 512) != 0 ? sourceParameter7.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter7.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter7.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter7.author_id : null, ((-9) & 8192) != 0 ? sourceParameter7.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter7.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter7.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter7.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter7.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter7.post_source : null, ((-9) & 524288) != 0 ? sourceParameter7.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter7.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter7.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter7.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter7.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter7.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter7.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter7.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter7.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter7.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter7.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter7.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter7.notification_type : null, (8191 & 1) != 0 ? sourceParameter7.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter7.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter7.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter7.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter7.email_location : null, (8191 & 32) != 0 ? sourceParameter7.book_id : null, (8191 & 64) != 0 ? sourceParameter7.edition_id : null, (8191 & 128) != 0 ? sourceParameter7.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter7.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter7.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter7.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter7.item_type : null, (8191 & 4096) != 0 ? sourceParameter7.unknownFields() : null)), catalogPreviewData);
            case 9:
                int i11 = this.c;
                CollectionPreviewData collectionPreviewData3 = (CollectionPreviewData) this.d;
                br7.v(obj);
                ru1 ru1Var = (ru1) obj2;
                ot1 ot1Var3 = ru1Var.e;
                mt1 mt1Var3 = mt1.FOLLOW;
                SourceParameter sourceParameter8 = ru1Var.o;
                return ot1Var3.a(collectionPreviewData3, mt1Var3, sourceParameter8.copy(((-9) & 1) != 0 ? sourceParameter8.name : null, ((-9) & 2) != 0 ? sourceParameter8.user_id : null, ((-9) & 4) != 0 ? sourceParameter8.timestamp : null, ((-9) & 8) != 0 ? sourceParameter8.dimension : null, ((-9) & 16) != 0 ? sourceParameter8.collection_id : null, ((-9) & 32) != 0 ? sourceParameter8.post_id : null, ((-9) & 64) != 0 ? sourceParameter8.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter8.promo_id : null, ((-9) & 256) != 0 ? sourceParameter8.index : new Integer(i11), ((-9) & 512) != 0 ? sourceParameter8.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter8.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter8.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter8.author_id : null, ((-9) & 8192) != 0 ? sourceParameter8.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter8.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter8.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter8.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter8.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter8.post_source : null, ((-9) & 524288) != 0 ? sourceParameter8.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter8.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter8.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter8.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter8.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter8.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter8.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter8.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter8.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter8.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter8.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter8.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter8.notification_type : null, (8191 & 1) != 0 ? sourceParameter8.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter8.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter8.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter8.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter8.email_location : null, (8191 & 32) != 0 ? sourceParameter8.book_id : null, (8191 & 64) != 0 ? sourceParameter8.edition_id : null, (8191 & 128) != 0 ? sourceParameter8.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter8.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter8.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter8.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter8.item_type : null, (8191 & 4096) != 0 ? sourceParameter8.unknownFields() : null), false);
            case 10:
                int i12 = this.c;
                CreatorPreviewData creatorPreviewData4 = (CreatorPreviewData) this.d;
                br7.v(obj);
                f74 f74Var = (f74) obj2;
                kne kneVar4 = f74Var.j;
                ine ineVar4 = ine.FOLLOW;
                SourceParameter sourceParameter9 = f74Var.p;
                return kneVar4.a(creatorPreviewData4, ineVar4, sourceParameter9.copy(((-9) & 1) != 0 ? sourceParameter9.name : null, ((-9) & 2) != 0 ? sourceParameter9.user_id : null, ((-9) & 4) != 0 ? sourceParameter9.timestamp : null, ((-9) & 8) != 0 ? sourceParameter9.dimension : "friends_to_follow", ((-9) & 16) != 0 ? sourceParameter9.collection_id : null, ((-9) & 32) != 0 ? sourceParameter9.post_id : null, ((-9) & 64) != 0 ? sourceParameter9.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter9.promo_id : null, ((-9) & 256) != 0 ? sourceParameter9.index : new Integer(i12), ((-9) & 512) != 0 ? sourceParameter9.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter9.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter9.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter9.author_id : null, ((-9) & 8192) != 0 ? sourceParameter9.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter9.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter9.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter9.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter9.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter9.post_source : null, ((-9) & 524288) != 0 ? sourceParameter9.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter9.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter9.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter9.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter9.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter9.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter9.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter9.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter9.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter9.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter9.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter9.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter9.notification_type : null, (8191 & 1) != 0 ? sourceParameter9.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter9.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter9.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter9.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter9.email_location : null, (8191 & 32) != 0 ? sourceParameter9.book_id : null, (8191 & 64) != 0 ? sourceParameter9.edition_id : null, (8191 & 128) != 0 ? sourceParameter9.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter9.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter9.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter9.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter9.item_type : null, (8191 & 4096) != 0 ? sourceParameter9.unknownFields() : null));
            case 11:
                int i13 = this.c;
                PostPreviewData postPreviewData = (PostPreviewData) this.d;
                br7.v(obj);
                ap5 ap5Var = (ap5) obj2;
                fr9 fr9Var = ap5Var.g;
                String str = ap5Var.b;
                SourceParameter sourceParameter10 = ap5Var.p;
                return fr9.a(fr9Var, postPreviewData, new g08(sourceParameter10.copy(((-9) & 1) != 0 ? sourceParameter10.name : null, ((-9) & 2) != 0 ? sourceParameter10.user_id : null, ((-9) & 4) != 0 ? sourceParameter10.timestamp : null, ((-9) & 8) != 0 ? sourceParameter10.dimension : null, ((-9) & 16) != 0 ? sourceParameter10.collection_id : null, ((-9) & 32) != 0 ? sourceParameter10.post_id : null, ((-9) & 64) != 0 ? sourceParameter10.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter10.promo_id : null, ((-9) & 256) != 0 ? sourceParameter10.index : new Integer(i13), ((-9) & 512) != 0 ? sourceParameter10.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter10.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter10.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter10.author_id : null, ((-9) & 8192) != 0 ? sourceParameter10.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter10.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter10.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter10.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter10.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter10.post_source : null, ((-9) & 524288) != 0 ? sourceParameter10.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter10.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter10.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter10.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter10.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter10.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter10.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter10.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter10.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter10.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter10.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter10.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter10.notification_type : null, (8191 & 1) != 0 ? sourceParameter10.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter10.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter10.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter10.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter10.email_location : null, (8191 & 32) != 0 ? sourceParameter10.book_id : null, (8191 & 64) != 0 ? sourceParameter10.edition_id : null, (8191 & 128) != 0 ? sourceParameter10.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter10.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter10.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter10.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter10.item_type : null, (8191 & 4096) != 0 ? sourceParameter10.unknownFields() : null), str, ap5Var.o), null, false, false, null, false, null, null, null, -132);
            case 12:
                int i14 = this.c;
                NotificationDetail notificationDetail = (NotificationDetail) this.d;
                br7.v(obj);
                SourceParameter sourceParameter11 = ((nl8) obj2).i;
                SourceParameter sourceParameterCopy = sourceParameter11.copy(((-9) & 1) != 0 ? sourceParameter11.name : null, ((-9) & 2) != 0 ? sourceParameter11.user_id : null, ((-9) & 4) != 0 ? sourceParameter11.timestamp : null, ((-9) & 8) != 0 ? sourceParameter11.dimension : null, ((-9) & 16) != 0 ? sourceParameter11.collection_id : null, ((-9) & 32) != 0 ? sourceParameter11.post_id : null, ((-9) & 64) != 0 ? sourceParameter11.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter11.promo_id : null, ((-9) & 256) != 0 ? sourceParameter11.index : new Integer(i14), ((-9) & 512) != 0 ? sourceParameter11.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter11.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter11.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter11.author_id : null, ((-9) & 8192) != 0 ? sourceParameter11.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter11.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter11.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter11.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter11.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter11.post_source : null, ((-9) & 524288) != 0 ? sourceParameter11.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter11.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter11.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter11.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter11.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter11.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter11.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter11.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter11.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter11.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter11.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter11.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter11.notification_type : null, (8191 & 1) != 0 ? sourceParameter11.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter11.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter11.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter11.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter11.email_location : null, (8191 & 32) != 0 ? sourceParameter11.book_id : null, (8191 & 64) != 0 ? sourceParameter11.edition_id : null, (8191 & 128) != 0 ? sourceParameter11.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter11.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter11.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter11.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter11.item_type : null, (8191 & 4096) != 0 ? sourceParameter11.unknownFields() : null);
                notificationDetail.getClass();
                NotificationData notificationData = notificationDetail.getNotificationData();
                try {
                    notificationType = notificationData.getNotificationType();
                } catch (Exception e) {
                    wld.a.l(e);
                }
                if (g76.L(notificationType, wj8.CATALOG_RECOMMENDED_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB = dj8.b(notificationDetail);
                    if (arrayListB != null && (actorA8 = dj8.a(arrayListB)) != null && (catalog2 = notificationData.getCatalog()) != null) {
                        boolean zIsUnread = notificationData.isUnread();
                        long occurredAt = notificationData.getOccurredAt();
                        String strD = dj8.d(actorA8);
                        String notificationName = notificationData.getNotificationName();
                        String id = actorA8.getId();
                        String imageId = actorA8.getImageId();
                        xi8VarC = new tf1(arrayListB.size(), occurredAt, df1.a(catalog2), sourceParameterCopy, notificationName, imageId != null ? imageId : null, id, strD, zIsUnread);
                        xi8Var = xi8VarC;
                    }
                    xi8Var = null;
                } else if (g76.L(notificationType, wj8.CATALOG_RESPONSE_CREATED_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB2 = dj8.b(notificationDetail);
                    if (arrayListB2 == null || (actorA7 = dj8.a(arrayListB2)) == null || (catalog = notificationData.getCatalog()) == null) {
                        xi8Var = null;
                    } else {
                        boolean zIsUnread2 = notificationData.isUnread();
                        long occurredAt2 = notificationData.getOccurredAt();
                        String strD2 = dj8.d(actorA7);
                        String notificationName2 = notificationData.getNotificationName();
                        String id2 = actorA7.getId();
                        String imageId2 = actorA7.getImageId();
                        xi8VarC = new cg1(arrayListB2.size(), occurredAt2, df1.a(catalog), sourceParameterCopy, notificationName2, imageId2 != null ? imageId2 : null, id2, strD2, zIsUnread2);
                        xi8Var = xi8VarC;
                    }
                } else if (g76.L(notificationType, wj8.POST_RECOMMENDED_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB3 = dj8.b(notificationDetail);
                    if (arrayListB3 != null && (actorA6 = dj8.a(arrayListB3)) != null && (post5 = notificationData.getPost()) != null && (title5 = post5.getTitle()) != null) {
                        String str2 = !muc.b0(title5) ? title5 : null;
                        if (str2 != null) {
                            boolean zIsUnread3 = notificationData.isUnread();
                            long occurredAt3 = notificationData.getOccurredAt();
                            String strD3 = dj8.d(actorA6);
                            String notificationName3 = notificationData.getNotificationName();
                            String id3 = actorA6.getId();
                            String imageId3 = actorA6.getImageId();
                            xi8VarC = new ql9(zIsUnread3, occurredAt3, notificationName3, imageId3 != null ? imageId3 : null, id3, strD3, arrayListB3.size(), str2, sourceParameterCopy);
                            xi8Var = xi8VarC;
                        }
                    }
                    xi8Var = null;
                } else if (g76.L(notificationType, wj8.POST_REPOSTED_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB4 = dj8.b(notificationDetail);
                    if (arrayListB4 != null && (actorA5 = dj8.a(arrayListB4)) != null && (post4 = notificationData.getPost()) != null && (title4 = post4.getTitle()) != null) {
                        String str3 = !muc.b0(title4) ? title4 : null;
                        if (str3 != null) {
                            boolean zIsUnread4 = notificationData.isUnread();
                            long occurredAt4 = notificationData.getOccurredAt();
                            String strD4 = dj8.d(actorA5);
                            String notificationName4 = notificationData.getNotificationName();
                            String id4 = actorA5.getId();
                            String imageId4 = actorA5.getImageId();
                            xi8VarC = new on9(zIsUnread4, occurredAt4, notificationName4, imageId4 != null ? imageId4 : null, id4, strD4, arrayListB4.size(), str3, sourceParameterCopy);
                            xi8Var = xi8VarC;
                        }
                    }
                    xi8Var = null;
                } else if (g76.L(notificationType, wj8.QUOTE_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB5 = dj8.b(notificationDetail);
                    if (arrayListB5 != null && (actorA4 = dj8.a(arrayListB5)) != null && (post3 = notificationData.getPost()) != null && (title3 = post3.getTitle()) != null) {
                        String str4 = !muc.b0(title3) ? title3 : null;
                        if (str4 != null) {
                            boolean zIsUnread5 = notificationData.isUnread();
                            long occurredAt5 = notificationData.getOccurredAt();
                            String strD5 = dj8.d(actorA4);
                            String notificationName5 = notificationData.getNotificationName();
                            String id5 = actorA4.getId();
                            String imageId5 = actorA4.getImageId();
                            xi8VarC = new pra(zIsUnread5, occurredAt5, notificationName5, imageId5 != null ? imageId5 : null, id5, strD5, arrayListB5.size(), str4, sourceParameterCopy);
                            xi8Var = xi8VarC;
                        }
                    }
                    xi8Var = null;
                } else if (g76.L(notificationType, wj8.RESPONSE_CREATED_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB6 = dj8.b(notificationDetail);
                    if (arrayListB6 != null && (actorA3 = dj8.a(arrayListB6)) != null && (post2 = notificationData.getPost()) != null && (title2 = post2.getTitle()) != null) {
                        String str5 = !muc.b0(title2) ? title2 : null;
                        if (str5 != null) {
                            boolean zIsUnread6 = notificationData.isUnread();
                            long occurredAt6 = notificationData.getOccurredAt();
                            String strD6 = dj8.d(actorA3);
                            String notificationName6 = notificationData.getNotificationName();
                            String id6 = actorA3.getId();
                            String imageId6 = actorA3.getImageId();
                            xi8VarC = new sdb(zIsUnread6, occurredAt6, notificationName6, imageId6 != null ? imageId6 : null, id6, strD6, arrayListB6.size(), str5, sourceParameterCopy);
                            xi8Var = xi8VarC;
                        }
                    }
                    xi8Var = null;
                } else if (g76.L(notificationType, wj8.USERS_FOLLOWING_YOU_ROLLUP.getIdentifier())) {
                    ArrayList arrayListB7 = dj8.b(notificationDetail);
                    if (arrayListB7 == null || (actorA2 = dj8.a(arrayListB7)) == null) {
                        xi8Var = null;
                    } else {
                        boolean zIsUnread7 = notificationData.isUnread();
                        long occurredAt7 = notificationData.getOccurredAt();
                        String strD7 = dj8.d(actorA2);
                        String notificationName7 = notificationData.getNotificationName();
                        String id7 = actorA2.getId();
                        String imageId7 = actorA2.getImageId();
                        xi8VarC = new zne(arrayListB7.size(), occurredAt7, sourceParameterCopy, notificationName7, imageId7 != null ? imageId7 : null, id7, strD7, zIsUnread7);
                        xi8Var = xi8VarC;
                    }
                } else {
                    if (g76.L(notificationType, wj8.HIGHLIGHT_WAS_PILED_ONTO_ROLLUP.getIdentifier())) {
                        ArrayList arrayListB8 = dj8.b(notificationDetail);
                        if (arrayListB8 != null && (actorA = dj8.a(arrayListB8)) != null && (post = notificationData.getPost()) != null && (title = post.getTitle()) != null) {
                            String str6 = !muc.b0(title) ? title : null;
                            if (str6 != null) {
                                boolean zIsUnread8 = notificationData.isUnread();
                                long occurredAt8 = notificationData.getOccurredAt();
                                String strD8 = dj8.d(actorA);
                                String notificationName8 = notificationData.getNotificationName();
                                String id8 = actorA.getId();
                                String imageId8 = actorA.getImageId();
                                xi8VarC = new ol5(zIsUnread8, occurredAt8, notificationName8, imageId8 != null ? imageId8 : null, id8, strD8, arrayListB8.size(), str6, sourceParameterCopy);
                            }
                        }
                        xi8Var = null;
                    } else {
                        xi8VarC = dj8.c(notificationData, sourceParameterCopy);
                    }
                    xi8Var = xi8VarC;
                }
                if (xi8Var == null) {
                    return null;
                }
                return new xj8(ur7.E(notificationDetail.getNotificationData()), xi8Var);
            case 13:
                int i15 = this.c;
                PostPreviewData postPreviewData2 = (PostPreviewData) this.d;
                br7.v(obj);
                qx9 qx9Var = (qx9) obj2;
                fr9 fr9Var2 = qx9Var.f;
                String str7 = qx9Var.b;
                SourceParameter sourceParameter12 = qx9Var.s;
                return fr9.a(fr9Var2, postPreviewData2, new g08(sourceParameter12.copy(((-9) & 1) != 0 ? sourceParameter12.name : null, ((-9) & 2) != 0 ? sourceParameter12.user_id : null, ((-9) & 4) != 0 ? sourceParameter12.timestamp : null, ((-9) & 8) != 0 ? sourceParameter12.dimension : null, ((-9) & 16) != 0 ? sourceParameter12.collection_id : null, ((-9) & 32) != 0 ? sourceParameter12.post_id : null, ((-9) & 64) != 0 ? sourceParameter12.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter12.promo_id : null, ((-9) & 256) != 0 ? sourceParameter12.index : new Integer(i15), ((-9) & 512) != 0 ? sourceParameter12.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter12.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter12.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter12.author_id : null, ((-9) & 8192) != 0 ? sourceParameter12.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter12.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter12.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter12.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter12.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter12.post_source : null, ((-9) & 524288) != 0 ? sourceParameter12.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter12.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter12.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter12.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter12.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter12.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter12.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter12.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter12.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter12.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter12.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter12.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter12.notification_type : null, (8191 & 1) != 0 ? sourceParameter12.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter12.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter12.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter12.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter12.email_location : null, (8191 & 32) != 0 ? sourceParameter12.book_id : null, (8191 & 64) != 0 ? sourceParameter12.edition_id : null, (8191 & 128) != 0 ? sourceParameter12.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter12.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter12.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter12.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter12.item_type : null, (8191 & 4096) != 0 ? sourceParameter12.unknownFields() : null), str7, qx9Var.r), null, false, false, null, false, null, null, null, -132);
            case 14:
                int i16 = this.c;
                PostPreviewData postPreviewData3 = (PostPreviewData) this.d;
                br7.v(obj);
                lca lcaVar = (lca) obj2;
                fr9 fr9Var3 = lcaVar.i;
                String str8 = lcaVar.d;
                SourceParameter sourceParameterE = lcaVar.e();
                return fr9.a(fr9Var3, postPreviewData3, new g08(sourceParameterE.copy(((-9) & 1) != 0 ? sourceParameterE.name : null, ((-9) & 2) != 0 ? sourceParameterE.user_id : null, ((-9) & 4) != 0 ? sourceParameterE.timestamp : null, ((-9) & 8) != 0 ? sourceParameterE.dimension : null, ((-9) & 16) != 0 ? sourceParameterE.collection_id : null, ((-9) & 32) != 0 ? sourceParameterE.post_id : null, ((-9) & 64) != 0 ? sourceParameterE.tag_slug : null, ((-9) & 128) != 0 ? sourceParameterE.promo_id : null, ((-9) & 256) != 0 ? sourceParameterE.index : new Integer(i16), ((-9) & 512) != 0 ? sourceParameterE.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameterE.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterE.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameterE.author_id : null, ((-9) & 8192) != 0 ? sourceParameterE.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameterE.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameterE.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameterE.rss_type : null, ((-9) & 131072) != 0 ? sourceParameterE.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameterE.post_source : null, ((-9) & 524288) != 0 ? sourceParameterE.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameterE.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameterE.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameterE.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameterE.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameterE.section_type : null, ((-9) & 33554432) != 0 ? sourceParameterE.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameterE.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameterE.email_id : null, ((-9) & 268435456) != 0 ? sourceParameterE.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameterE.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameterE.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameterE.notification_type : null, (8191 & 1) != 0 ? sourceParameterE.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameterE.local_date_sent : null, (8191 & 4) != 0 ? sourceParameterE.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameterE.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameterE.email_location : null, (8191 & 32) != 0 ? sourceParameterE.book_id : null, (8191 & 64) != 0 ? sourceParameterE.edition_id : null, (8191 & 128) != 0 ? sourceParameterE.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameterE.collection_section_id : null, (8191 & 512) != 0 ? sourceParameterE.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameterE.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterE.item_type : null, (8191 & 4096) != 0 ? sourceParameterE.unknownFields() : null), str8, lcaVar.t), null, false, false, null, false, null, null, null, -16388);
            case 15:
                return i(obj);
            case 16:
                return n(obj);
            case 17:
                return o(obj);
            case 18:
                return r(obj);
            case 19:
                return u(obj);
            case 20:
                return v(obj);
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i17 = this.c;
                if (i17 != 0) {
                    if (i17 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                uz0 uz0Var = ((t1f) this.d).g;
                xrc xrcVar = new xrc((h00) obj2);
                this.c = 1;
                return uz0Var.b(this, xrcVar) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ tg(int i, n92 n92Var, que queVar) {
        super(3, n92Var);
        this.b = i;
        this.e = queVar;
    }
}
