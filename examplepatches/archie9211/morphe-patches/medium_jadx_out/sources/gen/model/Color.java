package gen.model;

import android.os.Parcelable;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.su1;
import defpackage.tu1;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J/\u0010\u0016\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0018¨\u0006\u001b"}, d2 = {"Lgen/model/Color;", "Lcom/squareup/wire/AndroidMessage;", "Lsu1;", "", "dark_mode_hex", "light_mode_hex", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lsu1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/Color;", "Ljava/lang/String;", "Companion", "tu1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Color extends AndroidMessage<Color, su1> {
    public static final ProtoAdapter<Color> ADAPTER;
    public static final Parcelable.Creator<Color> CREATOR;
    public static final tu1 Companion = new tu1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String dark_mode_hex;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String light_mode_hex;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Color.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Color> protoAdapter = new ProtoAdapter<Color>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Color$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Color decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Color(strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Color value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.dark_mode_hex);
                protoAdapter2.encodeWithTag(writer, 2, value.light_mode_hex);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Color value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(2, value.light_mode_hex) + protoAdapter2.encodedSizeWithTag(1, value.dark_mode_hex) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Color redact(Color value) {
                value.getClass();
                return Color.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Color value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.light_mode_hex);
                protoAdapter2.encodeWithTag(writer, 1, value.dark_mode_hex);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Color(String str, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Color copy$default(Color color, String str, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = color.dark_mode_hex;
        }
        if ((i & 2) != 0) {
            str2 = color.light_mode_hex;
        }
        if ((i & 4) != 0) {
            h21Var = color.unknownFields();
        }
        return color.copy(str, str2, h21Var);
    }

    public final Color copy(String dark_mode_hex, String light_mode_hex, h21 unknownFields) {
        unknownFields.getClass();
        return new Color(dark_mode_hex, light_mode_hex, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Color)) {
            return false;
        }
        Color color = (Color) other;
        return g76.L(unknownFields(), color.unknownFields()) && g76.L(this.dark_mode_hex, color.dark_mode_hex) && g76.L(this.light_mode_hex, color.light_mode_hex);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.dark_mode_hex;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.light_mode_hex;
        int iHashCode3 = iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final su1 newBuilder() {
        su1 su1Var = new su1();
        su1Var.a = this.dark_mode_hex;
        su1Var.b = this.light_mode_hex;
        su1Var.addUnknownFields(unknownFields());
        return su1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.dark_mode_hex;
        if (str != null) {
            lv8.D(str, "dark_mode_hex=", arrayList);
        }
        String str2 = this.light_mode_hex;
        if (str2 != null) {
            lv8.D(str2, "light_mode_hex=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "Color{", ziYqbdHrAXvj.dLarPANBlXAF, null, 56);
    }

    public Color() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Color(String str, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.dark_mode_hex = str;
        this.light_mode_hex = str2;
    }
}
