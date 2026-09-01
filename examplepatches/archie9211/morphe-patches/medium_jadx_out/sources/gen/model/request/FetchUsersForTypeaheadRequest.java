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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.re4;
import defpackage.se4;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J;\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0019¨\u0006\u001c"}, d2 = {"Lgen/model/request/FetchUsersForTypeaheadRequest;", "Lcom/squareup/wire/AndroidMessage;", "Lre4;", "", "q", "source", "collection_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lre4;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/request/FetchUsersForTypeaheadRequest;", "Ljava/lang/String;", "Companion", "se4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FetchUsersForTypeaheadRequest extends AndroidMessage<FetchUsersForTypeaheadRequest, re4> {
    public static final ProtoAdapter<FetchUsersForTypeaheadRequest> ADAPTER;
    public static final Parcelable.Creator<FetchUsersForTypeaheadRequest> CREATOR;
    public static final se4 Companion = new se4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String q;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String source;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FetchUsersForTypeaheadRequest.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<FetchUsersForTypeaheadRequest> protoAdapter = new ProtoAdapter<FetchUsersForTypeaheadRequest>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.FetchUsersForTypeaheadRequest$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final FetchUsersForTypeaheadRequest decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FetchUsersForTypeaheadRequest(strDecode, strDecode2, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FetchUsersForTypeaheadRequest value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.q);
                protoAdapter2.encodeWithTag(writer, 2, value.source);
                protoAdapter2.encodeWithTag(writer, 3, value.collection_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FetchUsersForTypeaheadRequest value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(3, value.collection_id) + protoAdapter2.encodedSizeWithTag(2, value.source) + protoAdapter2.encodedSizeWithTag(1, value.q) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FetchUsersForTypeaheadRequest redact(FetchUsersForTypeaheadRequest value) {
                value.getClass();
                return FetchUsersForTypeaheadRequest.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FetchUsersForTypeaheadRequest value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 2, value.source);
                protoAdapter2.encodeWithTag(writer, 1, value.q);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ FetchUsersForTypeaheadRequest(String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ FetchUsersForTypeaheadRequest copy$default(FetchUsersForTypeaheadRequest fetchUsersForTypeaheadRequest, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = fetchUsersForTypeaheadRequest.q;
        }
        if ((i & 2) != 0) {
            str2 = fetchUsersForTypeaheadRequest.source;
        }
        if ((i & 4) != 0) {
            str3 = fetchUsersForTypeaheadRequest.collection_id;
        }
        if ((i & 8) != 0) {
            h21Var = fetchUsersForTypeaheadRequest.unknownFields();
        }
        return fetchUsersForTypeaheadRequest.copy(str, str2, str3, h21Var);
    }

    public final FetchUsersForTypeaheadRequest copy(String q, String source, String collection_id, h21 unknownFields) {
        unknownFields.getClass();
        return new FetchUsersForTypeaheadRequest(q, source, collection_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FetchUsersForTypeaheadRequest)) {
            return false;
        }
        FetchUsersForTypeaheadRequest fetchUsersForTypeaheadRequest = (FetchUsersForTypeaheadRequest) other;
        return g76.L(unknownFields(), fetchUsersForTypeaheadRequest.unknownFields()) && g76.L(this.q, fetchUsersForTypeaheadRequest.q) && g76.L(this.source, fetchUsersForTypeaheadRequest.source) && g76.L(this.collection_id, fetchUsersForTypeaheadRequest.collection_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.q;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.source;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.collection_id;
        int iHashCode4 = iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final re4 newBuilder() {
        re4 re4Var = new re4();
        re4Var.a = this.q;
        re4Var.b = this.source;
        re4Var.c = this.collection_id;
        re4Var.addUnknownFields(unknownFields());
        return re4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.q;
        if (str != null) {
            lv8.D(str, "q=", arrayList);
        }
        String str2 = this.source;
        if (str2 != null) {
            lv8.D(str2, "source=", arrayList);
        }
        String str3 = this.collection_id;
        if (str3 != null) {
            lv8.D(str3, "collection_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "FetchUsersForTypeaheadRequest{", "}", null, 56);
    }

    public FetchUsersForTypeaheadRequest() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FetchUsersForTypeaheadRequest(String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.q = str;
        this.source = str2;
        this.collection_id = str3;
    }
}
