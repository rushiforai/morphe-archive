package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.au1;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.zt1;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0015\b\u0007\u0018\u0000 12\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00022B¹\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010 \u001a\u00020\u00122\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0096\u0002¢\u0006\u0004\b \u0010!J\u000f\u0010\"\u001a\u00020\rH\u0016¢\u0006\u0004\b\"\u0010#J\u000f\u0010$\u001a\u00020\u0003H\u0016¢\u0006\u0004\b$\u0010%J¿\u0001\u0010&\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b&\u0010'R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010(R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010(R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010(R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010)R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010(R\u001c\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010*\u0012\u0004\b+\u0010,R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010(R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010-R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010)R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010(R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010(R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010.R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010/R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u00100¨\u00063"}, d2 = {"Lgen/model/CollectionWithOwner;", "Lcom/squareup/wire/AndroidMessage;", "Lzt1;", "", "collection_id", "name", "slug", "Lgen/model/ImageDisplay;", "image", "creator_id", "Lgen/model/UserItem;", "creator", "description", "", "subscriber_count", "logo", "public_email", "tint_color", "", "light_text", "Lgen/model/CollectionColorPalette;", "color_palette", "Lgen/model/CollectionColorBehavior;", "color_behavior", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Ljava/lang/String;Lgen/model/UserItem;Ljava/lang/String;Ljava/lang/Integer;Lgen/model/ImageDisplay;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/CollectionColorPalette;Lgen/model/CollectionColorBehavior;Lh21;)V", "newBuilder", "()Lzt1;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageDisplay;Ljava/lang/String;Lgen/model/UserItem;Ljava/lang/String;Ljava/lang/Integer;Lgen/model/ImageDisplay;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/CollectionColorPalette;Lgen/model/CollectionColorBehavior;Lh21;)Lgen/model/CollectionWithOwner;", "Ljava/lang/String;", "Lgen/model/ImageDisplay;", "Lgen/model/UserItem;", "getCreator$annotations", "()V", "Ljava/lang/Integer;", "Ljava/lang/Boolean;", "Lgen/model/CollectionColorPalette;", "Lgen/model/CollectionColorBehavior;", "Companion", "au1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionWithOwner extends AndroidMessage<CollectionWithOwner, zt1> {
    public static final ProtoAdapter<CollectionWithOwner> ADAPTER;
    public static final Parcelable.Creator<CollectionWithOwner> CREATOR;
    public static final au1 Companion = new au1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String collection_id;

    @WireField(adapter = "gen.model.CollectionColorBehavior#ADAPTER", schemaIndex = 13, tag = 14)
    public final CollectionColorBehavior color_behavior;

    @WireField(adapter = "gen.model.CollectionColorPalette#ADAPTER", schemaIndex = 12, tag = 13)
    public final CollectionColorPalette color_palette;

    @WireField(adapter = "gen.model.UserItem#ADAPTER", schemaIndex = 5, tag = 6)
    public final UserItem creator;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String description;

    @WireField(adapter = "gen.model.ImageDisplay#ADAPTER", schemaIndex = 3, tag = 4)
    public final ImageDisplay image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 11, tag = 12)
    public final Boolean light_text;

    @WireField(adapter = "gen.model.ImageDisplay#ADAPTER", schemaIndex = 8, tag = 9)
    public final ImageDisplay logo;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String public_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 7, tag = 8)
    public final Integer subscriber_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 11)
    public final String tint_color;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionWithOwner.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionWithOwner> protoAdapter = new ProtoAdapter<CollectionWithOwner>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionWithOwner$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionWithOwner decode(ProtoReader reader) {
                String str;
                String str2;
                ImageDisplay imageDisplay;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                ImageDisplay imageDisplayDecode = null;
                String strDecode4 = null;
                UserItem userItemDecode = null;
                String strDecode5 = null;
                Integer numDecode = null;
                ImageDisplay imageDisplayDecode2 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Boolean boolDecode = null;
                CollectionColorPalette collectionColorPaletteDecode = null;
                CollectionColorBehavior collectionColorBehaviorDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionWithOwner(str3, strDecode2, strDecode3, imageDisplayDecode, strDecode4, userItemDecode, strDecode5, numDecode, imageDisplayDecode2, strDecode6, strDecode7, boolDecode, collectionColorPaletteDecode, collectionColorBehaviorDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 4:
                            imageDisplayDecode = ImageDisplay.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 6:
                            userItemDecode = UserItem.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 7:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 8:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 9:
                            imageDisplayDecode2 = ImageDisplay.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 10:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 11:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 12:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 13:
                            collectionColorPaletteDecode = CollectionColorPalette.ADAPTER.decode(reader);
                            strDecode = str3;
                            break;
                        case 14:
                            try {
                                collectionColorBehaviorDecode = CollectionColorBehavior.ADAPTER.decode(reader);
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                str = strDecode2;
                                str2 = strDecode3;
                                imageDisplay = imageDisplayDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str3;
                                strDecode2 = str;
                                strDecode3 = str2;
                                imageDisplayDecode = imageDisplay;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode2;
                            str2 = strDecode3;
                            imageDisplay = imageDisplayDecode;
                            strDecode = str3;
                            strDecode2 = str;
                            strDecode3 = str2;
                            imageDisplayDecode = imageDisplay;
                            break;
                    }
                    str3 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionWithOwner value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 3, value.slug);
                ProtoAdapter<ImageDisplay> protoAdapter3 = ImageDisplay.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 4, value.image);
                protoAdapter2.encodeWithTag(writer, 5, value.creator_id);
                UserItem.ADAPTER.encodeWithTag(writer, 6, value.creator);
                protoAdapter2.encodeWithTag(writer, 7, value.description);
                ProtoAdapter.INT32.encodeWithTag(writer, 8, value.subscriber_count);
                protoAdapter3.encodeWithTag(writer, 9, value.logo);
                protoAdapter2.encodeWithTag(writer, 10, value.public_email);
                protoAdapter2.encodeWithTag(writer, 11, value.tint_color);
                ProtoAdapter.BOOL.encodeWithTag(writer, 12, value.light_text);
                CollectionColorPalette.ADAPTER.encodeWithTag(writer, 13, value.color_palette);
                CollectionColorBehavior.ADAPTER.encodeWithTag(writer, 14, value.color_behavior);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionWithOwner value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.slug) + protoAdapter2.encodedSizeWithTag(2, value.name) + protoAdapter2.encodedSizeWithTag(1, value.collection_id) + iE;
                ProtoAdapter<ImageDisplay> protoAdapter3 = ImageDisplay.ADAPTER;
                return CollectionColorBehavior.ADAPTER.encodedSizeWithTag(14, value.color_behavior) + CollectionColorPalette.ADAPTER.encodedSizeWithTag(13, value.color_palette) + ProtoAdapter.BOOL.encodedSizeWithTag(12, value.light_text) + protoAdapter2.encodedSizeWithTag(11, value.tint_color) + protoAdapter2.encodedSizeWithTag(10, value.public_email) + protoAdapter3.encodedSizeWithTag(9, value.logo) + ProtoAdapter.INT32.encodedSizeWithTag(8, value.subscriber_count) + protoAdapter2.encodedSizeWithTag(7, value.description) + UserItem.ADAPTER.encodedSizeWithTag(6, value.creator) + protoAdapter2.encodedSizeWithTag(5, value.creator_id) + protoAdapter3.encodedSizeWithTag(4, value.image) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionWithOwner redact(CollectionWithOwner value) {
                value.getClass();
                ImageDisplay imageDisplay = value.image;
                ImageDisplay imageDisplayRedact = imageDisplay != null ? ImageDisplay.ADAPTER.redact(imageDisplay) : null;
                UserItem userItem = value.creator;
                UserItem userItemRedact = userItem != null ? UserItem.ADAPTER.redact(userItem) : null;
                ImageDisplay imageDisplay2 = value.logo;
                ImageDisplay imageDisplayRedact2 = imageDisplay2 != null ? ImageDisplay.ADAPTER.redact(imageDisplay2) : null;
                CollectionColorPalette collectionColorPalette = value.color_palette;
                return value.copy((11991 & 1) != 0 ? value.collection_id : null, (11991 & 2) != 0 ? value.name : null, (11991 & 4) != 0 ? value.slug : null, (11991 & 8) != 0 ? value.image : imageDisplayRedact, (11991 & 16) != 0 ? value.creator_id : null, (11991 & 32) != 0 ? value.creator : userItemRedact, (11991 & 64) != 0 ? value.description : null, (11991 & 128) != 0 ? value.subscriber_count : null, (11991 & 256) != 0 ? value.logo : imageDisplayRedact2, (11991 & 512) != 0 ? value.public_email : null, (11991 & 1024) != 0 ? value.tint_color : null, (11991 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.light_text : null, (11991 & 4096) != 0 ? value.color_palette : collectionColorPalette != null ? CollectionColorPalette.ADAPTER.redact(collectionColorPalette) : null, (11991 & 8192) != 0 ? value.color_behavior : null, (11991 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionWithOwner value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CollectionColorBehavior.ADAPTER.encodeWithTag(writer, 14, value.color_behavior);
                CollectionColorPalette.ADAPTER.encodeWithTag(writer, 13, value.color_palette);
                ProtoAdapter.BOOL.encodeWithTag(writer, 12, value.light_text);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 11, value.tint_color);
                protoAdapter2.encodeWithTag(writer, 10, value.public_email);
                ProtoAdapter<ImageDisplay> protoAdapter3 = ImageDisplay.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 9, value.logo);
                ProtoAdapter.INT32.encodeWithTag(writer, 8, value.subscriber_count);
                protoAdapter2.encodeWithTag(writer, 7, value.description);
                UserItem.ADAPTER.encodeWithTag(writer, 6, value.creator);
                protoAdapter2.encodeWithTag(writer, 5, value.creator_id);
                protoAdapter3.encodeWithTag(writer, 4, value.image);
                protoAdapter2.encodeWithTag(writer, 3, value.slug);
                protoAdapter2.encodeWithTag(writer, 2, value.name);
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionWithOwner(String str, String str2, String str3, ImageDisplay imageDisplay, String str4, UserItem userItem, String str5, Integer num, ImageDisplay imageDisplay2, String str6, String str7, Boolean bool, CollectionColorPalette collectionColorPalette, CollectionColorBehavior collectionColorBehavior, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : imageDisplay, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : userItem, (i & 64) != 0 ? null : str5, (i & 128) != 0 ? null : num, (i & 256) != 0 ? null : imageDisplay2, (i & 512) != 0 ? null : str6, (i & 1024) != 0 ? null : str7, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool, (i & 4096) != 0 ? null : collectionColorPalette, (i & 8192) == 0 ? collectionColorBehavior : null, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? h21.d : h21Var);
    }

    public final CollectionWithOwner copy(String collection_id, String name, String slug, ImageDisplay image, String creator_id, UserItem creator, String description, Integer subscriber_count, ImageDisplay logo, String public_email, String tint_color, Boolean light_text, CollectionColorPalette color_palette, CollectionColorBehavior color_behavior, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionWithOwner(collection_id, name, slug, image, creator_id, creator, description, subscriber_count, logo, public_email, tint_color, light_text, color_palette, color_behavior, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionWithOwner)) {
            return false;
        }
        CollectionWithOwner collectionWithOwner = (CollectionWithOwner) other;
        return g76.L(unknownFields(), collectionWithOwner.unknownFields()) && g76.L(this.collection_id, collectionWithOwner.collection_id) && g76.L(this.name, collectionWithOwner.name) && g76.L(this.slug, collectionWithOwner.slug) && g76.L(this.image, collectionWithOwner.image) && g76.L(this.creator_id, collectionWithOwner.creator_id) && g76.L(this.creator, collectionWithOwner.creator) && g76.L(this.description, collectionWithOwner.description) && g76.L(this.subscriber_count, collectionWithOwner.subscriber_count) && g76.L(this.logo, collectionWithOwner.logo) && g76.L(this.public_email, collectionWithOwner.public_email) && g76.L(this.tint_color, collectionWithOwner.tint_color) && g76.L(this.light_text, collectionWithOwner.light_text) && g76.L(this.color_palette, collectionWithOwner.color_palette) && this.color_behavior == collectionWithOwner.color_behavior;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.collection_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.slug;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        ImageDisplay imageDisplay = this.image;
        int iHashCode5 = (iHashCode4 + (imageDisplay != null ? imageDisplay.hashCode() : 0)) * 37;
        String str4 = this.creator_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        UserItem userItem = this.creator;
        int iHashCode7 = (iHashCode6 + (userItem != null ? userItem.hashCode() : 0)) * 37;
        String str5 = this.description;
        int iHashCode8 = (iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Integer num = this.subscriber_count;
        int iIntValue = (iHashCode8 + (num != null ? num.intValue() : 0)) * 37;
        ImageDisplay imageDisplay2 = this.logo;
        int iHashCode9 = (iIntValue + (imageDisplay2 != null ? imageDisplay2.hashCode() : 0)) * 37;
        String str6 = this.public_email;
        int iHashCode10 = (iHashCode9 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.tint_color;
        int iHashCode11 = (iHashCode10 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Boolean bool = this.light_text;
        int i2 = (iHashCode11 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        CollectionColorPalette collectionColorPalette = this.color_palette;
        int iHashCode12 = (i2 + (collectionColorPalette != null ? collectionColorPalette.hashCode() : 0)) * 37;
        CollectionColorBehavior collectionColorBehavior = this.color_behavior;
        int iHashCode13 = iHashCode12 + (collectionColorBehavior != null ? collectionColorBehavior.hashCode() : 0);
        this.hashCode = iHashCode13;
        return iHashCode13;
    }

    @Override // com.squareup.wire.Message
    public final zt1 newBuilder() {
        zt1 zt1Var = new zt1();
        zt1Var.a = this.collection_id;
        zt1Var.b = this.name;
        zt1Var.c = this.slug;
        zt1Var.d = this.image;
        zt1Var.e = this.creator_id;
        zt1Var.f = this.creator;
        zt1Var.g = this.description;
        zt1Var.h = this.subscriber_count;
        zt1Var.i = this.logo;
        zt1Var.j = this.public_email;
        zt1Var.k = this.tint_color;
        zt1Var.l = this.light_text;
        zt1Var.m = this.color_palette;
        zt1Var.n = this.color_behavior;
        zt1Var.addUnknownFields(unknownFields());
        return zt1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.collection_id;
        if (str != null) {
            lv8.D(str, "collection_id=", arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.slug;
        if (str3 != null) {
            lv8.D(str3, "slug=", arrayList);
        }
        ImageDisplay imageDisplay = this.image;
        if (imageDisplay != null) {
            arrayList.add("image=" + imageDisplay);
        }
        String str4 = this.creator_id;
        if (str4 != null) {
            lv8.D(str4, "creator_id=", arrayList);
        }
        UserItem userItem = this.creator;
        if (userItem != null) {
            arrayList.add("creator=" + userItem);
        }
        String str5 = this.description;
        if (str5 != null) {
            lv8.D(str5, "description=", arrayList);
        }
        Integer num = this.subscriber_count;
        if (num != null) {
            lv8.B("subscriber_count=", num, arrayList);
        }
        ImageDisplay imageDisplay2 = this.logo;
        if (imageDisplay2 != null) {
            arrayList.add("logo=" + imageDisplay2);
        }
        String str6 = this.public_email;
        if (str6 != null) {
            lv8.D(str6, "public_email=", arrayList);
        }
        String str7 = this.tint_color;
        if (str7 != null) {
            lv8.D(str7, "tint_color=", arrayList);
        }
        Boolean bool = this.light_text;
        if (bool != null) {
            lv8.A("light_text=", bool, arrayList);
        }
        CollectionColorPalette collectionColorPalette = this.color_palette;
        if (collectionColorPalette != null) {
            arrayList.add("color_palette=" + collectionColorPalette);
        }
        CollectionColorBehavior collectionColorBehavior = this.color_behavior;
        if (collectionColorBehavior != null) {
            arrayList.add("color_behavior=" + collectionColorBehavior);
        }
        return bu1.F0(arrayList, ", ", "CollectionWithOwner{", "}", null, 56);
    }

    public static /* synthetic */ void getCreator$annotations() {
    }

    public CollectionWithOwner() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 32767, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionWithOwner(String str, String str2, String str3, ImageDisplay imageDisplay, String str4, UserItem userItem, String str5, Integer num, ImageDisplay imageDisplay2, String str6, String str7, Boolean bool, CollectionColorPalette collectionColorPalette, CollectionColorBehavior collectionColorBehavior, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.collection_id = str;
        this.name = str2;
        this.slug = str3;
        this.image = imageDisplay;
        this.creator_id = str4;
        this.creator = userItem;
        this.description = str5;
        this.subscriber_count = num;
        this.logo = imageDisplay2;
        this.public_email = str6;
        this.tint_color = str7;
        this.light_text = bool;
        this.color_palette = collectionColorPalette;
        this.color_behavior = collectionColorBehavior;
    }
}
