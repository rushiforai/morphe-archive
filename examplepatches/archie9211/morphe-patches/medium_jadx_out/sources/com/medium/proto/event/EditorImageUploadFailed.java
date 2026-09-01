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
import defpackage.av3;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import defpackage.zu3;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJS\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001f¨\u0006\""}, d2 = {"Lcom/medium/proto/event/EditorImageUploadFailed;", "Lcom/squareup/wire/AndroidMessage;", "Lzu3;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "client_post_id", "context", "", "editor_session_started_at", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lzu3;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Lh21;)Lcom/medium/proto/event/EditorImageUploadFailed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "av3", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("editor.imageUploadFailed")
public final class EditorImageUploadFailed extends AndroidMessage<EditorImageUploadFailed, zu3> {
    public static final ProtoAdapter<EditorImageUploadFailed> ADAPTER;
    public static final Parcelable.Creator<EditorImageUploadFailed> CREATOR;
    public static final av3 Companion = new av3();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "clientPostId", schemaIndex = 2, tag = 3)
    public final String client_post_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String context;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", jsonName = "editorSessionStartedAt", schemaIndex = 4, tag = 5)
    public final Long editor_session_started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(EditorImageUploadFailed.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<EditorImageUploadFailed> protoAdapter = new ProtoAdapter<EditorImageUploadFailed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.EditorImageUploadFailed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final EditorImageUploadFailed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Long lDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new EditorImageUploadFailed(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, lDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, EditorImageUploadFailed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.client_post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.context);
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.editor_session_started_at);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(EditorImageUploadFailed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT64.encodedSizeWithTag(5, value.editor_session_started_at) + protoAdapter2.encodedSizeWithTag(4, value.context) + protoAdapter2.encodedSizeWithTag(3, value.client_post_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final EditorImageUploadFailed redact(EditorImageUploadFailed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return EditorImageUploadFailed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, EditorImageUploadFailed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.editor_session_started_at);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.context);
                protoAdapter2.encodeWithTag(writer, 3, value.client_post_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ EditorImageUploadFailed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : l, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ EditorImageUploadFailed copy$default(EditorImageUploadFailed editorImageUploadFailed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = editorImageUploadFailed.common_fields;
        }
        if ((i & 2) != 0) {
            str = editorImageUploadFailed.post_id;
        }
        if ((i & 4) != 0) {
            str2 = editorImageUploadFailed.client_post_id;
        }
        if ((i & 8) != 0) {
            str3 = editorImageUploadFailed.context;
        }
        if ((i & 16) != 0) {
            l = editorImageUploadFailed.editor_session_started_at;
        }
        if ((i & 32) != 0) {
            h21Var = editorImageUploadFailed.unknownFields();
        }
        Long l2 = l;
        h21 h21Var2 = h21Var;
        return editorImageUploadFailed.copy(analyticsEventCommonFields, str, str2, str3, l2, h21Var2);
    }

    public final EditorImageUploadFailed copy(AnalyticsEventCommonFields common_fields, String post_id, String client_post_id, String context, Long editor_session_started_at, h21 unknownFields) {
        unknownFields.getClass();
        return new EditorImageUploadFailed(common_fields, post_id, client_post_id, context, editor_session_started_at, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof EditorImageUploadFailed)) {
            return false;
        }
        EditorImageUploadFailed editorImageUploadFailed = (EditorImageUploadFailed) other;
        return g76.L(unknownFields(), editorImageUploadFailed.unknownFields()) && g76.L(this.common_fields, editorImageUploadFailed.common_fields) && g76.L(this.post_id, editorImageUploadFailed.post_id) && g76.L(this.client_post_id, editorImageUploadFailed.client_post_id) && g76.L(this.context, editorImageUploadFailed.context) && g76.L(this.editor_session_started_at, editorImageUploadFailed.editor_session_started_at);
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
        String str2 = this.client_post_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.context;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Long l = this.editor_session_started_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        }
        int i3 = iHashCode5 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final zu3 newBuilder() {
        zu3 zu3Var = new zu3();
        zu3Var.a = this.common_fields;
        zu3Var.b = this.post_id;
        zu3Var.c = this.client_post_id;
        zu3Var.d = this.context;
        zu3Var.e = this.editor_session_started_at;
        zu3Var.addUnknownFields(unknownFields());
        return zu3Var;
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
        String str2 = this.client_post_id;
        if (str2 != null) {
            lv8.D(str2, "client_post_id=", arrayList);
        }
        String str3 = this.context;
        if (str3 != null) {
            lv8.D(str3, "context=", arrayList);
        }
        Long l = this.editor_session_started_at;
        if (l != null) {
            y30.A("editor_session_started_at=", l, arrayList);
        }
        return bu1.F0(arrayList, ", ", "EditorImageUploadFailed{", "}", null, 56);
    }

    public EditorImageUploadFailed() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditorImageUploadFailed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.client_post_id = str2;
        this.context = str3;
        this.editor_session_started_at = l;
    }
}
