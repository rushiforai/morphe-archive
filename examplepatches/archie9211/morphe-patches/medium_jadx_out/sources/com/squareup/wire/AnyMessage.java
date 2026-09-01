package com.squareup.wire;

import com.squareup.wire.Message;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.mm;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.z73;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0001\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\r\u0018\u0000 \"2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\"B\u0019\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ!\u0010\f\u001a\u00028\u0000\"\u0004\b\u0000\u0010\t2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00000\n¢\u0006\u0004\b\f\u0010\rJ#\u0010\u000e\u001a\u0004\u0018\u00018\u0000\"\u0004\b\u0000\u0010\t2\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00028\u00000\n¢\u0006\u0004\b\u000e\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ!\u0010\u001b\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001d\u001a\u0004\b\u001e\u0010\u001aR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001f\u001a\u0004\b \u0010!¨\u0006#"}, d2 = {"Lcom/squareup/wire/AnyMessage;", "Lcom/squareup/wire/Message;", "", "", "typeUrl", "Lh21;", "value", "<init>", "(Ljava/lang/String;Lh21;)V", "T", "Lcom/squareup/wire/ProtoAdapter;", "adapter", "unpack", "(Lcom/squareup/wire/ProtoAdapter;)Ljava/lang/Object;", "unpackOrNull", "newBuilder", "()Ljava/lang/Void;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lh21;)Lcom/squareup/wire/AnyMessage;", "Ljava/lang/String;", "getTypeUrl", "Lh21;", "getValue", "()Lh21;", "Companion", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class AnyMessage extends Message {
    public static final ProtoAdapter<AnyMessage> ADAPTER;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion();
    private final String typeUrl;
    private final h21 value;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AnyMessage.class);
        final Syntax syntax = Syntax.PROTO_3;
        ADAPTER = new ProtoAdapter<AnyMessage>(fieldEncoding, wg6VarB, syntax) { // from class: com.squareup.wire.AnyMessage$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AnyMessage decode(ProtoReader reader) {
                reader.getClass();
                h21 h21VarDecode = h21.d;
                long jBeginMessage = reader.beginMessage();
                String strDecode = "";
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(jBeginMessage);
                        return new AnyMessage(strDecode, h21VarDecode);
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        h21VarDecode = ProtoAdapter.BYTES.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AnyMessage value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.getTypeUrl());
                ProtoAdapter.BYTES.encodeWithTag(writer, 2, value.getValue());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AnyMessage value) {
                value.getClass();
                return ProtoAdapter.BYTES.encodedSizeWithTag(2, value.getValue()) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.getTypeUrl());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AnyMessage redact(AnyMessage value) {
                value.getClass();
                return new AnyMessage("square.github.io/wire/redacted", h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AnyMessage value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.BYTES.encodeWithTag(writer, 2, value.getValue());
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.getTypeUrl());
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AnyMessage decode(ProtoReader32 reader) {
                reader.getClass();
                h21 h21VarDecode = h21.d;
                int iBeginMessage = reader.beginMessage();
                String strDecode = "";
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        reader.endMessageAndGetUnknownFields(iBeginMessage);
                        return new AnyMessage(strDecode, h21VarDecode);
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        h21VarDecode = ProtoAdapter.BYTES.decode(reader);
                    }
                }
            }
        };
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AnyMessage(String str, h21 h21Var) {
        super(ADAPTER, h21.d);
        str.getClass();
        h21Var.getClass();
        this.typeUrl = str;
        this.value = h21Var;
    }

    public static /* synthetic */ AnyMessage copy$default(AnyMessage anyMessage, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = anyMessage.typeUrl;
        }
        if ((i & 2) != 0) {
            h21Var = anyMessage.value;
        }
        return anyMessage.copy(str, h21Var);
    }

    public final AnyMessage copy(String typeUrl, h21 value) {
        typeUrl.getClass();
        value.getClass();
        return new AnyMessage(typeUrl, value);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AnyMessage)) {
            return false;
        }
        AnyMessage anyMessage = (AnyMessage) other;
        return g76.L(this.typeUrl, anyMessage.typeUrl) && g76.L(this.value, anyMessage.value);
    }

    public final String getTypeUrl() {
        return this.typeUrl;
    }

    public final h21 getValue() {
        return this.value;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.value.hashCode() + wgd.o(i * 37, 37, this.typeUrl);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final /* synthetic */ Message.Builder newBuilder() {
        throw new AssertionError();
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        return "Any{type_url=" + this.typeUrl + ", value=" + this.value + '}';
    }

    public final <T> T unpack(ProtoAdapter<T> adapter) {
        adapter.getClass();
        if (g76.L(this.typeUrl, adapter.getTypeUrl())) {
            return adapter.decode(this.value);
        }
        mm.g("type mismatch: ", this.typeUrl, " != ", adapter.getTypeUrl());
        return null;
    }

    public final <T> T unpackOrNull(ProtoAdapter<T> adapter) {
        adapter.getClass();
        if (g76.L(this.typeUrl, adapter.getTypeUrl())) {
            return adapter.decode(this.value);
        }
        return null;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u000e\u0010\u0006\u001a\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0007R\u0016\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\t8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/squareup/wire/AnyMessage$Companion;", "", "<init>", "()V", "pack", "Lcom/squareup/wire/AnyMessage;", "message", "Lcom/squareup/wire/Message;", "ADAPTER", "Lcom/squareup/wire/ProtoAdapter;", "wire-runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final AnyMessage pack(Message<?, ?> message) {
            message.getClass();
            String typeUrl = message.adapter().getTypeUrl();
            if (typeUrl != null) {
                return new AnyMessage(typeUrl, message.encodeByteString());
            }
            throw new IllegalStateException(("recompile " + n1b.a.b(message.getClass()) + " to use it with AnyMessage").toString());
        }

        public Companion(gy2 gy2Var) {
        }
    }

    @z73
    /* JADX INFO: renamed from: newBuilder, reason: collision with other method in class */
    public final /* synthetic */ Void m94newBuilder() {
        throw new AssertionError();
    }

    public /* synthetic */ AnyMessage(String str, h21 h21Var, int i, gy2 gy2Var) {
        this(str, (i & 2) != 0 ? h21.d : h21Var);
    }
}
