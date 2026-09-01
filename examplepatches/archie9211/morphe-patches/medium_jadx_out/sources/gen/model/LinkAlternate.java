package gen.model;

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
import defpackage.wg6;
import defpackage.yz6;
import defpackage.zz6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/LinkAlternate;", "Lcom/squareup/wire/AndroidMessage;", "Lyz6;", "Lgen/model/LinkAlternateType;", "type", "", "url", "Lh21;", "unknownFields", "<init>", "(Lgen/model/LinkAlternateType;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lyz6;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/LinkAlternateType;Ljava/lang/String;Lh21;)Lgen/model/LinkAlternate;", "Lgen/model/LinkAlternateType;", "Ljava/lang/String;", "Companion", "zz6", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LinkAlternate extends AndroidMessage<LinkAlternate, yz6> {
    public static final ProtoAdapter<LinkAlternate> ADAPTER;
    public static final Parcelable.Creator<LinkAlternate> CREATOR;
    public static final zz6 Companion = new zz6();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.LinkAlternateType#ADAPTER", schemaIndex = 0, tag = 1)
    public final LinkAlternateType type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(LinkAlternate.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<LinkAlternate> protoAdapter = new ProtoAdapter<LinkAlternate>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.LinkAlternate$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final LinkAlternate decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                LinkAlternateType linkAlternateTypeDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new LinkAlternate(linkAlternateTypeDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        try {
                            linkAlternateTypeDecode = LinkAlternateType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, LinkAlternate value) {
                writer.getClass();
                value.getClass();
                LinkAlternateType.ADAPTER.encodeWithTag(writer, 1, value.type);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.url);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(LinkAlternate value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.url) + LinkAlternateType.ADAPTER.encodedSizeWithTag(1, value.type) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final LinkAlternate redact(LinkAlternate value) {
                value.getClass();
                return LinkAlternate.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, LinkAlternate value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.url);
                LinkAlternateType.ADAPTER.encodeWithTag(writer, 1, value.type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ LinkAlternate(LinkAlternateType linkAlternateType, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : linkAlternateType, (i & 2) != 0 ? null : str, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ LinkAlternate copy$default(LinkAlternate linkAlternate, LinkAlternateType linkAlternateType, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            linkAlternateType = linkAlternate.type;
        }
        if ((i & 2) != 0) {
            str = linkAlternate.url;
        }
        if ((i & 4) != 0) {
            h21Var = linkAlternate.unknownFields();
        }
        return linkAlternate.copy(linkAlternateType, str, h21Var);
    }

    public final LinkAlternate copy(LinkAlternateType type, String url, h21 unknownFields) {
        unknownFields.getClass();
        return new LinkAlternate(type, url, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof LinkAlternate)) {
            return false;
        }
        LinkAlternate linkAlternate = (LinkAlternate) other;
        return g76.L(unknownFields(), linkAlternate.unknownFields()) && this.type == linkAlternate.type && g76.L(this.url, linkAlternate.url);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        LinkAlternateType linkAlternateType = this.type;
        int iHashCode2 = (iHashCode + (linkAlternateType != null ? linkAlternateType.hashCode() : 0)) * 37;
        String str = this.url;
        int iHashCode3 = iHashCode2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final yz6 newBuilder() {
        yz6 yz6Var = new yz6();
        yz6Var.a = this.type;
        yz6Var.b = this.url;
        yz6Var.addUnknownFields(unknownFields());
        return yz6Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        LinkAlternateType linkAlternateType = this.type;
        if (linkAlternateType != null) {
            arrayList.add("type=" + linkAlternateType);
        }
        String str = this.url;
        if (str != null) {
            lv8.D(str, "url=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "LinkAlternate{", "}", null, 56);
    }

    public LinkAlternate() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LinkAlternate(LinkAlternateType linkAlternateType, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.type = linkAlternateType;
        this.url = str;
    }
}
