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
import defpackage.vs1;
import defpackage.wg6;
import defpackage.ws1;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 #2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002$Be\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0012\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0016\u001a\u00020\f2\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJk\u0010\u001d\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\b\b\u0002\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u001d\u0010\u001eR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001fR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001fR\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010!R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010\"¨\u0006%"}, d2 = {"Lgen/model/CollectionPromoLinkWithContent;", "Lcom/squareup/wire/AndroidMessage;", "Lvs1;", "", "url", "Lgen/model/ImageMetadata;", "image", "description", "button_text", "tint_color", "Lgen/model/ColorSpectrum;", "color_spectrum", "", "is_light_text", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ColorSpectrum;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lvs1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ColorSpectrum;Ljava/lang/Boolean;Lh21;)Lgen/model/CollectionPromoLinkWithContent;", "Ljava/lang/String;", "Lgen/model/ImageMetadata;", "Lgen/model/ColorSpectrum;", "Ljava/lang/Boolean;", "Companion", "ws1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionPromoLinkWithContent extends AndroidMessage<CollectionPromoLinkWithContent, vs1> {
    public static final ProtoAdapter<CollectionPromoLinkWithContent> ADAPTER;
    public static final Parcelable.Creator<CollectionPromoLinkWithContent> CREATOR;
    public static final ws1 Companion = new ws1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String button_text;

    @WireField(adapter = "gen.model.ColorSpectrum#ADAPTER", schemaIndex = 5, tag = 6)
    public final ColorSpectrum color_spectrum;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String description;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 1, tag = 2)
    public final ImageMetadata image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 7)
    public final Boolean is_light_text;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String tint_color;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionPromoLinkWithContent.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionPromoLinkWithContent> protoAdapter = new ProtoAdapter<CollectionPromoLinkWithContent>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionPromoLinkWithContent$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromoLinkWithContent decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                ImageMetadata imageMetadataDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                ColorSpectrum colorSpectrumDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionPromoLinkWithContent(strDecode, imageMetadataDecode, strDecode2, strDecode3, strDecode4, colorSpectrumDecode, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            colorSpectrumDecode = ColorSpectrum.ADAPTER.decode(reader);
                            break;
                        case 7:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionPromoLinkWithContent value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.url);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 2, value.image);
                protoAdapter2.encodeWithTag(writer, 3, value.description);
                protoAdapter2.encodeWithTag(writer, 4, value.button_text);
                protoAdapter2.encodeWithTag(writer, 5, value.tint_color);
                ColorSpectrum.ADAPTER.encodeWithTag(writer, 6, value.color_spectrum);
                ProtoAdapter.BOOL.encodeWithTag(writer, 7, value.is_light_text);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionPromoLinkWithContent value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.BOOL.encodedSizeWithTag(7, value.is_light_text) + ColorSpectrum.ADAPTER.encodedSizeWithTag(6, value.color_spectrum) + protoAdapter2.encodedSizeWithTag(5, value.tint_color) + protoAdapter2.encodedSizeWithTag(4, value.button_text) + protoAdapter2.encodedSizeWithTag(3, value.description) + ImageMetadata.ADAPTER.encodedSizeWithTag(2, value.image) + protoAdapter2.encodedSizeWithTag(1, value.url) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromoLinkWithContent redact(CollectionPromoLinkWithContent value) {
                value.getClass();
                ImageMetadata imageMetadata = value.image;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                ColorSpectrum colorSpectrum = value.color_spectrum;
                return CollectionPromoLinkWithContent.copy$default(value, null, imageMetadataRedact, null, null, null, colorSpectrum != null ? ColorSpectrum.ADAPTER.redact(colorSpectrum) : null, null, h21.d, 93, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionPromoLinkWithContent value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 7, value.is_light_text);
                ColorSpectrum.ADAPTER.encodeWithTag(writer, 6, value.color_spectrum);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.tint_color);
                protoAdapter2.encodeWithTag(writer, 4, value.button_text);
                protoAdapter2.encodeWithTag(writer, 3, value.description);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 2, value.image);
                protoAdapter2.encodeWithTag(writer, 1, value.url);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionPromoLinkWithContent(String str, ImageMetadata imageMetadata, String str2, String str3, String str4, ColorSpectrum colorSpectrum, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : imageMetadata, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : colorSpectrum, (i & 64) != 0 ? null : bool, (i & 128) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionPromoLinkWithContent copy$default(CollectionPromoLinkWithContent collectionPromoLinkWithContent, String str, ImageMetadata imageMetadata, String str2, String str3, String str4, ColorSpectrum colorSpectrum, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionPromoLinkWithContent.url;
        }
        if ((i & 2) != 0) {
            imageMetadata = collectionPromoLinkWithContent.image;
        }
        if ((i & 4) != 0) {
            str2 = collectionPromoLinkWithContent.description;
        }
        if ((i & 8) != 0) {
            str3 = collectionPromoLinkWithContent.button_text;
        }
        if ((i & 16) != 0) {
            str4 = collectionPromoLinkWithContent.tint_color;
        }
        if ((i & 32) != 0) {
            colorSpectrum = collectionPromoLinkWithContent.color_spectrum;
        }
        if ((i & 64) != 0) {
            bool = collectionPromoLinkWithContent.is_light_text;
        }
        if ((i & 128) != 0) {
            h21Var = collectionPromoLinkWithContent.unknownFields();
        }
        Boolean bool2 = bool;
        h21 h21Var2 = h21Var;
        String str5 = str4;
        ColorSpectrum colorSpectrum2 = colorSpectrum;
        return collectionPromoLinkWithContent.copy(str, imageMetadata, str2, str3, str5, colorSpectrum2, bool2, h21Var2);
    }

    public final CollectionPromoLinkWithContent copy(String url, ImageMetadata image, String description, String button_text, String tint_color, ColorSpectrum color_spectrum, Boolean is_light_text, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionPromoLinkWithContent(url, image, description, button_text, tint_color, color_spectrum, is_light_text, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionPromoLinkWithContent)) {
            return false;
        }
        CollectionPromoLinkWithContent collectionPromoLinkWithContent = (CollectionPromoLinkWithContent) other;
        return g76.L(unknownFields(), collectionPromoLinkWithContent.unknownFields()) && g76.L(this.url, collectionPromoLinkWithContent.url) && g76.L(this.image, collectionPromoLinkWithContent.image) && g76.L(this.description, collectionPromoLinkWithContent.description) && g76.L(this.button_text, collectionPromoLinkWithContent.button_text) && g76.L(this.tint_color, collectionPromoLinkWithContent.tint_color) && g76.L(this.color_spectrum, collectionPromoLinkWithContent.color_spectrum) && g76.L(this.is_light_text, collectionPromoLinkWithContent.is_light_text);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.url;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.image;
        int iHashCode3 = (iHashCode2 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        String str2 = this.description;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.button_text;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.tint_color;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        ColorSpectrum colorSpectrum = this.color_spectrum;
        int iHashCode7 = (iHashCode6 + (colorSpectrum != null ? colorSpectrum.hashCode() : 0)) * 37;
        Boolean bool = this.is_light_text;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode7 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final vs1 newBuilder() {
        vs1 vs1Var = new vs1();
        vs1Var.a = this.url;
        vs1Var.b = this.image;
        vs1Var.c = this.description;
        vs1Var.d = this.button_text;
        vs1Var.e = this.tint_color;
        vs1Var.f = this.color_spectrum;
        vs1Var.g = this.is_light_text;
        vs1Var.addUnknownFields(unknownFields());
        return vs1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.url;
        if (str != null) {
            lv8.D(str, "url=", arrayList);
        }
        ImageMetadata imageMetadata = this.image;
        if (imageMetadata != null) {
            arrayList.add("image=" + imageMetadata);
        }
        String str2 = this.description;
        if (str2 != null) {
            lv8.D(str2, "description=", arrayList);
        }
        String str3 = this.button_text;
        if (str3 != null) {
            lv8.D(str3, "button_text=", arrayList);
        }
        String str4 = this.tint_color;
        if (str4 != null) {
            lv8.D(str4, "tint_color=", arrayList);
        }
        ColorSpectrum colorSpectrum = this.color_spectrum;
        if (colorSpectrum != null) {
            arrayList.add("color_spectrum=" + colorSpectrum);
        }
        Boolean bool = this.is_light_text;
        if (bool != null) {
            lv8.A("is_light_text=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionPromoLinkWithContent{", "}", null, 56);
    }

    public CollectionPromoLinkWithContent() {
        this(null, null, null, null, null, null, null, null, 255, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionPromoLinkWithContent(String str, ImageMetadata imageMetadata, String str2, String str3, String str4, ColorSpectrum colorSpectrum, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.url = str;
        this.image = imageMetadata;
        this.description = str2;
        this.button_text = str3;
        this.tint_color = str4;
        this.color_spectrum = colorSpectrum;
        this.is_light_text = bool;
    }
}
