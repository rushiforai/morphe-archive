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
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.pg3;
import defpackage.qg3;
import defpackage.wg6;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB9\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J?\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u001a\u0010\b\u001a\b\u0012\u0004\u0012\u00020\u00050\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001d¨\u0006 "}, d2 = {"Lgen/model/DismissOption;", "Lcom/squareup/wire/AndroidMessage;", "Lpg3;", "Lgen/model/SignalReason;", "signal_reason", "", "dismiss_message", "", "entity_ids", "Lh21;", "unknownFields", "<init>", "(Lgen/model/SignalReason;Ljava/lang/String;Ljava/util/List;Lh21;)V", "newBuilder", "()Lpg3;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/SignalReason;Ljava/lang/String;Ljava/util/List;Lh21;)Lgen/model/DismissOption;", "Lgen/model/SignalReason;", "Ljava/lang/String;", "Ljava/util/List;", "Companion", "qg3", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DismissOption extends AndroidMessage<DismissOption, pg3> {
    public static final ProtoAdapter<DismissOption> ADAPTER;
    public static final Parcelable.Creator<DismissOption> CREATOR;
    public static final qg3 Companion = new qg3();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String dismiss_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 2, tag = 3)
    public final List<String> entity_ids;

    @WireField(adapter = "gen.model.SignalReason#ADAPTER", schemaIndex = 0, tag = 1)
    public final SignalReason signal_reason;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(DismissOption.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<DismissOption> protoAdapter = new ProtoAdapter<DismissOption>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.DismissOption$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final DismissOption decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                SignalReason signalReasonDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new DismissOption(signalReasonDecode, strDecode, arrayListF, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        try {
                            signalReasonDecode = SignalReason.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        arrayListF.add(ProtoAdapter.STRING.decode(reader));
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, DismissOption value) {
                writer.getClass();
                value.getClass();
                SignalReason.ADAPTER.encodeWithTag(writer, 1, value.signal_reason);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.dismiss_message);
                protoAdapter2.asRepeated().encodeWithTag(writer, 3, value.entity_ids);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(DismissOption value) {
                value.getClass();
                int iEncodedSizeWithTag = SignalReason.ADAPTER.encodedSizeWithTag(1, value.signal_reason) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.asRepeated().encodedSizeWithTag(3, value.entity_ids) + protoAdapter2.encodedSizeWithTag(2, value.dismiss_message) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final DismissOption redact(DismissOption value) {
                value.getClass();
                return DismissOption.copy$default(value, null, null, null, h21.d, 7, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, DismissOption value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.asRepeated().encodeWithTag(writer, 3, value.entity_ids);
                protoAdapter2.encodeWithTag(writer, 2, value.dismiss_message);
                SignalReason.ADAPTER.encodeWithTag(writer, 1, value.signal_reason);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ DismissOption(SignalReason signalReason, String str, List list, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : signalReason, (i & 2) != 0 ? null : str, (i & 4) != 0 ? ey3.a : list, (i & 8) != 0 ? h21.d : h21Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DismissOption copy$default(DismissOption dismissOption, SignalReason signalReason, String str, List list, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            signalReason = dismissOption.signal_reason;
        }
        if ((i & 2) != 0) {
            str = dismissOption.dismiss_message;
        }
        if ((i & 4) != 0) {
            list = dismissOption.entity_ids;
        }
        if ((i & 8) != 0) {
            h21Var = dismissOption.unknownFields();
        }
        return dismissOption.copy(signalReason, str, list, h21Var);
    }

    public final DismissOption copy(SignalReason signal_reason, String dismiss_message, List<String> entity_ids, h21 unknownFields) {
        entity_ids.getClass();
        unknownFields.getClass();
        return new DismissOption(signal_reason, dismiss_message, entity_ids, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof DismissOption)) {
            return false;
        }
        DismissOption dismissOption = (DismissOption) other;
        return g76.L(unknownFields(), dismissOption.unknownFields()) && this.signal_reason == dismissOption.signal_reason && g76.L(this.dismiss_message, dismissOption.dismiss_message) && g76.L(this.entity_ids, dismissOption.entity_ids);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        SignalReason signalReason = this.signal_reason;
        int iHashCode2 = (iHashCode + (signalReason != null ? signalReason.hashCode() : 0)) * 37;
        String str = this.dismiss_message;
        int iHashCode3 = this.entity_ids.hashCode() + ((iHashCode2 + (str != null ? str.hashCode() : 0)) * 37);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final pg3 newBuilder() {
        pg3 pg3Var = new pg3();
        pg3Var.c = ey3.a;
        pg3Var.a = this.signal_reason;
        pg3Var.b = this.dismiss_message;
        pg3Var.c = this.entity_ids;
        pg3Var.addUnknownFields(unknownFields());
        return pg3Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        SignalReason signalReason = this.signal_reason;
        if (signalReason != null) {
            arrayList.add("signal_reason=" + signalReason);
        }
        String str = this.dismiss_message;
        if (str != null) {
            lv8.D(str, "dismiss_message=", arrayList);
        }
        if (!this.entity_ids.isEmpty()) {
            arrayList.add("entity_ids=".concat(Internal.sanitize(this.entity_ids)));
        }
        return bu1.F0(arrayList, ", ", "DismissOption{", "}", null, 56);
    }

    public DismissOption() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DismissOption(SignalReason signalReason, String str, List<String> list, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.signal_reason = signalReason;
        this.dismiss_message = str;
        this.entity_ids = Internal.immutableCopyOf("entity_ids", list);
    }
}
