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
import defpackage.nr1;
import defpackage.or1;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 %2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002&Bq\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015H\u0096\u0002¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001b\u001a\u00020\u001aH\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u001d\u0010\u001eJw\u0010\u001f\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u001f\u0010 R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010!R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010!R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\"R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\"R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010#R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010$R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010!R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010!¨\u0006'"}, d2 = {"Lgen/model/CollectionHeaderMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lnr1;", "", "title", "description", "Lgen/model/ImageMetadata;", "background_image", "logo_image", "Lgen/model/CollectionHeadAlignment;", "alignment", "Lgen/model/CollectionHeadLayout;", "layout", "seo_title", "seo_description", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Lgen/model/CollectionHeadAlignment;Lgen/model/CollectionHeadLayout;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lnr1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Lgen/model/CollectionHeadAlignment;Lgen/model/CollectionHeadLayout;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/CollectionHeaderMetadata;", "Ljava/lang/String;", "Lgen/model/ImageMetadata;", "Lgen/model/CollectionHeadAlignment;", "Lgen/model/CollectionHeadLayout;", "Companion", "or1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionHeaderMetadata extends AndroidMessage<CollectionHeaderMetadata, nr1> {
    public static final ProtoAdapter<CollectionHeaderMetadata> ADAPTER;
    public static final Parcelable.Creator<CollectionHeaderMetadata> CREATOR;
    public static final or1 Companion = new or1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionHeadAlignment#ADAPTER", schemaIndex = 4, tag = 5)
    public final CollectionHeadAlignment alignment;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 2, tag = 3)
    public final ImageMetadata background_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String description;

    @WireField(adapter = "gen.model.CollectionHeadLayout#ADAPTER", schemaIndex = 5, tag = 6)
    public final CollectionHeadLayout layout;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageMetadata logo_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String seo_description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String seo_title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String title;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionHeaderMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionHeaderMetadata> protoAdapter = new ProtoAdapter<CollectionHeaderMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionHeaderMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionHeaderMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                ImageMetadata imageMetadataDecode = null;
                ImageMetadata imageMetadataDecode2 = null;
                CollectionHeadAlignment collectionHeadAlignmentDecode = null;
                CollectionHeadLayout collectionHeadLayoutDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionHeaderMetadata(strDecode, strDecode2, imageMetadataDecode, imageMetadataDecode2, collectionHeadAlignmentDecode, collectionHeadLayoutDecode, strDecode3, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 4:
                            imageMetadataDecode2 = ImageMetadata.ADAPTER.decode(reader);
                            break;
                        case 5:
                            try {
                                collectionHeadAlignmentDecode = CollectionHeadAlignment.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 6:
                            try {
                                collectionHeadLayoutDecode = CollectionHeadLayout.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 7:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 8:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionHeaderMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.title);
                protoAdapter2.encodeWithTag(writer, 2, value.description);
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 3, value.background_image);
                protoAdapter3.encodeWithTag(writer, 4, value.logo_image);
                CollectionHeadAlignment.ADAPTER.encodeWithTag(writer, 5, value.alignment);
                CollectionHeadLayout.ADAPTER.encodeWithTag(writer, 6, value.layout);
                protoAdapter2.encodeWithTag(writer, 7, value.seo_title);
                protoAdapter2.encodeWithTag(writer, 8, value.seo_description);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionHeaderMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.description) + protoAdapter2.encodedSizeWithTag(1, value.title) + iE;
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(8, value.seo_description) + protoAdapter2.encodedSizeWithTag(7, value.seo_title) + CollectionHeadLayout.ADAPTER.encodedSizeWithTag(6, value.layout) + CollectionHeadAlignment.ADAPTER.encodedSizeWithTag(5, value.alignment) + protoAdapter3.encodedSizeWithTag(4, value.logo_image) + protoAdapter3.encodedSizeWithTag(3, value.background_image) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionHeaderMetadata redact(CollectionHeaderMetadata value) {
                value.getClass();
                ImageMetadata imageMetadata = value.background_image;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                ImageMetadata imageMetadata2 = value.logo_image;
                return CollectionHeaderMetadata.copy$default(value, null, null, imageMetadataRedact, imageMetadata2 != null ? ImageMetadata.ADAPTER.redact(imageMetadata2) : null, null, null, null, null, h21.d, 243, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionHeaderMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 8, value.seo_description);
                protoAdapter2.encodeWithTag(writer, 7, value.seo_title);
                CollectionHeadLayout.ADAPTER.encodeWithTag(writer, 6, value.layout);
                CollectionHeadAlignment.ADAPTER.encodeWithTag(writer, 5, value.alignment);
                ProtoAdapter<ImageMetadata> protoAdapter3 = ImageMetadata.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 4, value.logo_image);
                protoAdapter3.encodeWithTag(writer, 3, value.background_image);
                protoAdapter2.encodeWithTag(writer, 2, value.description);
                protoAdapter2.encodeWithTag(writer, 1, value.title);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionHeaderMetadata(String str, String str2, ImageMetadata imageMetadata, ImageMetadata imageMetadata2, CollectionHeadAlignment collectionHeadAlignment, CollectionHeadLayout collectionHeadLayout, String str3, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : imageMetadata, (i & 8) != 0 ? null : imageMetadata2, (i & 16) != 0 ? null : collectionHeadAlignment, (i & 32) != 0 ? null : collectionHeadLayout, (i & 64) != 0 ? null : str3, (i & 128) != 0 ? null : str4, (i & 256) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionHeaderMetadata copy$default(CollectionHeaderMetadata collectionHeaderMetadata, String str, String str2, ImageMetadata imageMetadata, ImageMetadata imageMetadata2, CollectionHeadAlignment collectionHeadAlignment, CollectionHeadLayout collectionHeadLayout, String str3, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionHeaderMetadata.title;
        }
        if ((i & 2) != 0) {
            str2 = collectionHeaderMetadata.description;
        }
        if ((i & 4) != 0) {
            imageMetadata = collectionHeaderMetadata.background_image;
        }
        if ((i & 8) != 0) {
            imageMetadata2 = collectionHeaderMetadata.logo_image;
        }
        if ((i & 16) != 0) {
            collectionHeadAlignment = collectionHeaderMetadata.alignment;
        }
        if ((i & 32) != 0) {
            collectionHeadLayout = collectionHeaderMetadata.layout;
        }
        if ((i & 64) != 0) {
            str3 = collectionHeaderMetadata.seo_title;
        }
        if ((i & 128) != 0) {
            str4 = collectionHeaderMetadata.seo_description;
        }
        if ((i & 256) != 0) {
            h21Var = collectionHeaderMetadata.unknownFields();
        }
        String str5 = str4;
        h21 h21Var2 = h21Var;
        CollectionHeadLayout collectionHeadLayout2 = collectionHeadLayout;
        String str6 = str3;
        CollectionHeadAlignment collectionHeadAlignment2 = collectionHeadAlignment;
        ImageMetadata imageMetadata3 = imageMetadata;
        return collectionHeaderMetadata.copy(str, str2, imageMetadata3, imageMetadata2, collectionHeadAlignment2, collectionHeadLayout2, str6, str5, h21Var2);
    }

    public final CollectionHeaderMetadata copy(String title, String description, ImageMetadata background_image, ImageMetadata logo_image, CollectionHeadAlignment alignment, CollectionHeadLayout layout, String seo_title, String seo_description, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionHeaderMetadata(title, description, background_image, logo_image, alignment, layout, seo_title, seo_description, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionHeaderMetadata)) {
            return false;
        }
        CollectionHeaderMetadata collectionHeaderMetadata = (CollectionHeaderMetadata) other;
        return g76.L(unknownFields(), collectionHeaderMetadata.unknownFields()) && g76.L(this.title, collectionHeaderMetadata.title) && g76.L(this.description, collectionHeaderMetadata.description) && g76.L(this.background_image, collectionHeaderMetadata.background_image) && g76.L(this.logo_image, collectionHeaderMetadata.logo_image) && this.alignment == collectionHeaderMetadata.alignment && this.layout == collectionHeaderMetadata.layout && g76.L(this.seo_title, collectionHeaderMetadata.seo_title) && g76.L(this.seo_description, collectionHeaderMetadata.seo_description);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.title;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.description;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.background_image;
        int iHashCode4 = (iHashCode3 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata2 = this.logo_image;
        int iHashCode5 = (iHashCode4 + (imageMetadata2 != null ? imageMetadata2.hashCode() : 0)) * 37;
        CollectionHeadAlignment collectionHeadAlignment = this.alignment;
        int iHashCode6 = (iHashCode5 + (collectionHeadAlignment != null ? collectionHeadAlignment.hashCode() : 0)) * 37;
        CollectionHeadLayout collectionHeadLayout = this.layout;
        int iHashCode7 = (iHashCode6 + (collectionHeadLayout != null ? collectionHeadLayout.hashCode() : 0)) * 37;
        String str3 = this.seo_title;
        int iHashCode8 = (iHashCode7 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.seo_description;
        int iHashCode9 = iHashCode8 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode9;
        return iHashCode9;
    }

    @Override // com.squareup.wire.Message
    public final nr1 newBuilder() {
        nr1 nr1Var = new nr1();
        nr1Var.a = this.title;
        nr1Var.b = this.description;
        nr1Var.c = this.background_image;
        nr1Var.d = this.logo_image;
        nr1Var.e = this.alignment;
        nr1Var.f = this.layout;
        nr1Var.g = this.seo_title;
        nr1Var.h = this.seo_description;
        nr1Var.addUnknownFields(unknownFields());
        return nr1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.title;
        if (str != null) {
            lv8.D(str, "title=", arrayList);
        }
        String str2 = this.description;
        if (str2 != null) {
            lv8.D(str2, "description=", arrayList);
        }
        ImageMetadata imageMetadata = this.background_image;
        if (imageMetadata != null) {
            arrayList.add("background_image=" + imageMetadata);
        }
        ImageMetadata imageMetadata2 = this.logo_image;
        if (imageMetadata2 != null) {
            arrayList.add(ziYqbdHrAXvj.pcYIGEMmwaSNAg + imageMetadata2);
        }
        CollectionHeadAlignment collectionHeadAlignment = this.alignment;
        if (collectionHeadAlignment != null) {
            arrayList.add("alignment=" + collectionHeadAlignment);
        }
        CollectionHeadLayout collectionHeadLayout = this.layout;
        if (collectionHeadLayout != null) {
            arrayList.add("layout=" + collectionHeadLayout);
        }
        String str3 = this.seo_title;
        if (str3 != null) {
            lv8.D(str3, "seo_title=", arrayList);
        }
        String str4 = this.seo_description;
        if (str4 != null) {
            lv8.D(str4, "seo_description=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionHeaderMetadata{", "}", null, 56);
    }

    public CollectionHeaderMetadata() {
        this(null, null, null, null, null, null, null, null, null, 511, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionHeaderMetadata(String str, String str2, ImageMetadata imageMetadata, ImageMetadata imageMetadata2, CollectionHeadAlignment collectionHeadAlignment, CollectionHeadLayout collectionHeadLayout, String str3, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.title = str;
        this.description = str2;
        this.background_image = imageMetadata;
        this.logo_image = imageMetadata2;
        this.alignment = collectionHeadAlignment;
        this.layout = collectionHeadLayout;
        this.seo_title = str3;
        this.seo_description = str4;
    }
}
