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
import defpackage.h1d;
import defpackage.h21;
import defpackage.i1d;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u001a2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001bB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J;\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0019¨\u0006\u001c"}, d2 = {"Lgen/model/SuggestionReasonTopic;", "Lcom/squareup/wire/AndroidMessage;", "Lh1d;", "", "topic_id", "slug", "name", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lh1d;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/SuggestionReasonTopic;", "Ljava/lang/String;", "Companion", "i1d", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SuggestionReasonTopic extends AndroidMessage<SuggestionReasonTopic, h1d> {
    public static final ProtoAdapter<SuggestionReasonTopic> ADAPTER;
    public static final Parcelable.Creator<SuggestionReasonTopic> CREATOR;
    public static final i1d Companion = new i1d();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String topic_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SuggestionReasonTopic.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SuggestionReasonTopic> protoAdapter = new ProtoAdapter<SuggestionReasonTopic>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.SuggestionReasonTopic$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonTopic decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SuggestionReasonTopic(strDecode, strDecode2, strDecode3, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
            public final void encode(ProtoWriter writer, SuggestionReasonTopic value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.topic_id);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                protoAdapter2.encodeWithTag(writer, 3, value.name);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SuggestionReasonTopic value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(3, value.name) + protoAdapter2.encodedSizeWithTag(2, value.slug) + protoAdapter2.encodedSizeWithTag(1, value.topic_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonTopic redact(SuggestionReasonTopic value) {
                value.getClass();
                return SuggestionReasonTopic.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SuggestionReasonTopic value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.name);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                protoAdapter2.encodeWithTag(writer, 1, value.topic_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SuggestionReasonTopic(String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SuggestionReasonTopic copy$default(SuggestionReasonTopic suggestionReasonTopic, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = suggestionReasonTopic.topic_id;
        }
        if ((i & 2) != 0) {
            str2 = suggestionReasonTopic.slug;
        }
        if ((i & 4) != 0) {
            str3 = suggestionReasonTopic.name;
        }
        if ((i & 8) != 0) {
            h21Var = suggestionReasonTopic.unknownFields();
        }
        return suggestionReasonTopic.copy(str, str2, str3, h21Var);
    }

    public final SuggestionReasonTopic copy(String topic_id, String slug, String name, h21 unknownFields) {
        unknownFields.getClass();
        return new SuggestionReasonTopic(topic_id, slug, name, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SuggestionReasonTopic)) {
            return false;
        }
        SuggestionReasonTopic suggestionReasonTopic = (SuggestionReasonTopic) other;
        return g76.L(unknownFields(), suggestionReasonTopic.unknownFields()) && g76.L(this.topic_id, suggestionReasonTopic.topic_id) && g76.L(this.slug, suggestionReasonTopic.slug) && g76.L(this.name, suggestionReasonTopic.name);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.topic_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.slug;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.name;
        int iHashCode4 = iHashCode3 + (str3 != null ? str3.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final h1d newBuilder() {
        h1d h1dVar = new h1d();
        h1dVar.a = this.topic_id;
        h1dVar.b = this.slug;
        h1dVar.c = this.name;
        h1dVar.addUnknownFields(unknownFields());
        return h1dVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.topic_id;
        if (str != null) {
            lv8.D(str, "topic_id=", arrayList);
        }
        String str2 = this.slug;
        if (str2 != null) {
            lv8.D(str2, "slug=", arrayList);
        }
        String str3 = this.name;
        if (str3 != null) {
            lv8.D(str3, "name=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SuggestionReasonTopic{", "}", null, 56);
    }

    public SuggestionReasonTopic() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SuggestionReasonTopic(String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.topic_id = str;
        this.slug = str2;
        this.name = str3;
    }
}
