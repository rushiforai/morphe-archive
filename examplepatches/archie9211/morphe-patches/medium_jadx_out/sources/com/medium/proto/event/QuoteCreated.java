package com.medium.proto.event;

import android.os.Parcelable;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.proto.model.GFI;
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
import defpackage.gra;
import defpackage.gy2;
import defpackage.h21;
import defpackage.hra;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import gen.model.QuoteType;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0013\b\u0007\u0018\u0000 ,2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002-B}\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0096\u0002¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\u001bH\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u0083\u0001\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b \u0010!R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\"R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010#R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010$R\u001c\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\n\u0010#\u0012\u0004\b%\u0010&R\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010#\u0012\u0004\b'\u0010&R\u001c\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\f\u0010#\u0012\u0004\b(\u0010&R\u001c\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010)\u0012\u0004\b*\u0010&R\u001c\u0010\u000f\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010)\u0012\u0004\b+\u0010&¨\u0006."}, d2 = {"Lcom/medium/proto/event/QuoteCreated;", "Lcom/squareup/wire/AndroidMessage;", "Lgra;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "quote_id", "Lgen/model/QuoteType;", "quote_type", "book_id", "edition_id", "content_id", "Lcom/medium/proto/model/GFI;", "start_gfi", "end_gfi", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/QuoteType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/GFI;Lcom/medium/proto/model/GFI;Lh21;)V", "newBuilder", "()Lgra;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/QuoteType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/GFI;Lcom/medium/proto/model/GFI;Lh21;)Lcom/medium/proto/event/QuoteCreated;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lgen/model/QuoteType;", "getBook_id$annotations", "()V", "getEdition_id$annotations", "getContent_id$annotations", "Lcom/medium/proto/model/GFI;", "getStart_gfi$annotations", "getEnd_gfi$annotations", "Companion", "hra", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("quotes.ui.quoteCreated")
public final class QuoteCreated extends AndroidMessage<QuoteCreated, gra> {
    public static final ProtoAdapter<QuoteCreated> ADAPTER;
    public static final Parcelable.Creator<QuoteCreated> CREATOR;
    public static final hra Companion = new hra();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String book_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String content_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String edition_id;

    @WireField(adapter = "com.medium.proto.model.GFI#ADAPTER", schemaIndex = 8, tag = 9)
    public final GFI end_gfi;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String quote_id;

    @WireField(adapter = "gen.model.QuoteType#ADAPTER", schemaIndex = 3, tag = 4)
    public final QuoteType quote_type;

    @WireField(adapter = "com.medium.proto.model.GFI#ADAPTER", schemaIndex = 7, tag = 8)
    public final GFI start_gfi;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(QuoteCreated.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<QuoteCreated> protoAdapter = new ProtoAdapter<QuoteCreated>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.QuoteCreated$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final QuoteCreated decode(ProtoReader reader) {
                AnalyticsEventCommonFields analyticsEventCommonFields;
                String str;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                QuoteType quoteTypeDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                GFI gfiDecode = null;
                GFI gfiDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new QuoteCreated(analyticsEventCommonFieldsDecode, strDecode, strDecode2, quoteTypeDecode, strDecode3, strDecode4, strDecode5, gfiDecode, gfiDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                            continue;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 4:
                            try {
                                quoteTypeDecode = QuoteType.ADAPTER.decode(reader);
                                continue;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                                str = strDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                                strDecode = str;
                            }
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 7:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 8:
                            gfiDecode = GFI.ADAPTER.decode(reader);
                            continue;
                        case 9:
                            gfiDecode2 = GFI.ADAPTER.decode(reader);
                            continue;
                        default:
                            reader.readUnknownField(iNextTag);
                            analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                            str = strDecode;
                            break;
                    }
                    analyticsEventCommonFieldsDecode = analyticsEventCommonFields;
                    strDecode = str;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, QuoteCreated value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.quote_id);
                QuoteType.ADAPTER.encodeWithTag(writer, 4, value.quote_type);
                protoAdapter2.encodeWithTag(writer, 5, value.book_id);
                protoAdapter2.encodeWithTag(writer, 6, value.edition_id);
                protoAdapter2.encodeWithTag(writer, 7, value.content_id);
                ProtoAdapter<GFI> protoAdapter3 = GFI.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 8, value.start_gfi);
                protoAdapter3.encodeWithTag(writer, 9, value.end_gfi);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(QuoteCreated value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(7, value.content_id) + protoAdapter2.encodedSizeWithTag(6, value.edition_id) + protoAdapter2.encodedSizeWithTag(5, value.book_id) + QuoteType.ADAPTER.encodedSizeWithTag(4, value.quote_type) + protoAdapter2.encodedSizeWithTag(3, value.quote_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
                ProtoAdapter<GFI> protoAdapter3 = GFI.ADAPTER;
                return protoAdapter3.encodedSizeWithTag(9, value.end_gfi) + protoAdapter3.encodedSizeWithTag(8, value.start_gfi) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final QuoteCreated redact(QuoteCreated value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                AnalyticsEventCommonFields analyticsEventCommonFieldsRedact = analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null;
                GFI gfi = value.start_gfi;
                GFI gfiRedact = gfi != null ? GFI.ADAPTER.redact(gfi) : null;
                GFI gfi2 = value.end_gfi;
                return QuoteCreated.copy$default(value, analyticsEventCommonFieldsRedact, null, null, null, null, null, null, gfiRedact, gfi2 != null ? GFI.ADAPTER.redact(gfi2) : null, h21.d, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, QuoteCreated value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<GFI> protoAdapter2 = GFI.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 9, value.end_gfi);
                protoAdapter2.encodeWithTag(writer, 8, value.start_gfi);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 7, value.content_id);
                protoAdapter3.encodeWithTag(writer, 6, value.edition_id);
                protoAdapter3.encodeWithTag(writer, 5, value.book_id);
                QuoteType.ADAPTER.encodeWithTag(writer, 4, value.quote_type);
                protoAdapter3.encodeWithTag(writer, 3, value.quote_id);
                protoAdapter3.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ QuoteCreated(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, GFI gfi, GFI gfi2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : quoteType, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? null : gfi, (i & 256) != 0 ? null : gfi2, (i & 512) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ QuoteCreated copy$default(QuoteCreated quoteCreated, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, GFI gfi, GFI gfi2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = quoteCreated.common_fields;
        }
        if ((i & 2) != 0) {
            str = quoteCreated.post_id;
        }
        if ((i & 4) != 0) {
            str2 = quoteCreated.quote_id;
        }
        if ((i & 8) != 0) {
            quoteType = quoteCreated.quote_type;
        }
        if ((i & 16) != 0) {
            str3 = quoteCreated.book_id;
        }
        if ((i & 32) != 0) {
            str4 = quoteCreated.edition_id;
        }
        if ((i & 64) != 0) {
            str5 = quoteCreated.content_id;
        }
        if ((i & 128) != 0) {
            gfi = quoteCreated.start_gfi;
        }
        if ((i & 256) != 0) {
            gfi2 = quoteCreated.end_gfi;
        }
        if ((i & 512) != 0) {
            h21Var = quoteCreated.unknownFields();
        }
        GFI gfi3 = gfi2;
        h21 h21Var2 = h21Var;
        String str6 = str5;
        GFI gfi4 = gfi;
        String str7 = str3;
        String str8 = str4;
        return quoteCreated.copy(analyticsEventCommonFields, str, str2, quoteType, str7, str8, str6, gfi4, gfi3, h21Var2);
    }

    public final QuoteCreated copy(AnalyticsEventCommonFields common_fields, String post_id, String quote_id, QuoteType quote_type, String book_id, String edition_id, String content_id, GFI start_gfi, GFI end_gfi, h21 unknownFields) {
        unknownFields.getClass();
        return new QuoteCreated(common_fields, post_id, quote_id, quote_type, book_id, edition_id, content_id, start_gfi, end_gfi, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof QuoteCreated)) {
            return false;
        }
        QuoteCreated quoteCreated = (QuoteCreated) other;
        return g76.L(unknownFields(), quoteCreated.unknownFields()) && g76.L(this.common_fields, quoteCreated.common_fields) && g76.L(this.post_id, quoteCreated.post_id) && g76.L(this.quote_id, quoteCreated.quote_id) && this.quote_type == quoteCreated.quote_type && g76.L(this.book_id, quoteCreated.book_id) && g76.L(this.edition_id, quoteCreated.edition_id) && g76.L(this.content_id, quoteCreated.content_id) && g76.L(this.start_gfi, quoteCreated.start_gfi) && g76.L(this.end_gfi, quoteCreated.end_gfi);
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
        String str2 = this.quote_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        QuoteType quoteType = this.quote_type;
        int iHashCode5 = (iHashCode4 + (quoteType != null ? quoteType.hashCode() : 0)) * 37;
        String str3 = this.book_id;
        int iHashCode6 = (iHashCode5 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.edition_id;
        int iHashCode7 = (iHashCode6 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.content_id;
        int iHashCode8 = (iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37;
        GFI gfi = this.start_gfi;
        int iHashCode9 = (iHashCode8 + (gfi != null ? gfi.hashCode() : 0)) * 37;
        GFI gfi2 = this.end_gfi;
        int iHashCode10 = iHashCode9 + (gfi2 != null ? gfi2.hashCode() : 0);
        this.hashCode = iHashCode10;
        return iHashCode10;
    }

    @Override // com.squareup.wire.Message
    public final gra newBuilder() {
        gra graVar = new gra();
        graVar.a = this.common_fields;
        graVar.b = this.post_id;
        graVar.c = this.quote_id;
        graVar.d = this.quote_type;
        graVar.e = this.book_id;
        graVar.f = this.edition_id;
        graVar.g = this.content_id;
        graVar.h = this.start_gfi;
        graVar.i = this.end_gfi;
        graVar.addUnknownFields(unknownFields());
        return graVar;
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
        String str2 = this.quote_id;
        if (str2 != null) {
            lv8.D(str2, "quote_id=", arrayList);
        }
        QuoteType quoteType = this.quote_type;
        if (quoteType != null) {
            arrayList.add("quote_type=" + quoteType);
        }
        String str3 = this.book_id;
        if (str3 != null) {
            lv8.D(str3, "book_id=", arrayList);
        }
        String str4 = this.edition_id;
        if (str4 != null) {
            lv8.D(str4, "edition_id=", arrayList);
        }
        String str5 = this.content_id;
        if (str5 != null) {
            lv8.D(str5, "content_id=", arrayList);
        }
        GFI gfi = this.start_gfi;
        if (gfi != null) {
            arrayList.add("start_gfi=" + gfi);
        }
        GFI gfi2 = this.end_gfi;
        if (gfi2 != null) {
            arrayList.add("end_gfi=" + gfi2);
        }
        return bu1.F0(arrayList, ", ", "QuoteCreated{", "}", null, 56);
    }

    public static /* synthetic */ void getBook_id$annotations() {
    }

    public static /* synthetic */ void getContent_id$annotations() {
    }

    public static /* synthetic */ void getEdition_id$annotations() {
    }

    public static /* synthetic */ void getEnd_gfi$annotations() {
    }

    public static /* synthetic */ void getStart_gfi$annotations() {
    }

    public QuoteCreated() {
        this(null, null, null, null, null, null, null, null, null, null, 1023, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public QuoteCreated(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, GFI gfi, GFI gfi2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.quote_id = str2;
        this.quote_type = quoteType;
        this.book_id = str3;
        this.edition_id = str4;
        this.content_id = str5;
        this.start_gfi = gfi;
        this.end_gfi = gfi2;
    }
}
