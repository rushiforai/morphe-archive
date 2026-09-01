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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.we9;
import defpackage.wg6;
import defpackage.xe9;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/PostClap;", "Lcom/squareup/wire/AndroidMessage;", "Lwe9;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "source", "", "vote_count", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lwe9;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/PostClap;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "xe9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("post.clientUpvote")
public final class PostClap extends AndroidMessage<PostClap, we9> {
    public static final ProtoAdapter<PostClap> ADAPTER;
    public static final Parcelable.Creator<PostClap> CREATOR;
    public static final xe9 Companion = new xe9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 4)
    public final Integer vote_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostClap.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostClap> protoAdapter = new ProtoAdapter<PostClap>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PostClap$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostClap decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostClap(analyticsEventCommonFieldsDecode, strDecode, strDecode2, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostClap value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.source);
                ProtoAdapter.INT32.encodeWithTag(writer, 4, value.vote_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostClap value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT32.encodedSizeWithTag(4, value.vote_count) + protoAdapter2.encodedSizeWithTag(3, value.source) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostClap redact(PostClap value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PostClap.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostClap value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 4, value.vote_count);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.source);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostClap(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : num, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostClap copy$default(PostClap postClap, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = postClap.common_fields;
        }
        if ((i & 2) != 0) {
            str = postClap.post_id;
        }
        if ((i & 4) != 0) {
            str2 = postClap.source;
        }
        if ((i & 8) != 0) {
            num = postClap.vote_count;
        }
        if ((i & 16) != 0) {
            h21Var = postClap.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str3 = str2;
        return postClap.copy(analyticsEventCommonFields, str, str3, num, h21Var2);
    }

    public final PostClap copy(AnalyticsEventCommonFields common_fields, String post_id, String source, Integer vote_count, h21 unknownFields) {
        unknownFields.getClass();
        return new PostClap(common_fields, post_id, source, vote_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostClap)) {
            return false;
        }
        PostClap postClap = (PostClap) other;
        return g76.L(unknownFields(), postClap.unknownFields()) && g76.L(this.common_fields, postClap.common_fields) && g76.L(this.post_id, postClap.post_id) && g76.L(this.source, postClap.source) && g76.L(this.vote_count, postClap.vote_count);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.source;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Integer num = this.vote_count;
        int iIntValue = iHashCode4 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final we9 newBuilder() {
        we9 we9Var = new we9();
        we9Var.a = this.common_fields;
        we9Var.b = this.post_id;
        we9Var.c = this.source;
        we9Var.d = this.vote_count;
        we9Var.addUnknownFields(unknownFields());
        return we9Var;
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
        String str2 = this.source;
        if (str2 != null) {
            lv8.D(str2, "source=", arrayList);
        }
        Integer num = this.vote_count;
        if (num != null) {
            lv8.B("vote_count=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PostClap{", "}", null, 56);
    }

    public PostClap() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostClap(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.source = str2;
        this.vote_count = num;
    }
}
