package gen.model.response;

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
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.te4;
import defpackage.ue4;
import defpackage.wg6;
import defpackage.wgd;
import gen.model.CollectionUserRelationItem;
import gen.model.User;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB1\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J7\u0010\u0019\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001bR\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lgen/model/response/FetchUsersForTypeaheadResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lte4;", "", "Lgen/model/User;", "value_", "Lgen/model/CollectionUserRelationItem;", "collection_user_relation_items", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Ljava/util/List;Lh21;)V", "newBuilder", "()Lte4;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Ljava/util/List;Lh21;)Lgen/model/response/FetchUsersForTypeaheadResponse;", "Ljava/util/List;", "Companion", "ue4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FetchUsersForTypeaheadResponse extends AndroidMessage<FetchUsersForTypeaheadResponse, te4> {
    public static final ProtoAdapter<FetchUsersForTypeaheadResponse> ADAPTER;
    public static final Parcelable.Creator<FetchUsersForTypeaheadResponse> CREATOR;
    public static final ue4 Companion = new ue4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.CollectionUserRelationItem#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<CollectionUserRelationItem> collection_user_relation_items;

    @WireField(adapter = "gen.model.User#ADAPTER", declaredName = "value", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<User> value_;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FetchUsersForTypeaheadResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<FetchUsersForTypeaheadResponse> protoAdapter = new ProtoAdapter<FetchUsersForTypeaheadResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.FetchUsersForTypeaheadResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final FetchUsersForTypeaheadResponse decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FetchUsersForTypeaheadResponse(arrayListF, arrayList, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(User.ADAPTER.decode(reader));
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        arrayList.add(CollectionUserRelationItem.ADAPTER.decode(reader));
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FetchUsersForTypeaheadResponse value) {
                writer.getClass();
                value.getClass();
                User.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.value_);
                CollectionUserRelationItem.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.collection_user_relation_items);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FetchUsersForTypeaheadResponse value) {
                value.getClass();
                return CollectionUserRelationItem.ADAPTER.asRepeated().encodedSizeWithTag(2, value.collection_user_relation_items) + User.ADAPTER.asRepeated().encodedSizeWithTag(1, value.value_) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FetchUsersForTypeaheadResponse redact(FetchUsersForTypeaheadResponse value) {
                value.getClass();
                return value.copy(Internal.m97redactElements(value.value_, User.ADAPTER), Internal.m97redactElements(value.collection_user_relation_items, CollectionUserRelationItem.ADAPTER), h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FetchUsersForTypeaheadResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                CollectionUserRelationItem.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.collection_user_relation_items);
                User.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.value_);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FetchUsersForTypeaheadResponse(List<User> list, List<CollectionUserRelationItem> list2, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        h21Var.getClass();
        this.value_ = Internal.immutableCopyOf("value_", list);
        this.collection_user_relation_items = Internal.immutableCopyOf("collection_user_relation_items", list2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ FetchUsersForTypeaheadResponse copy$default(FetchUsersForTypeaheadResponse fetchUsersForTypeaheadResponse, List list, List list2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = fetchUsersForTypeaheadResponse.value_;
        }
        if ((i & 2) != 0) {
            list2 = fetchUsersForTypeaheadResponse.collection_user_relation_items;
        }
        if ((i & 4) != 0) {
            h21Var = fetchUsersForTypeaheadResponse.unknownFields();
        }
        return fetchUsersForTypeaheadResponse.copy(list, list2, h21Var);
    }

    public final FetchUsersForTypeaheadResponse copy(List<User> value_, List<CollectionUserRelationItem> collection_user_relation_items, h21 unknownFields) {
        value_.getClass();
        collection_user_relation_items.getClass();
        unknownFields.getClass();
        return new FetchUsersForTypeaheadResponse(value_, collection_user_relation_items, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FetchUsersForTypeaheadResponse)) {
            return false;
        }
        FetchUsersForTypeaheadResponse fetchUsersForTypeaheadResponse = (FetchUsersForTypeaheadResponse) other;
        return g76.L(unknownFields(), fetchUsersForTypeaheadResponse.unknownFields()) && g76.L(this.value_, fetchUsersForTypeaheadResponse.value_) && g76.L(this.collection_user_relation_items, fetchUsersForTypeaheadResponse.collection_user_relation_items);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.collection_user_relation_items.hashCode() + wgd.p(unknownFields().hashCode() * 37, 37, this.value_);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final te4 newBuilder() {
        te4 te4Var = new te4();
        ey3 ey3Var = ey3.a;
        te4Var.a = ey3Var;
        te4Var.b = ey3Var;
        te4Var.a = this.value_;
        te4Var.b = this.collection_user_relation_items;
        te4Var.addUnknownFields(unknownFields());
        return te4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.value_.isEmpty()) {
            b09.J("value_=", this.value_, arrayList);
        }
        if (!this.collection_user_relation_items.isEmpty()) {
            b09.J("collection_user_relation_items=", this.collection_user_relation_items, arrayList);
        }
        return bu1.F0(arrayList, eoLmc.mxTE, "FetchUsersForTypeaheadResponse{", "}", null, 56);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ FetchUsersForTypeaheadResponse(List list, List list2, h21 h21Var, int i, gy2 gy2Var) {
        int i2 = i & 1;
        ey3 ey3Var = ey3.a;
        this(i2 != 0 ? ey3Var : list, (i & 2) != 0 ? ey3Var : list2, (i & 4) != 0 ? h21.d : h21Var);
    }

    public FetchUsersForTypeaheadResponse() {
        this(null, null, null, 7, null);
    }
}
