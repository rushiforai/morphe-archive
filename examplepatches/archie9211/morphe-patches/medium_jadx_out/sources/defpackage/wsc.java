package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.GetPostsStatsQuery;
import com.medium.android.graphql.fragment.StatsPost;
import com.medium.android.graphql.type.PostVisibilityType;
import gen.model.SourceParameter;
import java.text.NumberFormat;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wsc extends p4d implements c55 {
    public /* synthetic */ int b;
    public /* synthetic */ GetPostsStatsQuery.Node c;
    public final /* synthetic */ zsc d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wsc(zsc zscVar, n92 n92Var) {
        super(3, n92Var);
        this.d = zscVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int iIntValue = ((Number) obj).intValue();
        wsc wscVar = new wsc(this.d, (n92) obj3);
        wscVar.b = iIntValue;
        wscVar.c = (GetPostsStatsQuery.Node) obj2;
        return wscVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        boolean z2;
        StatsPost.Earnings earnings;
        StatsPost.Total total;
        int i = this.b;
        GetPostsStatsQuery.Node node = this.c;
        br7.v(obj);
        StatsPost statsPost = node.getStatsPost();
        String title = statsPost.getTitle();
        String id = statsPost.getId();
        Boolean boolIsLocked = statsPost.isLocked();
        boolean zBooleanValue = boolIsLocked != null ? boolIsLocked.booleanValue() : false;
        Long firstPublishedAt = statsPost.getFirstPublishedAt();
        StatsPost.TotalStats totalStats = statsPost.getTotalStats();
        String str = null;
        Integer presentations = totalStats != null ? totalStats.getPresentations() : null;
        StatsPost.TotalStats totalStats2 = statsPost.getTotalStats();
        Integer views = totalStats2 != null ? totalStats2.getViews() : null;
        StatsPost.TotalStats totalStats3 = statsPost.getTotalStats();
        Integer reads = totalStats3 != null ? totalStats3.getReads() : null;
        if (!g76.L(statsPost.isLocked(), Boolean.TRUE) || (earnings = statsPost.getEarnings()) == null || (total = earnings.getTotal()) == null) {
            z = zBooleanValue;
        } else if (total.getUnits() == 0 && total.getNanos() == 0) {
            str = "--";
            z = zBooleanValue;
        } else {
            NumberFormat currencyInstance = NumberFormat.getCurrencyInstance(Locale.US);
            String currencyCode = total.getCurrency().getCurrencyCode();
            currencyCode.getClass();
            if (!muc.b0(currencyCode)) {
                currencyInstance.setCurrency(total.getCurrency());
            }
            z = zBooleanValue;
            str = currencyInstance.format((((double) total.getNanos()) / 1.0E9d) + ((double) total.getUnits()));
        }
        String str2 = str;
        boolean zIsFeaturedInPublishedPublication = statsPost.isFeaturedInPublishedPublication();
        Long firstBoostedAt = statsPost.getFirstBoostedAt();
        if (firstBoostedAt != null) {
            z2 = firstBoostedAt.longValue() > 0;
        } else {
            z2 = false;
        }
        boolean z3 = statsPost.getVisibility() == PostVisibilityType.UNLISTED;
        SourceParameter sourceParameter = this.d.j;
        return new wqc(id, title, null, z, firstPublishedAt, presentations, views, reads, zIsFeaturedInPublishedPublication, z2, str2, z3, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }
}
