package com.medium.proto.event;

import android.os.Parcelable;
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
import defpackage.he9;
import defpackage.ie9;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ_\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010 ¨\u0006#"}, d2 = {"Lcom/medium/proto/event/PostAudioStopped;", "Lcom/squareup/wire/AndroidMessage;", "Lhe9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "", "start_time", "end_time", "total_track_time", "playback_words_per_minute", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lhe9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lh21;)Lcom/medium/proto/event/PostAudioStopped;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "ie9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.audioStopped")
public final class PostAudioStopped extends AndroidMessage<PostAudioStopped, he9> {
    public static final ProtoAdapter<PostAudioStopped> ADAPTER;
    public static final Parcelable.Creator<PostAudioStopped> CREATOR;
    public static final ie9 Companion = new ie9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long end_time;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 5, tag = 6)
    public final Long playback_words_per_minute;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long start_time;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 4, tag = 5)
    public final Long total_track_time;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostAudioStopped.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostAudioStopped> protoAdapter = new ProtoAdapter<PostAudioStopped>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostAudioStopped$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostAudioStopped decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Long lDecode3 = null;
                Long lDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostAudioStopped(analyticsEventCommonFieldsDecode, strDecode, lDecode, lDecode2, lDecode3, lDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 4:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 5:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 6:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostAudioStopped value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 3, value.start_time);
                protoAdapter2.encodeWithTag(writer, 4, value.end_time);
                protoAdapter2.encodeWithTag(writer, 5, value.total_track_time);
                protoAdapter2.encodeWithTag(writer, 6, value.playback_words_per_minute);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostAudioStopped value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.STRING.encodedSizeWithTag(2, value.post_id) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                return protoAdapter2.encodedSizeWithTag(6, value.playback_words_per_minute) + protoAdapter2.encodedSizeWithTag(5, value.total_track_time) + protoAdapter2.encodedSizeWithTag(4, value.end_time) + protoAdapter2.encodedSizeWithTag(3, value.start_time) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostAudioStopped redact(PostAudioStopped value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PostAudioStopped.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, h21.d, 62, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostAudioStopped value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 6, value.playback_words_per_minute);
                protoAdapter2.encodeWithTag(writer, 5, value.total_track_time);
                protoAdapter2.encodeWithTag(writer, 4, value.end_time);
                protoAdapter2.encodeWithTag(writer, 3, value.start_time);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostAudioStopped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, Long l3, Long l4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : l2, (i & 16) != 0 ? null : l3, (i & 32) != 0 ? null : l4, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostAudioStopped copy$default(PostAudioStopped postAudioStopped, AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, Long l3, Long l4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = postAudioStopped.common_fields;
        }
        if ((i & 2) != 0) {
            str = postAudioStopped.post_id;
        }
        if ((i & 4) != 0) {
            l = postAudioStopped.start_time;
        }
        if ((i & 8) != 0) {
            l2 = postAudioStopped.end_time;
        }
        if ((i & 16) != 0) {
            l3 = postAudioStopped.total_track_time;
        }
        if ((i & 32) != 0) {
            l4 = postAudioStopped.playback_words_per_minute;
        }
        if ((i & 64) != 0) {
            h21Var = postAudioStopped.unknownFields();
        }
        Long l5 = l4;
        h21 h21Var2 = h21Var;
        Long l6 = l3;
        Long l7 = l;
        return postAudioStopped.copy(analyticsEventCommonFields, str, l7, l2, l6, l5, h21Var2);
    }

    public final PostAudioStopped copy(AnalyticsEventCommonFields common_fields, String post_id, Long start_time, Long end_time, Long total_track_time, Long playback_words_per_minute, h21 unknownFields) {
        unknownFields.getClass();
        return new PostAudioStopped(common_fields, post_id, start_time, end_time, total_track_time, playback_words_per_minute, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostAudioStopped)) {
            return false;
        }
        PostAudioStopped postAudioStopped = (PostAudioStopped) other;
        return g76.L(unknownFields(), postAudioStopped.unknownFields()) && g76.L(this.common_fields, postAudioStopped.common_fields) && g76.L(this.post_id, postAudioStopped.post_id) && g76.L(this.start_time, postAudioStopped.start_time) && g76.L(this.end_time, postAudioStopped.end_time) && g76.L(this.total_track_time, postAudioStopped.total_track_time) && g76.L(this.playback_words_per_minute, postAudioStopped.playback_words_per_minute);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4 = this.hashCode;
        if (i4 != 0) {
            return i4;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int i5 = 0;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        Long l = this.start_time;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i6 = (iHashCode3 + i) * 37;
        Long l2 = this.end_time;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i7 = (i6 + i2) * 37;
        Long l3 = this.total_track_time;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i8 = (i7 + i3) * 37;
        Long l4 = this.playback_words_per_minute;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i5 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        }
        int i9 = i8 + i5;
        this.hashCode = i9;
        return i9;
    }

    @Override // com.squareup.wire.Message
    public final he9 newBuilder() {
        he9 he9Var = new he9();
        he9Var.a = this.common_fields;
        he9Var.b = this.post_id;
        he9Var.c = this.start_time;
        he9Var.d = this.end_time;
        he9Var.e = this.total_track_time;
        he9Var.f = this.playback_words_per_minute;
        he9Var.addUnknownFields(unknownFields());
        return he9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        Long l = this.start_time;
        if (l != null) {
            y30.A("start_time=", l, arrayList);
        }
        Long l2 = this.end_time;
        if (l2 != null) {
            y30.A("end_time=", l2, arrayList);
        }
        Long l3 = this.total_track_time;
        if (l3 != null) {
            y30.A("total_track_time=", l3, arrayList);
        }
        Long l4 = this.playback_words_per_minute;
        if (l4 != null) {
            y30.A("playback_words_per_minute=", l4, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostAudioStopped{", "}", null, 56);
    }

    public PostAudioStopped() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostAudioStopped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, Long l2, Long l3, Long l4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.start_time = l;
        this.end_time = l2;
        this.total_track_time = l3;
        this.playback_words_per_minute = l4;
    }
}
