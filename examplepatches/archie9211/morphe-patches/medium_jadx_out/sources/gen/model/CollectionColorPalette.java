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
import defpackage.br1;
import defpackage.bu1;
import defpackage.cr1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lgen/model/CollectionColorPalette;", "Lcom/squareup/wire/AndroidMessage;", "Lbr1;", "Lgen/model/ColorSpectrum;", "default_background_spectrum", "tint_background_spectrum", "highlight_spectrum", "dark_background_spectrum", "Lh21;", "unknownFields", "<init>", "(Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lh21;)V", "newBuilder", "()Lbr1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lh21;)Lgen/model/CollectionColorPalette;", "Lgen/model/ColorSpectrum;", "Companion", "cr1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionColorPalette extends AndroidMessage<CollectionColorPalette, br1> {
    public static final ProtoAdapter<CollectionColorPalette> ADAPTER;
    public static final Parcelable.Creator<CollectionColorPalette> CREATOR;
    public static final cr1 Companion = new cr1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 3, tag = 4)
    public final ColorSpectrum dark_background_spectrum;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 0, tag = 1)
    public final ColorSpectrum default_background_spectrum;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 2, tag = 3)
    public final ColorSpectrum highlight_spectrum;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 1, tag = 2)
    public final ColorSpectrum tint_background_spectrum;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionColorPalette.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionColorPalette> protoAdapter = new ProtoAdapter<CollectionColorPalette>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionColorPalette$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionColorPalette decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                ColorSpectrum colorSpectrumDecode = null;
                ColorSpectrum colorSpectrumDecode2 = null;
                ColorSpectrum colorSpectrumDecode3 = null;
                ColorSpectrum colorSpectrumDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionColorPalette(colorSpectrumDecode, colorSpectrumDecode2, colorSpectrumDecode3, colorSpectrumDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        colorSpectrumDecode = ColorSpectrum.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        colorSpectrumDecode2 = ColorSpectrum.ADAPTER.decode(reader);
                    } else if (iNextTag == 3) {
                        colorSpectrumDecode3 = ColorSpectrum.ADAPTER.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        colorSpectrumDecode4 = ColorSpectrum.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionColorPalette value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.default_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 2, value.tint_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 3, value.highlight_spectrum);
                protoAdapter2.encodeWithTag(writer, 4, value.dark_background_spectrum);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionColorPalette value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(4, value.dark_background_spectrum) + protoAdapter2.encodedSizeWithTag(3, value.highlight_spectrum) + protoAdapter2.encodedSizeWithTag(2, value.tint_background_spectrum) + protoAdapter2.encodedSizeWithTag(1, value.default_background_spectrum) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionColorPalette redact(CollectionColorPalette value) {
                value.getClass();
                ColorSpectrum colorSpectrum = value.default_background_spectrum;
                ColorSpectrum colorSpectrumRedact = colorSpectrum != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum) : null;
                ColorSpectrum colorSpectrum2 = value.tint_background_spectrum;
                ColorSpectrum colorSpectrumRedact2 = colorSpectrum2 != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum2) : null;
                ColorSpectrum colorSpectrum3 = value.highlight_spectrum;
                ColorSpectrum colorSpectrumRedact3 = colorSpectrum3 != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum3) : null;
                ColorSpectrum colorSpectrum4 = value.dark_background_spectrum;
                return value.copy(colorSpectrumRedact, colorSpectrumRedact2, colorSpectrumRedact3, colorSpectrum4 != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum4) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionColorPalette value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 4, value.dark_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 3, value.highlight_spectrum);
                protoAdapter2.encodeWithTag(writer, 2, value.tint_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 1, value.default_background_spectrum);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionColorPalette(ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, ColorSpectrum colorSpectrum4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : colorSpectrum, (i & 2) != 0 ? null : colorSpectrum2, (i & 4) != 0 ? null : colorSpectrum3, (i & 8) != 0 ? null : colorSpectrum4, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionColorPalette copy$default(CollectionColorPalette collectionColorPalette, ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, ColorSpectrum colorSpectrum4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            colorSpectrum = collectionColorPalette.default_background_spectrum;
        }
        if ((i & 2) != 0) {
            colorSpectrum2 = collectionColorPalette.tint_background_spectrum;
        }
        if ((i & 4) != 0) {
            colorSpectrum3 = collectionColorPalette.highlight_spectrum;
        }
        if ((i & 8) != 0) {
            colorSpectrum4 = collectionColorPalette.dark_background_spectrum;
        }
        if ((i & 16) != 0) {
            h21Var = collectionColorPalette.unknownFields();
        }
        h21 h21Var2 = h21Var;
        ColorSpectrum colorSpectrum5 = colorSpectrum3;
        return collectionColorPalette.copy(colorSpectrum, colorSpectrum2, colorSpectrum5, colorSpectrum4, h21Var2);
    }

    public final CollectionColorPalette copy(ColorSpectrum default_background_spectrum, ColorSpectrum tint_background_spectrum, ColorSpectrum highlight_spectrum, ColorSpectrum dark_background_spectrum, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionColorPalette(default_background_spectrum, tint_background_spectrum, highlight_spectrum, dark_background_spectrum, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionColorPalette)) {
            return false;
        }
        CollectionColorPalette collectionColorPalette = (CollectionColorPalette) other;
        return g76.L(unknownFields(), collectionColorPalette.unknownFields()) && g76.L(this.default_background_spectrum, collectionColorPalette.default_background_spectrum) && g76.L(this.tint_background_spectrum, collectionColorPalette.tint_background_spectrum) && g76.L(this.highlight_spectrum, collectionColorPalette.highlight_spectrum) && g76.L(this.dark_background_spectrum, collectionColorPalette.dark_background_spectrum);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        ColorSpectrum colorSpectrum = this.default_background_spectrum;
        int iHashCode2 = (iHashCode + (colorSpectrum != null ? colorSpectrum.hashCode() : 0)) * 37;
        ColorSpectrum colorSpectrum2 = this.tint_background_spectrum;
        int iHashCode3 = (iHashCode2 + (colorSpectrum2 != null ? colorSpectrum2.hashCode() : 0)) * 37;
        ColorSpectrum colorSpectrum3 = this.highlight_spectrum;
        int iHashCode4 = (iHashCode3 + (colorSpectrum3 != null ? colorSpectrum3.hashCode() : 0)) * 37;
        ColorSpectrum colorSpectrum4 = this.dark_background_spectrum;
        int iHashCode5 = iHashCode4 + (colorSpectrum4 != null ? colorSpectrum4.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final br1 newBuilder() {
        br1 br1Var = new br1();
        br1Var.a = this.default_background_spectrum;
        br1Var.b = this.tint_background_spectrum;
        br1Var.c = this.highlight_spectrum;
        br1Var.d = this.dark_background_spectrum;
        br1Var.addUnknownFields(unknownFields());
        return br1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        ColorSpectrum colorSpectrum = this.default_background_spectrum;
        if (colorSpectrum != null) {
            arrayList.add("default_background_spectrum=" + colorSpectrum);
        }
        ColorSpectrum colorSpectrum2 = this.tint_background_spectrum;
        if (colorSpectrum2 != null) {
            arrayList.add("tint_background_spectrum=" + colorSpectrum2);
        }
        ColorSpectrum colorSpectrum3 = this.highlight_spectrum;
        if (colorSpectrum3 != null) {
            arrayList.add("highlight_spectrum=" + colorSpectrum3);
        }
        ColorSpectrum colorSpectrum4 = this.dark_background_spectrum;
        if (colorSpectrum4 != null) {
            arrayList.add("dark_background_spectrum=" + colorSpectrum4);
        }
        return bu1.F0(arrayList, ", ", "CollectionColorPalette{", "}", null, 56);
    }

    public CollectionColorPalette() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionColorPalette(ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, ColorSpectrum colorSpectrum4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.default_background_spectrum = colorSpectrum;
        this.tint_background_spectrum = colorSpectrum2;
        this.highlight_spectrum = colorSpectrum3;
        this.dark_background_spectrum = colorSpectrum4;
    }
}
