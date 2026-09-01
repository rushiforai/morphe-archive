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
import defpackage.g76;
import defpackage.gy2;
import defpackage.h07;
import defpackage.h21;
import defpackage.i07;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 B9\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u0018\u0010\u0019J?\u0010\u001a\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001dR\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001e¨\u0006!"}, d2 = {"Lgen/model/LinkMetadataList;", "Lcom/squareup/wire/AndroidMessage;", "Lh07;", "", "Lgen/model/LinkMetadata;", "entries", "", "version", "", "generated_at", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Ljava/lang/String;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lh07;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Ljava/lang/String;Ljava/lang/Long;Lh21;)Lgen/model/LinkMetadataList;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/util/List;", "Companion", "i07", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LinkMetadataList extends AndroidMessage<LinkMetadataList, h07> {
    public static final ProtoAdapter<LinkMetadataList> ADAPTER;
    public static final Parcelable.Creator<LinkMetadataList> CREATOR;
    public static final i07 Companion = new i07();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.LinkMetadata#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<LinkMetadata> entries;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long generated_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String version;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(LinkMetadataList.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<LinkMetadataList> protoAdapter = new ProtoAdapter<LinkMetadataList>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.LinkMetadataList$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final LinkMetadataList decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Long lDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new LinkMetadataList(arrayListF, strDecode, lDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(LinkMetadata.ADAPTER.decode(reader));
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        lDecode = ProtoAdapter.INT64.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, LinkMetadataList value) {
                writer.getClass();
                value.getClass();
                LinkMetadata.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.entries);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.version);
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.generated_at);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(LinkMetadataList value) {
                value.getClass();
                return ProtoAdapter.INT64.encodedSizeWithTag(3, value.generated_at) + ProtoAdapter.STRING.encodedSizeWithTag(2, value.version) + LinkMetadata.ADAPTER.asRepeated().encodedSizeWithTag(1, value.entries) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final LinkMetadataList redact(LinkMetadataList value) {
                value.getClass();
                return LinkMetadataList.copy$default(value, Internal.m97redactElements(value.entries, LinkMetadata.ADAPTER), null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, LinkMetadataList value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT64.encodeWithTag(writer, 3, value.generated_at);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.version);
                LinkMetadata.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.entries);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ LinkMetadataList(List list, String str, Long l, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? ey3.a : list, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : l, (i & 8) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ LinkMetadataList copy$default(LinkMetadataList linkMetadataList, List list, String str, Long l, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = linkMetadataList.entries;
        }
        if ((i & 2) != 0) {
            str = linkMetadataList.version;
        }
        if ((i & 4) != 0) {
            l = linkMetadataList.generated_at;
        }
        if ((i & 8) != 0) {
            h21Var = linkMetadataList.unknownFields();
        }
        return linkMetadataList.copy(list, str, l, h21Var);
    }

    public final LinkMetadataList copy(List<LinkMetadata> entries, String version, Long generated_at, h21 unknownFields) {
        entries.getClass();
        unknownFields.getClass();
        return new LinkMetadataList(entries, version, generated_at, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof LinkMetadataList)) {
            return false;
        }
        LinkMetadataList linkMetadataList = (LinkMetadataList) other;
        return g76.L(unknownFields(), linkMetadataList.unknownFields()) && g76.L(this.entries, linkMetadataList.entries) && g76.L(this.version, linkMetadataList.version) && g76.L(this.generated_at, linkMetadataList.generated_at);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iP = wgd.p(unknownFields().hashCode() * 37, 37, this.entries);
        String str = this.version;
        int i2 = 0;
        int iHashCode = (iP + (str != null ? str.hashCode() : 0)) * 37;
        Long l = this.generated_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        }
        int i3 = iHashCode + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final h07 newBuilder() {
        h07 h07Var = new h07();
        h07Var.a = ey3.a;
        h07Var.a = this.entries;
        h07Var.b = this.version;
        h07Var.c = this.generated_at;
        h07Var.addUnknownFields(unknownFields());
        return h07Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.entries.isEmpty()) {
            b09.J("entries=", this.entries, arrayList);
        }
        String str = this.version;
        if (str != null) {
            lv8.D(str, "version=", arrayList);
        }
        Long l = this.generated_at;
        if (l != null) {
            y30.A("generated_at=", l, arrayList);
        }
        return bu1.F0(arrayList, ", ", "LinkMetadataList{", "}", null, 56);
    }

    public LinkMetadataList() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LinkMetadataList(List<LinkMetadata> list, String str, Long l, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.version = str;
        this.generated_at = l;
        this.entries = Internal.immutableCopyOf("entries", list);
    }
}
