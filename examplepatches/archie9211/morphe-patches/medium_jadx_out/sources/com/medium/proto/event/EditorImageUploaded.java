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
import defpackage.bv3;
import defpackage.cv3;
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
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ_\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001f¨\u0006#"}, d2 = {"Lcom/medium/proto/event/EditorImageUploaded;", "Lcom/squareup/wire/AndroidMessage;", "Lbv3;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "client_post_id", "context", "", "editor_session_started_at", "file_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lbv3;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/EditorImageUploaded;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Long;", "Companion", "cv3", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("editor.imageUploaded")
public final class EditorImageUploaded extends AndroidMessage<EditorImageUploaded, bv3> {
    public static final ProtoAdapter<EditorImageUploaded> ADAPTER;
    public static final Parcelable.Creator<EditorImageUploaded> CREATOR;
    public static final cv3 Companion = new cv3();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "clientPostId", schemaIndex = 2, tag = 3)
    public final String client_post_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String context;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", jsonName = "editorSessionStartedAt", schemaIndex = 4, tag = 5)
    public final Long editor_session_started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "fileId", schemaIndex = 5, tag = 6)
    public final String file_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(EditorImageUploaded.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<EditorImageUploaded> protoAdapter = new ProtoAdapter<EditorImageUploaded>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.EditorImageUploaded$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final EditorImageUploaded decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Long lDecode = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new EditorImageUploaded(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, lDecode, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, EditorImageUploaded value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.client_post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.context);
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.editor_session_started_at);
                protoAdapter2.encodeWithTag(writer, 6, value.file_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(EditorImageUploaded value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(6, value.file_id) + ProtoAdapter.INT64.encodedSizeWithTag(5, value.editor_session_started_at) + protoAdapter2.encodedSizeWithTag(4, value.context) + protoAdapter2.encodedSizeWithTag(3, value.client_post_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final EditorImageUploaded redact(EditorImageUploaded value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return EditorImageUploaded.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, h21.d, 62, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, EditorImageUploaded value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.file_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 5, value.editor_session_started_at);
                protoAdapter2.encodeWithTag(writer, 4, value.context);
                protoAdapter2.encodeWithTag(writer, 3, value.client_post_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ EditorImageUploaded(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : l, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ EditorImageUploaded copy$default(EditorImageUploaded editorImageUploaded, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = editorImageUploaded.common_fields;
        }
        if ((i & 2) != 0) {
            str = editorImageUploaded.post_id;
        }
        if ((i & 4) != 0) {
            str2 = editorImageUploaded.client_post_id;
        }
        if ((i & 8) != 0) {
            str3 = editorImageUploaded.context;
        }
        if ((i & 16) != 0) {
            l = editorImageUploaded.editor_session_started_at;
        }
        if ((i & 32) != 0) {
            str4 = editorImageUploaded.file_id;
        }
        if ((i & 64) != 0) {
            h21Var = editorImageUploaded.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        Long l2 = l;
        String str6 = str2;
        return editorImageUploaded.copy(analyticsEventCommonFields, str, str6, str3, l2, str5, h21Var2);
    }

    public final EditorImageUploaded copy(AnalyticsEventCommonFields common_fields, String post_id, String client_post_id, String context, Long editor_session_started_at, String file_id, h21 unknownFields) {
        unknownFields.getClass();
        return new EditorImageUploaded(common_fields, post_id, client_post_id, context, editor_session_started_at, file_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof EditorImageUploaded)) {
            return false;
        }
        EditorImageUploaded editorImageUploaded = (EditorImageUploaded) other;
        return g76.L(unknownFields(), editorImageUploaded.unknownFields()) && g76.L(this.common_fields, editorImageUploaded.common_fields) && g76.L(this.post_id, editorImageUploaded.post_id) && g76.L(this.client_post_id, editorImageUploaded.client_post_id) && g76.L(this.context, editorImageUploaded.context) && g76.L(this.editor_session_started_at, editorImageUploaded.editor_session_started_at) && g76.L(this.file_id, editorImageUploaded.file_id);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
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
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i3 = (iHashCode5 + i) * 37;
        String str4 = this.file_id;
        int iHashCode6 = i3 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final bv3 newBuilder() {
        bv3 bv3Var = new bv3();
        bv3Var.a = this.common_fields;
        bv3Var.b = this.post_id;
        bv3Var.c = this.client_post_id;
        bv3Var.d = this.context;
        bv3Var.e = this.editor_session_started_at;
        bv3Var.f = this.file_id;
        bv3Var.addUnknownFields(unknownFields());
        return bv3Var;
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
        String str4 = this.file_id;
        if (str4 != null) {
            lv8.D(str4, "file_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "EditorImageUploaded{", "}", null, 56);
    }

    public EditorImageUploaded() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditorImageUploaded(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Long l, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.client_post_id = str2;
        this.context = str3;
        this.editor_session_started_at = l;
        this.file_id = str4;
    }
}
