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
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.v9;
import defpackage.w9;
import defpackage.wg6;
import gen.model.Membership;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0010\u001a\u00020\u00032\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u0012\u0004\b\u001b\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001a¨\u0006 "}, d2 = {"Lgen/model/response/AddMembershipResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lv9;", "", "success", "Lgen/model/Membership;", "membership", "is_new_user", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Boolean;Lgen/model/Membership;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lv9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Boolean;Lgen/model/Membership;Ljava/lang/Boolean;Lh21;)Lgen/model/response/AddMembershipResponse;", "Ljava/lang/Boolean;", "getSuccess$annotations", "()V", "Lgen/model/Membership;", "Companion", "w9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AddMembershipResponse extends AndroidMessage<AddMembershipResponse, v9> {
    public static final ProtoAdapter<AddMembershipResponse> ADAPTER;
    public static final Parcelable.Creator<AddMembershipResponse> CREATOR;
    public static final w9 Companion = new w9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean is_new_user;

    @WireField(adapter = "gen.model.Membership#ADAPTER", schemaIndex = 1, tag = 2)
    public final Membership membership;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 0, tag = 1)
    public final Boolean success;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AddMembershipResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AddMembershipResponse> protoAdapter = new ProtoAdapter<AddMembershipResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.AddMembershipResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AddMembershipResponse decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Boolean boolDecode = null;
                Membership membershipDecode = null;
                Boolean boolDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AddMembershipResponse(boolDecode, membershipDecode, boolDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag == 2) {
                        membershipDecode = Membership.ADAPTER.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AddMembershipResponse value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 1, value.success);
                Membership.ADAPTER.encodeWithTag(writer, 2, value.membership);
                protoAdapter2.encodeWithTag(writer, 3, value.is_new_user);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AddMembershipResponse value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                return protoAdapter2.encodedSizeWithTag(3, value.is_new_user) + Membership.ADAPTER.encodedSizeWithTag(2, value.membership) + protoAdapter2.encodedSizeWithTag(1, value.success) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AddMembershipResponse redact(AddMembershipResponse value) {
                value.getClass();
                Membership membership = value.membership;
                return AddMembershipResponse.copy$default(value, null, membership != null ? Membership.ADAPTER.redact(membership) : null, null, h21.d, 5, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AddMembershipResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Boolean> protoAdapter2 = ProtoAdapter.BOOL;
                protoAdapter2.encodeWithTag(writer, 3, value.is_new_user);
                Membership.ADAPTER.encodeWithTag(writer, 2, value.membership);
                protoAdapter2.encodeWithTag(writer, 1, value.success);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AddMembershipResponse(Boolean bool, Membership membership, Boolean bool2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? null : membership, (i & 4) != 0 ? null : bool2, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AddMembershipResponse copy$default(AddMembershipResponse addMembershipResponse, Boolean bool, Membership membership, Boolean bool2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            bool = addMembershipResponse.success;
        }
        if ((i & 2) != 0) {
            membership = addMembershipResponse.membership;
        }
        if ((i & 4) != 0) {
            bool2 = addMembershipResponse.is_new_user;
        }
        if ((i & 8) != 0) {
            h21Var = addMembershipResponse.unknownFields();
        }
        return addMembershipResponse.copy(bool, membership, bool2, h21Var);
    }

    public final AddMembershipResponse copy(Boolean success, Membership membership, Boolean is_new_user, h21 unknownFields) {
        unknownFields.getClass();
        return new AddMembershipResponse(success, membership, is_new_user, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AddMembershipResponse)) {
            return false;
        }
        AddMembershipResponse addMembershipResponse = (AddMembershipResponse) other;
        return g76.L(unknownFields(), addMembershipResponse.unknownFields()) && g76.L(this.success, addMembershipResponse.success) && g76.L(this.membership, addMembershipResponse.membership) && g76.L(this.is_new_user, addMembershipResponse.is_new_user);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Boolean bool = this.success;
        int i2 = 0;
        int i3 = (iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Membership membership = this.membership;
        int iHashCode2 = (i3 + (membership != null ? membership.hashCode() : 0)) * 37;
        Boolean bool2 = this.is_new_user;
        if (bool2 != null) {
            i2 = bool2.booleanValue() ? 1231 : 1237;
        }
        int i4 = iHashCode2 + i2;
        this.hashCode = i4;
        return i4;
    }

    @Override // com.squareup.wire.Message
    public final v9 newBuilder() {
        v9 v9Var = new v9();
        v9Var.a = this.success;
        v9Var.b = this.membership;
        v9Var.c = this.is_new_user;
        v9Var.addUnknownFields(unknownFields());
        return v9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Boolean bool = this.success;
        if (bool != null) {
            lv8.A("success=", bool, arrayList);
        }
        Membership membership = this.membership;
        if (membership != null) {
            arrayList.add("membership=" + membership);
        }
        Boolean bool2 = this.is_new_user;
        if (bool2 != null) {
            lv8.A("is_new_user=", bool2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "AddMembershipResponse{", "}", null, 56);
    }

    public AddMembershipResponse() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AddMembershipResponse(Boolean bool, Membership membership, Boolean bool2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.success = bool;
        this.membership = membership;
        this.is_new_user = bool2;
    }

    public static /* synthetic */ void getSuccess$annotations() {
    }
}
