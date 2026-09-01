package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.model.StreamItemSectionContext;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.okc;
import defpackage.pkc;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0018\u0018\u0000 X2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002YB¡\u0004\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0018\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001a\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001e\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010%\u001a\u0004\u0018\u00010$\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010&\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010.\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010/\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00100\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00101\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u00109\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010;\u001a\u00020:¢\u0006\u0004\b<\u0010=J\u000f\u0010>\u001a\u00020\u0002H\u0016¢\u0006\u0004\b>\u0010?J\u001a\u0010C\u001a\u00020B2\b\u0010A\u001a\u0004\u0018\u00010@H\u0096\u0002¢\u0006\u0004\bC\u0010DJ\u000f\u0010E\u001a\u00020\rH\u0016¢\u0006\u0004\bE\u0010FJ\u000f\u0010G\u001a\u00020\u0003H\u0016¢\u0006\u0004\bG\u0010HJ§\u0004\u0010I\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00182\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001a2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001e2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!2\n\b\u0002\u0010#\u001a\u0004\u0018\u00010!2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010$2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010&2\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010+\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010.\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010/\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00100\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00101\u001a\u0004\u0018\u00010\r2\n\b\u0002\u00102\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00103\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00104\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00105\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00106\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00107\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00108\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u00109\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010;\u001a\u00020:¢\u0006\u0004\bI\u0010JR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010KR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010KR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010LR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010KR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010KR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010KR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010KR\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010KR\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010MR\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010KR\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010KR\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010KR\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010KR\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010KR\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010KR\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010LR\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010NR\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00188\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010OR\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u001a8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010PR\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010QR\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u001e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010RR\u0016\u0010 \u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010KR\u0016\u0010\"\u001a\u0004\u0018\u00010!8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010SR\u0016\u0010#\u001a\u0004\u0018\u00010!8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010SR\u0016\u0010%\u001a\u0004\u0018\u00010$8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b%\u0010TR\u0016\u0010'\u001a\u0004\u0018\u00010&8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b'\u0010UR\u0016\u0010(\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010KR\u0016\u0010)\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010KR\u0016\u0010*\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b*\u0010KR\u0016\u0010+\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b+\u0010KR\u0016\u0010,\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b,\u0010MR\u0016\u0010-\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b-\u0010KR\u0016\u0010.\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b.\u0010KR\u0016\u0010/\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b/\u0010KR\u0016\u00100\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b0\u0010KR\u0016\u00101\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b1\u0010MR\u0016\u00102\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b2\u0010KR\u0016\u00103\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b3\u0010KR\u0016\u00104\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b4\u0010KR\u0016\u00105\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b5\u0010KR\u0016\u00106\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b6\u0010KR\u0016\u00107\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b7\u0010KR\u0016\u00108\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b8\u0010KR\u001c\u00109\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b9\u0010M\u0012\u0004\bV\u0010W¨\u0006Z"}, d2 = {"Lgen/model/SourceParameter;", "Lcom/squareup/wire/AndroidMessage;", "Lokc;", "", "name", "user_id", "", "timestamp", "dimension", "collection_id", "post_id", "tag_slug", "promo_id", "", "index", "catalog_id", "topic_id", "sequence_id", "author_id", "popchunk_id", "topic_slug", "window_duration", "Lgen/model/SourceRssType;", "rss_type", "Lgen/model/PostFeedReason;", "post_feed_reason", "Lgen/model/PostFeedSource;", "post_source", "Lgen/model/TagSource;", "tag_source", "Lgen/model/IFTTTSource;", "ifttt_source", "promotion_source", "Lgen/model/SuggestionReasonType;", "collection_suggestion_reason", "user_suggestion_reason", "Lcom/medium/proto/model/StreamItemSectionContext;", "section_type", "Lgen/model/DigestSectionType;", "digest_section_type", "susi_entry", "email_id", "feed_id", "newsletter_id", "rank_position", "notification_type", "amp_email_identifier", "local_date_sent", "newsletter_v3_id", "ranked_module_type", "email_location", "book_id", "edition_id", "sub_collection_id", "collection_section_id", "highlight_group_id", "quote_id", "item_type", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lgen/model/SourceRssType;Lgen/model/PostFeedReason;Lgen/model/PostFeedSource;Lgen/model/TagSource;Lgen/model/IFTTTSource;Ljava/lang/String;Lgen/model/SuggestionReasonType;Lgen/model/SuggestionReasonType;Lcom/medium/proto/model/StreamItemSectionContext;Lgen/model/DigestSectionType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lokc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lgen/model/SourceRssType;Lgen/model/PostFeedReason;Lgen/model/PostFeedSource;Lgen/model/TagSource;Lgen/model/IFTTTSource;Ljava/lang/String;Lgen/model/SuggestionReasonType;Lgen/model/SuggestionReasonType;Lcom/medium/proto/model/StreamItemSectionContext;Lgen/model/DigestSectionType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lgen/model/SourceParameter;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Integer;", "Lgen/model/SourceRssType;", "Lgen/model/PostFeedReason;", "Lgen/model/PostFeedSource;", "Lgen/model/TagSource;", "Lgen/model/IFTTTSource;", "Lgen/model/SuggestionReasonType;", "Lcom/medium/proto/model/StreamItemSectionContext;", "Lgen/model/DigestSectionType;", "getItem_type$annotations", "()V", "Companion", "pkc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SourceParameter extends AndroidMessage<SourceParameter, okc> {
    public static final ProtoAdapter<SourceParameter> ADAPTER;
    public static final Parcelable.Creator<SourceParameter> CREATOR;
    public static final pkc Companion = new pkc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 32, tag = 35)
    public final String amp_email_identifier;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 23)
    public final String author_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 37, tag = 40)
    public final String book_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 17)
    public final String catalog_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 40, tag = 43)
    public final String collection_section_id;

    @WireField(adapter = "gen.model.SuggestionReasonType#ADAPTER", schemaIndex = 22, tag = 19)
    public final SuggestionReasonType collection_suggestion_reason;

    @WireField(adapter = "gen.model.DigestSectionType#ADAPTER", schemaIndex = 25, tag = 30)
    public final DigestSectionType digest_section_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String dimension;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 38, tag = 41)
    public final String edition_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 27, tag = 29)
    public final String email_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 36, tag = 39)
    public final String email_location;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 28, tag = 31)
    public final String feed_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 41, tag = 44)
    public final String highlight_group_id;

    @WireField(adapter = "gen.model.IFTTTSource#ADAPTER", schemaIndex = 20, tag = 15)
    public final IFTTTSource ifttt_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 8, tag = 10)
    public final Integer index;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 43, tag = 13)
    public final Integer item_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 33, tag = 36)
    public final String local_date_sent;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 29, tag = 32)
    public final String newsletter_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 34, tag = 37)
    public final String newsletter_v3_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 31, tag = 34)
    public final String notification_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 24)
    public final String popchunk_id;

    @WireField(adapter = "gen.model.PostFeedReason#ADAPTER", schemaIndex = 17, tag = 11)
    public final PostFeedReason post_feed_reason;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String post_id;

    @WireField(adapter = "gen.model.PostFeedSource#ADAPTER", schemaIndex = 18, tag = 12)
    public final PostFeedSource post_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 9)
    public final String promo_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 21, tag = 18)
    public final String promotion_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 42, tag = 45)
    public final String quote_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 30, tag = 33)
    public final Integer rank_position;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 35, tag = 38)
    public final Integer ranked_module_type;

    @WireField(adapter = "gen.model.SourceRssType#ADAPTER", schemaIndex = 16, tag = 8)
    public final SourceRssType rss_type;

    @WireField(adapter = "com.medium.proto.model.StreamItemSectionContext#ADAPTER", schemaIndex = 24, tag = 28)
    public final StreamItemSectionContext section_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 22)
    public final String sequence_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 39, tag = 42)
    public final String sub_collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 26, tag = 27)
    public final String susi_entry;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String tag_slug;

    @WireField(adapter = "gen.model.TagSource#ADAPTER", schemaIndex = 19, tag = 14)
    public final TagSource tag_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long timestamp;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 21)
    public final String topic_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 25)
    public final String topic_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String user_id;

    @WireField(adapter = "gen.model.SuggestionReasonType#ADAPTER", schemaIndex = 23, tag = 20)
    public final SuggestionReasonType user_suggestion_reason;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 15, tag = 26)
    public final Long window_duration;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SourceParameter.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SourceParameter> protoAdapter = new ProtoAdapter<SourceParameter>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.SourceParameter$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SourceParameter decode(ProtoReader reader) {
                String str;
                Long l;
                String str2;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                String strDecode2 = null;
                Long lDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Integer numDecode = null;
                String strDecode8 = null;
                String strDecode9 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                String strDecode13 = null;
                Long lDecode2 = null;
                SourceRssType sourceRssTypeDecode = null;
                PostFeedReason postFeedReasonDecode = null;
                PostFeedSource postFeedSourceDecode = null;
                TagSource tagSourceDecode = null;
                IFTTTSource iFTTTSourceDecode = null;
                String strDecode14 = null;
                SuggestionReasonType suggestionReasonTypeDecode = null;
                SuggestionReasonType suggestionReasonTypeDecode2 = null;
                StreamItemSectionContext streamItemSectionContextDecode = null;
                DigestSectionType digestSectionTypeDecode = null;
                String strDecode15 = null;
                String strDecode16 = null;
                String strDecode17 = null;
                String strDecode18 = null;
                Integer numDecode2 = null;
                String strDecode19 = null;
                String strDecode20 = null;
                String strDecode21 = null;
                String strDecode22 = null;
                Integer numDecode3 = null;
                String strDecode23 = null;
                String strDecode24 = null;
                String strDecode25 = null;
                String strDecode26 = null;
                String strDecode27 = null;
                String strDecode28 = null;
                String strDecode29 = null;
                Integer numDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SourceParameter(str3, strDecode2, lDecode, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, numDecode, strDecode8, strDecode9, strDecode10, strDecode11, strDecode12, strDecode13, lDecode2, sourceRssTypeDecode, postFeedReasonDecode, postFeedSourceDecode, tagSourceDecode, iFTTTSourceDecode, strDecode14, suggestionReasonTypeDecode, suggestionReasonTypeDecode2, streamItemSectionContextDecode, digestSectionTypeDecode, strDecode15, strDecode16, strDecode17, strDecode18, numDecode2, strDecode19, strDecode20, strDecode21, strDecode22, numDecode3, strDecode23, strDecode24, strDecode25, strDecode26, strDecode27, strDecode28, strDecode29, numDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 3:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 7:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 8:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                sourceRssTypeDecode = SourceRssType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 9:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 10:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 11:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                postFeedReasonDecode = PostFeedReason.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 12:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                postFeedSourceDecode = PostFeedSource.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 13:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 14:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                tagSourceDecode = TagSource.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 15:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                iFTTTSourceDecode = IFTTTSource.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 16:
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            strDecode = str3;
                            strDecode2 = str;
                            lDecode = l;
                            strDecode3 = str2;
                            break;
                        case 17:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 18:
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 19:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                suggestionReasonTypeDecode = SuggestionReasonType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e6) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e6.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 20:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                suggestionReasonTypeDecode2 = SuggestionReasonType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e7) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e7.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 21:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 22:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 23:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 24:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 25:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 26:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str3;
                            break;
                        case 27:
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 28:
                            str = strDecode2;
                            l = lDecode;
                            str2 = strDecode3;
                            try {
                                streamItemSectionContextDecode = StreamItemSectionContext.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e8) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e8.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 29:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 30:
                            try {
                                digestSectionTypeDecode = DigestSectionType.ADAPTER.decode(reader);
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e9) {
                                str = strDecode2;
                                l = lDecode;
                                str2 = strDecode3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e9.value));
                                strDecode = str3;
                                strDecode2 = str;
                                lDecode = l;
                                strDecode3 = str2;
                            }
                            break;
                        case 31:
                            strDecode17 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 32:
                            strDecode18 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 33:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 34:
                            strDecode19 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 35:
                            strDecode20 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 36:
                            strDecode21 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 37:
                            strDecode22 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 38:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 39:
                            strDecode23 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 40:
                            strDecode24 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 41:
                            strDecode25 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 42:
                            strDecode26 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 43:
                            strDecode27 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 44:
                            strDecode28 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 45:
                            strDecode29 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                    }
                    str3 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SourceParameter value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.name);
                protoAdapter2.encodeWithTag(writer, 2, value.user_id);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.timestamp);
                protoAdapter2.encodeWithTag(writer, 4, value.dimension);
                protoAdapter2.encodeWithTag(writer, 5, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 6, value.post_id);
                protoAdapter2.encodeWithTag(writer, 7, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 9, value.promo_id);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 10, value.index);
                protoAdapter2.encodeWithTag(writer, 17, value.catalog_id);
                protoAdapter2.encodeWithTag(writer, 21, value.topic_id);
                protoAdapter2.encodeWithTag(writer, 22, value.sequence_id);
                protoAdapter2.encodeWithTag(writer, 23, value.author_id);
                protoAdapter2.encodeWithTag(writer, 24, value.popchunk_id);
                protoAdapter2.encodeWithTag(writer, 25, value.topic_slug);
                protoAdapter3.encodeWithTag(writer, 26, value.window_duration);
                SourceRssType.ADAPTER.encodeWithTag(writer, 8, value.rss_type);
                PostFeedReason.ADAPTER.encodeWithTag(writer, 11, value.post_feed_reason);
                PostFeedSource.ADAPTER.encodeWithTag(writer, 12, value.post_source);
                TagSource.ADAPTER.encodeWithTag(writer, 14, value.tag_source);
                IFTTTSource.ADAPTER.encodeWithTag(writer, 15, value.ifttt_source);
                protoAdapter2.encodeWithTag(writer, 18, value.promotion_source);
                ProtoAdapter<SuggestionReasonType> protoAdapter5 = SuggestionReasonType.ADAPTER;
                protoAdapter5.encodeWithTag(writer, 19, value.collection_suggestion_reason);
                protoAdapter5.encodeWithTag(writer, 20, value.user_suggestion_reason);
                StreamItemSectionContext.ADAPTER.encodeWithTag(writer, 28, value.section_type);
                DigestSectionType.ADAPTER.encodeWithTag(writer, 30, value.digest_section_type);
                protoAdapter2.encodeWithTag(writer, 27, value.susi_entry);
                protoAdapter2.encodeWithTag(writer, 29, value.email_id);
                protoAdapter2.encodeWithTag(writer, 31, value.feed_id);
                protoAdapter2.encodeWithTag(writer, 32, value.newsletter_id);
                protoAdapter4.encodeWithTag(writer, 33, value.rank_position);
                protoAdapter2.encodeWithTag(writer, 34, value.notification_type);
                protoAdapter2.encodeWithTag(writer, 35, value.amp_email_identifier);
                protoAdapter2.encodeWithTag(writer, 36, value.local_date_sent);
                protoAdapter2.encodeWithTag(writer, 37, value.newsletter_v3_id);
                protoAdapter4.encodeWithTag(writer, 38, value.ranked_module_type);
                protoAdapter2.encodeWithTag(writer, 39, value.email_location);
                protoAdapter2.encodeWithTag(writer, 40, value.book_id);
                protoAdapter2.encodeWithTag(writer, 41, value.edition_id);
                protoAdapter2.encodeWithTag(writer, 42, value.sub_collection_id);
                protoAdapter2.encodeWithTag(writer, 43, value.collection_section_id);
                protoAdapter2.encodeWithTag(writer, 44, value.highlight_group_id);
                protoAdapter2.encodeWithTag(writer, 45, value.quote_id);
                protoAdapter4.encodeWithTag(writer, 13, value.item_type);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SourceParameter value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.user_id) + protoAdapter2.encodedSizeWithTag(1, value.name) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(9, value.promo_id) + protoAdapter2.encodedSizeWithTag(7, value.tag_slug) + protoAdapter2.encodedSizeWithTag(6, value.post_id) + protoAdapter2.encodedSizeWithTag(5, value.collection_id) + protoAdapter2.encodedSizeWithTag(4, value.dimension) + protoAdapter3.encodedSizeWithTag(3, value.timestamp) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = protoAdapter2.encodedSizeWithTag(18, value.promotion_source) + IFTTTSource.ADAPTER.encodedSizeWithTag(15, value.ifttt_source) + TagSource.ADAPTER.encodedSizeWithTag(14, value.tag_source) + PostFeedSource.ADAPTER.encodedSizeWithTag(12, value.post_source) + PostFeedReason.ADAPTER.encodedSizeWithTag(11, value.post_feed_reason) + SourceRssType.ADAPTER.encodedSizeWithTag(8, value.rss_type) + protoAdapter3.encodedSizeWithTag(26, value.window_duration) + protoAdapter2.encodedSizeWithTag(25, value.topic_slug) + protoAdapter2.encodedSizeWithTag(24, value.popchunk_id) + protoAdapter2.encodedSizeWithTag(23, value.author_id) + protoAdapter2.encodedSizeWithTag(22, value.sequence_id) + protoAdapter2.encodedSizeWithTag(21, value.topic_id) + protoAdapter2.encodedSizeWithTag(17, value.catalog_id) + protoAdapter4.encodedSizeWithTag(10, value.index) + iEncodedSizeWithTag2;
                ProtoAdapter<SuggestionReasonType> protoAdapter5 = SuggestionReasonType.ADAPTER;
                return protoAdapter4.encodedSizeWithTag(13, value.item_type) + protoAdapter2.encodedSizeWithTag(45, value.quote_id) + protoAdapter2.encodedSizeWithTag(44, value.highlight_group_id) + protoAdapter2.encodedSizeWithTag(43, value.collection_section_id) + protoAdapter2.encodedSizeWithTag(42, value.sub_collection_id) + protoAdapter2.encodedSizeWithTag(41, value.edition_id) + protoAdapter2.encodedSizeWithTag(40, value.book_id) + protoAdapter2.encodedSizeWithTag(39, value.email_location) + protoAdapter4.encodedSizeWithTag(38, value.ranked_module_type) + protoAdapter2.encodedSizeWithTag(37, value.newsletter_v3_id) + protoAdapter2.encodedSizeWithTag(36, value.local_date_sent) + protoAdapter2.encodedSizeWithTag(35, value.amp_email_identifier) + protoAdapter2.encodedSizeWithTag(34, value.notification_type) + protoAdapter4.encodedSizeWithTag(33, value.rank_position) + protoAdapter2.encodedSizeWithTag(32, value.newsletter_id) + protoAdapter2.encodedSizeWithTag(31, value.feed_id) + protoAdapter2.encodedSizeWithTag(29, value.email_id) + protoAdapter2.encodedSizeWithTag(27, value.susi_entry) + DigestSectionType.ADAPTER.encodedSizeWithTag(30, value.digest_section_type) + StreamItemSectionContext.ADAPTER.encodedSizeWithTag(28, value.section_type) + protoAdapter5.encodedSizeWithTag(20, value.user_suggestion_reason) + protoAdapter5.encodedSizeWithTag(19, value.collection_suggestion_reason) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SourceParameter redact(SourceParameter value) {
                value.getClass();
                return value.copy(((-9) & 1) != 0 ? value.name : null, ((-9) & 2) != 0 ? value.user_id : null, ((-9) & 4) != 0 ? value.timestamp : null, ((-9) & 8) != 0 ? value.dimension : null, ((-9) & 16) != 0 ? value.collection_id : null, ((-9) & 32) != 0 ? value.post_id : null, ((-9) & 64) != 0 ? value.tag_slug : null, ((-9) & 128) != 0 ? value.promo_id : null, ((-9) & 256) != 0 ? value.index : null, ((-9) & 512) != 0 ? value.catalog_id : null, ((-9) & 1024) != 0 ? value.topic_id : null, ((-9) & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.sequence_id : null, ((-9) & 4096) != 0 ? value.author_id : null, ((-9) & 8192) != 0 ? value.popchunk_id : null, ((-9) & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.topic_slug : null, ((-9) & 32768) != 0 ? value.window_duration : null, ((-9) & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.rss_type : null, ((-9) & 131072) != 0 ? value.post_feed_reason : null, ((-9) & 262144) != 0 ? value.post_source : null, ((-9) & 524288) != 0 ? value.tag_source : null, ((-9) & 1048576) != 0 ? value.ifttt_source : null, ((-9) & 2097152) != 0 ? value.promotion_source : null, ((-9) & 4194304) != 0 ? value.collection_suggestion_reason : null, ((-9) & 8388608) != 0 ? value.user_suggestion_reason : null, ((-9) & 16777216) != 0 ? value.section_type : null, ((-9) & 33554432) != 0 ? value.digest_section_type : null, ((-9) & 67108864) != 0 ? value.susi_entry : null, ((-9) & 134217728) != 0 ? value.email_id : null, ((-9) & 268435456) != 0 ? value.feed_id : null, ((-9) & 536870912) != 0 ? value.newsletter_id : null, ((-9) & 1073741824) != 0 ? value.rank_position : null, ((-9) & Integer.MIN_VALUE) != 0 ? value.notification_type : null, (8191 & 1) != 0 ? value.amp_email_identifier : null, (8191 & 2) != 0 ? value.local_date_sent : null, (8191 & 4) != 0 ? value.newsletter_v3_id : null, (8191 & 8) != 0 ? value.ranked_module_type : null, (8191 & 16) != 0 ? value.email_location : null, (8191 & 32) != 0 ? value.book_id : null, (8191 & 64) != 0 ? value.edition_id : null, (8191 & 128) != 0 ? value.sub_collection_id : null, (8191 & 256) != 0 ? value.collection_section_id : null, (8191 & 512) != 0 ? value.highlight_group_id : null, (8191 & 1024) != 0 ? value.quote_id : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.item_type : null, (8191 & 4096) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SourceParameter value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 13, value.item_type);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 45, value.quote_id);
                protoAdapter3.encodeWithTag(writer, 44, value.highlight_group_id);
                protoAdapter3.encodeWithTag(writer, 43, value.collection_section_id);
                protoAdapter3.encodeWithTag(writer, 42, value.sub_collection_id);
                protoAdapter3.encodeWithTag(writer, 41, value.edition_id);
                protoAdapter3.encodeWithTag(writer, 40, value.book_id);
                protoAdapter3.encodeWithTag(writer, 39, value.email_location);
                protoAdapter2.encodeWithTag(writer, 38, value.ranked_module_type);
                protoAdapter3.encodeWithTag(writer, 37, value.newsletter_v3_id);
                protoAdapter3.encodeWithTag(writer, 36, value.local_date_sent);
                protoAdapter3.encodeWithTag(writer, 35, value.amp_email_identifier);
                protoAdapter3.encodeWithTag(writer, 34, value.notification_type);
                protoAdapter2.encodeWithTag(writer, 33, value.rank_position);
                protoAdapter3.encodeWithTag(writer, 32, value.newsletter_id);
                protoAdapter3.encodeWithTag(writer, 31, value.feed_id);
                protoAdapter3.encodeWithTag(writer, 29, value.email_id);
                protoAdapter3.encodeWithTag(writer, 27, value.susi_entry);
                DigestSectionType.ADAPTER.encodeWithTag(writer, 30, value.digest_section_type);
                StreamItemSectionContext.ADAPTER.encodeWithTag(writer, 28, value.section_type);
                ProtoAdapter<SuggestionReasonType> protoAdapter4 = SuggestionReasonType.ADAPTER;
                protoAdapter4.encodeWithTag(writer, 20, value.user_suggestion_reason);
                protoAdapter4.encodeWithTag(writer, 19, value.collection_suggestion_reason);
                protoAdapter3.encodeWithTag(writer, 18, value.promotion_source);
                IFTTTSource.ADAPTER.encodeWithTag(writer, 15, value.ifttt_source);
                TagSource.ADAPTER.encodeWithTag(writer, 14, value.tag_source);
                PostFeedSource.ADAPTER.encodeWithTag(writer, 12, value.post_source);
                PostFeedReason.ADAPTER.encodeWithTag(writer, 11, value.post_feed_reason);
                SourceRssType.ADAPTER.encodeWithTag(writer, 8, value.rss_type);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 26, value.window_duration);
                protoAdapter3.encodeWithTag(writer, 25, value.topic_slug);
                protoAdapter3.encodeWithTag(writer, 24, value.popchunk_id);
                protoAdapter3.encodeWithTag(writer, 23, value.author_id);
                protoAdapter3.encodeWithTag(writer, 22, value.sequence_id);
                protoAdapter3.encodeWithTag(writer, 21, value.topic_id);
                protoAdapter3.encodeWithTag(writer, 17, value.catalog_id);
                protoAdapter2.encodeWithTag(writer, 10, value.index);
                protoAdapter3.encodeWithTag(writer, 9, value.promo_id);
                protoAdapter3.encodeWithTag(writer, 7, value.tag_slug);
                protoAdapter3.encodeWithTag(writer, 6, value.post_id);
                protoAdapter3.encodeWithTag(writer, 5, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 4, value.dimension);
                protoAdapter5.encodeWithTag(writer, 3, value.timestamp);
                protoAdapter3.encodeWithTag(writer, 2, value.user_id);
                protoAdapter3.encodeWithTag(writer, 1, value.name);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SourceParameter(String str, String str2, Long l, String str3, String str4, String str5, String str6, String str7, Integer num, String str8, String str9, String str10, String str11, String str12, String str13, Long l2, SourceRssType sourceRssType, PostFeedReason postFeedReason, PostFeedSource postFeedSource, TagSource tagSource, IFTTTSource iFTTTSource, String str14, SuggestionReasonType suggestionReasonType, SuggestionReasonType suggestionReasonType2, StreamItemSectionContext streamItemSectionContext, DigestSectionType digestSectionType, String str15, String str16, String str17, String str18, Integer num2, String str19, String str20, String str21, String str22, Integer num3, String str23, String str24, String str25, String str26, String str27, String str28, String str29, Integer num4, h21 h21Var, int i, int i2, gy2 gy2Var) {
        String str30 = (i & 1) != 0 ? null : str;
        this(str30, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : str6, (i & 128) != 0 ? null : str7, (i & 256) != 0 ? null : num, (i & 512) != 0 ? null : str8, (i & 1024) != 0 ? null : str9, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str10, (i & 4096) != 0 ? null : str11, (i & 8192) != 0 ? null : str12, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str13, (i & 32768) != 0 ? null : l2, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : sourceRssType, (i & 131072) != 0 ? null : postFeedReason, (i & 262144) != 0 ? null : postFeedSource, (i & 524288) != 0 ? null : tagSource, (i & 1048576) != 0 ? null : iFTTTSource, (i & 2097152) != 0 ? null : str14, (i & 4194304) != 0 ? null : suggestionReasonType, (i & 8388608) != 0 ? null : suggestionReasonType2, (i & 16777216) != 0 ? null : streamItemSectionContext, (i & 33554432) != 0 ? null : digestSectionType, (i & 67108864) != 0 ? null : str15, (i & 134217728) != 0 ? null : str16, (i & 268435456) != 0 ? null : str17, (i & 536870912) != 0 ? null : str18, (i & 1073741824) != 0 ? null : num2, (i & Integer.MIN_VALUE) != 0 ? null : str19, (i2 & 1) != 0 ? null : str20, (i2 & 2) != 0 ? null : str21, (i2 & 4) != 0 ? null : str22, (i2 & 8) != 0 ? null : num3, (i2 & 16) != 0 ? null : str23, (i2 & 32) != 0 ? null : str24, (i2 & 64) != 0 ? null : str25, (i2 & 128) != 0 ? null : str26, (i2 & 256) != 0 ? null : str27, (i2 & 512) != 0 ? null : str28, (i2 & 1024) != 0 ? null : str29, (i2 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : num4, (i2 & 4096) != 0 ? h21.d : h21Var);
    }

    public final SourceParameter copy(String name, String user_id, Long timestamp, String dimension, String collection_id, String post_id, String tag_slug, String promo_id, Integer index, String catalog_id, String topic_id, String sequence_id, String author_id, String popchunk_id, String topic_slug, Long window_duration, SourceRssType rss_type, PostFeedReason post_feed_reason, PostFeedSource post_source, TagSource tag_source, IFTTTSource ifttt_source, String promotion_source, SuggestionReasonType collection_suggestion_reason, SuggestionReasonType user_suggestion_reason, StreamItemSectionContext section_type, DigestSectionType digest_section_type, String susi_entry, String email_id, String feed_id, String newsletter_id, Integer rank_position, String notification_type, String amp_email_identifier, String local_date_sent, String newsletter_v3_id, Integer ranked_module_type, String email_location, String book_id, String edition_id, String sub_collection_id, String collection_section_id, String highlight_group_id, String quote_id, Integer item_type, h21 unknownFields) {
        unknownFields.getClass();
        return new SourceParameter(name, user_id, timestamp, dimension, collection_id, post_id, tag_slug, promo_id, index, catalog_id, topic_id, sequence_id, author_id, popchunk_id, topic_slug, window_duration, rss_type, post_feed_reason, post_source, tag_source, ifttt_source, promotion_source, collection_suggestion_reason, user_suggestion_reason, section_type, digest_section_type, susi_entry, email_id, feed_id, newsletter_id, rank_position, notification_type, amp_email_identifier, local_date_sent, newsletter_v3_id, ranked_module_type, email_location, book_id, edition_id, sub_collection_id, collection_section_id, highlight_group_id, quote_id, item_type, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SourceParameter)) {
            return false;
        }
        SourceParameter sourceParameter = (SourceParameter) other;
        return g76.L(unknownFields(), sourceParameter.unknownFields()) && g76.L(this.name, sourceParameter.name) && g76.L(this.user_id, sourceParameter.user_id) && g76.L(this.timestamp, sourceParameter.timestamp) && g76.L(this.dimension, sourceParameter.dimension) && g76.L(this.collection_id, sourceParameter.collection_id) && g76.L(this.post_id, sourceParameter.post_id) && g76.L(this.tag_slug, sourceParameter.tag_slug) && g76.L(this.promo_id, sourceParameter.promo_id) && g76.L(this.index, sourceParameter.index) && g76.L(this.catalog_id, sourceParameter.catalog_id) && g76.L(this.topic_id, sourceParameter.topic_id) && g76.L(this.sequence_id, sourceParameter.sequence_id) && g76.L(this.author_id, sourceParameter.author_id) && g76.L(this.popchunk_id, sourceParameter.popchunk_id) && g76.L(this.topic_slug, sourceParameter.topic_slug) && g76.L(this.window_duration, sourceParameter.window_duration) && this.rss_type == sourceParameter.rss_type && this.post_feed_reason == sourceParameter.post_feed_reason && this.post_source == sourceParameter.post_source && this.tag_source == sourceParameter.tag_source && this.ifttt_source == sourceParameter.ifttt_source && g76.L(this.promotion_source, sourceParameter.promotion_source) && this.collection_suggestion_reason == sourceParameter.collection_suggestion_reason && this.user_suggestion_reason == sourceParameter.user_suggestion_reason && this.section_type == sourceParameter.section_type && this.digest_section_type == sourceParameter.digest_section_type && g76.L(this.susi_entry, sourceParameter.susi_entry) && g76.L(this.email_id, sourceParameter.email_id) && g76.L(this.feed_id, sourceParameter.feed_id) && g76.L(this.newsletter_id, sourceParameter.newsletter_id) && g76.L(this.rank_position, sourceParameter.rank_position) && g76.L(this.notification_type, sourceParameter.notification_type) && g76.L(this.amp_email_identifier, sourceParameter.amp_email_identifier) && g76.L(this.local_date_sent, sourceParameter.local_date_sent) && g76.L(this.newsletter_v3_id, sourceParameter.newsletter_v3_id) && g76.L(this.ranked_module_type, sourceParameter.ranked_module_type) && g76.L(this.email_location, sourceParameter.email_location) && g76.L(this.book_id, sourceParameter.book_id) && g76.L(this.edition_id, sourceParameter.edition_id) && g76.L(this.sub_collection_id, sourceParameter.sub_collection_id) && g76.L(this.collection_section_id, sourceParameter.collection_section_id) && g76.L(this.highlight_group_id, sourceParameter.highlight_group_id) && g76.L(this.quote_id, sourceParameter.quote_id) && g76.L(this.item_type, sourceParameter.item_type);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.name;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.user_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Long l = this.timestamp;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode3 + i) * 37;
        String str3 = this.dimension;
        int iHashCode4 = (i4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.collection_id;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.post_id;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.tag_slug;
        int iHashCode7 = (iHashCode6 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.promo_id;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Integer num = this.index;
        int iIntValue = (iHashCode8 + (num != null ? num.intValue() : 0)) * 37;
        String str8 = this.catalog_id;
        int iHashCode9 = (iIntValue + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.topic_id;
        int iHashCode10 = (iHashCode9 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.sequence_id;
        int iHashCode11 = (iHashCode10 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.author_id;
        int iHashCode12 = (iHashCode11 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.popchunk_id;
        int iHashCode13 = (iHashCode12 + (str12 != null ? str12.hashCode() : 0)) * 37;
        String str13 = this.topic_slug;
        int iHashCode14 = (iHashCode13 + (str13 != null ? str13.hashCode() : 0)) * 37;
        Long l2 = this.window_duration;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i5 = (iHashCode14 + i2) * 37;
        SourceRssType sourceRssType = this.rss_type;
        int iHashCode15 = (i5 + (sourceRssType != null ? sourceRssType.hashCode() : 0)) * 37;
        PostFeedReason postFeedReason = this.post_feed_reason;
        int iHashCode16 = (iHashCode15 + (postFeedReason != null ? postFeedReason.hashCode() : 0)) * 37;
        PostFeedSource postFeedSource = this.post_source;
        int iHashCode17 = (iHashCode16 + (postFeedSource != null ? postFeedSource.hashCode() : 0)) * 37;
        TagSource tagSource = this.tag_source;
        int iHashCode18 = (iHashCode17 + (tagSource != null ? tagSource.hashCode() : 0)) * 37;
        IFTTTSource iFTTTSource = this.ifttt_source;
        int iHashCode19 = (iHashCode18 + (iFTTTSource != null ? iFTTTSource.hashCode() : 0)) * 37;
        String str14 = this.promotion_source;
        int iHashCode20 = (iHashCode19 + (str14 != null ? str14.hashCode() : 0)) * 37;
        SuggestionReasonType suggestionReasonType = this.collection_suggestion_reason;
        int iHashCode21 = (iHashCode20 + (suggestionReasonType != null ? suggestionReasonType.hashCode() : 0)) * 37;
        SuggestionReasonType suggestionReasonType2 = this.user_suggestion_reason;
        int iHashCode22 = (iHashCode21 + (suggestionReasonType2 != null ? suggestionReasonType2.hashCode() : 0)) * 37;
        StreamItemSectionContext streamItemSectionContext = this.section_type;
        int iHashCode23 = (iHashCode22 + (streamItemSectionContext != null ? streamItemSectionContext.hashCode() : 0)) * 37;
        DigestSectionType digestSectionType = this.digest_section_type;
        int iHashCode24 = (iHashCode23 + (digestSectionType != null ? digestSectionType.hashCode() : 0)) * 37;
        String str15 = this.susi_entry;
        int iHashCode25 = (iHashCode24 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.email_id;
        int iHashCode26 = (iHashCode25 + (str16 != null ? str16.hashCode() : 0)) * 37;
        String str17 = this.feed_id;
        int iHashCode27 = (iHashCode26 + (str17 != null ? str17.hashCode() : 0)) * 37;
        String str18 = this.newsletter_id;
        int iHashCode28 = (iHashCode27 + (str18 != null ? str18.hashCode() : 0)) * 37;
        Integer num2 = this.rank_position;
        int iIntValue2 = (iHashCode28 + (num2 != null ? num2.intValue() : 0)) * 37;
        String str19 = this.notification_type;
        int iHashCode29 = (iIntValue2 + (str19 != null ? str19.hashCode() : 0)) * 37;
        String str20 = this.amp_email_identifier;
        int iHashCode30 = (iHashCode29 + (str20 != null ? str20.hashCode() : 0)) * 37;
        String str21 = this.local_date_sent;
        int iHashCode31 = (iHashCode30 + (str21 != null ? str21.hashCode() : 0)) * 37;
        String str22 = this.newsletter_v3_id;
        int iHashCode32 = (iHashCode31 + (str22 != null ? str22.hashCode() : 0)) * 37;
        Integer num3 = this.ranked_module_type;
        int iIntValue3 = (iHashCode32 + (num3 != null ? num3.intValue() : 0)) * 37;
        String str23 = this.email_location;
        int iHashCode33 = (iIntValue3 + (str23 != null ? str23.hashCode() : 0)) * 37;
        String str24 = this.book_id;
        int iHashCode34 = (iHashCode33 + (str24 != null ? str24.hashCode() : 0)) * 37;
        String str25 = this.edition_id;
        int iHashCode35 = (iHashCode34 + (str25 != null ? str25.hashCode() : 0)) * 37;
        String str26 = this.sub_collection_id;
        int iHashCode36 = (iHashCode35 + (str26 != null ? str26.hashCode() : 0)) * 37;
        String str27 = this.collection_section_id;
        int iHashCode37 = (iHashCode36 + (str27 != null ? str27.hashCode() : 0)) * 37;
        String str28 = this.highlight_group_id;
        int iHashCode38 = (iHashCode37 + (str28 != null ? str28.hashCode() : 0)) * 37;
        String str29 = this.quote_id;
        int iHashCode39 = (iHashCode38 + (str29 != null ? str29.hashCode() : 0)) * 37;
        Integer num4 = this.item_type;
        int iIntValue4 = iHashCode39 + (num4 != null ? num4.intValue() : 0);
        this.hashCode = iIntValue4;
        return iIntValue4;
    }

    @Override // com.squareup.wire.Message
    public final okc newBuilder() {
        okc okcVar = new okc();
        okcVar.a = this.name;
        okcVar.b = this.user_id;
        okcVar.c = this.timestamp;
        okcVar.d = this.dimension;
        okcVar.e = this.collection_id;
        okcVar.f = this.post_id;
        okcVar.g = this.tag_slug;
        okcVar.h = this.promo_id;
        okcVar.i = this.index;
        okcVar.j = this.catalog_id;
        okcVar.k = this.topic_id;
        okcVar.l = this.sequence_id;
        okcVar.m = this.author_id;
        okcVar.n = this.popchunk_id;
        okcVar.o = this.topic_slug;
        okcVar.p = this.window_duration;
        okcVar.q = this.rss_type;
        okcVar.r = this.post_feed_reason;
        okcVar.s = this.post_source;
        okcVar.t = this.tag_source;
        okcVar.u = this.ifttt_source;
        okcVar.v = this.promotion_source;
        okcVar.w = this.collection_suggestion_reason;
        okcVar.x = this.user_suggestion_reason;
        okcVar.y = this.section_type;
        okcVar.z = this.digest_section_type;
        okcVar.A = this.susi_entry;
        okcVar.B = this.email_id;
        okcVar.C = this.feed_id;
        okcVar.D = this.newsletter_id;
        okcVar.E = this.rank_position;
        okcVar.F = this.notification_type;
        okcVar.G = this.amp_email_identifier;
        okcVar.H = this.local_date_sent;
        okcVar.I = this.newsletter_v3_id;
        okcVar.J = this.ranked_module_type;
        okcVar.K = this.email_location;
        okcVar.L = this.book_id;
        okcVar.M = this.edition_id;
        okcVar.N = this.sub_collection_id;
        okcVar.O = this.collection_section_id;
        okcVar.P = this.highlight_group_id;
        okcVar.Q = this.quote_id;
        okcVar.R = this.item_type;
        okcVar.addUnknownFields(unknownFields());
        return okcVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.name;
        if (str != null) {
            lv8.D(str, "name=", arrayList);
        }
        String str2 = this.user_id;
        if (str2 != null) {
            lv8.D(str2, "user_id=", arrayList);
        }
        Long l = this.timestamp;
        if (l != null) {
            y30.A("timestamp=", l, arrayList);
        }
        String str3 = this.dimension;
        if (str3 != null) {
            lv8.D(str3, "dimension=", arrayList);
        }
        String str4 = this.collection_id;
        if (str4 != null) {
            lv8.D(str4, "collection_id=", arrayList);
        }
        String str5 = this.post_id;
        if (str5 != null) {
            lv8.D(str5, "post_id=", arrayList);
        }
        String str6 = this.tag_slug;
        if (str6 != null) {
            lv8.D(str6, "tag_slug=", arrayList);
        }
        String str7 = this.promo_id;
        if (str7 != null) {
            lv8.D(str7, "promo_id=", arrayList);
        }
        Integer num = this.index;
        if (num != null) {
            lv8.B("index=", num, arrayList);
        }
        String str8 = this.catalog_id;
        if (str8 != null) {
            lv8.D(str8, "catalog_id=", arrayList);
        }
        String str9 = this.topic_id;
        if (str9 != null) {
            lv8.D(str9, "topic_id=", arrayList);
        }
        String str10 = this.sequence_id;
        if (str10 != null) {
            lv8.D(str10, "sequence_id=", arrayList);
        }
        String str11 = this.author_id;
        if (str11 != null) {
            lv8.D(str11, "author_id=", arrayList);
        }
        String str12 = this.popchunk_id;
        if (str12 != null) {
            lv8.D(str12, "popchunk_id=", arrayList);
        }
        String str13 = this.topic_slug;
        if (str13 != null) {
            lv8.D(str13, "topic_slug=", arrayList);
        }
        Long l2 = this.window_duration;
        if (l2 != null) {
            y30.A("window_duration=", l2, arrayList);
        }
        SourceRssType sourceRssType = this.rss_type;
        if (sourceRssType != null) {
            arrayList.add("rss_type=" + sourceRssType);
        }
        PostFeedReason postFeedReason = this.post_feed_reason;
        if (postFeedReason != null) {
            arrayList.add("post_feed_reason=" + postFeedReason);
        }
        PostFeedSource postFeedSource = this.post_source;
        if (postFeedSource != null) {
            arrayList.add("post_source=" + postFeedSource);
        }
        TagSource tagSource = this.tag_source;
        if (tagSource != null) {
            arrayList.add("tag_source=" + tagSource);
        }
        IFTTTSource iFTTTSource = this.ifttt_source;
        if (iFTTTSource != null) {
            arrayList.add("ifttt_source=" + iFTTTSource);
        }
        String str14 = this.promotion_source;
        if (str14 != null) {
            lv8.D(str14, "promotion_source=", arrayList);
        }
        SuggestionReasonType suggestionReasonType = this.collection_suggestion_reason;
        if (suggestionReasonType != null) {
            arrayList.add("collection_suggestion_reason=" + suggestionReasonType);
        }
        SuggestionReasonType suggestionReasonType2 = this.user_suggestion_reason;
        if (suggestionReasonType2 != null) {
            arrayList.add("user_suggestion_reason=" + suggestionReasonType2);
        }
        StreamItemSectionContext streamItemSectionContext = this.section_type;
        if (streamItemSectionContext != null) {
            arrayList.add("section_type=" + streamItemSectionContext);
        }
        DigestSectionType digestSectionType = this.digest_section_type;
        if (digestSectionType != null) {
            arrayList.add("digest_section_type=" + digestSectionType);
        }
        String str15 = this.susi_entry;
        if (str15 != null) {
            lv8.D(str15, "susi_entry=", arrayList);
        }
        String str16 = this.email_id;
        if (str16 != null) {
            lv8.D(str16, "email_id=", arrayList);
        }
        String str17 = this.feed_id;
        if (str17 != null) {
            lv8.D(str17, "feed_id=", arrayList);
        }
        String str18 = this.newsletter_id;
        if (str18 != null) {
            lv8.D(str18, "newsletter_id=", arrayList);
        }
        Integer num2 = this.rank_position;
        if (num2 != null) {
            lv8.B("rank_position=", num2, arrayList);
        }
        String str19 = this.notification_type;
        if (str19 != null) {
            lv8.D(str19, "notification_type=", arrayList);
        }
        String str20 = this.amp_email_identifier;
        if (str20 != null) {
            lv8.D(str20, "amp_email_identifier=", arrayList);
        }
        String str21 = this.local_date_sent;
        if (str21 != null) {
            lv8.D(str21, "local_date_sent=", arrayList);
        }
        String str22 = this.newsletter_v3_id;
        if (str22 != null) {
            lv8.D(str22, "newsletter_v3_id=", arrayList);
        }
        Integer num3 = this.ranked_module_type;
        if (num3 != null) {
            lv8.B("ranked_module_type=", num3, arrayList);
        }
        String str23 = this.email_location;
        if (str23 != null) {
            lv8.D(str23, "email_location=", arrayList);
        }
        String str24 = this.book_id;
        if (str24 != null) {
            lv8.D(str24, "book_id=", arrayList);
        }
        String str25 = this.edition_id;
        if (str25 != null) {
            lv8.D(str25, "edition_id=", arrayList);
        }
        String str26 = this.sub_collection_id;
        if (str26 != null) {
            lv8.D(str26, "sub_collection_id=", arrayList);
        }
        String str27 = this.collection_section_id;
        if (str27 != null) {
            lv8.D(str27, "collection_section_id=", arrayList);
        }
        String str28 = this.highlight_group_id;
        if (str28 != null) {
            lv8.D(str28, "highlight_group_id=", arrayList);
        }
        String str29 = this.quote_id;
        if (str29 != null) {
            lv8.D(str29, "quote_id=", arrayList);
        }
        Integer num4 = this.item_type;
        if (num4 != null) {
            lv8.B("item_type=", num4, arrayList);
        }
        return bu1.F0(arrayList, ", ", "SourceParameter{", "}", null, 56);
    }

    public SourceParameter() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, 8191, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SourceParameter(String str, String str2, Long l, String str3, String str4, String str5, String str6, String str7, Integer num, String str8, String str9, String str10, String str11, String str12, String str13, Long l2, SourceRssType sourceRssType, PostFeedReason postFeedReason, PostFeedSource postFeedSource, TagSource tagSource, IFTTTSource iFTTTSource, String str14, SuggestionReasonType suggestionReasonType, SuggestionReasonType suggestionReasonType2, StreamItemSectionContext streamItemSectionContext, DigestSectionType digestSectionType, String str15, String str16, String str17, String str18, Integer num2, String str19, String str20, String str21, String str22, Integer num3, String str23, String str24, String str25, String str26, String str27, String str28, String str29, Integer num4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.name = str;
        this.user_id = str2;
        this.timestamp = l;
        this.dimension = str3;
        this.collection_id = str4;
        this.post_id = str5;
        this.tag_slug = str6;
        this.promo_id = str7;
        this.index = num;
        this.catalog_id = str8;
        this.topic_id = str9;
        this.sequence_id = str10;
        this.author_id = str11;
        this.popchunk_id = str12;
        this.topic_slug = str13;
        this.window_duration = l2;
        this.rss_type = sourceRssType;
        this.post_feed_reason = postFeedReason;
        this.post_source = postFeedSource;
        this.tag_source = tagSource;
        this.ifttt_source = iFTTTSource;
        this.promotion_source = str14;
        this.collection_suggestion_reason = suggestionReasonType;
        this.user_suggestion_reason = suggestionReasonType2;
        this.section_type = streamItemSectionContext;
        this.digest_section_type = digestSectionType;
        this.susi_entry = str15;
        this.email_id = str16;
        this.feed_id = str17;
        this.newsletter_id = str18;
        this.rank_position = num2;
        this.notification_type = str19;
        this.amp_email_identifier = str20;
        this.local_date_sent = str21;
        this.newsletter_v3_id = str22;
        this.ranked_module_type = num3;
        this.email_location = str23;
        this.book_id = str24;
        this.edition_id = str25;
        this.sub_collection_id = str26;
        this.collection_section_id = str27;
        this.highlight_group_id = str28;
        this.quote_id = str29;
        this.item_type = num4;
    }

    public static /* synthetic */ void getItem_type$annotations() {
    }
}
