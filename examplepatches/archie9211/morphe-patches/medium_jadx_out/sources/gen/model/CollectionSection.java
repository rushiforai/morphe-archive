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
import defpackage.at1;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.zs1;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\u0018\u0000 \"2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002#BA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u001a\u001a\u00020\u0019H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJG\u0010\u001c\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001c\u0010\u001dR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001eR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010!¨\u0006$"}, d2 = {"Lgen/model/CollectionSection;", "Lcom/squareup/wire/AndroidMessage;", "Lzs1;", "Lgen/model/CollectionSectionType;", "type", "Lgen/model/PostListMetadata;", "post_list_metadata", "Lgen/model/CollectionHeaderMetadata;", "collection_header_metadata", "Lgen/model/CollectionPromoMetadata;", "promo_metadata", "Lh21;", "unknownFields", "<init>", "(Lgen/model/CollectionSectionType;Lgen/model/PostListMetadata;Lgen/model/CollectionHeaderMetadata;Lgen/model/CollectionPromoMetadata;Lh21;)V", "newBuilder", "()Lzs1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/CollectionSectionType;Lgen/model/PostListMetadata;Lgen/model/CollectionHeaderMetadata;Lgen/model/CollectionPromoMetadata;Lh21;)Lgen/model/CollectionSection;", "Lgen/model/CollectionSectionType;", "Lgen/model/PostListMetadata;", "Lgen/model/CollectionHeaderMetadata;", "Lgen/model/CollectionPromoMetadata;", "Companion", "at1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionSection extends AndroidMessage<CollectionSection, zs1> {
    public static final ProtoAdapter<CollectionSection> ADAPTER;
    public static final Parcelable.Creator<CollectionSection> CREATOR;
    public static final at1 Companion = new at1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionHeaderMetadata#ADAPTER", schemaIndex = 2, tag = 3)
    public final CollectionHeaderMetadata collection_header_metadata;

    @WireField(adapter = "gen.model.PostListMetadata#ADAPTER", schemaIndex = 1, tag = 2)
    public final PostListMetadata post_list_metadata;

    @WireField(adapter = "gen.model.CollectionPromoMetadata#ADAPTER", schemaIndex = 3, tag = 4)
    public final CollectionPromoMetadata promo_metadata;

    @WireField(adapter = "gen.model.CollectionSectionType#ADAPTER", schemaIndex = 0, tag = 1)
    public final CollectionSectionType type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionSection.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionSection> protoAdapter = new ProtoAdapter<CollectionSection>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionSection$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionSection decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                CollectionSectionType collectionSectionTypeDecode = null;
                PostListMetadata postListMetadataDecode = null;
                CollectionHeaderMetadata collectionHeaderMetadataDecode = null;
                CollectionPromoMetadata collectionPromoMetadataDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionSection(collectionSectionTypeDecode, postListMetadataDecode, collectionHeaderMetadataDecode, collectionPromoMetadataDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        try {
                            collectionSectionTypeDecode = CollectionSectionType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag == 2) {
                        postListMetadataDecode = PostListMetadata.ADAPTER.decode(reader);
                    } else if (iNextTag == 3) {
                        collectionHeaderMetadataDecode = CollectionHeaderMetadata.ADAPTER.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        collectionPromoMetadataDecode = CollectionPromoMetadata.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionSection value) {
                writer.getClass();
                value.getClass();
                CollectionSectionType.ADAPTER.encodeWithTag(writer, 1, value.type);
                PostListMetadata.ADAPTER.encodeWithTag(writer, 2, value.post_list_metadata);
                CollectionHeaderMetadata.ADAPTER.encodeWithTag(writer, 3, value.collection_header_metadata);
                CollectionPromoMetadata.ADAPTER.encodeWithTag(writer, 4, value.promo_metadata);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionSection value) {
                value.getClass();
                return CollectionPromoMetadata.ADAPTER.encodedSizeWithTag(4, value.promo_metadata) + CollectionHeaderMetadata.ADAPTER.encodedSizeWithTag(3, value.collection_header_metadata) + PostListMetadata.ADAPTER.encodedSizeWithTag(2, value.post_list_metadata) + CollectionSectionType.ADAPTER.encodedSizeWithTag(1, value.type) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionSection redact(CollectionSection value) {
                value.getClass();
                PostListMetadata postListMetadata = value.post_list_metadata;
                PostListMetadata postListMetadataRedact = postListMetadata != null ? PostListMetadata.ADAPTER.redact(postListMetadata) : null;
                CollectionHeaderMetadata collectionHeaderMetadata = value.collection_header_metadata;
                CollectionHeaderMetadata collectionHeaderMetadataRedact = collectionHeaderMetadata != null ? CollectionHeaderMetadata.ADAPTER.redact(collectionHeaderMetadata) : null;
                CollectionPromoMetadata collectionPromoMetadata = value.promo_metadata;
                return CollectionSection.copy$default(value, null, postListMetadataRedact, collectionHeaderMetadataRedact, collectionPromoMetadata != null ? CollectionPromoMetadata.ADAPTER.redact(collectionPromoMetadata) : null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionSection value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CollectionPromoMetadata.ADAPTER.encodeWithTag(writer, 4, value.promo_metadata);
                CollectionHeaderMetadata.ADAPTER.encodeWithTag(writer, 3, value.collection_header_metadata);
                PostListMetadata.ADAPTER.encodeWithTag(writer, 2, value.post_list_metadata);
                CollectionSectionType.ADAPTER.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionSection(CollectionSectionType collectionSectionType, PostListMetadata postListMetadata, CollectionHeaderMetadata collectionHeaderMetadata, CollectionPromoMetadata collectionPromoMetadata, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : collectionSectionType, (i & 2) != 0 ? null : postListMetadata, (i & 4) != 0 ? null : collectionHeaderMetadata, (i & 8) != 0 ? null : collectionPromoMetadata, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionSection copy$default(CollectionSection collectionSection, CollectionSectionType collectionSectionType, PostListMetadata postListMetadata, CollectionHeaderMetadata collectionHeaderMetadata, CollectionPromoMetadata collectionPromoMetadata, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            collectionSectionType = collectionSection.type;
        }
        if ((i & 2) != 0) {
            postListMetadata = collectionSection.post_list_metadata;
        }
        if ((i & 4) != 0) {
            collectionHeaderMetadata = collectionSection.collection_header_metadata;
        }
        if ((i & 8) != 0) {
            collectionPromoMetadata = collectionSection.promo_metadata;
        }
        if ((i & 16) != 0) {
            h21Var = collectionSection.unknownFields();
        }
        h21 h21Var2 = h21Var;
        CollectionHeaderMetadata collectionHeaderMetadata2 = collectionHeaderMetadata;
        return collectionSection.copy(collectionSectionType, postListMetadata, collectionHeaderMetadata2, collectionPromoMetadata, h21Var2);
    }

    public final CollectionSection copy(CollectionSectionType type, PostListMetadata post_list_metadata, CollectionHeaderMetadata collection_header_metadata, CollectionPromoMetadata promo_metadata, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionSection(type, post_list_metadata, collection_header_metadata, promo_metadata, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionSection)) {
            return false;
        }
        CollectionSection collectionSection = (CollectionSection) other;
        return g76.L(unknownFields(), collectionSection.unknownFields()) && this.type == collectionSection.type && g76.L(this.post_list_metadata, collectionSection.post_list_metadata) && g76.L(this.collection_header_metadata, collectionSection.collection_header_metadata) && g76.L(this.promo_metadata, collectionSection.promo_metadata);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        CollectionSectionType collectionSectionType = this.type;
        int iHashCode2 = (iHashCode + (collectionSectionType != null ? collectionSectionType.hashCode() : 0)) * 37;
        PostListMetadata postListMetadata = this.post_list_metadata;
        int iHashCode3 = (iHashCode2 + (postListMetadata != null ? postListMetadata.hashCode() : 0)) * 37;
        CollectionHeaderMetadata collectionHeaderMetadata = this.collection_header_metadata;
        int iHashCode4 = (iHashCode3 + (collectionHeaderMetadata != null ? collectionHeaderMetadata.hashCode() : 0)) * 37;
        CollectionPromoMetadata collectionPromoMetadata = this.promo_metadata;
        int iHashCode5 = iHashCode4 + (collectionPromoMetadata != null ? collectionPromoMetadata.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final zs1 newBuilder() {
        zs1 zs1Var = new zs1();
        zs1Var.a = this.type;
        zs1Var.b = this.post_list_metadata;
        zs1Var.c = this.collection_header_metadata;
        zs1Var.d = this.promo_metadata;
        zs1Var.addUnknownFields(unknownFields());
        return zs1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        CollectionSectionType collectionSectionType = this.type;
        if (collectionSectionType != null) {
            arrayList.add("type=" + collectionSectionType);
        }
        PostListMetadata postListMetadata = this.post_list_metadata;
        if (postListMetadata != null) {
            arrayList.add("post_list_metadata=" + postListMetadata);
        }
        CollectionHeaderMetadata collectionHeaderMetadata = this.collection_header_metadata;
        if (collectionHeaderMetadata != null) {
            arrayList.add("collection_header_metadata=" + collectionHeaderMetadata);
        }
        CollectionPromoMetadata collectionPromoMetadata = this.promo_metadata;
        if (collectionPromoMetadata != null) {
            arrayList.add("promo_metadata=" + collectionPromoMetadata);
        }
        return bu1.F0(arrayList, ", ", "CollectionSection{", "}", null, 56);
    }

    public CollectionSection() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionSection(CollectionSectionType collectionSectionType, PostListMetadata postListMetadata, CollectionHeaderMetadata collectionHeaderMetadata, CollectionPromoMetadata collectionPromoMetadata, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.type = collectionSectionType;
        this.post_list_metadata = postListMetadata;
        this.collection_header_metadata = collectionHeaderMetadata;
        this.promo_metadata = collectionPromoMetadata;
    }
}
