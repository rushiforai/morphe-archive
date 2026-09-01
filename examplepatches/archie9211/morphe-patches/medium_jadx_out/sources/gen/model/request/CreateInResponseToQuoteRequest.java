package gen.model.request;

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
import defpackage.kf2;
import defpackage.lf2;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0019B\u001b\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J!\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0017¨\u0006\u001a"}, d2 = {"Lgen/model/request/CreateInResponseToQuoteRequest;", "Lcom/squareup/wire/AndroidMessage;", "Lkf2;", "", "in_response_to_quote_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lh21;)V", "newBuilder", "()Lkf2;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lh21;)Lgen/model/request/CreateInResponseToQuoteRequest;", "Ljava/lang/String;", "Companion", "lf2", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateInResponseToQuoteRequest extends AndroidMessage<CreateInResponseToQuoteRequest, kf2> {
    public static final ProtoAdapter<CreateInResponseToQuoteRequest> ADAPTER;
    public static final Parcelable.Creator<CreateInResponseToQuoteRequest> CREATOR;
    public static final lf2 Companion = new lf2();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "inResponseToQuoteId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final String in_response_to_quote_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CreateInResponseToQuoteRequest.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<CreateInResponseToQuoteRequest> protoAdapter = new ProtoAdapter<CreateInResponseToQuoteRequest>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.CreateInResponseToQuoteRequest$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CreateInResponseToQuoteRequest decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = "";
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CreateInResponseToQuoteRequest(strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CreateInResponseToQuoteRequest value) {
                writer.getClass();
                value.getClass();
                if (!g76.L(value.in_response_to_quote_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 1, value.in_response_to_quote_id);
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CreateInResponseToQuoteRequest value) {
                value.getClass();
                int iE = value.unknownFields().e();
                return !g76.L(value.in_response_to_quote_id, "") ? ProtoAdapter.STRING.encodedSizeWithTag(1, value.in_response_to_quote_id) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CreateInResponseToQuoteRequest redact(CreateInResponseToQuoteRequest value) {
                value.getClass();
                return CreateInResponseToQuoteRequest.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CreateInResponseToQuoteRequest value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                if (g76.L(value.in_response_to_quote_id, "")) {
                    return;
                }
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.in_response_to_quote_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CreateInResponseToQuoteRequest(String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? "" : str, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CreateInResponseToQuoteRequest copy$default(CreateInResponseToQuoteRequest createInResponseToQuoteRequest, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = createInResponseToQuoteRequest.in_response_to_quote_id;
        }
        if ((i & 2) != 0) {
            h21Var = createInResponseToQuoteRequest.unknownFields();
        }
        return createInResponseToQuoteRequest.copy(str, h21Var);
    }

    public final CreateInResponseToQuoteRequest copy(String in_response_to_quote_id, h21 unknownFields) {
        in_response_to_quote_id.getClass();
        unknownFields.getClass();
        return new CreateInResponseToQuoteRequest(in_response_to_quote_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CreateInResponseToQuoteRequest)) {
            return false;
        }
        CreateInResponseToQuoteRequest createInResponseToQuoteRequest = (CreateInResponseToQuoteRequest) other;
        return g76.L(unknownFields(), createInResponseToQuoteRequest.unknownFields()) && g76.L(this.in_response_to_quote_id, createInResponseToQuoteRequest.in_response_to_quote_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.in_response_to_quote_id.hashCode() + (unknownFields().hashCode() * 37);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final kf2 newBuilder() {
        kf2 kf2Var = new kf2();
        kf2Var.a = this.in_response_to_quote_id;
        kf2Var.addUnknownFields(unknownFields());
        return kf2Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.in_response_to_quote_id, "in_response_to_quote_id=", arrayList);
        return bu1.F0(arrayList, ", ", "CreateInResponseToQuoteRequest{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CreateInResponseToQuoteRequest() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CreateInResponseToQuoteRequest(String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.in_response_to_quote_id = str;
    }
}
