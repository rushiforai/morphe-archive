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
import defpackage.tt1;
import defpackage.ut1;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000f\u0018\u0000 #2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002$BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJS\u0010\u001b\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001dR\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u0012\u0004\b\u001f\u0010 R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u001c\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\t\u0010!\u0012\u0004\b\"\u0010 R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001d¨\u0006%"}, d2 = {"Lgen/model/CollectionUserRelationItem;", "Lcom/squareup/wire/AndroidMessage;", "Ltt1;", "", "collection_id", "Lgen/model/CollectionWithOwner;", "collection", "user_id", "Lgen/model/UserItem;", "user", "role", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/CollectionWithOwner;Ljava/lang/String;Lgen/model/UserItem;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ltt1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/CollectionWithOwner;Ljava/lang/String;Lgen/model/UserItem;Ljava/lang/String;Lh21;)Lgen/model/CollectionUserRelationItem;", "Ljava/lang/String;", "Lgen/model/CollectionWithOwner;", "getCollection$annotations", "()V", "Lgen/model/UserItem;", "getUser$annotations", "Companion", "ut1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionUserRelationItem extends AndroidMessage<CollectionUserRelationItem, tt1> {
    public static final ProtoAdapter<CollectionUserRelationItem> ADAPTER;
    public static final Parcelable.Creator<CollectionUserRelationItem> CREATOR;
    public static final ut1 Companion = new ut1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionWithOwner#ADAPTER", schemaIndex = 1, tag = 2)
    public final CollectionWithOwner collection;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String role;

    @WireField(adapter = "gen.model.UserItem#ADAPTER", schemaIndex = 3, tag = 4)
    public final UserItem user;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionUserRelationItem.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionUserRelationItem> protoAdapter = new ProtoAdapter<CollectionUserRelationItem>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionUserRelationItem$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionUserRelationItem decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                CollectionWithOwner collectionWithOwnerDecode = null;
                String strDecode2 = null;
                UserItem userItemDecode = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CollectionUserRelationItem(strDecode, collectionWithOwnerDecode, strDecode2, userItemDecode, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        collectionWithOwnerDecode = CollectionWithOwner.ADAPTER.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        userItemDecode = UserItem.ADAPTER.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionUserRelationItem value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
                CollectionWithOwner.ADAPTER.encodeWithTag(writer, 2, value.collection);
                protoAdapter2.encodeWithTag(writer, 3, value.user_id);
                UserItem.ADAPTER.encodeWithTag(writer, 4, value.user);
                protoAdapter2.encodeWithTag(writer, 5, value.role);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionUserRelationItem value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(5, value.role) + UserItem.ADAPTER.encodedSizeWithTag(4, value.user) + protoAdapter2.encodedSizeWithTag(3, value.user_id) + CollectionWithOwner.ADAPTER.encodedSizeWithTag(2, value.collection) + protoAdapter2.encodedSizeWithTag(1, value.collection_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionUserRelationItem redact(CollectionUserRelationItem value) {
                value.getClass();
                CollectionWithOwner collectionWithOwner = value.collection;
                CollectionWithOwner collectionWithOwnerRedact = collectionWithOwner != null ? CollectionWithOwner.ADAPTER.redact(collectionWithOwner) : null;
                UserItem userItem = value.user;
                return CollectionUserRelationItem.copy$default(value, null, collectionWithOwnerRedact, null, userItem != null ? UserItem.ADAPTER.redact(userItem) : null, null, h21.d, 21, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionUserRelationItem value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 5, value.role);
                UserItem.ADAPTER.encodeWithTag(writer, 4, value.user);
                protoAdapter2.encodeWithTag(writer, 3, value.user_id);
                CollectionWithOwner.ADAPTER.encodeWithTag(writer, 2, value.collection);
                protoAdapter2.encodeWithTag(writer, 1, value.collection_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionUserRelationItem(String str, CollectionWithOwner collectionWithOwner, String str2, UserItem userItem, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : collectionWithOwner, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : userItem, (i & 16) != 0 ? null : str3, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CollectionUserRelationItem copy$default(CollectionUserRelationItem collectionUserRelationItem, String str, CollectionWithOwner collectionWithOwner, String str2, UserItem userItem, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = collectionUserRelationItem.collection_id;
        }
        if ((i & 2) != 0) {
            collectionWithOwner = collectionUserRelationItem.collection;
        }
        if ((i & 4) != 0) {
            str2 = collectionUserRelationItem.user_id;
        }
        if ((i & 8) != 0) {
            userItem = collectionUserRelationItem.user;
        }
        if ((i & 16) != 0) {
            str3 = collectionUserRelationItem.role;
        }
        if ((i & 32) != 0) {
            h21Var = collectionUserRelationItem.unknownFields();
        }
        String str4 = str3;
        h21 h21Var2 = h21Var;
        return collectionUserRelationItem.copy(str, collectionWithOwner, str2, userItem, str4, h21Var2);
    }

    public final CollectionUserRelationItem copy(String collection_id, CollectionWithOwner collection, String user_id, UserItem user, String role, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionUserRelationItem(collection_id, collection, user_id, user, role, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionUserRelationItem)) {
            return false;
        }
        CollectionUserRelationItem collectionUserRelationItem = (CollectionUserRelationItem) other;
        return g76.L(unknownFields(), collectionUserRelationItem.unknownFields()) && g76.L(this.collection_id, collectionUserRelationItem.collection_id) && g76.L(this.collection, collectionUserRelationItem.collection) && g76.L(this.user_id, collectionUserRelationItem.user_id) && g76.L(this.user, collectionUserRelationItem.user) && g76.L(this.role, collectionUserRelationItem.role);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.collection_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        CollectionWithOwner collectionWithOwner = this.collection;
        int iHashCode3 = (iHashCode2 + (collectionWithOwner != null ? collectionWithOwner.hashCode() : 0)) * 37;
        String str2 = this.user_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        UserItem userItem = this.user;
        int iHashCode5 = (iHashCode4 + (userItem != null ? userItem.hashCode() : 0)) * 37;
        String str3 = this.role;
        int iHashCode6 = iHashCode5 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode6;
        return iHashCode6;
    }

    @Override // com.squareup.wire.Message
    public final tt1 newBuilder() {
        tt1 tt1Var = new tt1();
        tt1Var.a = this.collection_id;
        tt1Var.b = this.collection;
        tt1Var.c = this.user_id;
        tt1Var.d = this.user;
        tt1Var.e = this.role;
        tt1Var.addUnknownFields(unknownFields());
        return tt1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.collection_id;
        if (str != null) {
            lv8.D(str, "collection_id=", arrayList);
        }
        CollectionWithOwner collectionWithOwner = this.collection;
        if (collectionWithOwner != null) {
            arrayList.add("collection=" + collectionWithOwner);
        }
        String str2 = this.user_id;
        if (str2 != null) {
            lv8.D(str2, "user_id=", arrayList);
        }
        UserItem userItem = this.user;
        if (userItem != null) {
            arrayList.add("user=" + userItem);
        }
        String str3 = this.role;
        if (str3 != null) {
            lv8.D(str3, "role=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CollectionUserRelationItem{", "}", null, 56);
    }

    public CollectionUserRelationItem() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionUserRelationItem(String str, CollectionWithOwner collectionWithOwner, String str2, UserItem userItem, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.collection_id = str;
        this.collection = collectionWithOwner;
        this.user_id = str2;
        this.user = userItem;
        this.role = str3;
    }

    public static /* synthetic */ void getCollection$annotations() {
    }

    public static /* synthetic */ void getUser$annotations() {
    }
}
