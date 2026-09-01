package com.medium.proto.event;

import android.os.Parcelable;
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
import defpackage.ira;
import defpackage.jra;
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
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0010\b\u0007\u0018\u0000 &2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002'Be\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJk\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010 R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010!R\u001c\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\n\u0010 \u0012\u0004\b\"\u0010#R\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010 \u0012\u0004\b$\u0010#R\u001c\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\f\u0010 \u0012\u0004\b%\u0010#¨\u0006("}, d2 = {"Lcom/medium/proto/event/QuoteDeleted;", "Lcom/squareup/wire/AndroidMessage;", "Lira;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "quote_id", "Lgen/model/QuoteType;", "quote_type", "book_id", "edition_id", "content_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/QuoteType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lira;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/QuoteType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/QuoteDeleted;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lgen/model/QuoteType;", "getBook_id$annotations", "()V", "getEdition_id$annotations", "getContent_id$annotations", "Companion", "jra", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("quotes.ui.quoteDeleted")
public final class QuoteDeleted extends AndroidMessage<QuoteDeleted, ira> {
    public static final ProtoAdapter<QuoteDeleted> ADAPTER;
    public static final Parcelable.Creator<QuoteDeleted> CREATOR;
    public static final jra Companion = new jra();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String book_id;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String content_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String edition_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String quote_id;

    @WireField(adapter = "gen.model.QuoteType#ADAPTER", schemaIndex = 3, tag = 4)
    public final QuoteType quote_type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(QuoteDeleted.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<QuoteDeleted> protoAdapter = new ProtoAdapter<QuoteDeleted>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.QuoteDeleted$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final QuoteDeleted decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                QuoteType quoteTypeDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new QuoteDeleted(analyticsEventCommonFieldsDecode, strDecode, strDecode2, quoteTypeDecode, strDecode3, strDecode4, strDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            try {
                                quoteTypeDecode = QuoteType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
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
            public final void encode(ProtoWriter writer, QuoteDeleted value) {
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
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(QuoteDeleted value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(7, value.content_id) + protoAdapter2.encodedSizeWithTag(6, value.edition_id) + protoAdapter2.encodedSizeWithTag(5, value.book_id) + QuoteType.ADAPTER.encodedSizeWithTag(4, value.quote_type) + protoAdapter2.encodedSizeWithTag(3, value.quote_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final QuoteDeleted redact(QuoteDeleted value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return QuoteDeleted.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, null, null, h21.d, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, QuoteDeleted value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 7, value.content_id);
                protoAdapter2.encodeWithTag(writer, 6, value.edition_id);
                protoAdapter2.encodeWithTag(writer, 5, value.book_id);
                QuoteType.ADAPTER.encodeWithTag(writer, 4, value.quote_type);
                protoAdapter2.encodeWithTag(writer, 3, value.quote_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ QuoteDeleted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : quoteType, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ QuoteDeleted copy$default(QuoteDeleted quoteDeleted, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = quoteDeleted.common_fields;
        }
        if ((i & 2) != 0) {
            str = quoteDeleted.post_id;
        }
        if ((i & 4) != 0) {
            str2 = quoteDeleted.quote_id;
        }
        if ((i & 8) != 0) {
            quoteType = quoteDeleted.quote_type;
        }
        if ((i & 16) != 0) {
            str3 = quoteDeleted.book_id;
        }
        if ((i & 32) != 0) {
            str4 = quoteDeleted.edition_id;
        }
        if ((i & 64) != 0) {
            str5 = quoteDeleted.content_id;
        }
        if ((i & 128) != 0) {
            h21Var = quoteDeleted.unknownFields();
        }
        String str6 = str5;
        h21 h21Var2 = h21Var;
        String str7 = str3;
        String str8 = str4;
        return quoteDeleted.copy(analyticsEventCommonFields, str, str2, quoteType, str7, str8, str6, h21Var2);
    }

    public final QuoteDeleted copy(AnalyticsEventCommonFields common_fields, String post_id, String quote_id, QuoteType quote_type, String book_id, String edition_id, String content_id, h21 unknownFields) {
        unknownFields.getClass();
        return new QuoteDeleted(common_fields, post_id, quote_id, quote_type, book_id, edition_id, content_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof QuoteDeleted)) {
            return false;
        }
        QuoteDeleted quoteDeleted = (QuoteDeleted) other;
        return g76.L(unknownFields(), quoteDeleted.unknownFields()) && g76.L(this.common_fields, quoteDeleted.common_fields) && g76.L(this.post_id, quoteDeleted.post_id) && g76.L(this.quote_id, quoteDeleted.quote_id) && this.quote_type == quoteDeleted.quote_type && g76.L(this.book_id, quoteDeleted.book_id) && g76.L(this.edition_id, quoteDeleted.edition_id) && g76.L(this.content_id, quoteDeleted.content_id);
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
        int iHashCode8 = iHashCode7 + (str5 != null ? str5.hashCode() : 0);
        this.hashCode = iHashCode8;
        return iHashCode8;
    }

    @Override // com.squareup.wire.Message
    public final ira newBuilder() {
        ira iraVar = new ira();
        iraVar.a = this.common_fields;
        iraVar.b = this.post_id;
        iraVar.c = this.quote_id;
        iraVar.d = this.quote_type;
        iraVar.e = this.book_id;
        iraVar.f = this.edition_id;
        iraVar.g = this.content_id;
        iraVar.addUnknownFields(unknownFields());
        return iraVar;
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
        return bu1.F0(arrayList, ", ", "QuoteDeleted{", "}", null, 56);
    }

    public static /* synthetic */ void getBook_id$annotations() {
    }

    public static /* synthetic */ void getContent_id$annotations() {
    }

    public static /* synthetic */ void getEdition_id$annotations() {
    }

    public QuoteDeleted() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public QuoteDeleted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, QuoteType quoteType, String str3, String str4, String str5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.quote_id = str2;
        this.quote_type = quoteType;
        this.book_id = str3;
        this.edition_id = str4;
        this.content_id = str5;
    }
}
