package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.CollectionPreviewData;
import com.medium.android.graphql.fragment.CreatorPreviewData;
import com.medium.android.graphql.fragment.WhoToFollowNode;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ddd extends p4d implements c55 {
    public /* synthetic */ int b;
    public /* synthetic */ WhoToFollowNode c;
    public final /* synthetic */ odd d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ddd(n92 n92Var, odd oddVar) {
        super(3, n92Var);
        this.d = oddVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int iIntValue = ((Number) obj).intValue();
        ddd dddVar = new ddd((n92) obj3, this.d);
        dddVar.b = iIntValue;
        dddVar.c = (WhoToFollowNode) obj2;
        return dddVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        WhoToFollowNode whoToFollowNode = this.c;
        br7.v(obj);
        WhoToFollowNode.OnUser onUser = whoToFollowNode.getOnUser();
        CreatorPreviewData creatorPreviewData = onUser != null ? onUser.getCreatorPreviewData() : null;
        WhoToFollowNode.OnCollection onCollection = whoToFollowNode.getOnCollection();
        CollectionPreviewData collectionPreviewData = onCollection != null ? onCollection.getCollectionPreviewData() : null;
        odd oddVar = this.d;
        if (creatorPreviewData != null) {
            kne kneVar = oddVar.z;
            ine ineVar = ine.FOLLOW;
            SourceParameter sourceParameterF = oddVar.f();
            return new b3f(kneVar.a(creatorPreviewData, ineVar, sourceParameterF.copy(((-9) & 1) != 0 ? sourceParameterF.name : null, ((-9) & 2) != 0 ? sourceParameterF.user_id : null, ((-9) & 4) != 0 ? sourceParameterF.timestamp : null, ((-9) & 8) != 0 ? sourceParameterF.dimension : "who_to_follow", ((-9) & 16) != 0 ? sourceParameterF.collection_id : null, ((-9) & 32) != 0 ? sourceParameterF.post_id : null, ((-9) & 64) != 0 ? sourceParameterF.tag_slug : null, ((-9) & 128) != 0 ? sourceParameterF.promo_id : null, ((-9) & 256) != 0 ? sourceParameterF.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameterF.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameterF.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameterF.author_id : null, ((-9) & 8192) != 0 ? sourceParameterF.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameterF.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameterF.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameterF.rss_type : null, ((-9) & 131072) != 0 ? sourceParameterF.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameterF.post_source : null, ((-9) & 524288) != 0 ? sourceParameterF.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameterF.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameterF.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameterF.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameterF.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameterF.section_type : null, ((-9) & 33554432) != 0 ? sourceParameterF.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameterF.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameterF.email_id : null, ((-9) & 268435456) != 0 ? sourceParameterF.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameterF.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameterF.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameterF.notification_type : null, (8191 & 1) != 0 ? sourceParameterF.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameterF.local_date_sent : null, (8191 & 4) != 0 ? sourceParameterF.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameterF.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameterF.email_location : null, (8191 & 32) != 0 ? sourceParameterF.book_id : null, (8191 & 64) != 0 ? sourceParameterF.edition_id : null, (8191 & 128) != 0 ? sourceParameterF.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameterF.collection_section_id : null, (8191 & 512) != 0 ? sourceParameterF.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameterF.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF.item_type : null, (8191 & 4096) != 0 ? sourceParameterF.unknownFields() : null)));
        }
        if (collectionPreviewData == null) {
            wld.a.m("Who to follow returned a node that was not a user or publication", new Object[0]);
            return null;
        }
        ot1 ot1Var = oddVar.w;
        mt1 mt1Var = mt1.FOLLOW;
        SourceParameter sourceParameterF2 = oddVar.f();
        return new a3f(ot1Var.a(collectionPreviewData, mt1Var, sourceParameterF2.copy(((-9) & 1) != 0 ? sourceParameterF2.name : null, ((-9) & 2) != 0 ? sourceParameterF2.user_id : null, ((-9) & 4) != 0 ? sourceParameterF2.timestamp : null, ((-9) & 8) != 0 ? sourceParameterF2.dimension : "who_to_follow", ((-9) & 16) != 0 ? sourceParameterF2.collection_id : null, ((-9) & 32) != 0 ? sourceParameterF2.post_id : null, ((-9) & 64) != 0 ? sourceParameterF2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameterF2.promo_id : null, ((-9) & 256) != 0 ? sourceParameterF2.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameterF2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameterF2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameterF2.author_id : null, ((-9) & 8192) != 0 ? sourceParameterF2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameterF2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameterF2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameterF2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameterF2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameterF2.post_source : null, ((-9) & 524288) != 0 ? sourceParameterF2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameterF2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameterF2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameterF2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameterF2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameterF2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameterF2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameterF2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameterF2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameterF2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameterF2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameterF2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameterF2.notification_type : null, (8191 & 1) != 0 ? sourceParameterF2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameterF2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameterF2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameterF2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameterF2.email_location : null, (8191 & 32) != 0 ? sourceParameterF2.book_id : null, (8191 & 64) != 0 ? sourceParameterF2.edition_id : null, (8191 & 128) != 0 ? sourceParameterF2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameterF2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameterF2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameterF2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameterF2.item_type : null, (8191 & 4096) != 0 ? sourceParameterF2.unknownFields() : null), true));
    }
}
