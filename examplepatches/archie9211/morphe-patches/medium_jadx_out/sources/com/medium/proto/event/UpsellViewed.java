package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.a7e;
import defpackage.b7e;
import defpackage.bu1;
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
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJw\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010 R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010 R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010 ¨\u0006#"}, d2 = {"Lcom/medium/proto/event/UpsellViewed;", "Lcom/squareup/wire/AndroidMessage;", "La7e;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "dimension", "location_id", "feature", "post_id", "author_id", "sequence_id", "promo_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()La7e;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/UpsellViewed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "b7e", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("upsell.viewed")
public final class UpsellViewed extends AndroidMessage<UpsellViewed, a7e> {
    public static final ProtoAdapter<UpsellViewed> ADAPTER;
    public static final Parcelable.Creator<UpsellViewed> CREATOR;
    public static final b7e Companion = new b7e();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String author_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String dimension;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String feature;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String location_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String promo_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String sequence_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(UpsellViewed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<UpsellViewed> protoAdapter = new ProtoAdapter<UpsellViewed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.UpsellViewed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final UpsellViewed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new UpsellViewed(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, UpsellViewed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.dimension);
                protoAdapter2.encodeWithTag(writer, 3, value.location_id);
                protoAdapter2.encodeWithTag(writer, 4, value.feature);
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                protoAdapter2.encodeWithTag(writer, 6, value.author_id);
                protoAdapter2.encodeWithTag(writer, 7, value.sequence_id);
                protoAdapter2.encodeWithTag(writer, 8, value.promo_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(UpsellViewed value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(8, value.promo_id) + protoAdapter2.encodedSizeWithTag(7, value.sequence_id) + protoAdapter2.encodedSizeWithTag(6, value.author_id) + protoAdapter2.encodedSizeWithTag(5, value.post_id) + protoAdapter2.encodedSizeWithTag(4, value.feature) + protoAdapter2.encodedSizeWithTag(3, value.location_id) + protoAdapter2.encodedSizeWithTag(2, value.dimension) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final UpsellViewed redact(UpsellViewed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return UpsellViewed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, null, h21.d, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, UpsellViewed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 8, value.promo_id);
                protoAdapter2.encodeWithTag(writer, 7, value.sequence_id);
                protoAdapter2.encodeWithTag(writer, 6, value.author_id);
                protoAdapter2.encodeWithTag(writer, 5, value.post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.feature);
                protoAdapter2.encodeWithTag(writer, 3, value.location_id);
                protoAdapter2.encodeWithTag(writer, 2, value.dimension);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ UpsellViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : str6, (i & 128) != 0 ? null : str7, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ UpsellViewed copy$default(UpsellViewed upsellViewed, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = upsellViewed.common_fields;
        }
        if ((i & 2) != 0) {
            str = upsellViewed.dimension;
        }
        if ((i & 4) != 0) {
            str2 = upsellViewed.location_id;
        }
        if ((i & 8) != 0) {
            str3 = upsellViewed.feature;
        }
        if ((i & 16) != 0) {
            str4 = upsellViewed.post_id;
        }
        if ((i & 32) != 0) {
            str5 = upsellViewed.author_id;
        }
        if ((i & 64) != 0) {
            str6 = upsellViewed.sequence_id;
        }
        if ((i & 128) != 0) {
            str7 = upsellViewed.promo_id;
        }
        if ((i & 256) != 0) {
            h21Var = upsellViewed.unknownFields();
        }
        String str8 = str7;
        h21 h21Var2 = h21Var;
        String str9 = str5;
        String str10 = str6;
        String str11 = str4;
        String str12 = str2;
        return upsellViewed.copy(analyticsEventCommonFields, str, str12, str3, str11, str9, str10, str8, h21Var2);
    }

    public final UpsellViewed copy(AnalyticsEventCommonFields common_fields, String dimension, String location_id, String feature, String post_id, String author_id, String sequence_id, String promo_id, h21 unknownFields) {
        unknownFields.getClass();
        return new UpsellViewed(common_fields, dimension, location_id, feature, post_id, author_id, sequence_id, promo_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof UpsellViewed)) {
            return false;
        }
        UpsellViewed upsellViewed = (UpsellViewed) other;
        return g76.L(unknownFields(), upsellViewed.unknownFields()) && g76.L(this.common_fields, upsellViewed.common_fields) && g76.L(this.dimension, upsellViewed.dimension) && g76.L(this.location_id, upsellViewed.location_id) && g76.L(this.feature, upsellViewed.feature) && g76.L(this.post_id, upsellViewed.post_id) && g76.L(this.author_id, upsellViewed.author_id) && g76.L(this.sequence_id, upsellViewed.sequence_id) && g76.L(this.promo_id, upsellViewed.promo_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.dimension;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.location_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.feature;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.post_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.author_id;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.sequence_id;
        int iHashCode8 = (iHashCode7 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.promo_id;
        int iHashCode9 = iHashCode8 + (str7 != null ? str7.hashCode() : 0);
        this.hashCode = iHashCode9;
        return iHashCode9;
    }

    @Override // com.squareup.wire.Message
    public final a7e newBuilder() {
        a7e a7eVar = new a7e();
        a7eVar.a = this.common_fields;
        a7eVar.b = this.dimension;
        a7eVar.c = this.location_id;
        a7eVar.d = this.feature;
        a7eVar.e = this.post_id;
        a7eVar.f = this.author_id;
        a7eVar.g = this.sequence_id;
        a7eVar.h = this.promo_id;
        a7eVar.addUnknownFields(unknownFields());
        return a7eVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.dimension;
        if (str != null) {
            lv8.D(str, "dimension=", arrayList);
        }
        String str2 = this.location_id;
        if (str2 != null) {
            lv8.D(str2, "location_id=", arrayList);
        }
        String str3 = this.feature;
        if (str3 != null) {
            lv8.D(str3, "feature=", arrayList);
        }
        String str4 = this.post_id;
        if (str4 != null) {
            lv8.D(str4, "post_id=", arrayList);
        }
        String str5 = this.author_id;
        if (str5 != null) {
            lv8.D(str5, "author_id=", arrayList);
        }
        String str6 = this.sequence_id;
        if (str6 != null) {
            lv8.D(str6, "sequence_id=", arrayList);
        }
        String str7 = this.promo_id;
        if (str7 != null) {
            lv8.D(str7, "promo_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "UpsellViewed{", "}", null, 56);
    }

    public UpsellViewed() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UpsellViewed(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, String str4, String str5, String str6, String str7, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.dimension = str;
        this.location_id = str2;
        this.feature = str3;
        this.post_id = str4;
        this.author_id = str5;
        this.sequence_id = str6;
        this.promo_id = str7;
    }
}
