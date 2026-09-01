package gen.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.m3e;
import defpackage.n1b;
import defpackage.n3e;
import defpackage.wg6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\u0018\u0000 \u00162\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0017B\u0011\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0007\u0010\bJ\u001a\u0010\f\u001a\u00020\u000b2\b\u0010\n\u001a\u0004\u0018\u00010\tH\u0096\u0002¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0014\u0010\u0015¨\u0006\u0018"}, d2 = {"Lgen/model/Unused;", "Lcom/squareup/wire/AndroidMessage;", "Lm3e;", "Lh21;", "unknownFields", "<init>", "(Lh21;)V", "newBuilder", "()Lm3e;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lh21;)Lgen/model/Unused;", "Companion", "n3e", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Unused extends AndroidMessage<Unused, m3e> {
    public static final ProtoAdapter<Unused> ADAPTER;
    public static final Parcelable.Creator<Unused> CREATOR;
    public static final n3e Companion = new n3e();
    private static final long serialVersionUID = 0;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Unused.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Unused> protoAdapter = new ProtoAdapter<Unused>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Unused$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Unused decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Unused(reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    reader.readUnknownField(iNextTag);
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Unused value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Unused value) {
                value.getClass();
                return value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Unused redact(Unused value) {
                value.getClass();
                return value.copy(h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Unused value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Unused(h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Unused copy$default(Unused unused, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            h21Var = unused.unknownFields();
        }
        return unused.copy(h21Var);
    }

    public final Unused copy(h21 unknownFields) {
        unknownFields.getClass();
        return new Unused(ADAPTER, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        return (other instanceof Unused) && g76.L(unknownFields(), ((Unused) other).unknownFields());
    }

    public final int hashCode() {
        return unknownFields().hashCode();
    }

    @Override // com.squareup.wire.Message
    public final m3e newBuilder() {
        m3e m3eVar = new m3e();
        m3eVar.addUnknownFields(unknownFields());
        return m3eVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        return "Unused{}";
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Unused() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Unused(h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
    }
}
