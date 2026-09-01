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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.vu1;
import defpackage.wg6;
import defpackage.wu1;
import java.util.ArrayList;
import kotlin.Metadata;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ_\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lgen/model/ColorCombination;", "Lcom/squareup/wire/AndroidMessage;", "Lvu1;", "", "name", "Lgen/model/CollectionColorType;", "accent_text_color", "background_color", "main_text_color", "subtle_text_color", "very_subtle_text_color", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lh21;)V", "newBuilder", "()Lvu1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lgen/model/CollectionColorType;Lh21;)Lgen/model/ColorCombination;", "Ljava/lang/String;", "Lgen/model/CollectionColorType;", "Companion", "wu1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ColorCombination extends AndroidMessage<ColorCombination, vu1> {
    public static final ProtoAdapter<ColorCombination> ADAPTER;
    public static final Parcelable.Creator<ColorCombination> CREATOR;
    public static final wu1 Companion = new wu1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionColorType#ADAPTER", schemaIndex = 1, tag = 2)
    public final CollectionColorType accent_text_color;

    @WireField(adapter = "gen.model.CollectionColorType#ADAPTER", schemaIndex = 2, tag = 3)
    public final CollectionColorType background_color;

    @WireField(adapter = "gen.model.CollectionColorType#ADAPTER", schemaIndex = 3, tag = 4)
    public final CollectionColorType main_text_color;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String name;

    @WireField(adapter = "gen.model.CollectionColorType#ADAPTER", schemaIndex = 4, tag = 5)
    public final CollectionColorType subtle_text_color;

    @WireField(adapter = "gen.model.CollectionColorType#ADAPTER", schemaIndex = 5, tag = 6)
    public final CollectionColorType very_subtle_text_color;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ColorCombination.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ColorCombination> protoAdapter = new ProtoAdapter<ColorCombination>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ColorCombination$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ColorCombination decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                CollectionColorType collectionColorTypeDecode = null;
                CollectionColorType collectionColorTypeDecode2 = null;
                CollectionColorType collectionColorTypeDecode3 = null;
                CollectionColorType collectionColorTypeDecode4 = null;
                CollectionColorType collectionColorTypeDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ColorCombination(strDecode, collectionColorTypeDecode, collectionColorTypeDecode2, collectionColorTypeDecode3, collectionColorTypeDecode4, collectionColorTypeDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            try {
                                collectionColorTypeDecode = CollectionColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 3:
                            try {
                                collectionColorTypeDecode2 = CollectionColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 4:
                            try {
                                collectionColorTypeDecode3 = CollectionColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                            }
                            break;
                        case 5:
                            try {
                                collectionColorTypeDecode4 = CollectionColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                            }
                            break;
                        case 6:
                            try {
                                collectionColorTypeDecode5 = CollectionColorType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ColorCombination value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.name);
                ProtoAdapter<CollectionColorType> protoAdapter2 = CollectionColorType.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 2, value.accent_text_color);
                protoAdapter2.encodeWithTag(writer, 3, value.background_color);
                protoAdapter2.encodeWithTag(writer, 4, value.main_text_color);
                protoAdapter2.encodeWithTag(writer, 5, value.subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 6, value.very_subtle_text_color);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ColorCombination value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.STRING.encodedSizeWithTag(1, value.name) + value.unknownFields().e();
                ProtoAdapter<CollectionColorType> protoAdapter2 = CollectionColorType.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(6, value.very_subtle_text_color) + protoAdapter2.encodedSizeWithTag(5, value.subtle_text_color) + protoAdapter2.encodedSizeWithTag(4, value.main_text_color) + protoAdapter2.encodedSizeWithTag(3, value.background_color) + protoAdapter2.encodedSizeWithTag(2, value.accent_text_color) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ColorCombination redact(ColorCombination value) {
                value.getClass();
                return ColorCombination.copy$default(value, null, null, null, null, null, null, h21.d, 63, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ColorCombination value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<CollectionColorType> protoAdapter2 = CollectionColorType.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 6, value.very_subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 5, value.subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 4, value.main_text_color);
                protoAdapter2.encodeWithTag(writer, 3, value.background_color);
                protoAdapter2.encodeWithTag(writer, 2, value.accent_text_color);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.name);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ColorCombination(String str, CollectionColorType collectionColorType, CollectionColorType collectionColorType2, CollectionColorType collectionColorType3, CollectionColorType collectionColorType4, CollectionColorType collectionColorType5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : collectionColorType, (i & 4) != 0 ? null : collectionColorType2, (i & 8) != 0 ? null : collectionColorType3, (i & 16) != 0 ? null : collectionColorType4, (i & 32) != 0 ? null : collectionColorType5, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ColorCombination copy$default(ColorCombination colorCombination, String str, CollectionColorType collectionColorType, CollectionColorType collectionColorType2, CollectionColorType collectionColorType3, CollectionColorType collectionColorType4, CollectionColorType collectionColorType5, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = colorCombination.name;
        }
        if ((i & 2) != 0) {
            collectionColorType = colorCombination.accent_text_color;
        }
        if ((i & 4) != 0) {
            collectionColorType2 = colorCombination.background_color;
        }
        if ((i & 8) != 0) {
            collectionColorType3 = colorCombination.main_text_color;
        }
        if ((i & 16) != 0) {
            collectionColorType4 = colorCombination.subtle_text_color;
        }
        if ((i & 32) != 0) {
            collectionColorType5 = colorCombination.very_subtle_text_color;
        }
        if ((i & 64) != 0) {
            h21Var = colorCombination.unknownFields();
        }
        CollectionColorType collectionColorType6 = collectionColorType5;
        h21 h21Var2 = h21Var;
        CollectionColorType collectionColorType7 = collectionColorType4;
        CollectionColorType collectionColorType8 = collectionColorType2;
        return colorCombination.copy(str, collectionColorType, collectionColorType8, collectionColorType3, collectionColorType7, collectionColorType6, h21Var2);
    }

    public final ColorCombination copy(String name, CollectionColorType accent_text_color, CollectionColorType background_color, CollectionColorType main_text_color, CollectionColorType subtle_text_color, CollectionColorType very_subtle_text_color, h21 unknownFields) {
        unknownFields.getClass();
        return new ColorCombination(name, accent_text_color, background_color, main_text_color, subtle_text_color, very_subtle_text_color, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ColorCombination)) {
            return false;
        }
        ColorCombination colorCombination = (ColorCombination) other;
        return g76.L(unknownFields(), colorCombination.unknownFields()) && g76.L(this.name, colorCombination.name) && this.accent_text_color == colorCombination.accent_text_color && this.background_color == colorCombination.background_color && this.main_text_color == colorCombination.main_text_color && this.subtle_text_color == colorCombination.subtle_text_color && this.very_subtle_text_color == colorCombination.very_subtle_text_color;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.name;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        CollectionColorType collectionColorType = this.accent_text_color;
        int iHashCode3 = (iHashCode2 + (collectionColorType != null ? collectionColorType.hashCode() : 0)) * 37;
        CollectionColorType collectionColorType2 = this.background_color;
        int iHashCode4 = (iHashCode3 + (collectionColorType2 != null ? collectionColorType2.hashCode() : 0)) * 37;
        CollectionColorType collectionColorType3 = this.main_text_color;
        int iHashCode5 = (iHashCode4 + (collectionColorType3 != null ? collectionColorType3.hashCode() : 0)) * 37;
        CollectionColorType collectionColorType4 = this.subtle_text_color;
        int iHashCode6 = (iHashCode5 + (collectionColorType4 != null ? collectionColorType4.hashCode() : 0)) * 37;
        CollectionColorType collectionColorType5 = this.very_subtle_text_color;
        int iHashCode7 = iHashCode6 + (collectionColorType5 != null ? collectionColorType5.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final vu1 newBuilder() {
        vu1 vu1Var = new vu1();
        vu1Var.a = this.name;
        vu1Var.b = this.accent_text_color;
        vu1Var.c = this.background_color;
        vu1Var.d = this.main_text_color;
        vu1Var.e = this.subtle_text_color;
        vu1Var.f = this.very_subtle_text_color;
        vu1Var.addUnknownFields(unknownFields());
        return vu1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.name;
        if (str != null) {
            lv8.D(str, "name=", arrayList);
        }
        CollectionColorType collectionColorType = this.accent_text_color;
        if (collectionColorType != null) {
            arrayList.add("accent_text_color=" + collectionColorType);
        }
        CollectionColorType collectionColorType2 = this.background_color;
        if (collectionColorType2 != null) {
            arrayList.add("background_color=" + collectionColorType2);
        }
        CollectionColorType collectionColorType3 = this.main_text_color;
        if (collectionColorType3 != null) {
            arrayList.add(gYpYQDQkhfs.jGmxXuWhWVfchnH + collectionColorType3);
        }
        CollectionColorType collectionColorType4 = this.subtle_text_color;
        if (collectionColorType4 != null) {
            arrayList.add("subtle_text_color=" + collectionColorType4);
        }
        CollectionColorType collectionColorType5 = this.very_subtle_text_color;
        if (collectionColorType5 != null) {
            arrayList.add("very_subtle_text_color=" + collectionColorType5);
        }
        return bu1.F0(arrayList, ", ", "ColorCombination{", "}", null, 56);
    }

    public ColorCombination() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ColorCombination(String str, CollectionColorType collectionColorType, CollectionColorType collectionColorType2, CollectionColorType collectionColorType3, CollectionColorType collectionColorType4, CollectionColorType collectionColorType5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.name = str;
        this.accent_text_color = collectionColorType;
        this.background_color = collectionColorType2;
        this.main_text_color = collectionColorType3;
        this.subtle_text_color = collectionColorType4;
        this.very_subtle_text_color = collectionColorType5;
    }
}
