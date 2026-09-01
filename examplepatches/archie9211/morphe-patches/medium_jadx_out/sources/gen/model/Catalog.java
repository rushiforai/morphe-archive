package gen.model;

import android.os.Parcelable;
import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.q71;
import defpackage.r71;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0012\b\u0007\u0018\u0000 52\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00026BÅ\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u0012\b\b\u0002\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001f\u0010 J\u001a\u0010#\u001a\u00020\u00142\b\u0010\"\u001a\u0004\u0018\u00010!H\u0096\u0002¢\u0006\u0004\b#\u0010$J\u000f\u0010&\u001a\u00020%H\u0016¢\u0006\u0004\b&\u0010'J\u000f\u0010(\u001a\u00020\u0003H\u0016¢\u0006\u0004\b(\u0010)JÑ\u0001\u0010*\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\b\b\u0002\u0010\t\u001a\u00020\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\b\b\u0002\u0010\u001c\u001a\u00020\u001b¢\u0006\u0004\b*\u0010+R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010,R\u0014\u0010\u0005\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010,R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010-R\u0014\u0010\t\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010.R\u0016\u0010\n\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010/R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010,R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010,R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u00100R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010/R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010,R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010/R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u00101R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u00102R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u00103R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010,R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u00104¨\u00067"}, d2 = {"Lgen/model/Catalog;", "Lcom/squareup/wire/AndroidMessage;", "Lq71;", "", "catalog_id", "creator_id", "Lgen/model/User;", "creator", "", "created_at", "deleted_at", "name", "description", "Lgen/model/ImageMetadata;", "image", "item_count", "catalog_url", "items_last_inserted_at", "Lgen/model/CatalogVisibility;", "visibility", "", "is_locked_preview_only", "Lgen/model/CatalogType;", "catalog_type", "thumbnail", "Lgen/model/PredefinedCatalogKind;", "predefined_kind", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/User;JLjava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Lgen/model/CatalogVisibility;Ljava/lang/Boolean;Lgen/model/CatalogType;Ljava/lang/String;Lgen/model/PredefinedCatalogKind;Lh21;)V", "newBuilder", "()Lq71;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/User;JLjava/lang/Long;Ljava/lang/String;Ljava/lang/String;Lgen/model/ImageMetadata;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Long;Lgen/model/CatalogVisibility;Ljava/lang/Boolean;Lgen/model/CatalogType;Ljava/lang/String;Lgen/model/PredefinedCatalogKind;Lh21;)Lgen/model/Catalog;", "Ljava/lang/String;", "Lgen/model/User;", "J", "Ljava/lang/Long;", "Lgen/model/ImageMetadata;", "Lgen/model/CatalogVisibility;", "Ljava/lang/Boolean;", "Lgen/model/CatalogType;", "Lgen/model/PredefinedCatalogKind;", "Companion", "r71", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Catalog extends AndroidMessage<Catalog, q71> {
    public static final ProtoAdapter<Catalog> ADAPTER;
    public static final Parcelable.Creator<Catalog> CREATOR;
    public static final r71 Companion = new r71();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final String catalog_id;

    @WireField(adapter = "gen.model.CatalogType#ADAPTER", schemaIndex = 13, tag = 14)
    public final CatalogType catalog_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String catalog_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", label = WireField.Label.REQUIRED, schemaIndex = 3, tag = 3)
    public final long created_at;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 2, tag = 7)
    public final User creator;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 4, tag = 8)
    public final Long deleted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 5)
    public final String description;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 7, tag = 6)
    public final ImageMetadata image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 12, tag = 13)
    public final Boolean is_locked_preview_only;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 8, tag = 9)
    public final Long item_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 10, tag = 11)
    public final Long items_last_inserted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 4)
    public final String name;

    @WireField(adapter = "gen.model.PredefinedCatalogKind#ADAPTER", schemaIndex = 15, tag = 16)
    public final PredefinedCatalogKind predefined_kind;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 15)
    public final String thumbnail;

    @WireField(adapter = "gen.model.CatalogVisibility#ADAPTER", schemaIndex = 11, tag = 12)
    public final CatalogVisibility visibility;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Catalog.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Catalog> protoAdapter = new ProtoAdapter<Catalog>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Catalog$Companion$ADAPTER$1
            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Catalog value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.catalog_id);
                protoAdapter2.encodeWithTag(writer, 2, value.creator_id);
                User.ADAPTER.encodeWithTag(writer, 7, value.creator);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, Long.valueOf(value.created_at));
                protoAdapter3.encodeWithTag(writer, 8, value.deleted_at);
                protoAdapter2.encodeWithTag(writer, 4, value.name);
                protoAdapter2.encodeWithTag(writer, 5, value.description);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 6, value.image);
                protoAdapter3.encodeWithTag(writer, 9, value.item_count);
                protoAdapter2.encodeWithTag(writer, 10, value.catalog_url);
                protoAdapter3.encodeWithTag(writer, 11, value.items_last_inserted_at);
                CatalogVisibility.ADAPTER.encodeWithTag(writer, 12, value.visibility);
                ProtoAdapter.BOOL.encodeWithTag(writer, 13, value.is_locked_preview_only);
                CatalogType.ADAPTER.encodeWithTag(writer, 14, value.catalog_type);
                protoAdapter2.encodeWithTag(writer, 15, value.thumbnail);
                PredefinedCatalogKind.ADAPTER.encodeWithTag(writer, 16, value.predefined_kind);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Catalog value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = User.ADAPTER.encodedSizeWithTag(7, value.creator) + protoAdapter2.encodedSizeWithTag(2, value.creator_id) + protoAdapter2.encodedSizeWithTag(1, value.catalog_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                return PredefinedCatalogKind.ADAPTER.encodedSizeWithTag(16, value.predefined_kind) + protoAdapter2.encodedSizeWithTag(15, value.thumbnail) + CatalogType.ADAPTER.encodedSizeWithTag(14, value.catalog_type) + ProtoAdapter.BOOL.encodedSizeWithTag(13, value.is_locked_preview_only) + CatalogVisibility.ADAPTER.encodedSizeWithTag(12, value.visibility) + protoAdapter3.encodedSizeWithTag(11, value.items_last_inserted_at) + protoAdapter2.encodedSizeWithTag(10, value.catalog_url) + protoAdapter3.encodedSizeWithTag(9, value.item_count) + ImageMetadata.ADAPTER.encodedSizeWithTag(6, value.image) + protoAdapter2.encodedSizeWithTag(5, value.description) + protoAdapter2.encodedSizeWithTag(4, value.name) + protoAdapter3.encodedSizeWithTag(8, value.deleted_at) + protoAdapter3.encodedSizeWithTag(3, Long.valueOf(value.created_at)) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Catalog redact(Catalog value) {
                value.getClass();
                User user = value.creator;
                User userRedact = user != null ? User.ADAPTER.redact(user) : null;
                ImageMetadata imageMetadata = value.image;
                return value.copy((65403 & 1) != 0 ? value.catalog_id : null, (65403 & 2) != 0 ? value.creator_id : null, (65403 & 4) != 0 ? value.creator : userRedact, (65403 & 8) != 0 ? value.created_at : 0L, (65403 & 16) != 0 ? value.deleted_at : null, (65403 & 32) != 0 ? value.name : null, (65403 & 64) != 0 ? value.description : null, (65403 & 128) != 0 ? value.image : imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null, (65403 & 256) != 0 ? value.item_count : null, (65403 & 512) != 0 ? value.catalog_url : null, (65403 & 1024) != 0 ? value.items_last_inserted_at : null, (65403 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.visibility : null, (65403 & 4096) != 0 ? value.is_locked_preview_only : null, (65403 & 8192) != 0 ? value.catalog_type : null, (65403 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.thumbnail : null, (65403 & 32768) != 0 ? value.predefined_kind : null, (65403 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.unknownFields() : h21.d);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Catalog decode(ProtoReader reader) {
                String str;
                String str2;
                User user;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                User userDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                ImageMetadata imageMetadataDecode = null;
                Long lDecode3 = null;
                String strDecode5 = null;
                Long lDecode4 = null;
                CatalogVisibility catalogVisibilityDecode = null;
                Boolean boolDecode = null;
                CatalogType catalogTypeDecode = null;
                String strDecode6 = null;
                PredefinedCatalogKind predefinedCatalogKindDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        String str3 = strDecode;
                        String str4 = strDecode2;
                        User user2 = userDecode;
                        h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                        String str5 = str3;
                        if (str5 == null) {
                            Internal.missingRequiredFields(str3, "catalog_id");
                            throw null;
                        }
                        String str6 = str4;
                        if (str6 == null) {
                            Internal.missingRequiredFields(str4, CspinKvYN.DwVubwyS);
                            throw null;
                        }
                        User user3 = user2;
                        Long l = lDecode;
                        if (l != null) {
                            return new Catalog(str5, str6, user3, l.longValue(), lDecode2, strDecode3, strDecode4, imageMetadataDecode, lDecode3, strDecode5, lDecode4, catalogVisibilityDecode, boolDecode, catalogTypeDecode, strDecode6, predefinedCatalogKindDecode, h21VarEndMessageAndGetUnknownFields);
                        }
                        Internal.missingRequiredFields(lDecode, "created_at");
                        throw null;
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 3:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 6:
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            continue;
                        case 7:
                            userDecode = User.ADAPTER.decode(reader);
                            continue;
                        case 8:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 9:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 10:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 11:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 12:
                            str = strDecode;
                            str2 = strDecode2;
                            user = userDecode;
                            try {
                                catalogVisibilityDecode = CatalogVisibility.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 13:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            continue;
                        case 14:
                            str = strDecode;
                            str2 = strDecode2;
                            user = userDecode;
                            try {
                                catalogTypeDecode = CatalogType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                            }
                            break;
                        case 15:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 16:
                            try {
                                predefinedCatalogKindDecode = PredefinedCatalogKind.ADAPTER.decode(reader);
                                continue;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                str = strDecode;
                                str2 = strDecode2;
                                user = userDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str;
                                strDecode2 = str2;
                                userDecode = user;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode;
                            str2 = strDecode2;
                            user = userDecode;
                            break;
                    }
                    strDecode = str;
                    strDecode2 = str2;
                    userDecode = user;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Catalog value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                PredefinedCatalogKind.ADAPTER.encodeWithTag(writer, 16, value.predefined_kind);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 15, value.thumbnail);
                CatalogType.ADAPTER.encodeWithTag(writer, 14, value.catalog_type);
                ProtoAdapter.BOOL.encodeWithTag(writer, 13, value.is_locked_preview_only);
                CatalogVisibility.ADAPTER.encodeWithTag(writer, 12, value.visibility);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 11, value.items_last_inserted_at);
                protoAdapter2.encodeWithTag(writer, 10, value.catalog_url);
                protoAdapter3.encodeWithTag(writer, 9, value.item_count);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 6, value.image);
                protoAdapter2.encodeWithTag(writer, 5, value.description);
                protoAdapter2.encodeWithTag(writer, 4, value.name);
                protoAdapter3.encodeWithTag(writer, 8, value.deleted_at);
                protoAdapter3.encodeWithTag(writer, 3, Long.valueOf(value.created_at));
                User.ADAPTER.encodeWithTag(writer, 7, value.creator);
                protoAdapter2.encodeWithTag(writer, 2, value.creator_id);
                protoAdapter2.encodeWithTag(writer, 1, value.catalog_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Catalog(String str, String str2, User user, long j, Long l, String str3, String str4, ImageMetadata imageMetadata, Long l2, String str5, Long l3, CatalogVisibility catalogVisibility, Boolean bool, CatalogType catalogType, String str6, PredefinedCatalogKind predefinedCatalogKind, h21 h21Var, int i, gy2 gy2Var) {
        this(str, str2, (i & 4) != 0 ? null : user, j, (i & 16) != 0 ? null : l, (i & 32) != 0 ? null : str3, (i & 64) != 0 ? null : str4, (i & 128) != 0 ? null : imageMetadata, (i & 256) != 0 ? null : l2, (i & 512) != 0 ? null : str5, (i & 1024) != 0 ? null : l3, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : catalogVisibility, (i & 4096) != 0 ? null : bool, (i & 8192) != 0 ? null : catalogType, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str6, (32768 & i) != 0 ? null : predefinedCatalogKind, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? h21.d : h21Var);
    }

    public final Catalog copy(String catalog_id, String creator_id, User creator, long created_at, Long deleted_at, String name, String description, ImageMetadata image, Long item_count, String catalog_url, Long items_last_inserted_at, CatalogVisibility visibility, Boolean is_locked_preview_only, CatalogType catalog_type, String thumbnail, PredefinedCatalogKind predefined_kind, h21 unknownFields) {
        catalog_id.getClass();
        creator_id.getClass();
        unknownFields.getClass();
        return new Catalog(catalog_id, creator_id, creator, created_at, deleted_at, name, description, image, item_count, catalog_url, items_last_inserted_at, visibility, is_locked_preview_only, catalog_type, thumbnail, predefined_kind, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Catalog)) {
            return false;
        }
        Catalog catalog = (Catalog) other;
        return g76.L(unknownFields(), catalog.unknownFields()) && g76.L(this.catalog_id, catalog.catalog_id) && g76.L(this.creator_id, catalog.creator_id) && g76.L(this.creator, catalog.creator) && this.created_at == catalog.created_at && g76.L(this.deleted_at, catalog.deleted_at) && g76.L(this.name, catalog.name) && g76.L(this.description, catalog.description) && g76.L(this.image, catalog.image) && g76.L(this.item_count, catalog.item_count) && g76.L(this.catalog_url, catalog.catalog_url) && g76.L(this.items_last_inserted_at, catalog.items_last_inserted_at) && this.visibility == catalog.visibility && g76.L(this.is_locked_preview_only, catalog.is_locked_preview_only) && this.catalog_type == catalog.catalog_type && g76.L(this.thumbnail, catalog.thumbnail) && this.predefined_kind == catalog.predefined_kind;
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4 = this.hashCode;
        if (i4 != 0) {
            return i4;
        }
        int iO = wgd.o(wgd.o(unknownFields().hashCode() * 37, 37, this.catalog_id), 37, this.creator_id);
        User user = this.creator;
        int iHashCode = user != null ? user.hashCode() : 0;
        long j = this.created_at;
        int i5 = (((iO + iHashCode) * 37) + ((int) (j ^ (j >>> 32)))) * 37;
        Long l = this.deleted_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i6 = (i5 + i) * 37;
        String str = this.name;
        int iHashCode2 = (i6 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.description;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.image;
        int iHashCode4 = (iHashCode3 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        Long l2 = this.item_count;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i7 = (iHashCode4 + i2) * 37;
        String str3 = this.catalog_url;
        int iHashCode5 = (i7 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Long l3 = this.items_last_inserted_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i8 = (iHashCode5 + i3) * 37;
        CatalogVisibility catalogVisibility = this.visibility;
        int iHashCode6 = (i8 + (catalogVisibility != null ? catalogVisibility.hashCode() : 0)) * 37;
        Boolean bool = this.is_locked_preview_only;
        int i9 = (iHashCode6 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        CatalogType catalogType = this.catalog_type;
        int iHashCode7 = (i9 + (catalogType != null ? catalogType.hashCode() : 0)) * 37;
        String str4 = this.thumbnail;
        int iHashCode8 = (iHashCode7 + (str4 != null ? str4.hashCode() : 0)) * 37;
        PredefinedCatalogKind predefinedCatalogKind = this.predefined_kind;
        int iHashCode9 = iHashCode8 + (predefinedCatalogKind != null ? predefinedCatalogKind.hashCode() : 0);
        this.hashCode = iHashCode9;
        return iHashCode9;
    }

    @Override // com.squareup.wire.Message
    public final q71 newBuilder() {
        q71 q71Var = new q71();
        q71Var.a = this.catalog_id;
        q71Var.b = this.creator_id;
        q71Var.c = this.creator;
        q71Var.d = Long.valueOf(this.created_at);
        q71Var.e = this.deleted_at;
        q71Var.f = this.name;
        q71Var.g = this.description;
        q71Var.h = this.image;
        q71Var.i = this.item_count;
        q71Var.j = this.catalog_url;
        q71Var.k = this.items_last_inserted_at;
        q71Var.l = this.visibility;
        q71Var.m = this.is_locked_preview_only;
        q71Var.n = this.catalog_type;
        q71Var.o = this.thumbnail;
        q71Var.p = this.predefined_kind;
        q71Var.addUnknownFields(unknownFields());
        return q71Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.catalog_id, "catalog_id=", arrayList);
        lv8.D(this.creator_id, "creator_id=", arrayList);
        User user = this.creator;
        if (user != null) {
            arrayList.add("creator=" + user);
        }
        arrayList.add("created_at=" + this.created_at);
        Long l = this.deleted_at;
        if (l != null) {
            y30.A("deleted_at=", l, arrayList);
        }
        String str = this.name;
        if (str != null) {
            lv8.D(str, "name=", arrayList);
        }
        String str2 = this.description;
        if (str2 != null) {
            lv8.D(str2, "description=", arrayList);
        }
        ImageMetadata imageMetadata = this.image;
        if (imageMetadata != null) {
            arrayList.add("image=" + imageMetadata);
        }
        Long l2 = this.item_count;
        if (l2 != null) {
            y30.A("item_count=", l2, arrayList);
        }
        String str3 = this.catalog_url;
        if (str3 != null) {
            lv8.D(str3, "catalog_url=", arrayList);
        }
        Long l3 = this.items_last_inserted_at;
        if (l3 != null) {
            y30.A("items_last_inserted_at=", l3, arrayList);
        }
        CatalogVisibility catalogVisibility = this.visibility;
        if (catalogVisibility != null) {
            arrayList.add("visibility=" + catalogVisibility);
        }
        Boolean bool = this.is_locked_preview_only;
        if (bool != null) {
            lv8.A("is_locked_preview_only=", bool, arrayList);
        }
        CatalogType catalogType = this.catalog_type;
        if (catalogType != null) {
            arrayList.add("catalog_type=" + catalogType);
        }
        String str4 = this.thumbnail;
        if (str4 != null) {
            lv8.D(str4, "thumbnail=", arrayList);
        }
        PredefinedCatalogKind predefinedCatalogKind = this.predefined_kind;
        if (predefinedCatalogKind != null) {
            arrayList.add("predefined_kind=" + predefinedCatalogKind);
        }
        return bu1.F0(arrayList, ", ", "Catalog{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Catalog(String str, String str2, User user, long j, Long l, String str3, String str4, ImageMetadata imageMetadata, Long l2, String str5, Long l3, CatalogVisibility catalogVisibility, Boolean bool, CatalogType catalogType, String str6, PredefinedCatalogKind predefinedCatalogKind, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        h21Var.getClass();
        this.catalog_id = str;
        this.creator_id = str2;
        this.creator = user;
        this.created_at = j;
        this.deleted_at = l;
        this.name = str3;
        this.description = str4;
        this.image = imageMetadata;
        this.item_count = l2;
        this.catalog_url = str5;
        this.items_last_inserted_at = l3;
        this.visibility = catalogVisibility;
        this.is_locked_preview_only = bool;
        this.catalog_type = catalogType;
        this.thumbnail = str6;
        this.predefined_kind = predefinedCatalogKind;
    }
}
