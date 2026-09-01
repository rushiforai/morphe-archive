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
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.i71;
import defpackage.j71;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J#\u0010\u0016\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018¨\u0006\u001b"}, d2 = {"Lgen/model/CardStyleStandard;", "Lcom/squareup/wire/AndroidMessage;", "Li71;", "Lgen/model/ColorCombination;", "color_combination_a", "Lh21;", "unknownFields", "<init>", "(Lgen/model/ColorCombination;Lh21;)V", "newBuilder", "()Li71;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/ColorCombination;Lh21;)Lgen/model/CardStyleStandard;", "Lgen/model/ColorCombination;", "Companion", "j71", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CardStyleStandard extends AndroidMessage<CardStyleStandard, i71> {
    public static final ProtoAdapter<CardStyleStandard> ADAPTER;
    public static final Parcelable.Creator<CardStyleStandard> CREATOR;
    public static final j71 Companion = new j71();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ColorCombination#ADAPTER", schemaIndex = 0, tag = 1)
    public final ColorCombination color_combination_a;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CardStyleStandard.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CardStyleStandard> protoAdapter = new ProtoAdapter<CardStyleStandard>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CardStyleStandard$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleStandard decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                ColorCombination colorCombinationDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CardStyleStandard(colorCombinationDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        colorCombinationDecode = ColorCombination.ADAPTER.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CardStyleStandard value) {
                writer.getClass();
                value.getClass();
                ColorCombination.ADAPTER.encodeWithTag(writer, 1, value.color_combination_a);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CardStyleStandard value) {
                value.getClass();
                return ColorCombination.ADAPTER.encodedSizeWithTag(1, value.color_combination_a) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CardStyleStandard redact(CardStyleStandard value) {
                value.getClass();
                ColorCombination colorCombination = value.color_combination_a;
                return value.copy(colorCombination != null ? ColorCombination.ADAPTER.redact(colorCombination) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CardStyleStandard value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ColorCombination.ADAPTER.encodeWithTag(writer, 1, value.color_combination_a);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CardStyleStandard(ColorCombination colorCombination, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : colorCombination, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CardStyleStandard copy$default(CardStyleStandard cardStyleStandard, ColorCombination colorCombination, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            colorCombination = cardStyleStandard.color_combination_a;
        }
        if ((i & 2) != 0) {
            h21Var = cardStyleStandard.unknownFields();
        }
        return cardStyleStandard.copy(colorCombination, h21Var);
    }

    public final CardStyleStandard copy(ColorCombination color_combination_a, h21 unknownFields) {
        unknownFields.getClass();
        return new CardStyleStandard(color_combination_a, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CardStyleStandard)) {
            return false;
        }
        CardStyleStandard cardStyleStandard = (CardStyleStandard) other;
        return g76.L(unknownFields(), cardStyleStandard.unknownFields()) && g76.L(this.color_combination_a, cardStyleStandard.color_combination_a);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        ColorCombination colorCombination = this.color_combination_a;
        int iHashCode2 = iHashCode + (colorCombination != null ? colorCombination.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final i71 newBuilder() {
        i71 i71Var = new i71();
        i71Var.a = this.color_combination_a;
        i71Var.addUnknownFields(unknownFields());
        return i71Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        ColorCombination colorCombination = this.color_combination_a;
        if (colorCombination != null) {
            arrayList.add("color_combination_a=" + colorCombination);
        }
        return bu1.F0(arrayList, ", ", "CardStyleStandard{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CardStyleStandard() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CardStyleStandard(ColorCombination colorCombination, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.color_combination_a = colorCombination;
    }
}
