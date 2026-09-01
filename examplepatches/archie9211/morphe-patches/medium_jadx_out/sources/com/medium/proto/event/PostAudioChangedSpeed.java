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
import defpackage.be9;
import defpackage.bu1;
import defpackage.ce9;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J;\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/PostAudioChangedSpeed;", "Lcom/squareup/wire/AndroidMessage;", "Lbe9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "", "playback_words_per_minute", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lbe9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Long;Lh21;)Lcom/medium/proto/event/PostAudioChangedSpeed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "ce9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.audioChangedSpeed")
public final class PostAudioChangedSpeed extends AndroidMessage<PostAudioChangedSpeed, be9> {
    public static final ProtoAdapter<PostAudioChangedSpeed> ADAPTER;
    public static final Parcelable.Creator<PostAudioChangedSpeed> CREATOR;
    public static final ce9 Companion = new ce9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long playback_words_per_minute;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostAudioChangedSpeed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostAudioChangedSpeed> protoAdapter = new ProtoAdapter<PostAudioChangedSpeed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostAudioChangedSpeed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostAudioChangedSpeed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                Long lDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostAudioChangedSpeed(analyticsEventCommonFieldsDecode, strDecode, lDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostAudioChangedSpeed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.playback_words_per_minute);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostAudioChangedSpeed value) {
                value.getClass();
                return ProtoAdapter.INT64.encodedSizeWithTag(3, value.playback_words_per_minute) + ProtoAdapter.STRING.encodedSizeWithTag(2, value.post_id) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostAudioChangedSpeed redact(PostAudioChangedSpeed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PostAudioChangedSpeed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostAudioChangedSpeed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.playback_words_per_minute);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostAudioChangedSpeed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : l, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostAudioChangedSpeed copy$default(PostAudioChangedSpeed postAudioChangedSpeed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = postAudioChangedSpeed.common_fields;
        }
        if ((i & 2) != 0) {
            str = postAudioChangedSpeed.post_id;
        }
        if ((i & 4) != 0) {
            l = postAudioChangedSpeed.playback_words_per_minute;
        }
        if ((i & 8) != 0) {
            h21Var = postAudioChangedSpeed.unknownFields();
        }
        return postAudioChangedSpeed.copy(analyticsEventCommonFields, str, l, h21Var);
    }

    public final PostAudioChangedSpeed copy(AnalyticsEventCommonFields common_fields, String post_id, Long playback_words_per_minute, h21 unknownFields) {
        unknownFields.getClass();
        return new PostAudioChangedSpeed(common_fields, post_id, playback_words_per_minute, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostAudioChangedSpeed)) {
            return false;
        }
        PostAudioChangedSpeed postAudioChangedSpeed = (PostAudioChangedSpeed) other;
        return g76.L(unknownFields(), postAudioChangedSpeed.unknownFields()) && g76.L(this.common_fields, postAudioChangedSpeed.common_fields) && g76.L(this.post_id, postAudioChangedSpeed.post_id) && g76.L(this.playback_words_per_minute, postAudioChangedSpeed.playback_words_per_minute);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        Long l = this.playback_words_per_minute;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        }
        int i3 = iHashCode3 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final be9 newBuilder() {
        be9 be9Var = new be9();
        be9Var.a = this.common_fields;
        be9Var.b = this.post_id;
        be9Var.c = this.playback_words_per_minute;
        be9Var.addUnknownFields(unknownFields());
        return be9Var;
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
        Long l = this.playback_words_per_minute;
        if (l != null) {
            y30.A("playback_words_per_minute=", l, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostAudioChangedSpeed{", "}", null, 56);
    }

    public PostAudioChangedSpeed() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostAudioChangedSpeed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Long l, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.playback_words_per_minute = l;
    }
}
