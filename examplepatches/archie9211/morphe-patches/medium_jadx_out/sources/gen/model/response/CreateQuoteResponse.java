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
import defpackage.hg2;
import defpackage.ig2;
import defpackage.n1b;
import defpackage.wg6;
import gen.model.Quote;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J#\u0010\u0016\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018¨\u0006\u001b"}, d2 = {"Lgen/model/response/CreateQuoteResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lhg2;", "Lgen/model/Quote;", "value_", "Lh21;", "unknownFields", "<init>", "(Lgen/model/Quote;Lh21;)V", "newBuilder", "()Lhg2;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/Quote;Lh21;)Lgen/model/response/CreateQuoteResponse;", "Lgen/model/Quote;", "Companion", "ig2", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateQuoteResponse extends AndroidMessage<CreateQuoteResponse, hg2> {
    public static final ProtoAdapter<CreateQuoteResponse> ADAPTER;
    public static final Parcelable.Creator<CreateQuoteResponse> CREATOR;
    public static final ig2 Companion = new ig2();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Quote#ADAPTER", declaredName = "value", schemaIndex = 0, tag = 1)
    public final Quote value_;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CreateQuoteResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CreateQuoteResponse> protoAdapter = new ProtoAdapter<CreateQuoteResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.CreateQuoteResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CreateQuoteResponse decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Quote quoteDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CreateQuoteResponse(quoteDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        quoteDecode = Quote.ADAPTER.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CreateQuoteResponse value) {
                writer.getClass();
                value.getClass();
                Quote.ADAPTER.encodeWithTag(writer, 1, value.value_);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CreateQuoteResponse value) {
                value.getClass();
                return Quote.ADAPTER.encodedSizeWithTag(1, value.value_) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CreateQuoteResponse redact(CreateQuoteResponse value) {
                value.getClass();
                Quote quote = value.value_;
                return value.copy(quote != null ? Quote.ADAPTER.redact(quote) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CreateQuoteResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                Quote.ADAPTER.encodeWithTag(writer, 1, value.value_);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CreateQuoteResponse(Quote quote, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : quote, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CreateQuoteResponse copy$default(CreateQuoteResponse createQuoteResponse, Quote quote, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            quote = createQuoteResponse.value_;
        }
        if ((i & 2) != 0) {
            h21Var = createQuoteResponse.unknownFields();
        }
        return createQuoteResponse.copy(quote, h21Var);
    }

    public final CreateQuoteResponse copy(Quote value_, h21 unknownFields) {
        unknownFields.getClass();
        return new CreateQuoteResponse(value_, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CreateQuoteResponse)) {
            return false;
        }
        CreateQuoteResponse createQuoteResponse = (CreateQuoteResponse) other;
        return g76.L(unknownFields(), createQuoteResponse.unknownFields()) && g76.L(this.value_, createQuoteResponse.value_);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Quote quote = this.value_;
        int iHashCode2 = iHashCode + (quote != null ? quote.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final hg2 newBuilder() {
        hg2 hg2Var = new hg2();
        hg2Var.a = this.value_;
        hg2Var.addUnknownFields(unknownFields());
        return hg2Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Quote quote = this.value_;
        if (quote != null) {
            arrayList.add("value_=" + quote);
        }
        return bu1.F0(arrayList, ", ", "CreateQuoteResponse{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CreateQuoteResponse() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CreateQuoteResponse(Quote quote, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.value_ = quote;
    }
}
