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
import defpackage.je4;
import defpackage.ke4;
import defpackage.n1b;
import defpackage.wg6;
import gen.model.Quote;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB!\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J'\u0010\u0017\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019¨\u0006\u001c"}, d2 = {"Lgen/model/response/FetchQuotesResponse;", "Lcom/squareup/wire/AndroidMessage;", "Lje4;", "", "Lgen/model/Quote;", "value_", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Lh21;)V", "newBuilder", "()Lje4;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Lh21;)Lgen/model/response/FetchQuotesResponse;", "Ljava/util/List;", "Companion", "ke4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FetchQuotesResponse extends AndroidMessage<FetchQuotesResponse, je4> {
    public static final ProtoAdapter<FetchQuotesResponse> ADAPTER;
    public static final Parcelable.Creator<FetchQuotesResponse> CREATOR;
    public static final ke4 Companion = new ke4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Quote#ADAPTER", declaredName = "value", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<Quote> value_;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FetchQuotesResponse.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<FetchQuotesResponse> protoAdapter = new ProtoAdapter<FetchQuotesResponse>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.response.FetchQuotesResponse$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final FetchQuotesResponse decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FetchQuotesResponse(arrayListF, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(Quote.ADAPTER.decode(reader));
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FetchQuotesResponse value) {
                writer.getClass();
                value.getClass();
                Quote.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.value_);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FetchQuotesResponse value) {
                value.getClass();
                return Quote.ADAPTER.asRepeated().encodedSizeWithTag(1, value.value_) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FetchQuotesResponse redact(FetchQuotesResponse value) {
                value.getClass();
                return value.copy(Internal.m97redactElements(value.value_, Quote.ADAPTER), h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FetchQuotesResponse value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                Quote.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.value_);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FetchQuotesResponse(List<Quote> list, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.value_ = Internal.immutableCopyOf("value_", list);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ FetchQuotesResponse copy$default(FetchQuotesResponse fetchQuotesResponse, List list, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = fetchQuotesResponse.value_;
        }
        if ((i & 2) != 0) {
            h21Var = fetchQuotesResponse.unknownFields();
        }
        return fetchQuotesResponse.copy(list, h21Var);
    }

    public final FetchQuotesResponse copy(List<Quote> value_, h21 unknownFields) {
        value_.getClass();
        unknownFields.getClass();
        return new FetchQuotesResponse(value_, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FetchQuotesResponse)) {
            return false;
        }
        FetchQuotesResponse fetchQuotesResponse = (FetchQuotesResponse) other;
        return g76.L(unknownFields(), fetchQuotesResponse.unknownFields()) && g76.L(this.value_, fetchQuotesResponse.value_);
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
    public final je4 newBuilder() {
        je4 je4Var = new je4();
        je4Var.a = ey3.a;
        je4Var.a = this.value_;
        je4Var.addUnknownFields(unknownFields());
        return je4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.value_.isEmpty()) {
            b09.J("value_=", this.value_, arrayList);
        }
        return bu1.F0(arrayList, ", ", "FetchQuotesResponse{", "}", null, 56);
    }

    public /* synthetic */ FetchQuotesResponse(List list, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? ey3.a : list, (i & 2) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public FetchQuotesResponse() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
