package scalapb.options;

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
import defpackage.n1b;
import defpackage.sf4;
import defpackage.tf4;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 !2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\"Bi\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00030\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0015\u001a\u00020\u000b2\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJo\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00030\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u001fR\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00030\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010 ¨\u0006#"}, d2 = {"Lscalapb/options/FieldOptions;", "Lcom/squareup/wire/AndroidMessage;", "Lsf4;", "", "type", "scala_name", "collection_type", "key_type", "value_type", "", "annotations", "", "no_box", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lsf4;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Boolean;Lh21;)Lscalapb/options/FieldOptions;", "Ljava/lang/String;", "Ljava/lang/Boolean;", "Ljava/util/List;", "Companion", "tf4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FieldOptions extends AndroidMessage<FieldOptions, sf4> {
    public static final ProtoAdapter<FieldOptions> ADAPTER;
    public static final Parcelable.Creator<FieldOptions> CREATOR;
    public static final tf4 Companion = new tf4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 5, tag = 6)
    public final List<String> annotations;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String collection_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String key_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 30)
    public final Boolean no_box;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String scala_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String value_type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FieldOptions.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<FieldOptions> protoAdapter = new ProtoAdapter<FieldOptions>(fieldEncoding, wg6VarB, syntax) { // from class: scalapb.options.FieldOptions$Companion$ADAPTER$1
            @Override // com.squareup.wire.ProtoAdapter
            public final FieldOptions decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FieldOptions(strDecode, strDecode2, strDecode3, strDecode4, strDecode5, arrayListF, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag != 30) {
                        switch (iNextTag) {
                            case 1:
                                strDecode = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 2:
                                strDecode2 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 3:
                                strDecode3 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 4:
                                strDecode4 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 5:
                                strDecode5 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 6:
                                arrayListF.add(ProtoAdapter.STRING.decode(reader));
                                break;
                            default:
                                reader.readUnknownField(iNextTag);
                                break;
                        }
                    } else {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FieldOptions value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.type);
                protoAdapter2.encodeWithTag(writer, 2, value.scala_name);
                protoAdapter2.encodeWithTag(writer, 3, value.collection_type);
                protoAdapter2.encodeWithTag(writer, 4, value.key_type);
                protoAdapter2.encodeWithTag(writer, 5, value.value_type);
                protoAdapter2.asRepeated().encodeWithTag(writer, 6, value.annotations);
                ProtoAdapter.BOOL.encodeWithTag(writer, 30, value.no_box);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FieldOptions value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(30, value.no_box) + protoAdapter2.asRepeated().encodedSizeWithTag(6, value.annotations) + protoAdapter2.encodedSizeWithTag(5, value.value_type) + protoAdapter2.encodedSizeWithTag(4, value.key_type) + protoAdapter2.encodedSizeWithTag(3, value.collection_type) + protoAdapter2.encodedSizeWithTag(2, value.scala_name) + protoAdapter2.encodedSizeWithTag(1, value.type) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FieldOptions redact(FieldOptions value) {
                value.getClass();
                return FieldOptions.copy$default(value, null, null, null, null, null, null, null, h21.d, 127, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FieldOptions value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 30, value.no_box);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.asRepeated().encodeWithTag(writer, 6, value.annotations);
                protoAdapter2.encodeWithTag(writer, 5, value.value_type);
                protoAdapter2.encodeWithTag(writer, 4, value.key_type);
                protoAdapter2.encodeWithTag(writer, 3, value.collection_type);
                protoAdapter2.encodeWithTag(writer, 2, value.scala_name);
                protoAdapter2.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ FieldOptions(String str, String str2, String str3, String str4, String str5, List list, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? ey3.a : list, (i & 64) != 0 ? null : bool, (i & 128) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ FieldOptions copy$default(FieldOptions fieldOptions, String str, String str2, String str3, String str4, String str5, List list, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = fieldOptions.type;
        }
        if ((i & 2) != 0) {
            str2 = fieldOptions.scala_name;
        }
        if ((i & 4) != 0) {
            str3 = fieldOptions.collection_type;
        }
        if ((i & 8) != 0) {
            str4 = fieldOptions.key_type;
        }
        if ((i & 16) != 0) {
            str5 = fieldOptions.value_type;
        }
        if ((i & 32) != 0) {
            list = fieldOptions.annotations;
        }
        if ((i & 64) != 0) {
            bool = fieldOptions.no_box;
        }
        if ((i & 128) != 0) {
            h21Var = fieldOptions.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        String str6 = str5;
        List list2 = list;
        return fieldOptions.copy(str, str2, str3, str4, str6, list2, bool2, h21Var2);
    }

    public final FieldOptions copy(String type, String scala_name, String collection_type, String key_type, String value_type, List<String> annotations, Boolean no_box, h21 unknownFields) {
        annotations.getClass();
        unknownFields.getClass();
        return new FieldOptions(type, scala_name, collection_type, key_type, value_type, annotations, no_box, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FieldOptions)) {
            return false;
        }
        FieldOptions fieldOptions = (FieldOptions) other;
        return g76.L(unknownFields(), fieldOptions.unknownFields()) && g76.L(this.type, fieldOptions.type) && g76.L(this.scala_name, fieldOptions.scala_name) && g76.L(this.collection_type, fieldOptions.collection_type) && g76.L(this.key_type, fieldOptions.key_type) && g76.L(this.value_type, fieldOptions.value_type) && g76.L(this.annotations, fieldOptions.annotations) && g76.L(this.no_box, fieldOptions.no_box);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.type;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.scala_name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_type;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.key_type;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.value_type;
        int iP = wgd.p((iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37, 37, this.annotations);
        Boolean bool = this.no_box;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iP + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final sf4 newBuilder() {
        sf4 sf4Var = new sf4();
        sf4Var.f = ey3.a;
        sf4Var.a = this.type;
        sf4Var.b = this.scala_name;
        sf4Var.c = this.collection_type;
        sf4Var.d = this.key_type;
        sf4Var.e = this.value_type;
        sf4Var.f = this.annotations;
        sf4Var.g = this.no_box;
        sf4Var.addUnknownFields(unknownFields());
        return sf4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.type;
        if (str != null) {
            lv8.D(str, "type=", arrayList);
        }
        String str2 = this.scala_name;
        if (str2 != null) {
            lv8.D(str2, "scala_name=", arrayList);
        }
        String str3 = this.collection_type;
        if (str3 != null) {
            lv8.D(str3, "collection_type=", arrayList);
        }
        String str4 = this.key_type;
        if (str4 != null) {
            lv8.D(str4, "key_type=", arrayList);
        }
        String str5 = this.value_type;
        if (str5 != null) {
            lv8.D(str5, "value_type=", arrayList);
        }
        if (!this.annotations.isEmpty()) {
            arrayList.add("annotations=".concat(Internal.sanitize(this.annotations)));
        }
        Boolean bool = this.no_box;
        if (bool != null) {
            lv8.A("no_box=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "FieldOptions{", "}", null, 56);
    }

    public FieldOptions() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FieldOptions(String str, String str2, String str3, String str4, String str5, List<String> list, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.type = str;
        this.scala_name = str2;
        this.collection_type = str3;
        this.key_type = str4;
        this.value_type = str5;
        this.no_box = bool;
        this.annotations = Internal.immutableCopyOf("annotations", list);
    }
}
