package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.PostPreviewData;
import gen.model.SourceParameter;
import j$.util.Map;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class def extends p4d implements c55 {
    public final /* synthetic */ int b;
    public /* synthetic */ int c;
    public /* synthetic */ PostPreviewData d;
    public final /* synthetic */ ref e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ def(int i, n92 n92Var, ref refVar, String str) {
        super(3, n92Var);
        this.b = i;
        this.e = refVar;
        this.f = str;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.f;
        ref refVar = this.e;
        int iIntValue = ((Number) obj).intValue();
        PostPreviewData postPreviewData = (PostPreviewData) obj2;
        n92 n92Var = (n92) obj3;
        switch (i) {
            case 0:
                def defVar = new def(0, n92Var, refVar, str);
                defVar.c = iIntValue;
                defVar.d = postPreviewData;
                return defVar.invokeSuspend(c1eVar);
            default:
                def defVar2 = new def(1, n92Var, refVar, str);
                defVar2.c = iIntValue;
                defVar2.d = postPreviewData;
                return defVar2.invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        ref refVar = this.e;
        switch (i) {
            case 0:
                int i2 = this.c;
                PostPreviewData postPreviewData = this.d;
                br7.v(obj);
                fr9 fr9Var = refVar.l;
                String str = refVar.b;
                SourceParameter sourceParameter = refVar.r;
                return fr9.a(fr9Var, postPreviewData, new g08(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : "publication", ((-9) & 16) != 0 ? sourceParameter.collection_id : this.f, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : new Integer(i2), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : ((Boolean) Map.EL.getOrDefault(refVar.F, this.f, Boolean.FALSE)).booleanValue() ? "following_badge" : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), str, refVar.q), null, false, false, null, false, null, null, null, -16516);
            default:
                int i3 = this.c;
                PostPreviewData postPreviewData2 = this.d;
                br7.v(obj);
                fr9 fr9Var2 = refVar.l;
                String str2 = refVar.b;
                SourceParameter sourceParameter2 = refVar.r;
                Integer num = new Integer(i3);
                LinkedHashMap linkedHashMap = refVar.E;
                Boolean bool = Boolean.FALSE;
                String str3 = this.f;
                return fr9.a(fr9Var2, postPreviewData2, new g08(sourceParameter2.copy(((-9) & 1) != 0 ? sourceParameter2.name : null, ((-9) & 2) != 0 ? sourceParameter2.user_id : null, ((-9) & 4) != 0 ? sourceParameter2.timestamp : null, ((-9) & 8) != 0 ? sourceParameter2.dimension : "writer", ((-9) & 16) != 0 ? sourceParameter2.collection_id : null, ((-9) & 32) != 0 ? sourceParameter2.post_id : null, ((-9) & 64) != 0 ? sourceParameter2.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter2.promo_id : null, ((-9) & 256) != 0 ? sourceParameter2.index : num, ((-9) & 512) != 0 ? sourceParameter2.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter2.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter2.author_id : str3, ((-9) & 8192) != 0 ? sourceParameter2.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter2.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter2.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter2.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter2.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter2.post_source : null, ((-9) & 524288) != 0 ? sourceParameter2.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter2.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter2.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter2.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter2.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter2.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter2.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter2.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter2.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter2.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter2.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter2.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter2.notification_type : ((Boolean) Map.EL.getOrDefault(linkedHashMap, str3, bool)).booleanValue() ? "following_badge" : null, (8191 & 1) != 0 ? sourceParameter2.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter2.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter2.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter2.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter2.email_location : null, (8191 & 32) != 0 ? sourceParameter2.book_id : null, (8191 & 64) != 0 ? sourceParameter2.edition_id : null, (8191 & 128) != 0 ? sourceParameter2.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter2.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter2.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter2.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter2.item_type : null, (8191 & 4096) != 0 ? sourceParameter2.unknownFields() : null), str2, refVar.q), null, false, false, null, false, null, null, null, -132);
        }
    }
}
