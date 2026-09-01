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
import defpackage.gdb;
import defpackage.gy2;
import defpackage.h21;
import defpackage.hdb;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\nH\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ_\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\b\b\u0002\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001f¨\u0006\""}, d2 = {"Lcom/medium/proto/event/ResponseCollapsed;", "Lcom/squareup/wire/AndroidMessage;", "Lgdb;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "root_post_id", "root_catalog_id", "parent_post_id", "", "thread_depth", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lgdb;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/ResponseCollapsed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "hdb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("response.collapsed")
public final class ResponseCollapsed extends AndroidMessage<ResponseCollapsed, gdb> {
    public static final ProtoAdapter<ResponseCollapsed> ADAPTER;
    public static final Parcelable.Creator<ResponseCollapsed> CREATOR;
    public static final hdb Companion = new hdb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "parentPostId", schemaIndex = 4, tag = 5)
    public final String parent_post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "rootCatalogId", schemaIndex = 3, tag = 4)
    public final String root_catalog_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "rootPostId", schemaIndex = 2, tag = 3)
    public final String root_post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "threadDepth", schemaIndex = 5, tag = 6)
    public final Integer thread_depth;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ResponseCollapsed.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ResponseCollapsed> protoAdapter = new ProtoAdapter<ResponseCollapsed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ResponseCollapsed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ResponseCollapsed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ResponseCollapsed(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ResponseCollapsed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.root_post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.root_catalog_id);
                protoAdapter2.encodeWithTag(writer, 5, value.parent_post_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 6, value.thread_depth);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ResponseCollapsed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT32.encodedSizeWithTag(6, value.thread_depth) + protoAdapter2.encodedSizeWithTag(5, value.parent_post_id) + protoAdapter2.encodedSizeWithTag(4, value.root_catalog_id) + protoAdapter2.encodedSizeWithTag(3, value.root_post_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ResponseCollapsed redact(ResponseCollapsed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ResponseCollapsed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, h21.d, 62, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ResponseCollapsed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 6, value.thread_depth);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.parent_post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.root_catalog_id);
                protoAdapter2.encodeWithTag(writer, 3, value.root_post_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ResponseCollapsed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : num, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ResponseCollapsed copy$default(ResponseCollapsed responseCollapsed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = responseCollapsed.common_fields;
        }
        if ((i & 2) != 0) {
            str = responseCollapsed.post_id;
        }
        if ((i & 4) != 0) {
            str2 = responseCollapsed.root_post_id;
        }
        if ((i & 8) != 0) {
            str3 = responseCollapsed.root_catalog_id;
        }
        if ((i & 16) != 0) {
            str4 = responseCollapsed.parent_post_id;
        }
        if ((i & 32) != 0) {
            num = responseCollapsed.thread_depth;
        }
        if ((i & 64) != 0) {
            h21Var = responseCollapsed.unknownFields();
        }
        Integer num2 = num;
        h21 h21Var2 = h21Var;
        String str5 = str4;
        String str6 = str2;
        return responseCollapsed.copy(analyticsEventCommonFields, str, str6, str3, str5, num2, h21Var2);
    }

    public final ResponseCollapsed copy(AnalyticsEventCommonFields common_fields, String post_id, String root_post_id, String root_catalog_id, String parent_post_id, Integer thread_depth, h21 unknownFields) {
        unknownFields.getClass();
        return new ResponseCollapsed(common_fields, post_id, root_post_id, root_catalog_id, parent_post_id, thread_depth, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ResponseCollapsed)) {
            return false;
        }
        ResponseCollapsed responseCollapsed = (ResponseCollapsed) other;
        return g76.L(unknownFields(), responseCollapsed.unknownFields()) && g76.L(this.common_fields, responseCollapsed.common_fields) && g76.L(this.post_id, responseCollapsed.post_id) && g76.L(this.root_post_id, responseCollapsed.root_post_id) && g76.L(this.root_catalog_id, responseCollapsed.root_catalog_id) && g76.L(this.parent_post_id, responseCollapsed.parent_post_id) && g76.L(this.thread_depth, responseCollapsed.thread_depth);
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
        String str2 = this.root_post_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.root_catalog_id;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.parent_post_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Integer num = this.thread_depth;
        int iIntValue = iHashCode6 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final gdb newBuilder() {
        gdb gdbVar = new gdb();
        gdbVar.a = this.common_fields;
        gdbVar.b = this.post_id;
        gdbVar.c = this.root_post_id;
        gdbVar.d = this.root_catalog_id;
        gdbVar.e = this.parent_post_id;
        gdbVar.f = this.thread_depth;
        gdbVar.addUnknownFields(unknownFields());
        return gdbVar;
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
        String str2 = this.root_post_id;
        if (str2 != null) {
            lv8.D(str2, "root_post_id=", arrayList);
        }
        String str3 = this.root_catalog_id;
        if (str3 != null) {
            lv8.D(str3, "root_catalog_id=", arrayList);
        }
        String str4 = this.parent_post_id;
        if (str4 != null) {
            lv8.D(str4, "parent_post_id=", arrayList);
        }
        Integer num = this.thread_depth;
        if (num != null) {
            lv8.B("thread_depth=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "ResponseCollapsed{", "}", null, 56);
    }

    public ResponseCollapsed() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ResponseCollapsed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.root_post_id = str2;
        this.root_catalog_id = str3;
        this.parent_post_id = str4;
        this.thread_depth = num;
    }
}
