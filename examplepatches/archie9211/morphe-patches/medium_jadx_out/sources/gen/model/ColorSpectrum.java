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
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.mv1;
import defpackage.n1b;
import defpackage.nv1;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB-\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J3\u0010\u0018\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001aR\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001b¨\u0006\u001e"}, d2 = {"Lgen/model/ColorSpectrum;", "Lcom/squareup/wire/AndroidMessage;", "Lmv1;", "", "Lgen/model/ColorPoint;", "color_points", "", "background_color", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lmv1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Ljava/lang/String;Lh21;)Lgen/model/ColorSpectrum;", "Ljava/lang/String;", "Ljava/util/List;", "Companion", "nv1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ColorSpectrum extends AndroidMessage<ColorSpectrum, mv1> {
    public static final ProtoAdapter<ColorSpectrum> ADAPTER;
    public static final Parcelable.Creator<ColorSpectrum> CREATOR;
    public static final nv1 Companion = new nv1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String background_color;

    @WireField(adapter = "gen.model.ColorPoint#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<ColorPoint> color_points;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ColorSpectrum.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ColorSpectrum> protoAdapter = new ProtoAdapter<ColorSpectrum>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ColorSpectrum$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ColorSpectrum decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ColorSpectrum(arrayListF, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(ColorPoint.ADAPTER.decode(reader));
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ColorSpectrum value) {
                writer.getClass();
                value.getClass();
                ColorPoint.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.color_points);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.background_color);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ColorSpectrum value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.background_color) + ColorPoint.ADAPTER.asRepeated().encodedSizeWithTag(1, value.color_points) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ColorSpectrum redact(ColorSpectrum value) {
                value.getClass();
                return ColorSpectrum.copy$default(value, Internal.m97redactElements(value.color_points, ColorPoint.ADAPTER), null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ColorSpectrum value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.background_color);
                ColorPoint.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.color_points);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorSpectrum(List<ColorPoint> list, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.background_color = str;
        this.color_points = Internal.immutableCopyOf("color_points", list);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ColorSpectrum copy$default(ColorSpectrum colorSpectrum, List list, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = colorSpectrum.color_points;
        }
        if ((i & 2) != 0) {
            str = colorSpectrum.background_color;
        }
        if ((i & 4) != 0) {
            h21Var = colorSpectrum.unknownFields();
        }
        return colorSpectrum.copy(list, str, h21Var);
    }

    public final ColorSpectrum copy(List<ColorPoint> color_points, String background_color, h21 unknownFields) {
        color_points.getClass();
        unknownFields.getClass();
        return new ColorSpectrum(color_points, background_color, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ColorSpectrum)) {
            return false;
        }
        ColorSpectrum colorSpectrum = (ColorSpectrum) other;
        return g76.L(unknownFields(), colorSpectrum.unknownFields()) && g76.L(this.color_points, colorSpectrum.color_points) && g76.L(this.background_color, colorSpectrum.background_color);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iP = wgd.p(unknownFields().hashCode() * 37, 37, this.color_points);
        String str = this.background_color;
        int iHashCode = iP + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final mv1 newBuilder() {
        mv1 mv1Var = new mv1();
        mv1Var.a = ey3.a;
        mv1Var.a = this.color_points;
        mv1Var.b = this.background_color;
        mv1Var.addUnknownFields(unknownFields());
        return mv1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.color_points.isEmpty()) {
            b09.J("color_points=", this.color_points, arrayList);
        }
        String str = this.background_color;
        if (str != null) {
            lv8.D(str, "background_color=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "ColorSpectrum{", "}", null, 56);
    }

    public /* synthetic */ ColorSpectrum(List list, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? ey3.a : list, (i & 2) != 0 ? null : str, (i & 4) != 0 ? h21.d : h21Var);
    }

    public ColorSpectrum() {
        this(null, null, null, 7, null);
    }
}
