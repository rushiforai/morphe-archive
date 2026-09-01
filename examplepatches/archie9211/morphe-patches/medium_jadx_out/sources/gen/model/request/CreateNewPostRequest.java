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
import defpackage.rf2;
import defpackage.sf2;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0019B\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J#\u0010\u0015\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0015\u0010\u0016R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0017¨\u0006\u001a"}, d2 = {"Lgen/model/request/CreateNewPostRequest;", "Lcom/squareup/wire/AndroidMessage;", "Lrf2;", "", "post_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lh21;)V", "newBuilder", "()Lrf2;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lh21;)Lgen/model/request/CreateNewPostRequest;", "Ljava/lang/String;", "Companion", "sf2", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CreateNewPostRequest extends AndroidMessage<CreateNewPostRequest, rf2> {
    public static final ProtoAdapter<CreateNewPostRequest> ADAPTER;
    public static final Parcelable.Creator<CreateNewPostRequest> CREATOR;
    public static final sf2 Companion = new sf2();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CreateNewPostRequest.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CreateNewPostRequest> protoAdapter = new ProtoAdapter<CreateNewPostRequest>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.CreateNewPostRequest$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CreateNewPostRequest decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CreateNewPostRequest(strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CreateNewPostRequest value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CreateNewPostRequest value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(1, value.post_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CreateNewPostRequest redact(CreateNewPostRequest value) {
                value.getClass();
                return CreateNewPostRequest.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CreateNewPostRequest value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CreateNewPostRequest(String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CreateNewPostRequest copy$default(CreateNewPostRequest createNewPostRequest, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = createNewPostRequest.post_id;
        }
        if ((i & 2) != 0) {
            h21Var = createNewPostRequest.unknownFields();
        }
        return createNewPostRequest.copy(str, h21Var);
    }

    public final CreateNewPostRequest copy(String post_id, h21 unknownFields) {
        unknownFields.getClass();
        return new CreateNewPostRequest(post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CreateNewPostRequest)) {
            return false;
        }
        CreateNewPostRequest createNewPostRequest = (CreateNewPostRequest) other;
        return g76.L(unknownFields(), createNewPostRequest.unknownFields()) && g76.L(this.post_id, createNewPostRequest.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.post_id;
        int iHashCode2 = iHashCode + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final rf2 newBuilder() {
        rf2 rf2Var = new rf2();
        rf2Var.a = this.post_id;
        rf2Var.addUnknownFields(unknownFields());
        return rf2Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CreateNewPostRequest{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public CreateNewPostRequest() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CreateNewPostRequest(String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.post_id = str;
    }
}
