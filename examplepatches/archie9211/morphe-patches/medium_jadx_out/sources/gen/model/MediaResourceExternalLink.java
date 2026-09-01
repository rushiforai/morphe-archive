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
import defpackage.cm7;
import defpackage.dm7;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB!\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J'\u0010\u0016\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0018¨\u0006\u001b"}, d2 = {"Lgen/model/MediaResourceExternalLink;", "Lcom/squareup/wire/AndroidMessage;", "Lcm7;", "", "", "quotes", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Lh21;)V", "newBuilder", "()Lcm7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Lh21;)Lgen/model/MediaResourceExternalLink;", "Ljava/util/List;", "Companion", "dm7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResourceExternalLink extends AndroidMessage<MediaResourceExternalLink, cm7> {
    public static final ProtoAdapter<MediaResourceExternalLink> ADAPTER;
    public static final Parcelable.Creator<MediaResourceExternalLink> CREATOR;
    public static final dm7 Companion = new dm7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<String> quotes;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResourceExternalLink.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResourceExternalLink> protoAdapter = new ProtoAdapter<MediaResourceExternalLink>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResourceExternalLink$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceExternalLink decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResourceExternalLink(arrayListF, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(ProtoAdapter.STRING.decode(reader));
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResourceExternalLink value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.asRepeated().encodeWithTag(writer, 1, value.quotes);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResourceExternalLink value) {
                value.getClass();
                return ProtoAdapter.STRING.asRepeated().encodedSizeWithTag(1, value.quotes) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceExternalLink redact(MediaResourceExternalLink value) {
                value.getClass();
                return MediaResourceExternalLink.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResourceExternalLink value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.asRepeated().encodeWithTag(writer, 1, value.quotes);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResourceExternalLink(List<String> list, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.quotes = Internal.immutableCopyOf("quotes", list);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ MediaResourceExternalLink copy$default(MediaResourceExternalLink mediaResourceExternalLink, List list, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = mediaResourceExternalLink.quotes;
        }
        if ((i & 2) != 0) {
            h21Var = mediaResourceExternalLink.unknownFields();
        }
        return mediaResourceExternalLink.copy(list, h21Var);
    }

    public final MediaResourceExternalLink copy(List<String> quotes, h21 unknownFields) {
        quotes.getClass();
        unknownFields.getClass();
        return new MediaResourceExternalLink(quotes, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResourceExternalLink)) {
            return false;
        }
        MediaResourceExternalLink mediaResourceExternalLink = (MediaResourceExternalLink) other;
        return g76.L(unknownFields(), mediaResourceExternalLink.unknownFields()) && g76.L(this.quotes, mediaResourceExternalLink.quotes);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.quotes.hashCode() + (unknownFields().hashCode() * 37);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final cm7 newBuilder() {
        cm7 cm7Var = new cm7();
        cm7Var.a = ey3.a;
        cm7Var.a = this.quotes;
        cm7Var.addUnknownFields(unknownFields());
        return cm7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.quotes.isEmpty()) {
            arrayList.add("quotes=".concat(Internal.sanitize(this.quotes)));
        }
        return bu1.F0(arrayList, ", ", "MediaResourceExternalLink{", "}", null, 56);
    }

    public /* synthetic */ MediaResourceExternalLink(List list, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? ey3.a : list, (i & 2) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public MediaResourceExternalLink() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }
}
