package gen.model;

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
import defpackage.ft1;
import defpackage.g76;
import defpackage.gt1;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\r\u0018\u0000 (2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002)BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ_\u0010 \u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b \u0010!R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\"R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010#R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010$R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010%R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010&R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010'¨\u0006*"}, d2 = {"Lgen/model/CollectionTheme;", "Lcom/squareup/wire/AndroidMessage;", "Lft1;", "Lgen/model/CollectionColors;", "collection_colors", "Lgen/model/CardStyleHeader;", "header_card", "Lgen/model/CardStyleStandard;", "standard_card", "Lgen/model/CardStyleHalfFeature;", "half_feature_card", "Lgen/model/CardStyleQuote;", "quote_card", "Lgen/model/CardStyleShortStory;", "short_story_card", "Lh21;", "unknownFields", "<init>", "(Lgen/model/CollectionColors;Lgen/model/CardStyleHeader;Lgen/model/CardStyleStandard;Lgen/model/CardStyleHalfFeature;Lgen/model/CardStyleQuote;Lgen/model/CardStyleShortStory;Lh21;)V", "newBuilder", "()Lft1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/CollectionColors;Lgen/model/CardStyleHeader;Lgen/model/CardStyleStandard;Lgen/model/CardStyleHalfFeature;Lgen/model/CardStyleQuote;Lgen/model/CardStyleShortStory;Lh21;)Lgen/model/CollectionTheme;", "Lgen/model/CollectionColors;", "Lgen/model/CardStyleHeader;", "Lgen/model/CardStyleStandard;", "Lgen/model/CardStyleHalfFeature;", "Lgen/model/CardStyleQuote;", "Lgen/model/CardStyleShortStory;", "Companion", "gt1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionTheme extends AndroidMessage<CollectionTheme, ft1> {
    public static final ProtoAdapter<CollectionTheme> ADAPTER;
    public static final Parcelable.Creator<CollectionTheme> CREATOR;
    public static final gt1 Companion = new gt1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionColors#ADAPTER", schemaIndex = 0, tag = 1)
    public final CollectionColors collection_colors;

    @WireField(adapter = "gen.model.CardStyleHalfFeature#ADAPTER", schemaIndex = 3, tag = 4)
    public final CardStyleHalfFeature half_feature_card;

    @WireField(adapter = "gen.model.CardStyleHeader#ADAPTER", schemaIndex = 1, tag = 2)
    public final CardStyleHeader header_card;

    @WireField(adapter = "gen.model.CardStyleQuote#ADAPTER", schemaIndex = 4, tag = 5)
    public final CardStyleQuote quote_card;

    @WireField(adapter = "gen.model.CardStyleShortStory#ADAPTER", schemaIndex = 5, tag = 6)
    public final CardStyleShortStory short_story_card;

    @WireField(adapter = "gen.model.CardStyleStandard#ADAPTER", schemaIndex = 2, tag = 3)
    public final CardStyleStandard standard_card;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionTheme.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionTheme> protoAdapter = new ProtoAdapter<CollectionTheme>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionTheme$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionTheme decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                CollectionColors collectionColorsDecode = null;
                CardStyleHeader cardStyleHeaderDecode = null;
                CardStyleStandard cardStyleStandardDecode = null;
                CardStyleHalfFeature cardStyleHalfFeatureDecode = null;
                CardStyleQuote cardStyleQuoteDecode = null;
                CardStyleShortStory cardStyleShortStoryDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionTheme(collectionColorsDecode, cardStyleHeaderDecode, cardStyleStandardDecode, cardStyleHalfFeatureDecode, cardStyleQuoteDecode, cardStyleShortStoryDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            collectionColorsDecode = CollectionColors.ADAPTER.decode(reader);
                            break;
                        case 2:
                            cardStyleHeaderDecode = CardStyleHeader.ADAPTER.decode(reader);
                            break;
                        case 3:
                            cardStyleStandardDecode = CardStyleStandard.ADAPTER.decode(reader);
                            break;
                        case 4:
                            cardStyleHalfFeatureDecode = CardStyleHalfFeature.ADAPTER.decode(reader);
                            break;
                        case 5:
                            cardStyleQuoteDecode = CardStyleQuote.ADAPTER.decode(reader);
                            break;
                        case 6:
                            cardStyleShortStoryDecode = CardStyleShortStory.ADAPTER.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionTheme value) {
                writer.getClass();
                value.getClass();
                CollectionColors.ADAPTER.encodeWithTag(writer, 1, value.collection_colors);
                CardStyleHeader.ADAPTER.encodeWithTag(writer, 2, value.header_card);
                CardStyleStandard.ADAPTER.encodeWithTag(writer, 3, value.standard_card);
                CardStyleHalfFeature.ADAPTER.encodeWithTag(writer, 4, value.half_feature_card);
                CardStyleQuote.ADAPTER.encodeWithTag(writer, 5, value.quote_card);
                CardStyleShortStory.ADAPTER.encodeWithTag(writer, 6, value.short_story_card);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionTheme value) {
                value.getClass();
                return CardStyleShortStory.ADAPTER.encodedSizeWithTag(6, value.short_story_card) + CardStyleQuote.ADAPTER.encodedSizeWithTag(5, value.quote_card) + CardStyleHalfFeature.ADAPTER.encodedSizeWithTag(4, value.half_feature_card) + CardStyleStandard.ADAPTER.encodedSizeWithTag(3, value.standard_card) + CardStyleHeader.ADAPTER.encodedSizeWithTag(2, value.header_card) + CollectionColors.ADAPTER.encodedSizeWithTag(1, value.collection_colors) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionTheme redact(CollectionTheme value) {
                value.getClass();
                CollectionColors collectionColors = value.collection_colors;
                CollectionColors collectionColorsRedact = collectionColors != null ? CollectionColors.ADAPTER.redact(collectionColors) : null;
                CardStyleHeader cardStyleHeader = value.header_card;
                CardStyleHeader cardStyleHeaderRedact = cardStyleHeader != null ? CardStyleHeader.ADAPTER.redact(cardStyleHeader) : null;
                CardStyleStandard cardStyleStandard = value.standard_card;
                CardStyleStandard cardStyleStandardRedact = cardStyleStandard != null ? CardStyleStandard.ADAPTER.redact(cardStyleStandard) : null;
                CardStyleHalfFeature cardStyleHalfFeature = value.half_feature_card;
                CardStyleHalfFeature cardStyleHalfFeatureRedact = cardStyleHalfFeature != null ? CardStyleHalfFeature.ADAPTER.redact(cardStyleHalfFeature) : null;
                CardStyleQuote cardStyleQuote = value.quote_card;
                CardStyleQuote cardStyleQuoteRedact = cardStyleQuote != null ? CardStyleQuote.ADAPTER.redact(cardStyleQuote) : null;
                CardStyleShortStory cardStyleShortStory = value.short_story_card;
                return value.copy(collectionColorsRedact, cardStyleHeaderRedact, cardStyleStandardRedact, cardStyleHalfFeatureRedact, cardStyleQuoteRedact, cardStyleShortStory != null ? CardStyleShortStory.ADAPTER.redact(cardStyleShortStory) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionTheme value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CardStyleShortStory.ADAPTER.encodeWithTag(writer, 6, value.short_story_card);
                CardStyleQuote.ADAPTER.encodeWithTag(writer, 5, value.quote_card);
                CardStyleHalfFeature.ADAPTER.encodeWithTag(writer, 4, value.half_feature_card);
                CardStyleStandard.ADAPTER.encodeWithTag(writer, 3, value.standard_card);
                CardStyleHeader.ADAPTER.encodeWithTag(writer, 2, value.header_card);
                CollectionColors.ADAPTER.encodeWithTag(writer, 1, value.collection_colors);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionTheme(CollectionColors collectionColors, CardStyleHeader cardStyleHeader, CardStyleStandard cardStyleStandard, CardStyleHalfFeature cardStyleHalfFeature, CardStyleQuote cardStyleQuote, CardStyleShortStory cardStyleShortStory, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : collectionColors, (i & 2) != 0 ? null : cardStyleHeader, (i & 4) != 0 ? null : cardStyleStandard, (i & 8) != 0 ? null : cardStyleHalfFeature, (i & 16) != 0 ? null : cardStyleQuote, (i & 32) != 0 ? null : cardStyleShortStory, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionTheme copy$default(CollectionTheme collectionTheme, CollectionColors collectionColors, CardStyleHeader cardStyleHeader, CardStyleStandard cardStyleStandard, CardStyleHalfFeature cardStyleHalfFeature, CardStyleQuote cardStyleQuote, CardStyleShortStory cardStyleShortStory, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            collectionColors = collectionTheme.collection_colors;
        }
        if ((i & 2) != 0) {
            cardStyleHeader = collectionTheme.header_card;
        }
        if ((i & 4) != 0) {
            cardStyleStandard = collectionTheme.standard_card;
        }
        if ((i & 8) != 0) {
            cardStyleHalfFeature = collectionTheme.half_feature_card;
        }
        if ((i & 16) != 0) {
            cardStyleQuote = collectionTheme.quote_card;
        }
        if ((i & 32) != 0) {
            cardStyleShortStory = collectionTheme.short_story_card;
        }
        if ((i & 64) != 0) {
            h21Var = collectionTheme.unknownFields();
        }
        CardStyleShortStory cardStyleShortStory2 = cardStyleShortStory;
        h21 h21Var2 = h21Var;
        CardStyleQuote cardStyleQuote2 = cardStyleQuote;
        CardStyleStandard cardStyleStandard2 = cardStyleStandard;
        return collectionTheme.copy(collectionColors, cardStyleHeader, cardStyleStandard2, cardStyleHalfFeature, cardStyleQuote2, cardStyleShortStory2, h21Var2);
    }

    public final CollectionTheme copy(CollectionColors collection_colors, CardStyleHeader header_card, CardStyleStandard standard_card, CardStyleHalfFeature half_feature_card, CardStyleQuote quote_card, CardStyleShortStory short_story_card, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionTheme(collection_colors, header_card, standard_card, half_feature_card, quote_card, short_story_card, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionTheme)) {
            return false;
        }
        CollectionTheme collectionTheme = (CollectionTheme) other;
        return g76.L(unknownFields(), collectionTheme.unknownFields()) && g76.L(this.collection_colors, collectionTheme.collection_colors) && g76.L(this.header_card, collectionTheme.header_card) && g76.L(this.standard_card, collectionTheme.standard_card) && g76.L(this.half_feature_card, collectionTheme.half_feature_card) && g76.L(this.quote_card, collectionTheme.quote_card) && g76.L(this.short_story_card, collectionTheme.short_story_card);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        CollectionColors collectionColors = this.collection_colors;
        int iHashCode2 = (iHashCode + (collectionColors != null ? collectionColors.hashCode() : 0)) * 37;
        CardStyleHeader cardStyleHeader = this.header_card;
        int iHashCode3 = (iHashCode2 + (cardStyleHeader != null ? cardStyleHeader.hashCode() : 0)) * 37;
        CardStyleStandard cardStyleStandard = this.standard_card;
        int iHashCode4 = (iHashCode3 + (cardStyleStandard != null ? cardStyleStandard.hashCode() : 0)) * 37;
        CardStyleHalfFeature cardStyleHalfFeature = this.half_feature_card;
        int iHashCode5 = (iHashCode4 + (cardStyleHalfFeature != null ? cardStyleHalfFeature.hashCode() : 0)) * 37;
        CardStyleQuote cardStyleQuote = this.quote_card;
        int iHashCode6 = (iHashCode5 + (cardStyleQuote != null ? cardStyleQuote.hashCode() : 0)) * 37;
        CardStyleShortStory cardStyleShortStory = this.short_story_card;
        int iHashCode7 = iHashCode6 + (cardStyleShortStory != null ? cardStyleShortStory.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final ft1 newBuilder() {
        ft1 ft1Var = new ft1();
        ft1Var.a = this.collection_colors;
        ft1Var.b = this.header_card;
        ft1Var.c = this.standard_card;
        ft1Var.d = this.half_feature_card;
        ft1Var.e = this.quote_card;
        ft1Var.f = this.short_story_card;
        ft1Var.addUnknownFields(unknownFields());
        return ft1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        CollectionColors collectionColors = this.collection_colors;
        if (collectionColors != null) {
            arrayList.add("collection_colors=" + collectionColors);
        }
        CardStyleHeader cardStyleHeader = this.header_card;
        if (cardStyleHeader != null) {
            arrayList.add("header_card=" + cardStyleHeader);
        }
        CardStyleStandard cardStyleStandard = this.standard_card;
        if (cardStyleStandard != null) {
            arrayList.add("standard_card=" + cardStyleStandard);
        }
        CardStyleHalfFeature cardStyleHalfFeature = this.half_feature_card;
        if (cardStyleHalfFeature != null) {
            arrayList.add("half_feature_card=" + cardStyleHalfFeature);
        }
        CardStyleQuote cardStyleQuote = this.quote_card;
        if (cardStyleQuote != null) {
            arrayList.add("quote_card=" + cardStyleQuote);
        }
        CardStyleShortStory cardStyleShortStory = this.short_story_card;
        if (cardStyleShortStory != null) {
            arrayList.add("short_story_card=" + cardStyleShortStory);
        }
        return bu1.F0(arrayList, ", ", "CollectionTheme{", "}", null, 56);
    }

    public CollectionTheme() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionTheme(CollectionColors collectionColors, CardStyleHeader cardStyleHeader, CardStyleStandard cardStyleStandard, CardStyleHalfFeature cardStyleHalfFeature, CardStyleQuote cardStyleQuote, CardStyleShortStory cardStyleShortStory, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.collection_colors = collectionColors;
        this.header_card = cardStyleHeader;
        this.standard_card = cardStyleStandard;
        this.half_feature_card = cardStyleHalfFeature;
        this.quote_card = cardStyleQuote;
        this.short_story_card = cardStyleShortStory;
    }
}
