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
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.f07;
import defpackage.g07;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB9\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J?\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001cR\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001d¨\u0006 "}, d2 = {"Lgen/model/LinkMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lf07;", "", "url", "", "Lgen/model/LinkAlternate;", "alts", "", "http_status", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lf07;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Lh21;)Lgen/model/LinkMetadata;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/util/List;", "Companion", "g07", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LinkMetadata extends AndroidMessage<LinkMetadata, f07> {
    public static final ProtoAdapter<LinkMetadata> ADAPTER;
    public static final Parcelable.Creator<LinkMetadata> CREATOR;
    public static final g07 Companion = new g07();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.LinkAlternate#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<LinkAlternate> alts;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer http_status;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String url;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(LinkMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<LinkMetadata> protoAdapter = new ProtoAdapter<LinkMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.LinkMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final LinkMetadata decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new LinkMetadata(strDecode, arrayListF, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        arrayListF.add(LinkAlternate.ADAPTER.decode(reader));
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, LinkMetadata value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.url);
                LinkAlternate.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.alts);
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.http_status);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(LinkMetadata value) {
                value.getClass();
                return ProtoAdapter.INT32.encodedSizeWithTag(3, value.http_status) + LinkAlternate.ADAPTER.asRepeated().encodedSizeWithTag(2, value.alts) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.url) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final LinkMetadata redact(LinkMetadata value) {
                value.getClass();
                return LinkMetadata.copy$default(value, null, Internal.m97redactElements(value.alts, LinkAlternate.ADAPTER), null, h21.d, 5, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, LinkMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.http_status);
                LinkAlternate.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.alts);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.url);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ LinkMetadata(String str, List list, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? ey3.a : list, (i & 4) != 0 ? null : num, (i & 8) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ LinkMetadata copy$default(LinkMetadata linkMetadata, String str, List list, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = linkMetadata.url;
        }
        if ((i & 2) != 0) {
            list = linkMetadata.alts;
        }
        if ((i & 4) != 0) {
            num = linkMetadata.http_status;
        }
        if ((i & 8) != 0) {
            h21Var = linkMetadata.unknownFields();
        }
        return linkMetadata.copy(str, list, num, h21Var);
    }

    public final LinkMetadata copy(String url, List<LinkAlternate> alts, Integer http_status, h21 unknownFields) {
        alts.getClass();
        unknownFields.getClass();
        return new LinkMetadata(url, alts, http_status, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof LinkMetadata)) {
            return false;
        }
        LinkMetadata linkMetadata = (LinkMetadata) other;
        return g76.L(unknownFields(), linkMetadata.unknownFields()) && g76.L(this.url, linkMetadata.url) && g76.L(this.alts, linkMetadata.alts) && g76.L(this.http_status, linkMetadata.http_status);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.url;
        int iP = wgd.p((iHashCode + (str != null ? str.hashCode() : 0)) * 37, 37, this.alts);
        Integer num = this.http_status;
        int iIntValue = iP + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final f07 newBuilder() {
        f07 f07Var = new f07();
        f07Var.b = ey3.a;
        f07Var.a = this.url;
        f07Var.b = this.alts;
        f07Var.c = this.http_status;
        f07Var.addUnknownFields(unknownFields());
        return f07Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.url;
        if (str != null) {
            lv8.D(str, "url=", arrayList);
        }
        if (!this.alts.isEmpty()) {
            b09.J("alts=", this.alts, arrayList);
        }
        Integer num = this.http_status;
        if (num != null) {
            lv8.B("http_status=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "LinkMetadata{", "}", null, 56);
    }

    public LinkMetadata() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LinkMetadata(String str, List<LinkAlternate> list, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.url = str;
        this.http_status = num;
        this.alts = Internal.immutableCopyOf("alts", list);
    }
}
