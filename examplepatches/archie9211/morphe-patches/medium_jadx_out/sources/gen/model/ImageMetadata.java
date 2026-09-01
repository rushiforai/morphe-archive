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
import defpackage.jx5;
import defpackage.kx5;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0011\u0018\u0000 )2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002*B¡\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u001a\u0010\u001c\u001a\u00020\n2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aH\u0096\u0002¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010 \u001a\u00020\u0003H\u0016¢\u0006\u0004\b \u0010!J§\u0001\u0010\"\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0015\u001a\u00020\u0014¢\u0006\u0004\b\"\u0010#R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010$R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010%R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010%R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010$R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010$R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010&R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010$R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010'R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010'R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010$R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010(R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010$¨\u0006+"}, d2 = {"Lgen/model/ImageMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Ljx5;", "", "id", "", "original_width", "original_height", "background_size", "filter", "", "is_featured", "external_src", "", "focus_percent_x", "focus_percent_y", "alt", "", "repaired_at", "unsplash_photo_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ljx5;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/String;Lh21;)Lgen/model/ImageMetadata;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/lang/Boolean;", "Ljava/lang/Float;", "Ljava/lang/Long;", "Companion", "kx5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ImageMetadata extends AndroidMessage<ImageMetadata, jx5> {
    public static final ProtoAdapter<ImageMetadata> ADAPTER;
    public static final Parcelable.Creator<ImageMetadata> CREATOR;
    public static final kx5 Companion = new kx5();
    public static final float DEFAULT_FOCUS_PERCENT_X = -1.0f;
    public static final float DEFAULT_FOCUS_PERCENT_Y = -1.0f;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String alt;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String background_size;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String external_src;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String filter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 7, tag = 8)
    public final Float focus_percent_x;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 8, tag = 9)
    public final Float focus_percent_y;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 5, tag = 6)
    public final Boolean is_featured;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer original_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer original_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 10, tag = 11)
    public final Long repaired_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 12)
    public final String unsplash_photo_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ImageMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ImageMetadata> protoAdapter = new ProtoAdapter<ImageMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.ImageMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ImageMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Boolean boolDecode = null;
                String strDecode4 = null;
                Float fDecode = null;
                Float fDecode2 = null;
                String strDecode5 = null;
                Long lDecode = null;
                String strDecode6 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    String str = strDecode;
                    if (iNextTag == -1) {
                        return new ImageMetadata(str, numDecode, numDecode2, strDecode2, strDecode3, boolDecode, strDecode4, fDecode, fDecode2, strDecode5, lDecode, strDecode6, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 3:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            break;
                        case 4:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        case 7:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            break;
                        case 9:
                            fDecode2 = ProtoAdapter.FLOAT.decode(reader);
                            break;
                        case 10:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 11:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            break;
                        case 12:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                    strDecode = str;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ImageMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.id);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 2, value.original_width);
                protoAdapter3.encodeWithTag(writer, 3, value.original_height);
                protoAdapter2.encodeWithTag(writer, 4, value.background_size);
                protoAdapter2.encodeWithTag(writer, 5, value.filter);
                ProtoAdapter.BOOL.encodeWithTag(writer, 6, value.is_featured);
                protoAdapter2.encodeWithTag(writer, 7, value.external_src);
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                protoAdapter4.encodeWithTag(writer, 8, value.focus_percent_x);
                protoAdapter4.encodeWithTag(writer, 9, value.focus_percent_y);
                protoAdapter2.encodeWithTag(writer, 10, value.alt);
                ProtoAdapter.INT64.encodeWithTag(writer, 11, value.repaired_at);
                protoAdapter2.encodeWithTag(writer, 12, value.unsplash_photo_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ImageMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(7, value.external_src) + ProtoAdapter.BOOL.encodedSizeWithTag(6, value.is_featured) + protoAdapter2.encodedSizeWithTag(5, value.filter) + protoAdapter2.encodedSizeWithTag(4, value.background_size) + protoAdapter3.encodedSizeWithTag(3, value.original_height) + protoAdapter3.encodedSizeWithTag(2, value.original_width) + iEncodedSizeWithTag;
                ProtoAdapter<Float> protoAdapter4 = ProtoAdapter.FLOAT;
                return protoAdapter2.encodedSizeWithTag(12, value.unsplash_photo_id) + ProtoAdapter.INT64.encodedSizeWithTag(11, value.repaired_at) + protoAdapter2.encodedSizeWithTag(10, value.alt) + protoAdapter4.encodedSizeWithTag(9, value.focus_percent_y) + protoAdapter4.encodedSizeWithTag(8, value.focus_percent_x) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ImageMetadata redact(ImageMetadata value) {
                value.getClass();
                return ImageMetadata.copy$default(value, null, null, null, null, null, null, null, null, null, null, null, null, h21.d, 4095, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ImageMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 12, value.unsplash_photo_id);
                ProtoAdapter.INT64.encodeWithTag(writer, 11, value.repaired_at);
                protoAdapter2.encodeWithTag(writer, 10, value.alt);
                ProtoAdapter<Float> protoAdapter3 = ProtoAdapter.FLOAT;
                protoAdapter3.encodeWithTag(writer, 9, value.focus_percent_y);
                protoAdapter3.encodeWithTag(writer, 8, value.focus_percent_x);
                protoAdapter2.encodeWithTag(writer, 7, value.external_src);
                ProtoAdapter.BOOL.encodeWithTag(writer, 6, value.is_featured);
                protoAdapter2.encodeWithTag(writer, 5, value.filter);
                protoAdapter2.encodeWithTag(writer, 4, value.background_size);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 3, value.original_height);
                protoAdapter4.encodeWithTag(writer, 2, value.original_width);
                protoAdapter2.encodeWithTag(writer, 1, value.id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ImageMetadata(String str, Integer num, Integer num2, String str2, String str3, Boolean bool, String str4, Float f, Float f2, String str5, Long l, String str6, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : num2, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? null : bool, (i & 64) != 0 ? null : str4, (i & 128) != 0 ? null : f, (i & 256) != 0 ? null : f2, (i & 512) != 0 ? null : str5, (i & 1024) != 0 ? null : l, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) == 0 ? str6 : null, (i & 4096) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ImageMetadata copy$default(ImageMetadata imageMetadata, String str, Integer num, Integer num2, String str2, String str3, Boolean bool, String str4, Float f, Float f2, String str5, Long l, String str6, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = imageMetadata.id;
        }
        return imageMetadata.copy(str, (i & 2) != 0 ? imageMetadata.original_width : num, (i & 4) != 0 ? imageMetadata.original_height : num2, (i & 8) != 0 ? imageMetadata.background_size : str2, (i & 16) != 0 ? imageMetadata.filter : str3, (i & 32) != 0 ? imageMetadata.is_featured : bool, (i & 64) != 0 ? imageMetadata.external_src : str4, (i & 128) != 0 ? imageMetadata.focus_percent_x : f, (i & 256) != 0 ? imageMetadata.focus_percent_y : f2, (i & 512) != 0 ? imageMetadata.alt : str5, (i & 1024) != 0 ? imageMetadata.repaired_at : l, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? imageMetadata.unsplash_photo_id : str6, (i & 4096) != 0 ? imageMetadata.unknownFields() : h21Var);
    }

    public final ImageMetadata copy(String id, Integer original_width, Integer original_height, String background_size, String filter, Boolean is_featured, String external_src, Float focus_percent_x, Float focus_percent_y, String alt, Long repaired_at, String unsplash_photo_id, h21 unknownFields) {
        unknownFields.getClass();
        return new ImageMetadata(id, original_width, original_height, background_size, filter, is_featured, external_src, focus_percent_x, focus_percent_y, alt, repaired_at, unsplash_photo_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ImageMetadata)) {
            return false;
        }
        ImageMetadata imageMetadata = (ImageMetadata) other;
        return g76.L(unknownFields(), imageMetadata.unknownFields()) && g76.L(this.id, imageMetadata.id) && g76.L(this.original_width, imageMetadata.original_width) && g76.L(this.original_height, imageMetadata.original_height) && g76.L(this.background_size, imageMetadata.background_size) && g76.L(this.filter, imageMetadata.filter) && g76.L(this.is_featured, imageMetadata.is_featured) && g76.L(this.external_src, imageMetadata.external_src) && g76.K(this.focus_percent_x, imageMetadata.focus_percent_x) && g76.K(this.focus_percent_y, imageMetadata.focus_percent_y) && g76.L(this.alt, imageMetadata.alt) && g76.L(this.repaired_at, imageMetadata.repaired_at) && g76.L(this.unsplash_photo_id, imageMetadata.unsplash_photo_id);
    }

    public final int hashCode() {
        int i;
        int i2 = this.hashCode;
        if (i2 != 0) {
            return i2;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.original_width;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.original_height;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        String str2 = this.background_size;
        int iHashCode3 = (iIntValue2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.filter;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Boolean bool = this.is_featured;
        int i3 = (iHashCode4 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str4 = this.external_src;
        int iHashCode5 = (i3 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Float f = this.focus_percent_x;
        int iFloatToIntBits = (iHashCode5 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0)) * 37;
        Float f2 = this.focus_percent_y;
        int iFloatToIntBits2 = (iFloatToIntBits + (f2 != null ? Float.floatToIntBits(f2.floatValue()) : 0)) * 37;
        String str5 = this.alt;
        int iHashCode6 = (iFloatToIntBits2 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Long l = this.repaired_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode6 + i) * 37;
        String str6 = this.unsplash_photo_id;
        int iHashCode7 = i4 + (str6 != null ? str6.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final jx5 newBuilder() {
        jx5 jx5Var = new jx5();
        jx5Var.a = this.id;
        jx5Var.b = this.original_width;
        jx5Var.c = this.original_height;
        jx5Var.d = this.background_size;
        jx5Var.e = this.filter;
        jx5Var.f = this.is_featured;
        jx5Var.g = this.external_src;
        jx5Var.h = this.focus_percent_x;
        jx5Var.i = this.focus_percent_y;
        jx5Var.j = this.alt;
        jx5Var.k = this.repaired_at;
        jx5Var.l = this.unsplash_photo_id;
        jx5Var.addUnknownFields(unknownFields());
        return jx5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.id;
        if (str != null) {
            lv8.D(str, "id=", arrayList);
        }
        Integer num = this.original_width;
        if (num != null) {
            lv8.B("original_width=", num, arrayList);
        }
        Integer num2 = this.original_height;
        if (num2 != null) {
            lv8.B("original_height=", num2, arrayList);
        }
        String str2 = this.background_size;
        if (str2 != null) {
            lv8.D(str2, "background_size=", arrayList);
        }
        String str3 = this.filter;
        if (str3 != null) {
            lv8.D(str3, "filter=", arrayList);
        }
        Boolean bool = this.is_featured;
        if (bool != null) {
            lv8.A("is_featured=", bool, arrayList);
        }
        String str4 = this.external_src;
        if (str4 != null) {
            lv8.D(str4, "external_src=", arrayList);
        }
        Float f = this.focus_percent_x;
        if (f != null) {
            arrayList.add("focus_percent_x=" + f);
        }
        Float f2 = this.focus_percent_y;
        if (f2 != null) {
            arrayList.add("focus_percent_y=" + f2);
        }
        String str5 = this.alt;
        if (str5 != null) {
            lv8.D(str5, "alt=", arrayList);
        }
        Long l = this.repaired_at;
        if (l != null) {
            y30.A("repaired_at=", l, arrayList);
        }
        String str6 = this.unsplash_photo_id;
        if (str6 != null) {
            lv8.D(str6, "unsplash_photo_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "ImageMetadata{", "}", null, 56);
    }

    public ImageMetadata() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, 8191, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ImageMetadata(String str, Integer num, Integer num2, String str2, String str3, Boolean bool, String str4, Float f, Float f2, String str5, Long l, String str6, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.id = str;
        this.original_width = num;
        this.original_height = num2;
        this.background_size = str2;
        this.filter = str3;
        this.is_featured = bool;
        this.external_src = str4;
        this.focus_percent_x = f;
        this.focus_percent_y = f2;
        this.alt = str5;
        this.repaired_at = l;
        this.unsplash_photo_id = str6;
    }
}
