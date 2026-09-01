package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.PostPreviewData;
import gen.model.SourceParameter;
import java.util.LinkedHashSet;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lqe3;", "Lque;", "pp2", "me3", "ge3", "digest_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class qe3 extends que {
    public final String b;
    public final q95 c;
    public final q95 d;
    public final dd3 e;
    public final fr9 f;
    public final tl g;
    public final qy2 h;
    public final ty2 i;
    public final ax2 j;
    public final r6c k;
    public final uua l;
    public final wua m;
    public final String n;
    public SourceParameter o;
    public boolean p;
    public final LinkedHashSet q;

    public qe3(String str, String str2, q95 q95Var, q95 q95Var2, dd3 dd3Var, fr9 fr9Var, tl tlVar, qy2 qy2Var, ty2 ty2Var, ax2 ax2Var, kb2 kb2Var) {
        str2.getClass();
        dd3Var.getClass();
        this.b = str2;
        this.c = q95Var;
        this.d = q95Var2;
        this.e = dd3Var;
        this.f = fr9Var;
        this.g = tlVar;
        this.h = qy2Var;
        this.i = ty2Var;
        this.j = ax2Var;
        n92 n92Var = null;
        if (str != null) {
            dd3Var.b.m(null, str);
        }
        r6c r6cVarX = k40.x(0, 7, null);
        this.k = r6cVarX;
        this.l = bo.z(r6cVarX);
        this.m = bo.e0(w2g.r(ip4.b(dd3Var.c, new yk(4, n92Var, this)), kb2Var), f76.F(this), new ync(5000L, Long.MAX_VALUE), ke3.a);
        this.n = "digest";
        this.o = new SourceParameter("digest", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null);
        this.q = new LinkedHashSet();
    }

    public final dr9 e(int i, PostPreviewData postPreviewData) {
        SourceParameter sourceParameter = this.o;
        return fr9.a(this.f, postPreviewData, new g08(sourceParameter.copy(((-9) & 1) != 0 ? sourceParameter.name : null, ((-9) & 2) != 0 ? sourceParameter.user_id : null, ((-9) & 4) != 0 ? sourceParameter.timestamp : null, ((-9) & 8) != 0 ? sourceParameter.dimension : null, ((-9) & 16) != 0 ? sourceParameter.collection_id : null, ((-9) & 32) != 0 ? sourceParameter.post_id : null, ((-9) & 64) != 0 ? sourceParameter.tag_slug : null, ((-9) & 128) != 0 ? sourceParameter.promo_id : null, ((-9) & 256) != 0 ? sourceParameter.index : Integer.valueOf(i), ((-9) & 512) != 0 ? sourceParameter.catalog_id : null, ((-9) & 1024) != 0 ? sourceParameter.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.sequence_id : null, ((-9) & 4096) != 0 ? sourceParameter.author_id : null, ((-9) & 8192) != 0 ? sourceParameter.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? sourceParameter.topic_slug : null, ((-9) & 32768) != 0 ? sourceParameter.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? sourceParameter.rss_type : null, ((-9) & 131072) != 0 ? sourceParameter.post_feed_reason : null, ((-9) & 262144) != 0 ? sourceParameter.post_source : null, ((-9) & 524288) != 0 ? sourceParameter.tag_source : null, ((-9) & 1048576) != 0 ? sourceParameter.ifttt_source : null, ((-9) & 2097152) != 0 ? sourceParameter.promotion_source : null, ((-9) & 4194304) != 0 ? sourceParameter.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? sourceParameter.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? sourceParameter.section_type : null, ((-9) & 33554432) != 0 ? sourceParameter.digest_section_type : null, ((-9) & 67108864) != 0 ? sourceParameter.susi_entry : null, ((-9) & 134217728) != 0 ? sourceParameter.email_id : null, ((-9) & 268435456) != 0 ? sourceParameter.feed_id : null, ((-9) & 536870912) != 0 ? sourceParameter.newsletter_id : null, ((-9) & 1073741824) != 0 ? sourceParameter.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? sourceParameter.notification_type : null, (8191 & 1) != 0 ? sourceParameter.amp_email_identifier : null, (8191 & 2) != 0 ? sourceParameter.local_date_sent : null, (8191 & 4) != 0 ? sourceParameter.newsletter_v3_id : null, (8191 & 8) != 0 ? sourceParameter.ranked_module_type : null, (8191 & 16) != 0 ? sourceParameter.email_location : null, (8191 & 32) != 0 ? sourceParameter.book_id : null, (8191 & 64) != 0 ? sourceParameter.edition_id : null, (8191 & 128) != 0 ? sourceParameter.sub_collection_id : null, (8191 & 256) != 0 ? sourceParameter.collection_section_id : null, (8191 & 512) != 0 ? sourceParameter.highlight_group_id : null, (8191 & 1024) != 0 ? sourceParameter.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? sourceParameter.item_type : null, (8191 & 4096) != 0 ? sourceParameter.unknownFields() : null), this.b, this.n), null, false, false, null, false, null, null, null, -2097284);
    }
}
