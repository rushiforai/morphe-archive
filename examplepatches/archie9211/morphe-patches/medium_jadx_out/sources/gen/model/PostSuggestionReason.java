package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.dq9;
import defpackage.eq9;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\u0018\u0000 /2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00020B\u00ad\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\u0007\u0012\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u0007\u0012\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0007\u0012\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u0007\u0012\u000e\b\u0002\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u0007\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\b\b\u0002\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u001a\u0010\"\u001a\u00020!2\b\u0010 \u001a\u0004\u0018\u00010\u001fH\u0096\u0002¢\u0006\u0004\b\"\u0010#J\u000f\u0010$\u001a\u00020\u0017H\u0016¢\u0006\u0004\b$\u0010%J\u000f\u0010&\u001a\u00020\u0005H\u0016¢\u0006\u0004\b&\u0010'J³\u0001\u0010(\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u000e\b\u0002\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\u00072\u000e\b\u0002\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u00072\u000e\b\u0002\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u00072\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u00072\u000e\b\u0002\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00072\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\b\b\u0002\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b(\u0010)R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010*R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010+R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010,R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010+R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010-R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010.R\u001a\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\n0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010.R\u001a\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010.R\u001a\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010.R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00100\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010.R\u001a\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010.¨\u00061"}, d2 = {"Lgen/model/PostSuggestionReason;", "Lcom/squareup/wire/AndroidMessage;", "Ldq9;", "Lgen/model/PostFeedReason;", "reason", "", "description_override", "", "Lgen/model/DismissOption;", "dismiss_options", "Lgen/model/SuggestionReasonCollection;", "collections", "Lgen/model/SuggestionReasonUser;", "users", "Lgen/model/SuggestionReasonTag;", "tags", "Lgen/model/SuggestionReasonTopic;", "topics", "Lgen/model/SuggestionReasonPopchunk;", "popchunks", "", "window_duration", "feed_id", "", "rank_position", "Lh21;", "unknownFields", "<init>", "(Lgen/model/PostFeedReason;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Ldq9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/PostFeedReason;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lgen/model/PostSuggestionReason;", "Lgen/model/PostFeedReason;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/lang/Integer;", "Ljava/util/List;", "Companion", "eq9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostSuggestionReason extends AndroidMessage<PostSuggestionReason, dq9> {
    public static final ProtoAdapter<PostSuggestionReason> ADAPTER;
    public static final Parcelable.Creator<PostSuggestionReason> CREATOR;
    public static final eq9 Companion = new eq9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.SuggestionReasonCollection#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 2)
    public final List<SuggestionReasonCollection> collections;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 6)
    public final String description_override;

    @WireField(adapter = "gen.model.DismissOption#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 2, tag = 5)
    public final List<DismissOption> dismiss_options;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String feed_id;

    @WireField(adapter = "gen.model.SuggestionReasonPopchunk#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 7, tag = 8)
    public final List<SuggestionReasonPopchunk> popchunks;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 10, tag = 11)
    public final Integer rank_position;

    @WireField(adapter = "gen.model.PostFeedReason#ADAPTER", schemaIndex = 0, tag = 1)
    public final PostFeedReason reason;

    @WireField(adapter = "gen.model.SuggestionReasonTag#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 5, tag = 4)
    public final List<SuggestionReasonTag> tags;

    @WireField(adapter = "gen.model.SuggestionReasonTopic#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 6, tag = 7)
    public final List<SuggestionReasonTopic> topics;

    @WireField(adapter = "gen.model.SuggestionReasonUser#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 4, tag = 3)
    public final List<SuggestionReasonUser> users;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 8, tag = 9)
    public final Long window_duration;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostSuggestionReason.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostSuggestionReason> protoAdapter = new ProtoAdapter<PostSuggestionReason>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.PostSuggestionReason$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0030. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostSuggestionReason decode(ProtoReader reader) {
                PostFeedReason postFeedReason;
                ArrayList arrayList;
                ArrayList arrayList2;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList3 = new ArrayList();
                ArrayList arrayList4 = new ArrayList();
                ArrayList arrayList5 = new ArrayList();
                ArrayList arrayList6 = new ArrayList();
                ArrayList arrayList7 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                PostFeedReason postFeedReasonDecode = null;
                String strDecode = null;
                Long lDecode = null;
                String strDecode2 = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostSuggestionReason(postFeedReasonDecode, strDecode, arrayListF, arrayList3, arrayList4, arrayList5, arrayList6, arrayList7, lDecode, strDecode2, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            try {
                                postFeedReasonDecode = PostFeedReason.ADAPTER.decode(reader);
                                arrayList = arrayListF;
                                arrayList2 = arrayList3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                postFeedReason = postFeedReasonDecode;
                                arrayList = arrayListF;
                                arrayList2 = arrayList3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                postFeedReasonDecode = postFeedReason;
                            }
                            break;
                        case 2:
                            arrayList3.add(SuggestionReasonCollection.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 3:
                            arrayList4.add(SuggestionReasonUser.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 4:
                            arrayList5.add(SuggestionReasonTag.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 5:
                            arrayListF.add(DismissOption.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 6:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            break;
                        case 7:
                            arrayList6.add(SuggestionReasonTopic.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 8:
                            arrayList7.add(SuggestionReasonPopchunk.ADAPTER.decode(reader));
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                        case 9:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            break;
                        case 10:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            break;
                        case 11:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            postFeedReason = postFeedReasonDecode;
                            arrayList = arrayListF;
                            arrayList2 = arrayList3;
                            postFeedReasonDecode = postFeedReason;
                            break;
                    }
                    arrayListF = arrayList;
                    arrayList3 = arrayList2;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostSuggestionReason value) {
                writer.getClass();
                value.getClass();
                PostFeedReason.ADAPTER.encodeWithTag(writer, 1, value.reason);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.description_override);
                DismissOption.ADAPTER.asRepeated().encodeWithTag(writer, 5, value.dismiss_options);
                SuggestionReasonCollection.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.collections);
                SuggestionReasonUser.ADAPTER.asRepeated().encodeWithTag(writer, 3, value.users);
                SuggestionReasonTag.ADAPTER.asRepeated().encodeWithTag(writer, 4, value.tags);
                SuggestionReasonTopic.ADAPTER.asRepeated().encodeWithTag(writer, 7, value.topics);
                SuggestionReasonPopchunk.ADAPTER.asRepeated().encodeWithTag(writer, 8, value.popchunks);
                ProtoAdapter.INT64.encodeWithTag(writer, 9, value.window_duration);
                protoAdapter2.encodeWithTag(writer, 10, value.feed_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 11, value.rank_position);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostSuggestionReason value) {
                value.getClass();
                int iEncodedSizeWithTag = PostFeedReason.ADAPTER.encodedSizeWithTag(1, value.reason) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT32.encodedSizeWithTag(11, value.rank_position) + protoAdapter2.encodedSizeWithTag(10, value.feed_id) + ProtoAdapter.INT64.encodedSizeWithTag(9, value.window_duration) + SuggestionReasonPopchunk.ADAPTER.asRepeated().encodedSizeWithTag(8, value.popchunks) + SuggestionReasonTopic.ADAPTER.asRepeated().encodedSizeWithTag(7, value.topics) + SuggestionReasonTag.ADAPTER.asRepeated().encodedSizeWithTag(4, value.tags) + SuggestionReasonUser.ADAPTER.asRepeated().encodedSizeWithTag(3, value.users) + SuggestionReasonCollection.ADAPTER.asRepeated().encodedSizeWithTag(2, value.collections) + DismissOption.ADAPTER.asRepeated().encodedSizeWithTag(5, value.dismiss_options) + protoAdapter2.encodedSizeWithTag(6, value.description_override) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostSuggestionReason redact(PostSuggestionReason value) {
                value.getClass();
                return PostSuggestionReason.copy$default(value, null, null, Internal.m97redactElements(value.dismiss_options, DismissOption.ADAPTER), Internal.m97redactElements(value.collections, SuggestionReasonCollection.ADAPTER), Internal.m97redactElements(value.users, SuggestionReasonUser.ADAPTER), Internal.m97redactElements(value.tags, SuggestionReasonTag.ADAPTER), Internal.m97redactElements(value.topics, SuggestionReasonTopic.ADAPTER), Internal.m97redactElements(value.popchunks, SuggestionReasonPopchunk.ADAPTER), null, null, null, h21.d, 1795, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostSuggestionReason value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 11, value.rank_position);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 10, value.feed_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 9, value.window_duration);
                SuggestionReasonPopchunk.ADAPTER.asRepeated().encodeWithTag(writer, 8, value.popchunks);
                SuggestionReasonTopic.ADAPTER.asRepeated().encodeWithTag(writer, 7, value.topics);
                SuggestionReasonTag.ADAPTER.asRepeated().encodeWithTag(writer, 4, value.tags);
                SuggestionReasonUser.ADAPTER.asRepeated().encodeWithTag(writer, 3, value.users);
                SuggestionReasonCollection.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.collections);
                DismissOption.ADAPTER.asRepeated().encodeWithTag(writer, 5, value.dismiss_options);
                protoAdapter2.encodeWithTag(writer, 6, value.description_override);
                PostFeedReason.ADAPTER.encodeWithTag(writer, 1, value.reason);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ PostSuggestionReason(PostFeedReason postFeedReason, String str, List list, List list2, List list3, List list4, List list5, List list6, Long l, String str2, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        postFeedReason = (i & 1) != 0 ? null : postFeedReason;
        str = (i & 2) != 0 ? null : str;
        int i2 = i & 4;
        List list7 = ey3.a;
        this(postFeedReason, str, i2 != 0 ? list7 : list, (i & 8) != 0 ? list7 : list2, (i & 16) != 0 ? list7 : list3, (i & 32) != 0 ? list7 : list4, (i & 64) != 0 ? list7 : list5, (i & 128) == 0 ? list6 : list7, (i & 256) != 0 ? null : l, (i & 512) != 0 ? null : str2, (i & 1024) == 0 ? num : null, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ PostSuggestionReason copy$default(PostSuggestionReason postSuggestionReason, PostFeedReason postFeedReason, String str, List list, List list2, List list3, List list4, List list5, List list6, Long l, String str2, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            postFeedReason = postSuggestionReason.reason;
        }
        if ((i & 2) != 0) {
            str = postSuggestionReason.description_override;
        }
        if ((i & 4) != 0) {
            list = postSuggestionReason.dismiss_options;
        }
        if ((i & 8) != 0) {
            list2 = postSuggestionReason.collections;
        }
        if ((i & 16) != 0) {
            list3 = postSuggestionReason.users;
        }
        if ((i & 32) != 0) {
            list4 = postSuggestionReason.tags;
        }
        if ((i & 64) != 0) {
            list5 = postSuggestionReason.topics;
        }
        if ((i & 128) != 0) {
            list6 = postSuggestionReason.popchunks;
        }
        if ((i & 256) != 0) {
            l = postSuggestionReason.window_duration;
        }
        if ((i & 512) != 0) {
            str2 = postSuggestionReason.feed_id;
        }
        if ((i & 1024) != 0) {
            num = postSuggestionReason.rank_position;
        }
        if ((i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0) {
            h21Var = postSuggestionReason.unknownFields();
        }
        Integer num2 = num;
        h21 h21Var2 = h21Var;
        Long l2 = l;
        String str3 = str2;
        List list7 = list5;
        List list8 = list6;
        List list9 = list3;
        List list10 = list4;
        return postSuggestionReason.copy(postFeedReason, str, list, list2, list9, list10, list7, list8, l2, str3, num2, h21Var2);
    }

    public final PostSuggestionReason copy(PostFeedReason reason, String description_override, List<DismissOption> dismiss_options, List<SuggestionReasonCollection> collections, List<SuggestionReasonUser> users, List<SuggestionReasonTag> tags, List<SuggestionReasonTopic> topics, List<SuggestionReasonPopchunk> popchunks, Long window_duration, String feed_id, Integer rank_position, h21 unknownFields) {
        dismiss_options.getClass();
        collections.getClass();
        users.getClass();
        tags.getClass();
        topics.getClass();
        popchunks.getClass();
        unknownFields.getClass();
        return new PostSuggestionReason(reason, description_override, dismiss_options, collections, users, tags, topics, popchunks, window_duration, feed_id, rank_position, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostSuggestionReason)) {
            return false;
        }
        PostSuggestionReason postSuggestionReason = (PostSuggestionReason) other;
        return g76.L(unknownFields(), postSuggestionReason.unknownFields()) && this.reason == postSuggestionReason.reason && g76.L(this.description_override, postSuggestionReason.description_override) && g76.L(this.dismiss_options, postSuggestionReason.dismiss_options) && g76.L(this.collections, postSuggestionReason.collections) && g76.L(this.users, postSuggestionReason.users) && g76.L(this.tags, postSuggestionReason.tags) && g76.L(this.topics, postSuggestionReason.topics) && g76.L(this.popchunks, postSuggestionReason.popchunks) && g76.L(this.window_duration, postSuggestionReason.window_duration) && g76.L(this.feed_id, postSuggestionReason.feed_id) && g76.L(this.rank_position, postSuggestionReason.rank_position);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        PostFeedReason postFeedReason = this.reason;
        int iHashCode2 = (iHashCode + (postFeedReason != null ? postFeedReason.hashCode() : 0)) * 37;
        String str = this.description_override;
        int iP = wgd.p(wgd.p(wgd.p(wgd.p(wgd.p(wgd.p((iHashCode2 + (str != null ? str.hashCode() : 0)) * 37, 37, this.dismiss_options), 37, this.collections), 37, this.users), 37, this.tags), 37, this.topics), 37, this.popchunks);
        Long l = this.window_duration;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i3 = (iP + i) * 37;
        String str2 = this.feed_id;
        int iHashCode3 = (i3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Integer num = this.rank_position;
        int iIntValue = iHashCode3 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final dq9 newBuilder() {
        dq9 dq9Var = new dq9();
        ey3 ey3Var = ey3.a;
        dq9Var.c = ey3Var;
        dq9Var.d = ey3Var;
        dq9Var.e = ey3Var;
        dq9Var.f = ey3Var;
        dq9Var.g = ey3Var;
        dq9Var.h = ey3Var;
        dq9Var.a = this.reason;
        dq9Var.b = this.description_override;
        dq9Var.c = this.dismiss_options;
        dq9Var.d = this.collections;
        dq9Var.e = this.users;
        dq9Var.f = this.tags;
        dq9Var.g = this.topics;
        dq9Var.h = this.popchunks;
        dq9Var.i = this.window_duration;
        dq9Var.j = this.feed_id;
        dq9Var.k = this.rank_position;
        dq9Var.addUnknownFields(unknownFields());
        return dq9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        PostFeedReason postFeedReason = this.reason;
        if (postFeedReason != null) {
            arrayList.add("reason=" + postFeedReason);
        }
        String str = this.description_override;
        if (str != null) {
            lv8.D(str, "description_override=", arrayList);
        }
        if (!this.dismiss_options.isEmpty()) {
            b09.J("dismiss_options=", this.dismiss_options, arrayList);
        }
        if (!this.collections.isEmpty()) {
            b09.J("collections=", this.collections, arrayList);
        }
        if (!this.users.isEmpty()) {
            b09.J("users=", this.users, arrayList);
        }
        if (!this.tags.isEmpty()) {
            b09.J("tags=", this.tags, arrayList);
        }
        if (!this.topics.isEmpty()) {
            b09.J("topics=", this.topics, arrayList);
        }
        if (!this.popchunks.isEmpty()) {
            b09.J("popchunks=", this.popchunks, arrayList);
        }
        Long l = this.window_duration;
        if (l != null) {
            y30.A("window_duration=", l, arrayList);
        }
        String str2 = this.feed_id;
        if (str2 != null) {
            lv8.D(str2, "feed_id=", arrayList);
        }
        Integer num = this.rank_position;
        if (num != null) {
            lv8.B("rank_position=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostSuggestionReason{", "}", null, 56);
    }

    public PostSuggestionReason() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, 4095, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostSuggestionReason(PostFeedReason postFeedReason, String str, List<DismissOption> list, List<SuggestionReasonCollection> list2, List<SuggestionReasonUser> list3, List<SuggestionReasonTag> list4, List<SuggestionReasonTopic> list5, List<SuggestionReasonPopchunk> list6, Long l, String str2, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        list3.getClass();
        list4.getClass();
        list5.getClass();
        list6.getClass();
        h21Var.getClass();
        this.reason = postFeedReason;
        this.description_override = str;
        this.window_duration = l;
        this.feed_id = str2;
        this.rank_position = num;
        this.dismiss_options = Internal.immutableCopyOf("dismiss_options", list);
        this.collections = Internal.immutableCopyOf("collections", list2);
        this.users = Internal.immutableCopyOf("users", list3);
        this.tags = Internal.immutableCopyOf("tags", list4);
        this.topics = Internal.immutableCopyOf("topics", list5);
        this.popchunks = Internal.immutableCopyOf("popchunks", list6);
    }
}
