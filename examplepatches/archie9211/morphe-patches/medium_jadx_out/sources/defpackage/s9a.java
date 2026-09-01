package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.GetPubPostsStatsQuery;
import com.medium.android.graphql.fragment.StatsPost;
import com.medium.android.graphql.type.PostVisibilityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s9a extends p4d implements c55 {
    public /* synthetic */ int b;
    public /* synthetic */ GetPubPostsStatsQuery.Node c;
    public final /* synthetic */ w9a d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s9a(w9a w9aVar, n92 n92Var) {
        super(3, n92Var);
        this.d = w9aVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int iIntValue = ((Number) obj).intValue();
        s9a s9aVar = new s9a(this.d, (n92) obj3);
        s9aVar.b = iIntValue;
        s9aVar.c = (GetPubPostsStatsQuery.Node) obj2;
        return s9aVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        vqc vqcVar;
        int i = this.b;
        GetPubPostsStatsQuery.Node node = this.c;
        br7.v(obj);
        StatsPost statsPost = node.getStatsPost();
        String title = statsPost.getTitle();
        if (title == null) {
            ay0.e("Title should not be null");
            return null;
        }
        StatsPost.TotalStats totalStats = statsPost.getTotalStats();
        Integer views = totalStats != null ? totalStats.getViews() : null;
        StatsPost.TotalStats totalStats2 = statsPost.getTotalStats();
        Integer reads = totalStats2 != null ? totalStats2.getReads() : null;
        StatsPost.Creator creator = statsPost.getCreator();
        String name = creator != null ? creator.getName() : null;
        if (name != null) {
            String id = creator.getId();
            String imageId = creator.getImageId();
            vqcVar = new vqc(id, name, imageId != null ? imageId : null);
        } else {
            vqcVar = null;
        }
        String id2 = statsPost.getId();
        Boolean boolIsLocked = statsPost.isLocked();
        boolean zBooleanValue = boolIsLocked != null ? boolIsLocked.booleanValue() : false;
        Long firstPublishedAt = statsPost.getFirstPublishedAt();
        boolean zIsFeaturedInPublishedPublication = statsPost.isFeaturedInPublishedPublication();
        Long firstBoostedAt = statsPost.getFirstBoostedAt();
        boolean z = firstBoostedAt != null && firstBoostedAt.longValue() > 0;
        SourceParameter sourceParameter = this.d.k;
        return new wqc(id2, title, vqcVar, zBooleanValue, firstPublishedAt, null, views, reads, zIsFeaturedInPublishedPublication, z, null, statsPost.getVisibility() == PostVisibilityType.UNLISTED, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }
}
