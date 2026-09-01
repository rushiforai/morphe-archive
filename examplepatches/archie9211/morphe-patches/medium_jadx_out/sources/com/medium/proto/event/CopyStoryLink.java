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
import defpackage.ja2;
import defpackage.ka2;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0013\u001a\u00020\b2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001d¨\u0006!"}, d2 = {"Lcom/medium/proto/event/CopyStoryLink;", "Lcom/squareup/wire/AndroidMessage;", "Lja2;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "type", "", "is_social_share_sheet", "collection_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lja2;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/CopyStoryLink;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "ka2", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("copyStoryLink.clicked")
public final class CopyStoryLink extends AndroidMessage<CopyStoryLink, ja2> {
    public static final ProtoAdapter<CopyStoryLink> ADAPTER;
    public static final Parcelable.Creator<CopyStoryLink> CREATOR;
    public static final ka2 Companion = new ka2();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String collection_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 3, tag = 4)
    public final Boolean is_social_share_sheet;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CopyStoryLink.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CopyStoryLink> protoAdapter = new ProtoAdapter<CopyStoryLink>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.CopyStoryLink$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CopyStoryLink decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                Boolean boolDecode = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CopyStoryLink(analyticsEventCommonFieldsDecode, strDecode, strDecode2, boolDecode, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CopyStoryLink value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.type);
                ProtoAdapter.BOOL.encodeWithTag(writer, 4, value.is_social_share_sheet);
                protoAdapter2.encodeWithTag(writer, 5, value.collection_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CopyStoryLink value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.collection_id) + ProtoAdapter.BOOL.encodedSizeWithTag(4, value.is_social_share_sheet) + protoAdapter2.encodedSizeWithTag(3, value.type) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CopyStoryLink redact(CopyStoryLink value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return CopyStoryLink.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CopyStoryLink value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.collection_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 4, value.is_social_share_sheet);
                protoAdapter2.encodeWithTag(writer, 3, value.type);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CopyStoryLink(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Boolean bool, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : bool, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CopyStoryLink copy$default(CopyStoryLink copyStoryLink, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Boolean bool, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = copyStoryLink.common_fields;
        }
        if ((i & 2) != 0) {
            str = copyStoryLink.post_id;
        }
        if ((i & 4) != 0) {
            str2 = copyStoryLink.type;
        }
        if ((i & 8) != 0) {
            bool = copyStoryLink.is_social_share_sheet;
        }
        if ((i & 16) != 0) {
            str3 = copyStoryLink.collection_id;
        }
        if ((i & 32) != 0) {
            h21Var = copyStoryLink.unknownFields();
        }
        String str4 = str3;
        h21 h21Var2 = h21Var;
        return copyStoryLink.copy(analyticsEventCommonFields, str, str2, bool, str4, h21Var2);
    }

    public final CopyStoryLink copy(AnalyticsEventCommonFields common_fields, String post_id, String type, Boolean is_social_share_sheet, String collection_id, h21 unknownFields) {
        unknownFields.getClass();
        return new CopyStoryLink(common_fields, post_id, type, is_social_share_sheet, collection_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CopyStoryLink)) {
            return false;
        }
        CopyStoryLink copyStoryLink = (CopyStoryLink) other;
        return g76.L(unknownFields(), copyStoryLink.unknownFields()) && g76.L(this.common_fields, copyStoryLink.common_fields) && g76.L(this.post_id, copyStoryLink.post_id) && g76.L(this.type, copyStoryLink.type) && g76.L(this.is_social_share_sheet, copyStoryLink.is_social_share_sheet) && g76.L(this.collection_id, copyStoryLink.collection_id);
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
        String str2 = this.type;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Boolean bool = this.is_social_share_sheet;
        int i2 = (iHashCode4 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str3 = this.collection_id;
        int iHashCode5 = i2 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final ja2 newBuilder() {
        ja2 ja2Var = new ja2();
        ja2Var.a = this.common_fields;
        ja2Var.b = this.post_id;
        ja2Var.c = this.type;
        ja2Var.d = this.is_social_share_sheet;
        ja2Var.e = this.collection_id;
        ja2Var.addUnknownFields(unknownFields());
        return ja2Var;
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
        String str2 = this.type;
        if (str2 != null) {
            lv8.D(str2, "type=", arrayList);
        }
        Boolean bool = this.is_social_share_sheet;
        if (bool != null) {
            lv8.A("is_social_share_sheet=", bool, arrayList);
        }
        String str3 = this.collection_id;
        if (str3 != null) {
            lv8.D(str3, "collection_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CopyStoryLink{", "}", null, 56);
    }

    public CopyStoryLink() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CopyStoryLink(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, Boolean bool, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.type = str2;
        this.is_social_share_sheet = bool;
        this.collection_id = str3;
    }
}
