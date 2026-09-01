package com.medium.proto.event;

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
import defpackage.n1b;
import defpackage.pv3;
import defpackage.qv3;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u00192\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001aB\u001d\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\t\u0010\nJ\u001a\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u000bH\u0096\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0011\u001a\u00020\u0010H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J#\u0010\u0016\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u0005¢\u0006\u0004\b\u0016\u0010\u0017R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0018¨\u0006\u001b"}, d2 = {"Lcom/medium/proto/event/EditorQuoteToggle;", "Lcom/squareup/wire/AndroidMessage;", "Lpv3;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lh21;)V", "newBuilder", "()Lpv3;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lh21;)Lcom/medium/proto/event/EditorQuoteToggle;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Companion", "qv3", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("editor.quoteToggle")
public final class EditorQuoteToggle extends AndroidMessage<EditorQuoteToggle, pv3> {
    public static final ProtoAdapter<EditorQuoteToggle> ADAPTER;
    public static final Parcelable.Creator<EditorQuoteToggle> CREATOR;
    public static final qv3 Companion = new qv3();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(EditorQuoteToggle.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<EditorQuoteToggle> protoAdapter = new ProtoAdapter<EditorQuoteToggle>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.EditorQuoteToggle$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final EditorQuoteToggle decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new EditorQuoteToggle(analyticsEventCommonFieldsDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else {
                        reader.readUnknownField(iNextTag);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, EditorQuoteToggle value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(EditorQuoteToggle value) {
                value.getClass();
                return AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final EditorQuoteToggle redact(EditorQuoteToggle value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return value.copy(analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, EditorQuoteToggle value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ EditorQuoteToggle(AnalyticsEventCommonFields analyticsEventCommonFields, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ EditorQuoteToggle copy$default(EditorQuoteToggle editorQuoteToggle, AnalyticsEventCommonFields analyticsEventCommonFields, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = editorQuoteToggle.common_fields;
        }
        if ((i & 2) != 0) {
            h21Var = editorQuoteToggle.unknownFields();
        }
        return editorQuoteToggle.copy(analyticsEventCommonFields, h21Var);
    }

    public final EditorQuoteToggle copy(AnalyticsEventCommonFields common_fields, h21 unknownFields) {
        unknownFields.getClass();
        return new EditorQuoteToggle(common_fields, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof EditorQuoteToggle)) {
            return false;
        }
        EditorQuoteToggle editorQuoteToggle = (EditorQuoteToggle) other;
        return g76.L(unknownFields(), editorQuoteToggle.unknownFields()) && g76.L(this.common_fields, editorQuoteToggle.common_fields);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final pv3 newBuilder() {
        pv3 pv3Var = new pv3();
        pv3Var.a = this.common_fields;
        pv3Var.addUnknownFields(unknownFields());
        return pv3Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        return bu1.F0(arrayList, ", ", "EditorQuoteToggle{", "}", null, 56);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public EditorQuoteToggle() {
        this(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditorQuoteToggle(AnalyticsEventCommonFields analyticsEventCommonFields, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
    }
}
