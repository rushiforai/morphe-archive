package com.medium.proto.event;

import android.os.Parcelable;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
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
import defpackage.rs1;
import defpackage.ss1;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"Be\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0015\u001a\u00020\t2\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJk\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\u001fR\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u001f¨\u0006#"}, d2 = {"Lcom/medium/proto/event/CollectionPresented;", "Lcom/squareup/wire/AndroidMessage;", "Lrs1;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "collection_id", "referrer_source", "collection_slug", "", "tracking_v2", "user_id", "source", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lrs1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/CollectionPresented;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Companion", "ss1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("collection.presented")
public final class CollectionPresented extends AndroidMessage<CollectionPresented, rs1> {
    public static final ProtoAdapter<CollectionPresented> ADAPTER;
    public static final Parcelable.Creator<CollectionPresented> CREATOR;
    public static final ss1 Companion = new ss1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String collection_slug;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String referrer_source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 4, tag = 5)
    public final Boolean tracking_v2;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionPresented.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionPresented> protoAdapter = new ProtoAdapter<CollectionPresented>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.CollectionPresented$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPresented decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                String strDecode4 = null;
                String strDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionPresented(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, boolDecode, strDecode4, strDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionPresented value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 4, value.collection_slug);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                protoAdapter2.encodeWithTag(writer, 6, value.user_id);
                protoAdapter2.encodeWithTag(writer, 7, value.source);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionPresented value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(7, value.source) + protoAdapter2.encodedSizeWithTag(6, value.user_id) + ProtoAdapter.BOOL.encodedSizeWithTag(5, value.tracking_v2) + protoAdapter2.encodedSizeWithTag(4, value.collection_slug) + protoAdapter2.encodedSizeWithTag(3, value.referrer_source) + protoAdapter2.encodedSizeWithTag(2, value.collection_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPresented redact(CollectionPresented value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return CollectionPresented.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, h21.d, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionPresented value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 7, value.source);
                protoAdapter2.encodeWithTag(writer, 6, value.user_id);
                ProtoAdapter.BOOL.encodeWithTag(writer, 5, value.tracking_v2);
                protoAdapter2.encodeWithTag(writer, 4, value.collection_slug);
                protoAdapter2.encodeWithTag(writer, 3, value.referrer_source);
                protoAdapter2.encodeWithTag(writer, 2, value.collection_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : bool, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionPresented copy$default(CollectionPresented collectionPresented, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = collectionPresented.common_fields;
        }
        if ((i & 2) != 0) {
            str = collectionPresented.collection_id;
        }
        if ((i & 4) != 0) {
            str2 = collectionPresented.referrer_source;
        }
        if ((i & 8) != 0) {
            str3 = collectionPresented.collection_slug;
        }
        if ((i & 16) != 0) {
            bool = collectionPresented.tracking_v2;
        }
        if ((i & 32) != 0) {
            str4 = collectionPresented.user_id;
        }
        if ((i & 64) != 0) {
            str5 = collectionPresented.source;
        }
        if ((i & 128) != 0) {
            h21Var = collectionPresented.unknownFields();
        }
        String str6 = str5;
        h21 h21Var2 = h21Var;
        Boolean bool2 = bool;
        String str7 = str4;
        return collectionPresented.copy(analyticsEventCommonFields, str, str2, str3, bool2, str7, str6, h21Var2);
    }

    public final CollectionPresented copy(AnalyticsEventCommonFields common_fields, String collection_id, String referrer_source, String collection_slug, Boolean tracking_v2, String user_id, String source, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionPresented(common_fields, collection_id, referrer_source, collection_slug, tracking_v2, user_id, source, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionPresented)) {
            return false;
        }
        CollectionPresented collectionPresented = (CollectionPresented) other;
        return g76.L(unknownFields(), collectionPresented.unknownFields()) && g76.L(this.common_fields, collectionPresented.common_fields) && g76.L(this.collection_id, collectionPresented.collection_id) && g76.L(this.referrer_source, collectionPresented.referrer_source) && g76.L(this.collection_slug, collectionPresented.collection_slug) && g76.L(this.tracking_v2, collectionPresented.tracking_v2) && g76.L(this.user_id, collectionPresented.user_id) && g76.L(this.source, collectionPresented.source);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.collection_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.referrer_source;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_slug;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool = this.tracking_v2;
        int i2 = (iHashCode5 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.user_id;
        int iHashCode6 = (i2 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.source;
        int iHashCode7 = iHashCode6 + (str5 != null ? str5.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final rs1 newBuilder() {
        rs1 rs1Var = new rs1();
        rs1Var.a = this.common_fields;
        rs1Var.b = this.collection_id;
        rs1Var.c = this.referrer_source;
        rs1Var.d = this.collection_slug;
        rs1Var.e = this.tracking_v2;
        rs1Var.f = this.user_id;
        rs1Var.g = this.source;
        rs1Var.addUnknownFields(unknownFields());
        return rs1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.collection_id;
        if (str != null) {
            lv8.D(str, "collection_id=", arrayList);
        }
        String str2 = this.referrer_source;
        if (str2 != null) {
            lv8.D(str2, "referrer_source=", arrayList);
        }
        String str3 = this.collection_slug;
        if (str3 != null) {
            lv8.D(str3, "collection_slug=", arrayList);
        }
        Boolean bool = this.tracking_v2;
        if (bool != null) {
            lv8.A("tracking_v2=", bool, arrayList);
        }
        String str4 = this.user_id;
        if (str4 != null) {
            lv8.D(str4, "user_id=", arrayList);
        }
        String str5 = this.source;
        if (str5 != null) {
            lv8.D(str5, "source=", arrayList);
        }
        return bu1.F0(arrayList, aJzfoQ.pWxrmVpaOzuJw, "CollectionPresented{", "}", null, 56);
    }

    public CollectionPresented() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Boolean bool, String str4, String str5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.collection_id = str;
        this.referrer_source = str2;
        this.collection_slug = str3;
        this.tracking_v2 = bool;
        this.user_id = str4;
        this.source = str5;
    }
}
