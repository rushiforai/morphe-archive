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
import com.squareup.wire.internal.Internal;
import defpackage.ay0;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.hs1;
import defpackage.is1;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BY\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ_\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001eR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001eR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001eR\u0016\u0010\n\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lgen/model/CollectionNavItem;", "Lcom/squareup/wire/AndroidMessage;", "Lhs1;", "Lgen/model/CollectionNavItemType;", "type", "", "title", "url", "tag_slug", "post_id", "topic_id", "Lh21;", "unknownFields", "<init>", "(Lgen/model/CollectionNavItemType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lhs1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/CollectionNavItemType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/CollectionNavItem;", "Lgen/model/CollectionNavItemType;", "Ljava/lang/String;", "Companion", "is1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionNavItem extends AndroidMessage<CollectionNavItem, hs1> {
    public static final ProtoAdapter<CollectionNavItem> ADAPTER;
    public static final Parcelable.Creator<CollectionNavItem> CREATOR;
    public static final is1 Companion = new is1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", oneofName = "source", schemaIndex = 4, tag = 4)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", oneofName = "source", schemaIndex = 3, tag = 3)
    public final String tag_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", oneofName = "source", schemaIndex = 5, tag = 6)
    public final String topic_id;

    @WireField(adapter = "gen.model.CollectionNavItemType#ADAPTER", schemaIndex = 0, tag = 1)
    public final CollectionNavItemType type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 5)
    public final String url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionNavItem.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionNavItem> protoAdapter = new ProtoAdapter<CollectionNavItem>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionNavItem$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionNavItem decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                CollectionNavItemType collectionNavItemTypeDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionNavItem(collectionNavItemTypeDecode, strDecode, strDecode2, strDecode3, strDecode4, strDecode5, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            try {
                                collectionNavItemTypeDecode = CollectionNavItemType.ADAPTER.decode(reader);
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                            }
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 4:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 5:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            break;
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionNavItem value) {
                writer.getClass();
                value.getClass();
                CollectionNavItemType.ADAPTER.encodeWithTag(writer, 1, value.type);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.title);
                protoAdapter2.encodeWithTag(writer, 5, value.url);
                protoAdapter2.encodeWithTag(writer, 3, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 4, value.post_id);
                protoAdapter2.encodeWithTag(writer, 6, value.topic_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionNavItem value) {
                value.getClass();
                int iEncodedSizeWithTag = CollectionNavItemType.ADAPTER.encodedSizeWithTag(1, value.type) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(6, value.topic_id) + protoAdapter2.encodedSizeWithTag(4, value.post_id) + protoAdapter2.encodedSizeWithTag(3, value.tag_slug) + protoAdapter2.encodedSizeWithTag(5, value.url) + protoAdapter2.encodedSizeWithTag(2, value.title) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionNavItem redact(CollectionNavItem value) {
                value.getClass();
                return CollectionNavItem.copy$default(value, null, null, null, null, null, null, h21.d, 63, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionNavItem value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 6, value.topic_id);
                protoAdapter2.encodeWithTag(writer, 4, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.tag_slug);
                protoAdapter2.encodeWithTag(writer, 5, value.url);
                protoAdapter2.encodeWithTag(writer, 2, value.title);
                CollectionNavItemType.ADAPTER.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionNavItem(CollectionNavItemType collectionNavItemType, String str, String str2, String str3, String str4, String str5, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : collectionNavItemType, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionNavItem copy$default(CollectionNavItem collectionNavItem, CollectionNavItemType collectionNavItemType, String str, String str2, String str3, String str4, String str5, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            collectionNavItemType = collectionNavItem.type;
        }
        if ((i & 2) != 0) {
            str = collectionNavItem.title;
        }
        if ((i & 4) != 0) {
            str2 = collectionNavItem.url;
        }
        if ((i & 8) != 0) {
            str3 = collectionNavItem.tag_slug;
        }
        if ((i & 16) != 0) {
            str4 = collectionNavItem.post_id;
        }
        if ((i & 32) != 0) {
            str5 = collectionNavItem.topic_id;
        }
        if ((i & 64) != 0) {
            h21Var = collectionNavItem.unknownFields();
        }
        String str6 = str5;
        h21 h21Var2 = h21Var;
        String str7 = str4;
        String str8 = str2;
        return collectionNavItem.copy(collectionNavItemType, str, str8, str3, str7, str6, h21Var2);
    }

    public final CollectionNavItem copy(CollectionNavItemType type, String title, String url, String tag_slug, String post_id, String topic_id, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionNavItem(type, title, url, tag_slug, post_id, topic_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionNavItem)) {
            return false;
        }
        CollectionNavItem collectionNavItem = (CollectionNavItem) other;
        return g76.L(unknownFields(), collectionNavItem.unknownFields()) && this.type == collectionNavItem.type && g76.L(this.title, collectionNavItem.title) && g76.L(this.url, collectionNavItem.url) && g76.L(this.tag_slug, collectionNavItem.tag_slug) && g76.L(this.post_id, collectionNavItem.post_id) && g76.L(this.topic_id, collectionNavItem.topic_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        CollectionNavItemType collectionNavItemType = this.type;
        int iHashCode2 = (iHashCode + (collectionNavItemType != null ? collectionNavItemType.hashCode() : 0)) * 37;
        String str = this.title;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.url;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.tag_slug;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.post_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.topic_id;
        int iHashCode7 = iHashCode6 + (str5 != null ? str5.hashCode() : 0);
        this.hashCode = iHashCode7;
        return iHashCode7;
    }

    @Override // com.squareup.wire.Message
    public final hs1 newBuilder() {
        hs1 hs1Var = new hs1();
        hs1Var.a = this.type;
        hs1Var.b = this.title;
        hs1Var.c = this.url;
        hs1Var.d = this.tag_slug;
        hs1Var.e = this.post_id;
        hs1Var.f = this.topic_id;
        hs1Var.addUnknownFields(unknownFields());
        return hs1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        CollectionNavItemType collectionNavItemType = this.type;
        if (collectionNavItemType != null) {
            arrayList.add("type=" + collectionNavItemType);
        }
        String str = this.title;
        if (str != null) {
            lv8.D(str, "title=", arrayList);
        }
        String str2 = this.url;
        if (str2 != null) {
            lv8.D(str2, "url=", arrayList);
        }
        String str3 = this.tag_slug;
        if (str3 != null) {
            lv8.D(str3, "tag_slug=", arrayList);
        }
        String str4 = this.post_id;
        if (str4 != null) {
            lv8.D(str4, "post_id=", arrayList);
        }
        String str5 = this.topic_id;
        if (str5 != null) {
            lv8.D(str5, "topic_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionNavItem{", "}", null, 56);
    }

    public CollectionNavItem() {
        this(null, null, null, null, null, null, null, 127, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionNavItem(CollectionNavItemType collectionNavItemType, String str, String str2, String str3, String str4, String str5, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.type = collectionNavItemType;
        this.title = str;
        this.url = str2;
        this.tag_slug = str3;
        this.post_id = str4;
        this.topic_id = str5;
        if (Internal.countNonNull(str3, str4, str5) <= 1) {
            return;
        }
        ay0.e("At most one of tag_slug, post_id, topic_id may be non-null");
        throw null;
    }
}
