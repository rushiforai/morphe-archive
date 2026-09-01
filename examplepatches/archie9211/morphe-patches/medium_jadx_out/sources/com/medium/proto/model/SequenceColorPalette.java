package com.medium.proto.model;

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
import defpackage.n1b;
import defpackage.ozb;
import defpackage.pzb;
import defpackage.wg6;
import gen.model.ColorSpectrum;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lcom/medium/proto/model/SequenceColorPalette;", "Lcom/squareup/wire/AndroidMessage;", "Lozb;", "Lgen/model/ColorSpectrum;", "default_background_spectrum", "tint_background_spectrum", "highlight_spectrum", "Lh21;", "unknownFields", "<init>", "(Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lh21;)V", "newBuilder", "()Lozb;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lgen/model/ColorSpectrum;Lh21;)Lcom/medium/proto/model/SequenceColorPalette;", "Lgen/model/ColorSpectrum;", "Companion", "pzb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SequenceColorPalette extends AndroidMessage<SequenceColorPalette, ozb> {
    public static final ProtoAdapter<SequenceColorPalette> ADAPTER;
    public static final Parcelable.Creator<SequenceColorPalette> CREATOR;
    public static final pzb Companion = new pzb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 0, tag = 1)
    public final ColorSpectrum default_background_spectrum;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 2, tag = 3)
    public final ColorSpectrum highlight_spectrum;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 1, tag = 2)
    public final ColorSpectrum tint_background_spectrum;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SequenceColorPalette.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SequenceColorPalette> protoAdapter = new ProtoAdapter<SequenceColorPalette>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.SequenceColorPalette$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SequenceColorPalette decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                ColorSpectrum colorSpectrumDecode = null;
                ColorSpectrum colorSpectrumDecode2 = null;
                ColorSpectrum colorSpectrumDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SequenceColorPalette(colorSpectrumDecode, colorSpectrumDecode2, colorSpectrumDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        colorSpectrumDecode = ColorSpectrum.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        colorSpectrumDecode2 = ColorSpectrum.ADAPTER.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        colorSpectrumDecode3 = ColorSpectrum.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SequenceColorPalette value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.default_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 2, value.tint_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 3, value.highlight_spectrum);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SequenceColorPalette value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(3, value.highlight_spectrum) + protoAdapter2.encodedSizeWithTag(2, value.tint_background_spectrum) + protoAdapter2.encodedSizeWithTag(1, value.default_background_spectrum) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SequenceColorPalette redact(SequenceColorPalette value) {
                value.getClass();
                ColorSpectrum colorSpectrum = value.default_background_spectrum;
                ColorSpectrum colorSpectrumRedact = colorSpectrum != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum) : null;
                ColorSpectrum colorSpectrum2 = value.tint_background_spectrum;
                ColorSpectrum colorSpectrumRedact2 = colorSpectrum2 != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum2) : null;
                ColorSpectrum colorSpectrum3 = value.highlight_spectrum;
                return value.copy(colorSpectrumRedact, colorSpectrumRedact2, colorSpectrum3 != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum3) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SequenceColorPalette value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ColorSpectrum> protoAdapter2 = ColorSpectrum.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 3, value.highlight_spectrum);
                protoAdapter2.encodeWithTag(writer, 2, value.tint_background_spectrum);
                protoAdapter2.encodeWithTag(writer, 1, value.default_background_spectrum);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SequenceColorPalette(ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : colorSpectrum, (i & 2) != 0 ? null : colorSpectrum2, (i & 4) != 0 ? null : colorSpectrum3, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SequenceColorPalette copy$default(SequenceColorPalette sequenceColorPalette, ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            colorSpectrum = sequenceColorPalette.default_background_spectrum;
        }
        if ((i & 2) != 0) {
            colorSpectrum2 = sequenceColorPalette.tint_background_spectrum;
        }
        if ((i & 4) != 0) {
            colorSpectrum3 = sequenceColorPalette.highlight_spectrum;
        }
        if ((i & 8) != 0) {
            h21Var = sequenceColorPalette.unknownFields();
        }
        return sequenceColorPalette.copy(colorSpectrum, colorSpectrum2, colorSpectrum3, h21Var);
    }

    public final SequenceColorPalette copy(ColorSpectrum default_background_spectrum, ColorSpectrum tint_background_spectrum, ColorSpectrum highlight_spectrum, h21 unknownFields) {
        unknownFields.getClass();
        return new SequenceColorPalette(default_background_spectrum, tint_background_spectrum, highlight_spectrum, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SequenceColorPalette)) {
            return false;
        }
        SequenceColorPalette sequenceColorPalette = (SequenceColorPalette) other;
        return g76.L(unknownFields(), sequenceColorPalette.unknownFields()) && g76.L(this.default_background_spectrum, sequenceColorPalette.default_background_spectrum) && g76.L(this.tint_background_spectrum, sequenceColorPalette.tint_background_spectrum) && g76.L(this.highlight_spectrum, sequenceColorPalette.highlight_spectrum);
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
        int iHashCode4 = iHashCode3 + (colorSpectrum3 != null ? colorSpectrum3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final ozb newBuilder() {
        ozb ozbVar = new ozb();
        ozbVar.a = this.default_background_spectrum;
        ozbVar.b = this.tint_background_spectrum;
        ozbVar.c = this.highlight_spectrum;
        ozbVar.addUnknownFields(unknownFields());
        return ozbVar;
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
        return bu1.F0(arrayList, ", ", "SequenceColorPalette{", "}", null, 56);
    }

    public SequenceColorPalette() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SequenceColorPalette(ColorSpectrum colorSpectrum, ColorSpectrum colorSpectrum2, ColorSpectrum colorSpectrum3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.default_background_spectrum = colorSpectrum;
        this.tint_background_spectrum = colorSpectrum2;
        this.highlight_spectrum = colorSpectrum3;
    }
}
