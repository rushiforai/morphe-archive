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
import defpackage.wb0;
import defpackage.wg6;
import defpackage.xb0;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u0019B\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J#\u0010\u0015\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0015\u0010\u0016R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0017¨\u0006\u001a"}, d2 = {"Lgen/model/AuroraTheme;", "Lcom/squareup/wire/AndroidMessage;", "Lwb0;", "", "aurora_theme_json", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lh21;)V", "newBuilder", "()Lwb0;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lh21;)Lgen/model/AuroraTheme;", "Ljava/lang/String;", "Companion", "xb0", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AuroraTheme extends AndroidMessage<AuroraTheme, wb0> {
    public static final ProtoAdapter<AuroraTheme> ADAPTER;
    public static final Parcelable.Creator<AuroraTheme> CREATOR;
    public static final xb0 Companion = new xb0();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String aurora_theme_json;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AuroraTheme.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AuroraTheme> protoAdapter = new ProtoAdapter<AuroraTheme>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.AuroraTheme$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AuroraTheme decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AuroraTheme(strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AuroraTheme value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.aurora_theme_json);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AuroraTheme value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(1, value.aurora_theme_json) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AuroraTheme redact(AuroraTheme value) {
                value.getClass();
                return AuroraTheme.copy$default(value, null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AuroraTheme value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.aurora_theme_json);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AuroraTheme(String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AuroraTheme copy$default(AuroraTheme auroraTheme, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = auroraTheme.aurora_theme_json;
        }
        if ((i & 2) != 0) {
            h21Var = auroraTheme.unknownFields();
        }
        return auroraTheme.copy(str, h21Var);
    }

    public final AuroraTheme copy(String aurora_theme_json, h21 unknownFields) {
        unknownFields.getClass();
        return new AuroraTheme(aurora_theme_json, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AuroraTheme)) {
            return false;
        }
        AuroraTheme auroraTheme = (AuroraTheme) other;
        return g76.L(unknownFields(), auroraTheme.unknownFields()) && g76.L(this.aurora_theme_json, auroraTheme.aurora_theme_json);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.aurora_theme_json;
        int iHashCode2 = iHashCode + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final wb0 newBuilder() {
        wb0 wb0Var = new wb0();
        wb0Var.a = this.aurora_theme_json;
        wb0Var.addUnknownFields(unknownFields());
        return wb0Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.aurora_theme_json;
        if (str != null) {
            lv8.D(str, "aurora_theme_json=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "AuroraTheme{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AuroraTheme() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AuroraTheme(String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.aurora_theme_json = str;
    }
}
