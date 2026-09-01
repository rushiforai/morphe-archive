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
import defpackage.v75;
import defpackage.w75;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\n\b\u0007\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\r\u001a\u00020\u00032\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J#\u0010\u0015\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0015\u0010\u0016R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u0012\u0004\b\u0018\u0010\u0019¨\u0006\u001c"}, d2 = {"Lgen/model/response/GenericActionResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lv75;", "", "success", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lv75;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Boolean;Lh21;)Lgen/model/response/GenericActionResponse;", "Ljava/lang/Boolean;", "getSuccess$annotations", "()V", "Companion", "w75", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class GenericActionResponse extends AndroidMessage<GenericActionResponse, v75> {
    public static final ProtoAdapter<GenericActionResponse> ADAPTER;
    public static final Parcelable.Creator<GenericActionResponse> CREATOR;
    public static final w75 Companion = new w75();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 0, tag = 1)
    public final Boolean success;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(GenericActionResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<GenericActionResponse> protoAdapter = new ProtoAdapter<GenericActionResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.GenericActionResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final GenericActionResponse decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new GenericActionResponse(boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, GenericActionResponse value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.BOOL.encodeWithTag(writer, 1, value.success);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(GenericActionResponse value) {
                value.getClass();
                return ProtoAdapter.BOOL.encodedSizeWithTag(1, value.success) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final GenericActionResponse redact(GenericActionResponse value) {
                value.getClass();
                return GenericActionResponse.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, GenericActionResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 1, value.success);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ GenericActionResponse(Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ GenericActionResponse copy$default(GenericActionResponse genericActionResponse, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            bool = genericActionResponse.success;
        }
        if ((i & 2) != 0) {
            h21Var = genericActionResponse.unknownFields();
        }
        return genericActionResponse.copy(bool, h21Var);
    }

    public final GenericActionResponse copy(Boolean success, h21 unknownFields) {
        unknownFields.getClass();
        return new GenericActionResponse(success, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof GenericActionResponse)) {
            return false;
        }
        GenericActionResponse genericActionResponse = (GenericActionResponse) other;
        return g76.L(unknownFields(), genericActionResponse.unknownFields()) && g76.L(this.success, genericActionResponse.success);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Boolean bool = this.success;
        int i2 = iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0);
        this.hashCode = i2;
        return i2;
    }

    @Override // com.squareup.wire.Message
    public final v75 newBuilder() {
        v75 v75Var = new v75();
        v75Var.a = this.success;
        v75Var.addUnknownFields(unknownFields());
        return v75Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Boolean bool = this.success;
        if (bool != null) {
            lv8.A("success=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "GenericActionResponse{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public GenericActionResponse() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public GenericActionResponse(Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.success = bool;
    }

    public static /* synthetic */ void getSuccess$annotations() {
    }
}
