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
import defpackage.foa;
import defpackage.g76;
import defpackage.goa;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u0012\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lgen/model/request/PublishPostRequest;", "Lcom/squareup/wire/AndroidMessage;", "Lfoa;", "", "post_id", "Lgen/model/request/PublishPostRequestContent;", "content", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/request/PublishPostRequestContent;Lh21;)V", "newBuilder", "()Lfoa;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/request/PublishPostRequestContent;Lh21;)Lgen/model/request/PublishPostRequest;", "Ljava/lang/String;", "Lgen/model/request/PublishPostRequestContent;", "getContent$annotations", "()V", "Companion", "goa", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublishPostRequest extends AndroidMessage<PublishPostRequest, foa> {
    public static final ProtoAdapter<PublishPostRequest> ADAPTER;
    public static final Parcelable.Creator<PublishPostRequest> CREATOR;
    public static final goa Companion = new goa();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.request.PublishPostRequestContent#ADAPTER", schemaIndex = 1, tag = 2)
    public final PublishPostRequestContent content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PublishPostRequest.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PublishPostRequest> protoAdapter = new ProtoAdapter<PublishPostRequest>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.request.PublishPostRequest$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PublishPostRequest decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                PublishPostRequestContent publishPostRequestContentDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PublishPostRequest(strDecode, publishPostRequestContentDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        publishPostRequestContentDecode = PublishPostRequestContent.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PublishPostRequest value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
                PublishPostRequestContent.ADAPTER.encodeWithTag(writer, 2, value.content);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PublishPostRequest value) {
                value.getClass();
                return PublishPostRequestContent.ADAPTER.encodedSizeWithTag(2, value.content) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.post_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PublishPostRequest redact(PublishPostRequest value) {
                value.getClass();
                PublishPostRequestContent publishPostRequestContent = value.content;
                return PublishPostRequest.copy$default(value, null, publishPostRequestContent != null ? PublishPostRequestContent.ADAPTER.redact(publishPostRequestContent) : null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PublishPostRequest value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                PublishPostRequestContent.ADAPTER.encodeWithTag(writer, 2, value.content);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PublishPostRequest(String str, PublishPostRequestContent publishPostRequestContent, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : publishPostRequestContent, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PublishPostRequest copy$default(PublishPostRequest publishPostRequest, String str, PublishPostRequestContent publishPostRequestContent, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = publishPostRequest.post_id;
        }
        if ((i & 2) != 0) {
            publishPostRequestContent = publishPostRequest.content;
        }
        if ((i & 4) != 0) {
            h21Var = publishPostRequest.unknownFields();
        }
        return publishPostRequest.copy(str, publishPostRequestContent, h21Var);
    }

    public final PublishPostRequest copy(String post_id, PublishPostRequestContent content, h21 unknownFields) {
        unknownFields.getClass();
        return new PublishPostRequest(post_id, content, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PublishPostRequest)) {
            return false;
        }
        PublishPostRequest publishPostRequest = (PublishPostRequest) other;
        return g76.L(unknownFields(), publishPostRequest.unknownFields()) && g76.L(this.post_id, publishPostRequest.post_id) && g76.L(this.content, publishPostRequest.content);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.post_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        PublishPostRequestContent publishPostRequestContent = this.content;
        int iHashCode3 = iHashCode2 + (publishPostRequestContent != null ? publishPostRequestContent.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final foa newBuilder() {
        foa foaVar = new foa();
        foaVar.a = this.post_id;
        foaVar.b = this.content;
        foaVar.addUnknownFields(unknownFields());
        return foaVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        PublishPostRequestContent publishPostRequestContent = this.content;
        if (publishPostRequestContent != null) {
            arrayList.add("content=" + publishPostRequestContent);
        }
        return bu1.F0(arrayList, ", ", "PublishPostRequest{", "}", null, 56);
    }

    public PublishPostRequest() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PublishPostRequest(String str, PublishPostRequestContent publishPostRequestContent, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.post_id = str;
        this.content = publishPostRequestContent;
    }

    public static /* synthetic */ void getContent$annotations() {
    }
}
