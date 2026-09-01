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
import defpackage.cx5;
import defpackage.dx5;
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
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\u0018\u0000 $2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002%B\u0089\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016H\u0096\u0002¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJ\u008f\u0001\u0010\u001f\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u0011\u001a\u00020\u0010¢\u0006\u0004\b\u001f\u0010 R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010!R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010!R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010!R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\"R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010!R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\"R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\"R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010#R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010#¨\u0006&"}, d2 = {"Lgen/model/ImageInfo;", "Lcom/squareup/wire/AndroidMessage;", "Lcx5;", "", "image_id", "filter", "background_size", "", "original_width", "original_height", "strategy", "height", "width", "", "focus_percent_x", "focus_percent_y", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Float;Ljava/lang/Float;Lh21;)V", "newBuilder", "()Lcx5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Float;Ljava/lang/Float;Lh21;)Lgen/model/ImageInfo;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/lang/Float;", "Companion", "dx5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ImageInfo extends AndroidMessage<ImageInfo, cx5> {
    public static final ProtoAdapter<ImageInfo> ADAPTER;
    public static final Parcelable.Creator<ImageInfo> CREATOR;
    public static final dx5 Companion = new dx5();
    public static final float DEFAULT_FOCUS_PERCENT_X = -1.0f;
    public static final float DEFAULT_FOCUS_PERCENT_Y = -1.0f;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String background_size;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String filter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 8, tag = 9)
    public final Float focus_percent_x;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 9, tag = 10)
    public final Float focus_percent_y;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 6, tag = 7)
    public final Integer height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 5)
    public final Integer original_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 4)
    public final Integer original_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String strategy;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 7, tag = 8)
    public final Integer width;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ImageInfo.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ImageInfo> protoAdapter = new ProtoAdapter<ImageInfo>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ImageInfo$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ImageInfo decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode4 = null;
                Integer numDecode3 = null;
                Integer numDecode4 = null;
                Float fDecode = null;
                Float fDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ImageInfo(strDecode, strDecode2, strDecode3, numDecode, numDecode2, strDecode4, numDecode3, numDecode4, fDecode, fDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
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
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 5:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 7:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 8:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 9:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            break;
                        case 10:
                            fDecode2 = ProtoAdapter.FLOAT.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ImageInfo value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.image_id);
                protoAdapter2.encodeWithTag(writer, 2, value.filter);
                protoAdapter2.encodeWithTag(writer, 3, value.background_size);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 4, value.original_width);
                protoAdapter3.encodeWithTag(writer, 5, value.original_height);
                protoAdapter2.encodeWithTag(writer, 6, value.strategy);
                protoAdapter3.encodeWithTag(writer, 7, value.height);
                protoAdapter3.encodeWithTag(writer, 8, value.width);
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                protoAdapter4.encodeWithTag(writer, 9, value.focus_percent_x);
                protoAdapter4.encodeWithTag(writer, 10, value.focus_percent_y);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ImageInfo value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.background_size) + protoAdapter2.encodedSizeWithTag(2, value.filter) + protoAdapter2.encodedSizeWithTag(1, value.image_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter3.encodedSizeWithTag(8, value.width) + protoAdapter3.encodedSizeWithTag(7, value.height) + protoAdapter2.encodedSizeWithTag(6, value.strategy) + protoAdapter3.encodedSizeWithTag(5, value.original_height) + protoAdapter3.encodedSizeWithTag(4, value.original_width) + iEncodedSizeWithTag;
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                return protoAdapter4.encodedSizeWithTag(10, value.focus_percent_y) + protoAdapter4.encodedSizeWithTag(9, value.focus_percent_x) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ImageInfo redact(ImageInfo value) {
                value.getClass();
                return ImageInfo.copy$default(value, null, null, null, null, null, null, null, null, null, null, h21.d, 1023, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ImageInfo value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Float> protoAdapter2 = ProtoAdapter.FLOAT;
                protoAdapter2.encodeWithTag(writer, 10, value.focus_percent_y);
                protoAdapter2.encodeWithTag(writer, 9, value.focus_percent_x);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 8, value.width);
                protoAdapter3.encodeWithTag(writer, 7, value.height);
                ProtoAdapter<String> protoAdapter4 = ProtoAdapter.STRING;
                protoAdapter4.encodeWithTag(writer, 6, value.strategy);
                protoAdapter3.encodeWithTag(writer, 5, value.original_height);
                protoAdapter3.encodeWithTag(writer, 4, value.original_width);
                protoAdapter4.encodeWithTag(writer, 3, value.background_size);
                protoAdapter4.encodeWithTag(writer, 2, value.filter);
                protoAdapter4.encodeWithTag(writer, 1, value.image_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ImageInfo(String str, String str2, String str3, Integer num, Integer num2, String str4, Integer num3, Integer num4, Float f, Float f2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : num, (i & 16) != 0 ? null : num2, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : num3, (i & 128) != 0 ? null : num4, (i & 256) != 0 ? null : f, (i & 512) != 0 ? null : f2, (i & 1024) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ImageInfo copy$default(ImageInfo imageInfo, String str, String str2, String str3, Integer num, Integer num2, String str4, Integer num3, Integer num4, Float f, Float f2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = imageInfo.image_id;
        }
        if ((i & 2) != 0) {
            str2 = imageInfo.filter;
        }
        if ((i & 4) != 0) {
            str3 = imageInfo.background_size;
        }
        if ((i & 8) != 0) {
            num = imageInfo.original_width;
        }
        if ((i & 16) != 0) {
            num2 = imageInfo.original_height;
        }
        if ((i & 32) != 0) {
            str4 = imageInfo.strategy;
        }
        if ((i & 64) != 0) {
            num3 = imageInfo.height;
        }
        if ((i & 128) != 0) {
            num4 = imageInfo.width;
        }
        if ((i & 256) != 0) {
            f = imageInfo.focus_percent_x;
        }
        if ((i & 512) != 0) {
            f2 = imageInfo.focus_percent_y;
        }
        if ((i & 1024) != 0) {
            h21Var = imageInfo.unknownFields();
        }
        Float f3 = f2;
        h21 h21Var2 = h21Var;
        Integer num5 = num4;
        Float f4 = f;
        String str5 = str4;
        Integer num6 = num3;
        Integer num7 = num2;
        String str6 = str3;
        return imageInfo.copy(str, str2, str6, num, num7, str5, num6, num5, f4, f3, h21Var2);
    }

    public final ImageInfo copy(String image_id, String filter, String background_size, Integer original_width, Integer original_height, String strategy, Integer height, Integer width, Float focus_percent_x, Float focus_percent_y, h21 unknownFields) {
        unknownFields.getClass();
        return new ImageInfo(image_id, filter, background_size, original_width, original_height, strategy, height, width, focus_percent_x, focus_percent_y, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ImageInfo)) {
            return false;
        }
        ImageInfo imageInfo = (ImageInfo) other;
        return g76.L(unknownFields(), imageInfo.unknownFields()) && g76.L(this.image_id, imageInfo.image_id) && g76.L(this.filter, imageInfo.filter) && g76.L(this.background_size, imageInfo.background_size) && g76.L(this.original_width, imageInfo.original_width) && g76.L(this.original_height, imageInfo.original_height) && g76.L(this.strategy, imageInfo.strategy) && g76.L(this.height, imageInfo.height) && g76.L(this.width, imageInfo.width) && g76.K(this.focus_percent_x, imageInfo.focus_percent_x) && g76.K(this.focus_percent_y, imageInfo.focus_percent_y);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.image_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.filter;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.background_size;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Integer num = this.original_width;
        int iIntValue = (iHashCode4 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.original_height;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str4 = this.strategy;
        int iHashCode5 = (iIntValue2 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Integer num3 = this.height;
        int iIntValue3 = (iHashCode5 + (num3 != null ? num3.intValue() : 0)) * 37;
        Integer num4 = this.width;
        int iIntValue4 = (iIntValue3 + (num4 != null ? num4.intValue() : 0)) * 37;
        Float f = this.focus_percent_x;
        int iFloatToIntBits = (iIntValue4 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0)) * 37;
        Float f2 = this.focus_percent_y;
        int iFloatToIntBits2 = iFloatToIntBits + (f2 != null ? Float.floatToIntBits(f2.floatValue()) : 0);
        this.hashCode = iFloatToIntBits2;
        return iFloatToIntBits2;
    }

    @Override // com.squareup.wire.Message
    public final cx5 newBuilder() {
        cx5 cx5Var = new cx5();
        cx5Var.a = this.image_id;
        cx5Var.b = this.filter;
        cx5Var.c = this.background_size;
        cx5Var.d = this.original_width;
        cx5Var.e = this.original_height;
        cx5Var.f = this.strategy;
        cx5Var.g = this.height;
        cx5Var.h = this.width;
        cx5Var.i = this.focus_percent_x;
        cx5Var.j = this.focus_percent_y;
        cx5Var.addUnknownFields(unknownFields());
        return cx5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.image_id;
        if (str != null) {
            lv8.D(str, "image_id=", arrayList);
        }
        String str2 = this.filter;
        if (str2 != null) {
            lv8.D(str2, "filter=", arrayList);
        }
        String str3 = this.background_size;
        if (str3 != null) {
            lv8.D(str3, "background_size=", arrayList);
        }
        Integer num = this.original_width;
        if (num != null) {
            lv8.B("original_width=", num, arrayList);
        }
        Integer num2 = this.original_height;
        if (num2 != null) {
            lv8.B("original_height=", num2, arrayList);
        }
        String str4 = this.strategy;
        if (str4 != null) {
            lv8.D(str4, "strategy=", arrayList);
        }
        Integer num3 = this.height;
        if (num3 != null) {
            lv8.B("height=", num3, arrayList);
        }
        Integer num4 = this.width;
        if (num4 != null) {
            lv8.B("width=", num4, arrayList);
        }
        Float f = this.focus_percent_x;
        if (f != null) {
            arrayList.add("focus_percent_x=" + f);
        }
        Float f2 = this.focus_percent_y;
        if (f2 != null) {
            arrayList.add("focus_percent_y=" + f2);
        }
        return bu1.F0(arrayList, ", ", "ImageInfo{", "}", null, 56);
    }

    public ImageInfo() {
        this(null, null, null, null, null, null, null, null, null, null, null, 2047, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ImageInfo(String str, String str2, String str3, Integer num, Integer num2, String str4, Integer num3, Integer num4, Float f, Float f2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.image_id = str;
        this.filter = str2;
        this.background_size = str3;
        this.original_width = num;
        this.original_height = num2;
        this.strategy = str4;
        this.height = num3;
        this.width = num4;
        this.focus_percent_x = f;
        this.focus_percent_y = f2;
    }
}
