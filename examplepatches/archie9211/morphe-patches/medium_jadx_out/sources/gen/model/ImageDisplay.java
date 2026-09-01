package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
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
import defpackage.uw5;
import defpackage.vw5;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\n\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\u0018\u0000 '2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002(B\u00ad\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0010\u0012\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019H\u0096\u0002¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0003H\u0016¢\u0006\u0004\b \u0010!J³\u0001\u0010\"\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00102\b\b\u0002\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b\"\u0010#R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010$R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010%R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010%R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010$R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010$R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010$R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010$R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010%R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010%R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010$R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010$R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010&R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010&¨\u0006)"}, d2 = {"Lgen/model/ImageDisplay;", "Lcom/squareup/wire/AndroidMessage;", "Luw5;", "", "image_id", "", "height", "width", "strategy", "filter", "vertical_gradient", "crop_type", "darken", "blur", "url", "multiply", "", "focus_percent_x", "focus_percent_y", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;Lh21;)V", "newBuilder", "()Luw5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;Lh21;)Lgen/model/ImageDisplay;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/lang/Float;", "Companion", "vw5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ImageDisplay extends AndroidMessage<ImageDisplay, uw5> {
    public static final ProtoAdapter<ImageDisplay> ADAPTER;
    public static final Parcelable.Creator<ImageDisplay> CREATOR;
    public static final vw5 Companion = new vw5();
    public static final float DEFAULT_FOCUS_PERCENT_X = -1.0f;
    public static final float DEFAULT_FOCUS_PERCENT_Y = -1.0f;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 8, tag = 9)
    public final Integer blur;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String crop_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 7, tag = 8)
    public final Integer darken;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String filter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 11, tag = 11)
    public final Float focus_percent_x;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 12, tag = 12)
    public final Float focus_percent_y;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 13)
    public final String multiply;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String strategy;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String vertical_gradient;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer width;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ImageDisplay.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ImageDisplay> protoAdapter = new ProtoAdapter<ImageDisplay>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ImageDisplay$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0022. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final ImageDisplay decode(ProtoReader reader) {
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                Integer numDecode3 = null;
                Integer numDecode4 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Float fDecode = null;
                Float fDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    Integer num = numDecode;
                    if (iNextTag == -1) {
                        return new ImageDisplay(str, num, numDecode2, strDecode2, strDecode3, strDecode4, strDecode5, numDecode3, numDecode4, strDecode6, strDecode7, fDecode, fDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            break;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 3:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 4:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 6:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 7:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 8:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 9:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 10:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 11:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 12:
                            fDecode2 = ProtoAdapter.FLOAT.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 13:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            strDecode = str;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            strDecode = str;
                            numDecode = num;
                            break;
                    }
                    str = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ImageDisplay value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.image_id);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 2, value.height);
                protoAdapter3.encodeWithTag(writer, 3, value.width);
                protoAdapter2.encodeWithTag(writer, 4, value.strategy);
                protoAdapter2.encodeWithTag(writer, 5, value.filter);
                protoAdapter2.encodeWithTag(writer, 6, value.vertical_gradient);
                protoAdapter2.encodeWithTag(writer, 7, value.crop_type);
                protoAdapter3.encodeWithTag(writer, 8, value.darken);
                protoAdapter3.encodeWithTag(writer, 9, value.blur);
                protoAdapter2.encodeWithTag(writer, 10, value.url);
                protoAdapter2.encodeWithTag(writer, 13, value.multiply);
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                protoAdapter4.encodeWithTag(writer, 11, value.focus_percent_x);
                protoAdapter4.encodeWithTag(writer, 12, value.focus_percent_y);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ImageDisplay value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.image_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(13, value.multiply) + protoAdapter2.encodedSizeWithTag(10, value.url) + protoAdapter3.encodedSizeWithTag(9, value.blur) + protoAdapter3.encodedSizeWithTag(8, value.darken) + protoAdapter2.encodedSizeWithTag(7, value.crop_type) + protoAdapter2.encodedSizeWithTag(6, value.vertical_gradient) + protoAdapter2.encodedSizeWithTag(5, value.filter) + protoAdapter2.encodedSizeWithTag(4, value.strategy) + protoAdapter3.encodedSizeWithTag(3, value.width) + protoAdapter3.encodedSizeWithTag(2, value.height) + iEncodedSizeWithTag;
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                return protoAdapter4.encodedSizeWithTag(12, value.focus_percent_y) + protoAdapter4.encodedSizeWithTag(11, value.focus_percent_x) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ImageDisplay redact(ImageDisplay value) {
                value.getClass();
                return value.copy((8191 & 1) != 0 ? value.image_id : null, (8191 & 2) != 0 ? value.height : null, (8191 & 4) != 0 ? value.width : null, (8191 & 8) != 0 ? value.strategy : null, (8191 & 16) != 0 ? value.filter : null, (8191 & 32) != 0 ? value.vertical_gradient : null, (8191 & 64) != 0 ? value.crop_type : null, (8191 & 128) != 0 ? value.darken : null, (8191 & 256) != 0 ? value.blur : null, (8191 & 512) != 0 ? value.url : null, (8191 & 1024) != 0 ? value.multiply : null, (8191 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.focus_percent_x : null, (8191 & 4096) != 0 ? value.focus_percent_y : null, (8191 & 8192) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ImageDisplay value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Float> protoAdapter2 = ProtoAdapter.FLOAT;
                protoAdapter2.encodeWithTag(writer, 12, value.focus_percent_y);
                protoAdapter2.encodeWithTag(writer, 11, value.focus_percent_x);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 13, value.multiply);
                protoAdapter3.encodeWithTag(writer, 10, value.url);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 9, value.blur);
                protoAdapter4.encodeWithTag(writer, 8, value.darken);
                protoAdapter3.encodeWithTag(writer, 7, value.crop_type);
                protoAdapter3.encodeWithTag(writer, 6, value.vertical_gradient);
                protoAdapter3.encodeWithTag(writer, 5, value.filter);
                protoAdapter3.encodeWithTag(writer, 4, value.strategy);
                protoAdapter4.encodeWithTag(writer, 3, value.width);
                protoAdapter4.encodeWithTag(writer, 2, value.height);
                protoAdapter3.encodeWithTag(writer, 1, value.image_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ImageDisplay(String str, Integer num, Integer num2, String str2, String str3, String str4, String str5, Integer num3, Integer num4, String str6, String str7, Float f, Float f2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : str4, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? null : num3, (i & 256) != 0 ? null : num4, (i & 512) != 0 ? null : str6, (i & 1024) != 0 ? null : str7, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : f, (i & 4096) == 0 ? f2 : null, (i & 8192) != 0 ? h21.d : h21Var);
    }

    public final ImageDisplay copy(String image_id, Integer height, Integer width, String strategy, String filter, String vertical_gradient, String crop_type, Integer darken, Integer blur, String url, String multiply, Float focus_percent_x, Float focus_percent_y, h21 unknownFields) {
        unknownFields.getClass();
        return new ImageDisplay(image_id, height, width, strategy, filter, vertical_gradient, crop_type, darken, blur, url, multiply, focus_percent_x, focus_percent_y, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ImageDisplay)) {
            return false;
        }
        ImageDisplay imageDisplay = (ImageDisplay) other;
        return g76.L(unknownFields(), imageDisplay.unknownFields()) && g76.L(this.image_id, imageDisplay.image_id) && g76.L(this.height, imageDisplay.height) && g76.L(this.width, imageDisplay.width) && g76.L(this.strategy, imageDisplay.strategy) && g76.L(this.filter, imageDisplay.filter) && g76.L(this.vertical_gradient, imageDisplay.vertical_gradient) && g76.L(this.crop_type, imageDisplay.crop_type) && g76.L(this.darken, imageDisplay.darken) && g76.L(this.blur, imageDisplay.blur) && g76.L(this.url, imageDisplay.url) && g76.L(this.multiply, imageDisplay.multiply) && g76.K(this.focus_percent_x, imageDisplay.focus_percent_x) && g76.K(this.focus_percent_y, imageDisplay.focus_percent_y);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.image_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.height;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.width;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str2 = this.strategy;
        int iHashCode3 = (iIntValue2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.filter;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.vertical_gradient;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.crop_type;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Integer num3 = this.darken;
        int iIntValue3 = (iHashCode6 + (num3 != null ? num3.intValue() : 0)) * 37;
        Integer num4 = this.blur;
        int iIntValue4 = (iIntValue3 + (num4 != null ? num4.intValue() : 0)) * 37;
        String str6 = this.url;
        int iHashCode7 = (iIntValue4 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.multiply;
        int iHashCode8 = (iHashCode7 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Float f = this.focus_percent_x;
        int iFloatToIntBits = (iHashCode8 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0)) * 37;
        Float f2 = this.focus_percent_y;
        int iFloatToIntBits2 = iFloatToIntBits + (f2 != null ? Float.floatToIntBits(f2.floatValue()) : 0);
        this.hashCode = iFloatToIntBits2;
        return iFloatToIntBits2;
    }

    @Override // com.squareup.wire.Message
    public final uw5 newBuilder() {
        uw5 uw5Var = new uw5();
        uw5Var.a = this.image_id;
        uw5Var.b = this.height;
        uw5Var.c = this.width;
        uw5Var.d = this.strategy;
        uw5Var.e = this.filter;
        uw5Var.f = this.vertical_gradient;
        uw5Var.g = this.crop_type;
        uw5Var.h = this.darken;
        uw5Var.i = this.blur;
        uw5Var.j = this.url;
        uw5Var.k = this.multiply;
        uw5Var.l = this.focus_percent_x;
        uw5Var.m = this.focus_percent_y;
        uw5Var.addUnknownFields(unknownFields());
        return uw5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.image_id;
        if (str != null) {
            lv8.D(str, "image_id=", arrayList);
        }
        Integer num = this.height;
        if (num != null) {
            lv8.B("height=", num, arrayList);
        }
        Integer num2 = this.width;
        if (num2 != null) {
            lv8.B("width=", num2, arrayList);
        }
        String str2 = this.strategy;
        if (str2 != null) {
            lv8.D(str2, "strategy=", arrayList);
        }
        String str3 = this.filter;
        if (str3 != null) {
            lv8.D(str3, "filter=", arrayList);
        }
        String str4 = this.vertical_gradient;
        if (str4 != null) {
            lv8.D(str4, "vertical_gradient=", arrayList);
        }
        String str5 = this.crop_type;
        if (str5 != null) {
            lv8.D(str5, "crop_type=", arrayList);
        }
        Integer num3 = this.darken;
        if (num3 != null) {
            lv8.B("darken=", num3, arrayList);
        }
        Integer num4 = this.blur;
        if (num4 != null) {
            lv8.B("blur=", num4, arrayList);
        }
        String str6 = this.url;
        if (str6 != null) {
            lv8.D(str6, "url=", arrayList);
        }
        String str7 = this.multiply;
        if (str7 != null) {
            lv8.D(str7, "multiply=", arrayList);
        }
        Float f = this.focus_percent_x;
        if (f != null) {
            arrayList.add("focus_percent_x=" + f);
        }
        Float f2 = this.focus_percent_y;
        if (f2 != null) {
            arrayList.add("focus_percent_y=" + f2);
        }
        return bu1.F0(arrayList, ", ", "ImageDisplay{", "}", null, 56);
    }

    public ImageDisplay() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, 16383, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ImageDisplay(String str, Integer num, Integer num2, String str2, String str3, String str4, String str5, Integer num3, Integer num4, String str6, String str7, Float f, Float f2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.image_id = str;
        this.height = num;
        this.width = num2;
        this.strategy = str2;
        this.filter = str3;
        this.vertical_gradient = str4;
        this.crop_type = str5;
        this.darken = num3;
        this.blur = num4;
        this.url = str6;
        this.multiply = str7;
        this.focus_percent_x = f;
        this.focus_percent_y = f2;
    }
}
