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
import defpackage.c71;
import defpackage.d71;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019¨\u0006\u001c"}, d2 = {"Lgen/model/CardStyleHeader;", "Lcom/squareup/wire/AndroidMessage;", "Lc71;", "Lgen/model/ColorCombination;", "color_combination_accent_no_fill", "color_combination_accent_fill", "Lh21;", "unknownFields", "<init>", "(Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lh21;)V", "newBuilder", "()Lc71;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lh21;)Lgen/model/CardStyleHeader;", "Lgen/model/ColorCombination;", "Companion", "d71", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CardStyleHeader extends AndroidMessage<CardStyleHeader, c71> {
    public static final ProtoAdapter<CardStyleHeader> ADAPTER;
    public static final Parcelable.Creator<CardStyleHeader> CREATOR;
    public static final d71 Companion = new d71();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 1, tag = 2)
    public final ColorCombination color_combination_accent_fill;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 0, tag = 1)
    public final ColorCombination color_combination_accent_no_fill;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CardStyleHeader.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CardStyleHeader> protoAdapter = new ProtoAdapter<CardStyleHeader>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CardStyleHeader$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleHeader decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                ColorCombination colorCombinationDecode = null;
                ColorCombination colorCombinationDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CardStyleHeader(colorCombinationDecode, colorCombinationDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        colorCombinationDecode = ColorCombination.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        colorCombinationDecode2 = ColorCombination.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CardStyleHeader value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.color_combination_accent_no_fill);
                protoAdapter2.encodeWithTag(writer, 2, value.color_combination_accent_fill);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CardStyleHeader value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(2, value.color_combination_accent_fill) + protoAdapter2.encodedSizeWithTag(1, value.color_combination_accent_no_fill) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleHeader redact(CardStyleHeader value) {
                value.getClass();
                ColorCombination colorCombination = value.color_combination_accent_no_fill;
                ColorCombination colorCombinationRedact = colorCombination != null ? ColorCombination.ADAPTER.redact(colorCombination) : null;
                ColorCombination colorCombination2 = value.color_combination_accent_fill;
                return value.copy(colorCombinationRedact, colorCombination2 != null ? ColorCombination.ADAPTER.redact(colorCombination2) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CardStyleHeader value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 2, value.color_combination_accent_fill);
                protoAdapter2.encodeWithTag(writer, 1, value.color_combination_accent_no_fill);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CardStyleHeader(ColorCombination colorCombination, ColorCombination colorCombination2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : colorCombination, (i & 2) != 0 ? null : colorCombination2, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CardStyleHeader copy$default(CardStyleHeader cardStyleHeader, ColorCombination colorCombination, ColorCombination colorCombination2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            colorCombination = cardStyleHeader.color_combination_accent_no_fill;
        }
        if ((i & 2) != 0) {
            colorCombination2 = cardStyleHeader.color_combination_accent_fill;
        }
        if ((i & 4) != 0) {
            h21Var = cardStyleHeader.unknownFields();
        }
        return cardStyleHeader.copy(colorCombination, colorCombination2, h21Var);
    }

    public final CardStyleHeader copy(ColorCombination color_combination_accent_no_fill, ColorCombination color_combination_accent_fill, h21 unknownFields) {
        unknownFields.getClass();
        return new CardStyleHeader(color_combination_accent_no_fill, color_combination_accent_fill, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CardStyleHeader)) {
            return false;
        }
        CardStyleHeader cardStyleHeader = (CardStyleHeader) other;
        return g76.L(unknownFields(), cardStyleHeader.unknownFields()) && g76.L(this.color_combination_accent_no_fill, cardStyleHeader.color_combination_accent_no_fill) && g76.L(this.color_combination_accent_fill, cardStyleHeader.color_combination_accent_fill);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        ColorCombination colorCombination = this.color_combination_accent_no_fill;
        int iHashCode2 = (iHashCode + (colorCombination != null ? colorCombination.hashCode() : 0)) * 37;
        ColorCombination colorCombination2 = this.color_combination_accent_fill;
        int iHashCode3 = iHashCode2 + (colorCombination2 != null ? colorCombination2.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final c71 newBuilder() {
        c71 c71Var = new c71();
        c71Var.a = this.color_combination_accent_no_fill;
        c71Var.b = this.color_combination_accent_fill;
        c71Var.addUnknownFields(unknownFields());
        return c71Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        ColorCombination colorCombination = this.color_combination_accent_no_fill;
        if (colorCombination != null) {
            arrayList.add("color_combination_accent_no_fill=" + colorCombination);
        }
        ColorCombination colorCombination2 = this.color_combination_accent_fill;
        if (colorCombination2 != null) {
            arrayList.add("color_combination_accent_fill=" + colorCombination2);
        }
        return bu1.F0(arrayList, ", ", "CardStyleHeader{", "}", null, 56);
    }

    public CardStyleHeader() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CardStyleHeader(ColorCombination colorCombination, ColorCombination colorCombination2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.color_combination_accent_no_fill = colorCombination;
        this.color_combination_accent_fill = colorCombination2;
    }
}
