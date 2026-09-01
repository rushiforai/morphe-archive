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
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.p5;
import defpackage.q5;
import defpackage.wg6;
import gen.model.AuthInfo;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB\u0019\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J!\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018¨\u0006\u001b"}, d2 = {"Lgen/model/response/AcctCreateResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lp5;", "Lgen/model/AuthInfo;", "value_", "Lh21;", "unknownFields", "<init>", "(Lgen/model/AuthInfo;Lh21;)V", "newBuilder", "()Lp5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/AuthInfo;Lh21;)Lgen/model/response/AcctCreateResponse;", "Lgen/model/AuthInfo;", "Companion", "q5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AcctCreateResponse extends AndroidMessage<AcctCreateResponse, p5> {
    public static final ProtoAdapter<AcctCreateResponse> ADAPTER;
    public static final Parcelable.Creator<AcctCreateResponse> CREATOR;
    public static final q5 Companion = new q5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.AuthInfo#ADAPTER", declaredName = "value", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final AuthInfo value_;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AcctCreateResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AcctCreateResponse> protoAdapter = new ProtoAdapter<AcctCreateResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.AcctCreateResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AcctCreateResponse decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AuthInfo authInfoDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        break;
                    }
                    if (iNextTag == 1) {
                        authInfoDecode = AuthInfo.ADAPTER.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
                h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                AuthInfo authInfo = authInfoDecode;
                if (authInfo != null) {
                    return new AcctCreateResponse(authInfo, h21VarEndMessageAndGetUnknownFields);
                }
                Internal.missingRequiredFields(authInfoDecode, "value");
                throw null;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AcctCreateResponse value) {
                writer.getClass();
                value.getClass();
                AuthInfo.ADAPTER.encodeWithTag(writer, 1, value.value_);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AcctCreateResponse value) {
                value.getClass();
                return AuthInfo.ADAPTER.encodedSizeWithTag(1, value.value_) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AcctCreateResponse redact(AcctCreateResponse value) {
                value.getClass();
                return value.copy(AuthInfo.ADAPTER.redact(value.value_), h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AcctCreateResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                AuthInfo.ADAPTER.encodeWithTag(writer, 1, value.value_);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AcctCreateResponse(AuthInfo authInfo, h21 h21Var) {
        super(ADAPTER, h21Var);
        authInfo.getClass();
        h21Var.getClass();
        this.value_ = authInfo;
    }

    public static /* synthetic */ AcctCreateResponse copy$default(AcctCreateResponse acctCreateResponse, AuthInfo authInfo, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            authInfo = acctCreateResponse.value_;
        }
        if ((i & 2) != 0) {
            h21Var = acctCreateResponse.unknownFields();
        }
        return acctCreateResponse.copy(authInfo, h21Var);
    }

    public final AcctCreateResponse copy(AuthInfo value_, h21 unknownFields) {
        value_.getClass();
        unknownFields.getClass();
        return new AcctCreateResponse(value_, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AcctCreateResponse)) {
            return false;
        }
        AcctCreateResponse acctCreateResponse = (AcctCreateResponse) other;
        return g76.L(unknownFields(), acctCreateResponse.unknownFields()) && g76.L(this.value_, acctCreateResponse.value_);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.value_.hashCode() + (unknownFields().hashCode() * 37);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final p5 newBuilder() {
        p5 p5Var = new p5();
        p5Var.a = this.value_;
        p5Var.addUnknownFields(unknownFields());
        return p5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        arrayList.add("value_=" + this.value_);
        return bu1.F0(arrayList, ", ", "AcctCreateResponse{", "}", null, 56);
    }

    public /* synthetic */ AcctCreateResponse(AuthInfo authInfo, h21 h21Var, int i, gy2 gy2Var) {
        this(authInfo, (i & 2) != 0 ? h21.d : h21Var);
    }
}
