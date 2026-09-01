package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.PostReposter;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hbb extends p4d implements e55 {
    public /* synthetic */ int b;
    public /* synthetic */ PostReposter c;
    public /* synthetic */ boolean d;
    public /* synthetic */ String e;
    public final /* synthetic */ jbb f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hbb(jbb jbbVar, n92 n92Var) {
        super(5, n92Var);
        this.f = jbbVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        PostReposter postReposter = this.c;
        boolean z = this.d;
        String str = this.e;
        br7.v(obj);
        jbb jbbVar = this.f;
        eab eabVar = jbbVar.j;
        SourceParameter sourceParameter = jbbVar.t;
        eabVar.getClass();
        postReposter.getClass();
        sourceParameter.getClass();
        PostReposter.User user = postReposter.getUser();
        if (user == null) {
            return null;
        }
        hne hneVarA = eabVar.a.a(user.getCreatorPreviewData(), ine.FOLLOW, sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : Integer.valueOf(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null));
        boolean zIsUser = user.getViewerEdge().isUser();
        boolean z2 = postReposter.getHideTime() != null;
        String note = postReposter.getNote();
        if (!z2) {
            return (note == null || muc.b0(note)) ? new cab(hneVarA) : eab.a(hneVarA, note, false, str, zIsUser, z);
        }
        if (!z) {
            return (!zIsUser || note == null || muc.b0(note)) ? new cab(hneVarA) : eab.a(hneVarA, note, false, str, true, false);
        }
        if (note == null) {
            note = "";
        }
        return eab.a(hneVarA, note, true, str, zIsUser, true);
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        int iIntValue = ((Number) obj).intValue();
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        hbb hbbVar = new hbb(this.f, (n92) obj5);
        hbbVar.b = iIntValue;
        hbbVar.c = (PostReposter) obj2;
        hbbVar.d = zBooleanValue;
        hbbVar.e = (String) obj4;
        return hbbVar.invokeSuspend(c1e.a);
    }
}
