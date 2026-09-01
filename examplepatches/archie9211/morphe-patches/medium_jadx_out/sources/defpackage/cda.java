package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.models.EntityType;
import com.medium.android.graphql.fragment.MembershipFragment;
import com.medium.android.graphql.fragment.PublicationFlairedStaffData;
import com.medium.android.graphql.fragment.PublicationStaffData;
import com.medium.android.graphql.fragment.UserFollowData;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cda extends p4d implements c55 {
    public /* synthetic */ int b;
    public /* synthetic */ PublicationFlairedStaffData c;
    public final /* synthetic */ dda d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cda(dda ddaVar, n92 n92Var) {
        super(3, n92Var);
        this.d = ddaVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int iIntValue = ((Number) obj).intValue();
        cda cdaVar = new cda(this.d, (n92) obj3);
        cdaVar.b = iIntValue;
        cdaVar.c = (PublicationFlairedStaffData) obj2;
        return cdaVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        zw7 zw7VarB;
        MembershipFragment membershipFragment;
        int i = this.b;
        PublicationFlairedStaffData publicationFlairedStaffData = this.c;
        br7.v(obj);
        PublicationStaffData publicationStaffData = publicationFlairedStaffData.getUser().getPublicationStaffData();
        String name = publicationStaffData.getName();
        n92 n92Var = null;
        if (name == null) {
            return null;
        }
        String id = publicationStaffData.getId();
        String title = publicationFlairedStaffData.getTitle();
        if (title == null || muc.b0(title)) {
            title = null;
        }
        String imageId = publicationStaffData.getImageId();
        String str = imageId != null ? imageId : null;
        PublicationStaffData.Membership membership = publicationStaffData.getMembership();
        if (membership == null || (membershipFragment = membership.getMembershipFragment()) == null || (zw7VarB = vn7.B(membershipFragment)) == null) {
            zw7VarB = zw7.NOT_A_MEMBER;
        }
        zw7 zw7Var = zw7VarB;
        UserFollowData.SocialStats socialStats = publicationStaffData.getUserFollowData().getSocialStats();
        Long followerCount = socialStats != null ? socialStats.getFollowerCount() : null;
        dda ddaVar = this.d;
        jmc jmcVar = new jmc(m40.J(new sp4(ddaVar.c.v(publicationStaffData.getId(), false), ddaVar.d.u(EntityType.AUTHOR, publicationStaffData.getId(), false), new bda(publicationStaffData, name, ddaVar, n92Var, 0), 0)));
        String bio = publicationStaffData.getBio();
        SourceParameter sourceParameter = ddaVar.n;
        return new kmc(id, name, title, str, zw7Var, followerCount, jmcVar, bio, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
    }
}
