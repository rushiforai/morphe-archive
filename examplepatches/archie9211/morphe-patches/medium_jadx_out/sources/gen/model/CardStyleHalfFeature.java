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
import defpackage.a71;
import defpackage.b71;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/CardStyleHalfFeature;", "Lcom/squareup/wire/AndroidMessage;", "La71;", "Lgen/model/ColorCombination;", "color_combination_a", "color_combination_b", "color_combination_c", "Lh21;", "unknownFields", "<init>", "(Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lh21;)V", "newBuilder", "()La71;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lgen/model/ColorCombination;Lh21;)Lgen/model/CardStyleHalfFeature;", "Lgen/model/ColorCombination;", "Companion", "b71", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CardStyleHalfFeature extends AndroidMessage<CardStyleHalfFeature, a71> {
    public static final ProtoAdapter<CardStyleHalfFeature> ADAPTER;
    public static final Parcelable.Creator<CardStyleHalfFeature> CREATOR;
    public static final b71 Companion = new b71();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 0, tag = 1)
    public final ColorCombination color_combination_a;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 1, tag = 2)
    public final ColorCombination color_combination_b;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 2, tag = 3)
    public final ColorCombination color_combination_c;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CardStyleHalfFeature.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CardStyleHalfFeature> protoAdapter = new ProtoAdapter<CardStyleHalfFeature>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CardStyleHalfFeature$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleHalfFeature decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                ColorCombination colorCombinationDecode = null;
                ColorCombination colorCombinationDecode2 = null;
                ColorCombination colorCombinationDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CardStyleHalfFeature(colorCombinationDecode, colorCombinationDecode2, colorCombinationDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        colorCombinationDecode = ColorCombination.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        colorCombinationDecode2 = ColorCombination.ADAPTER.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        colorCombinationDecode3 = ColorCombination.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CardStyleHalfFeature value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.color_combination_a);
                protoAdapter2.encodeWithTag(writer, 2, value.color_combination_b);
                protoAdapter2.encodeWithTag(writer, 3, value.color_combination_c);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CardStyleHalfFeature value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(3, value.color_combination_c) + protoAdapter2.encodedSizeWithTag(2, value.color_combination_b) + protoAdapter2.encodedSizeWithTag(1, value.color_combination_a) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleHalfFeature redact(CardStyleHalfFeature value) {
                value.getClass();
                ColorCombination colorCombination = value.color_combination_a;
                ColorCombination colorCombinationRedact = colorCombination != null ? ColorCombination.ADAPTER.redact(colorCombination) : null;
                ColorCombination colorCombination2 = value.color_combination_b;
                ColorCombination colorCombinationRedact2 = colorCombination2 != null ? ColorCombination.ADAPTER.redact(colorCombination2) : null;
                ColorCombination colorCombination3 = value.color_combination_c;
                return value.copy(colorCombinationRedact, colorCombinationRedact2, colorCombination3 != null ? ColorCombination.ADAPTER.redact(colorCombination3) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CardStyleHalfFeature value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ColorCombination> protoAdapter2 = ColorCombination.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 3, value.color_combination_c);
                protoAdapter2.encodeWithTag(writer, 2, value.color_combination_b);
                protoAdapter2.encodeWithTag(writer, 1, value.color_combination_a);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CardStyleHalfFeature(ColorCombination colorCombination, ColorCombination colorCombination2, ColorCombination colorCombination3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : colorCombination, (i & 2) != 0 ? null : colorCombination2, (i & 4) != 0 ? null : colorCombination3, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CardStyleHalfFeature copy$default(CardStyleHalfFeature cardStyleHalfFeature, ColorCombination colorCombination, ColorCombination colorCombination2, ColorCombination colorCombination3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            colorCombination = cardStyleHalfFeature.color_combination_a;
        }
        if ((i & 2) != 0) {
            colorCombination2 = cardStyleHalfFeature.color_combination_b;
        }
        if ((i & 4) != 0) {
            colorCombination3 = cardStyleHalfFeature.color_combination_c;
        }
        if ((i & 8) != 0) {
            h21Var = cardStyleHalfFeature.unknownFields();
        }
        return cardStyleHalfFeature.copy(colorCombination, colorCombination2, colorCombination3, h21Var);
    }

    public final CardStyleHalfFeature copy(ColorCombination color_combination_a, ColorCombination color_combination_b, ColorCombination color_combination_c, h21 unknownFields) {
        unknownFields.getClass();
        return new CardStyleHalfFeature(color_combination_a, color_combination_b, color_combination_c, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CardStyleHalfFeature)) {
            return false;
        }
        CardStyleHalfFeature cardStyleHalfFeature = (CardStyleHalfFeature) other;
        return g76.L(unknownFields(), cardStyleHalfFeature.unknownFields()) && g76.L(this.color_combination_a, cardStyleHalfFeature.color_combination_a) && g76.L(this.color_combination_b, cardStyleHalfFeature.color_combination_b) && g76.L(this.color_combination_c, cardStyleHalfFeature.color_combination_c);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        ColorCombination colorCombination = this.color_combination_a;
        int iHashCode2 = (iHashCode + (colorCombination != null ? colorCombination.hashCode() : 0)) * 37;
        ColorCombination colorCombination2 = this.color_combination_b;
        int iHashCode3 = (iHashCode2 + (colorCombination2 != null ? colorCombination2.hashCode() : 0)) * 37;
        ColorCombination colorCombination3 = this.color_combination_c;
        int iHashCode4 = iHashCode3 + (colorCombination3 != null ? colorCombination3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final a71 newBuilder() {
        a71 a71Var = new a71();
        a71Var.a = this.color_combination_a;
        a71Var.b = this.color_combination_b;
        a71Var.c = this.color_combination_c;
        a71Var.addUnknownFields(unknownFields());
        return a71Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        ColorCombination colorCombination = this.color_combination_a;
        if (colorCombination != null) {
            arrayList.add("color_combination_a=" + colorCombination);
        }
        ColorCombination colorCombination2 = this.color_combination_b;
        if (colorCombination2 != null) {
            arrayList.add("color_combination_b=" + colorCombination2);
        }
        ColorCombination colorCombination3 = this.color_combination_c;
        if (colorCombination3 != null) {
            arrayList.add("color_combination_c=" + colorCombination3);
        }
        return bu1.F0(arrayList, ", ", "CardStyleHalfFeature{", "}", null, 56);
    }

    public CardStyleHalfFeature() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CardStyleHalfFeature(ColorCombination colorCombination, ColorCombination colorCombination2, ColorCombination colorCombination3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.color_combination_a = colorCombination;
        this.color_combination_b = colorCombination2;
        this.color_combination_c = colorCombination3;
    }
}
