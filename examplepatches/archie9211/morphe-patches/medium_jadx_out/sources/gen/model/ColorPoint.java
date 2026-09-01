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
import defpackage.bv1;
import defpackage.cv1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/ColorPoint;", "Lcom/squareup/wire/AndroidMessage;", "Lbv1;", "", "color", "", "point", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Float;Lh21;)V", "newBuilder", "()Lbv1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Float;Lh21;)Lgen/model/ColorPoint;", "Ljava/lang/String;", "Ljava/lang/Float;", "Companion", "cv1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ColorPoint extends AndroidMessage<ColorPoint, bv1> {
    public static final ProtoAdapter<ColorPoint> ADAPTER;
    public static final Parcelable.Creator<ColorPoint> CREATOR;
    public static final cv1 Companion = new cv1();
    public static final float DEFAULT_POINT = 0.0f;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String color;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 1, tag = 2)
    public final Float point;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ColorPoint.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ColorPoint> protoAdapter = new ProtoAdapter<ColorPoint>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ColorPoint$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ColorPoint decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Float fDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ColorPoint(strDecode, fDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        fDecode = ProtoAdapter.FLOAT.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ColorPoint value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.color);
                ProtoAdapter.FLOAT.encodeWithTag(writer, 2, value.point);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ColorPoint value) {
                value.getClass();
                return ProtoAdapter.FLOAT.encodedSizeWithTag(2, value.point) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.color) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ColorPoint redact(ColorPoint value) {
                value.getClass();
                return ColorPoint.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ColorPoint value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.FLOAT.encodeWithTag(writer, 2, value.point);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.color);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ColorPoint(String str, Float f, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : f, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ColorPoint copy$default(ColorPoint colorPoint, String str, Float f, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = colorPoint.color;
        }
        if ((i & 2) != 0) {
            f = colorPoint.point;
        }
        if ((i & 4) != 0) {
            h21Var = colorPoint.unknownFields();
        }
        return colorPoint.copy(str, f, h21Var);
    }

    public final ColorPoint copy(String color, Float point, h21 unknownFields) {
        unknownFields.getClass();
        return new ColorPoint(color, point, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ColorPoint)) {
            return false;
        }
        ColorPoint colorPoint = (ColorPoint) other;
        return g76.L(unknownFields(), colorPoint.unknownFields()) && g76.L(this.color, colorPoint.color) && g76.K(this.point, colorPoint.point);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.color;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Float f = this.point;
        int iFloatToIntBits = iHashCode2 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0);
        this.hashCode = iFloatToIntBits;
        return iFloatToIntBits;
    }

    @Override // com.squareup.wire.Message
    public final bv1 newBuilder() {
        bv1 bv1Var = new bv1();
        bv1Var.a = this.color;
        bv1Var.b = this.point;
        bv1Var.addUnknownFields(unknownFields());
        return bv1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.color;
        if (str != null) {
            lv8.D(str, "color=", arrayList);
        }
        Float f = this.point;
        if (f != null) {
            arrayList.add("point=" + f);
        }
        return bu1.F0(arrayList, ", ", "ColorPoint{", "}", null, 56);
    }

    public ColorPoint() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorPoint(String str, Float f, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.color = str;
        this.point = f;
    }
}
