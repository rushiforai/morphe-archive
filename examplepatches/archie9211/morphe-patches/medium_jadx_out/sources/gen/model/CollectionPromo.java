package gen.model;

import android.os.Parcelable;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
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
import defpackage.ts1;
import defpackage.us1;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJS\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001f¨\u0006\""}, d2 = {"Lgen/model/CollectionPromo;", "Lcom/squareup/wire/AndroidMessage;", "Lts1;", "", "promo_id", "collection_id", "", "created_at", "deleted_at", "Lgen/model/CollectionPromoLinkWithContent;", "link_with_content_item", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/CollectionPromoLinkWithContent;Lh21;)V", "newBuilder", "()Lts1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/CollectionPromoLinkWithContent;Lh21;)Lgen/model/CollectionPromo;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/CollectionPromoLinkWithContent;", "Companion", "us1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionPromo extends AndroidMessage<CollectionPromo, ts1> {
    public static final ProtoAdapter<CollectionPromo> ADAPTER;
    public static final Parcelable.Creator<CollectionPromo> CREATOR;
    public static final us1 Companion = new us1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long deleted_at;

    @WireField(adapter = "gen.model.CollectionPromoLinkWithContent#ADAPTER", oneofName = "item_type", schemaIndex = 4, tag = 5)
    public final CollectionPromoLinkWithContent link_with_content_item;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String promo_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionPromo.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionPromo> protoAdapter = new ProtoAdapter<CollectionPromo>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionPromo$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromo decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                CollectionPromoLinkWithContent collectionPromoLinkWithContentDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionPromo(strDecode, strDecode2, lDecode, lDecode2, collectionPromoLinkWithContentDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    } else if (iNextTag == 4) {
                        lDecode2 = ProtoAdapter.INT64.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        collectionPromoLinkWithContentDecode = CollectionPromoLinkWithContent.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionPromo value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.promo_id);
                protoAdapter2.encodeWithTag(writer, 2, value.collection_id);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.created_at);
                protoAdapter3.encodeWithTag(writer, 4, value.deleted_at);
                CollectionPromoLinkWithContent.ADAPTER.encodeWithTag(writer, 5, value.link_with_content_item);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionPromo value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.collection_id) + protoAdapter2.encodedSizeWithTag(1, value.promo_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                return CollectionPromoLinkWithContent.ADAPTER.encodedSizeWithTag(5, value.link_with_content_item) + protoAdapter3.encodedSizeWithTag(4, value.deleted_at) + protoAdapter3.encodedSizeWithTag(3, value.created_at) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionPromo redact(CollectionPromo value) {
                value.getClass();
                CollectionPromoLinkWithContent collectionPromoLinkWithContent = value.link_with_content_item;
                return CollectionPromo.copy$default(value, null, null, null, null, collectionPromoLinkWithContent != null ? CollectionPromoLinkWithContent.ADAPTER.redact(collectionPromoLinkWithContent) : null, h21.d, 15, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionPromo value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CollectionPromoLinkWithContent.ADAPTER.encodeWithTag(writer, 5, value.link_with_content_item);
                ProtoAdapter<Long> protoAdapter2 = ProtoAdapter.INT64;
                protoAdapter2.encodeWithTag(writer, 4, value.deleted_at);
                protoAdapter2.encodeWithTag(writer, 3, value.created_at);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 2, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 1, value.promo_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionPromo(String str, String str2, Long l, Long l2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : l, (i & 8) != 0 ? null : l2, (i & 16) != 0 ? null : collectionPromoLinkWithContent, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionPromo copy$default(CollectionPromo collectionPromo, String str, String str2, Long l, Long l2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionPromo.promo_id;
        }
        if ((i & 2) != 0) {
            str2 = collectionPromo.collection_id;
        }
        if ((i & 4) != 0) {
            l = collectionPromo.created_at;
        }
        if ((i & 8) != 0) {
            l2 = collectionPromo.deleted_at;
        }
        if ((i & 16) != 0) {
            collectionPromoLinkWithContent = collectionPromo.link_with_content_item;
        }
        if ((i & 32) != 0) {
            h21Var = collectionPromo.unknownFields();
        }
        CollectionPromoLinkWithContent collectionPromoLinkWithContent2 = collectionPromoLinkWithContent;
        h21 h21Var2 = h21Var;
        return collectionPromo.copy(str, str2, l, l2, collectionPromoLinkWithContent2, h21Var2);
    }

    public final CollectionPromo copy(String promo_id, String collection_id, Long created_at, Long deleted_at, CollectionPromoLinkWithContent link_with_content_item, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionPromo(promo_id, collection_id, created_at, deleted_at, link_with_content_item, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionPromo)) {
            return false;
        }
        CollectionPromo collectionPromo = (CollectionPromo) other;
        return g76.L(unknownFields(), collectionPromo.unknownFields()) && g76.L(this.promo_id, collectionPromo.promo_id) && g76.L(this.collection_id, collectionPromo.collection_id) && g76.L(this.created_at, collectionPromo.created_at) && g76.L(this.deleted_at, collectionPromo.deleted_at) && g76.L(this.link_with_content_item, collectionPromo.link_with_content_item);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.promo_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.collection_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode3 + i) * 37;
        Long l2 = this.deleted_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i5 = (i4 + i2) * 37;
        CollectionPromoLinkWithContent collectionPromoLinkWithContent = this.link_with_content_item;
        int iHashCode4 = i5 + (collectionPromoLinkWithContent != null ? collectionPromoLinkWithContent.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final ts1 newBuilder() {
        ts1 ts1Var = new ts1();
        ts1Var.a = this.promo_id;
        ts1Var.b = this.collection_id;
        ts1Var.c = this.created_at;
        ts1Var.d = this.deleted_at;
        ts1Var.e = this.link_with_content_item;
        ts1Var.addUnknownFields(unknownFields());
        return ts1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.promo_id;
        if (str != null) {
            lv8.D(str, "promo_id=", arrayList);
        }
        String str2 = this.collection_id;
        if (str2 != null) {
            lv8.D(str2, ZVsviyDAr.KiMOhAEtFwjvHv, arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.deleted_at;
        if (l2 != null) {
            y30.A("deleted_at=", l2, arrayList);
        }
        CollectionPromoLinkWithContent collectionPromoLinkWithContent = this.link_with_content_item;
        if (collectionPromoLinkWithContent != null) {
            arrayList.add("link_with_content_item=" + collectionPromoLinkWithContent);
        }
        return bu1.F0(arrayList, ", ", "CollectionPromo{", "}", null, 56);
    }

    public CollectionPromo() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionPromo(String str, String str2, Long l, Long l2, CollectionPromoLinkWithContent collectionPromoLinkWithContent, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.promo_id = str;
        this.collection_id = str2;
        this.created_at = l;
        this.deleted_at = l2;
        this.link_with_content_item = collectionPromoLinkWithContent;
    }
}
