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
import defpackage.d1d;
import defpackage.e1d;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0019B\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J#\u0010\u0015\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0015\u0010\u0016R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0017¨\u0006\u001a"}, d2 = {"Lgen/model/SuggestionReasonPopchunk;", "Lcom/squareup/wire/AndroidMessage;", "Ld1d;", "", "popchunk_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lh21;)V", "newBuilder", "()Ld1d;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lh21;)Lgen/model/SuggestionReasonPopchunk;", "Ljava/lang/String;", "Companion", "e1d", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SuggestionReasonPopchunk extends AndroidMessage<SuggestionReasonPopchunk, d1d> {
    public static final ProtoAdapter<SuggestionReasonPopchunk> ADAPTER;
    public static final Parcelable.Creator<SuggestionReasonPopchunk> CREATOR;
    public static final e1d Companion = new e1d();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String popchunk_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(SuggestionReasonPopchunk.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<SuggestionReasonPopchunk> protoAdapter = new ProtoAdapter<SuggestionReasonPopchunk>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.SuggestionReasonPopchunk$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonPopchunk decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new SuggestionReasonPopchunk(strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, SuggestionReasonPopchunk value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.popchunk_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(SuggestionReasonPopchunk value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(1, value.popchunk_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final SuggestionReasonPopchunk redact(SuggestionReasonPopchunk value) {
                value.getClass();
                return SuggestionReasonPopchunk.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, SuggestionReasonPopchunk value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.popchunk_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ SuggestionReasonPopchunk(String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ SuggestionReasonPopchunk copy$default(SuggestionReasonPopchunk suggestionReasonPopchunk, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = suggestionReasonPopchunk.popchunk_id;
        }
        if ((i & 2) != 0) {
            h21Var = suggestionReasonPopchunk.unknownFields();
        }
        return suggestionReasonPopchunk.copy(str, h21Var);
    }

    public final SuggestionReasonPopchunk copy(String popchunk_id, h21 unknownFields) {
        unknownFields.getClass();
        return new SuggestionReasonPopchunk(popchunk_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof SuggestionReasonPopchunk)) {
            return false;
        }
        SuggestionReasonPopchunk suggestionReasonPopchunk = (SuggestionReasonPopchunk) other;
        return g76.L(unknownFields(), suggestionReasonPopchunk.unknownFields()) && g76.L(this.popchunk_id, suggestionReasonPopchunk.popchunk_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.popchunk_id;
        int iHashCode2 = iHashCode + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final d1d newBuilder() {
        d1d d1dVar = new d1d();
        d1dVar.a = this.popchunk_id;
        d1dVar.addUnknownFields(unknownFields());
        return d1dVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.popchunk_id;
        if (str != null) {
            lv8.D(str, "popchunk_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "SuggestionReasonPopchunk{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public SuggestionReasonPopchunk() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SuggestionReasonPopchunk(String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.popchunk_id = str;
    }
}
