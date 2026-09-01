package pushnotifications;

import android.os.Parcelable;
import androidx.core.widget.nRCC.nGxjfIr;
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
import defpackage.sj;
import defpackage.tj;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB'\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u000f\u0010\n\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\fH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J-\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0018¨\u0006\u001b"}, d2 = {"Lpushnotifications/Analytics;", "Lcom/squareup/wire/AndroidMessage;", "Lsj;", "", "notification_type", "post_id", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lsj;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lh21;)Lpushnotifications/Analytics;", "Ljava/lang/String;", "Companion", "tj", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Analytics extends AndroidMessage<Analytics, sj> {
    public static final ProtoAdapter<Analytics> ADAPTER;
    public static final Parcelable.Creator<Analytics> CREATOR;
    public static final tj Companion = new tj();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "notificationType", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final String notification_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Analytics.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<Analytics> protoAdapter = new ProtoAdapter<Analytics>(fieldEncoding, wg6VarB, syntax) { // from class: pushnotifications.Analytics$Companion$ADAPTER$1
            @Override // com.squareup.wire.ProtoAdapter
            public final Analytics decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = "";
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Analytics(strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Analytics value) {
                writer.getClass();
                value.getClass();
                if (!g76.L(value.notification_type, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 1, value.notification_type);
                }
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Analytics value) {
                value.getClass();
                int iE = value.unknownFields().e();
                if (!g76.L(value.notification_type, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(1, value.notification_type);
                }
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.post_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Analytics redact(Analytics value) {
                value.getClass();
                return Analytics.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Analytics value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                if (g76.L(value.notification_type, nGxjfIr.VAWFqDfi)) {
                    return;
                }
                protoAdapter2.encodeWithTag(writer, 1, value.notification_type);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Analytics(String str, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? "" : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ Analytics copy$default(Analytics analytics, String str, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = analytics.notification_type;
        }
        if ((i & 2) != 0) {
            str2 = analytics.post_id;
        }
        if ((i & 4) != 0) {
            h21Var = analytics.unknownFields();
        }
        return analytics.copy(str, str2, h21Var);
    }

    public final Analytics copy(String notification_type, String post_id, h21 unknownFields) {
        notification_type.getClass();
        unknownFields.getClass();
        return new Analytics(notification_type, post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Analytics)) {
            return false;
        }
        Analytics analytics = (Analytics) other;
        return g76.L(unknownFields(), analytics.unknownFields()) && g76.L(this.notification_type, analytics.notification_type) && g76.L(this.post_id, analytics.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iO = wgd.o(unknownFields().hashCode() * 37, 37, this.notification_type);
        String str = this.post_id;
        int iHashCode = iO + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final sj newBuilder() {
        sj sjVar = new sj();
        sjVar.a = "";
        sjVar.a = this.notification_type;
        sjVar.b = this.post_id;
        sjVar.addUnknownFields(unknownFields());
        return sjVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.notification_type, "notification_type=", arrayList);
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "Analytics{", "}", null, 56);
    }

    public Analytics() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Analytics(String str, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.notification_type = str;
        this.post_id = str2;
    }
}
