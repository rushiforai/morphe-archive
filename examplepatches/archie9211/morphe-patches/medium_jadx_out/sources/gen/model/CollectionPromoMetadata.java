package gen.model;

import android.os.Parcelable;
import com.medium.android.data.catalog.KnyB.uvlZTF;
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
import defpackage.wg6;
import defpackage.xs1;
import defpackage.ys1;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JG\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001cR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001e¨\u0006!"}, d2 = {"Lgen/model/CollectionPromoMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lxs1;", "", "section_header", "promo_id", "Lgen/model/CollectionPromoLinkWithContent;", "link_with_content", "Lgen/model/CollectionPromo;", "promo", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/CollectionPromoLinkWithContent;Lgen/model/CollectionPromo;Lh21;)V", "newBuilder", "()Lxs1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/CollectionPromoLinkWithContent;Lgen/model/CollectionPromo;Lh21;)Lgen/model/CollectionPromoMetadata;", "Ljava/lang/String;", "Lgen/model/CollectionPromoLinkWithContent;", "Lgen/model/CollectionPromo;", "Companion", "ys1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionPromoMetadata extends AndroidMessage<CollectionPromoMetadata, xs1> {
    public static final ProtoAdapter<CollectionPromoMetadata> ADAPTER;
    public static final Parcelable.Creator<CollectionPromoMetadata> CREATOR;
    public static final ys1 Companion = new ys1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionPromoLinkWithContent#ADAPTER", schemaIndex = 2, tag = 3)
    public final CollectionPromoLinkWithContent link_with_content;

    @WireField(adapter = "gen.model.CollectionPromo#ADAPTER", schemaIndex = 3, tag = 4)
    public final CollectionPromo promo;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String promo_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String section_header;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionPromoMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionPromoMetadata> protoAdapter = new ProtoAdapter<CollectionPromoMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionPromoMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromoMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                CollectionPromoLinkWithContent collectionPromoLinkWithContentDecode = null;
                CollectionPromo collectionPromoDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionPromoMetadata(strDecode, strDecode2, collectionPromoLinkWithContentDecode, collectionPromoDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        collectionPromoLinkWithContentDecode = CollectionPromoLinkWithContent.ADAPTER.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        collectionPromoDecode = CollectionPromo.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionPromoMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.section_header);
                protoAdapter2.encodeWithTag(writer, 2, value.promo_id);
                CollectionPromoLinkWithContent.ADAPTER.encodeWithTag(writer, 3, value.link_with_content);
                CollectionPromo.ADAPTER.encodeWithTag(writer, 4, value.promo);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionPromoMetadata value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return CollectionPromo.ADAPTER.encodedSizeWithTag(4, value.promo) + CollectionPromoLinkWithContent.ADAPTER.encodedSizeWithTag(3, value.link_with_content) + protoAdapter2.encodedSizeWithTag(2, value.promo_id) + protoAdapter2.encodedSizeWithTag(1, value.section_header) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromoMetadata redact(CollectionPromoMetadata value) {
                value.getClass();
                CollectionPromoLinkWithContent collectionPromoLinkWithContent = value.link_with_content;
                CollectionPromoLinkWithContent collectionPromoLinkWithContentRedact = collectionPromoLinkWithContent != null ? CollectionPromoLinkWithContent.ADAPTER.redact(collectionPromoLinkWithContent) : null;
                CollectionPromo collectionPromo = value.promo;
                return CollectionPromoMetadata.copy$default(value, null, null, collectionPromoLinkWithContentRedact, collectionPromo != null ? CollectionPromo.ADAPTER.redact(collectionPromo) : null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionPromoMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CollectionPromo.ADAPTER.encodeWithTag(writer, 4, value.promo);
                CollectionPromoLinkWithContent.ADAPTER.encodeWithTag(writer, 3, value.link_with_content);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.promo_id);
                protoAdapter2.encodeWithTag(writer, 1, value.section_header);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionPromoMetadata(String str, String str2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, CollectionPromo collectionPromo, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : collectionPromoLinkWithContent, (i & 8) != 0 ? null : collectionPromo, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionPromoMetadata copy$default(CollectionPromoMetadata collectionPromoMetadata, String str, String str2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, CollectionPromo collectionPromo, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionPromoMetadata.section_header;
        }
        if ((i & 2) != 0) {
            str2 = collectionPromoMetadata.promo_id;
        }
        if ((i & 4) != 0) {
            collectionPromoLinkWithContent = collectionPromoMetadata.link_with_content;
        }
        if ((i & 8) != 0) {
            collectionPromo = collectionPromoMetadata.promo;
        }
        if ((i & 16) != 0) {
            h21Var = collectionPromoMetadata.unknownFields();
        }
        h21 h21Var2 = h21Var;
        CollectionPromoLinkWithContent collectionPromoLinkWithContent2 = collectionPromoLinkWithContent;
        return collectionPromoMetadata.copy(str, str2, collectionPromoLinkWithContent2, collectionPromo, h21Var2);
    }

    public final CollectionPromoMetadata copy(String section_header, String promo_id, CollectionPromoLinkWithContent link_with_content, CollectionPromo promo, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionPromoMetadata(section_header, promo_id, link_with_content, promo, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionPromoMetadata)) {
            return false;
        }
        CollectionPromoMetadata collectionPromoMetadata = (CollectionPromoMetadata) other;
        return g76.L(unknownFields(), collectionPromoMetadata.unknownFields()) && g76.L(this.section_header, collectionPromoMetadata.section_header) && g76.L(this.promo_id, collectionPromoMetadata.promo_id) && g76.L(this.link_with_content, collectionPromoMetadata.link_with_content) && g76.L(this.promo, collectionPromoMetadata.promo);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.section_header;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.promo_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        CollectionPromoLinkWithContent collectionPromoLinkWithContent = this.link_with_content;
        int iHashCode4 = (iHashCode3 + (collectionPromoLinkWithContent != null ? collectionPromoLinkWithContent.hashCode() : 0)) * 37;
        CollectionPromo collectionPromo = this.promo;
        int iHashCode5 = iHashCode4 + (collectionPromo != null ? collectionPromo.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final xs1 newBuilder() {
        xs1 xs1Var = new xs1();
        xs1Var.a = this.section_header;
        xs1Var.b = this.promo_id;
        xs1Var.c = this.link_with_content;
        xs1Var.d = this.promo;
        xs1Var.addUnknownFields(unknownFields());
        return xs1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.section_header;
        if (str != null) {
            lv8.D(str, "section_header=", arrayList);
        }
        String str2 = this.promo_id;
        if (str2 != null) {
            lv8.D(str2, "promo_id=", arrayList);
        }
        CollectionPromoLinkWithContent collectionPromoLinkWithContent = this.link_with_content;
        if (collectionPromoLinkWithContent != null) {
            arrayList.add("link_with_content=" + collectionPromoLinkWithContent);
        }
        CollectionPromo collectionPromo = this.promo;
        if (collectionPromo != null) {
            arrayList.add("promo=" + collectionPromo);
        }
        return bu1.F0(arrayList, ", ", "CollectionPromoMetadata{", uvlZTF.zpDDjAXwV, null, 56);
    }

    public CollectionPromoMetadata() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionPromoMetadata(String str, String str2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, CollectionPromo collectionPromo, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.section_header = str;
        this.promo_id = str2;
        this.link_with_content = collectionPromoLinkWithContent;
        this.promo = collectionPromo;
    }
}
