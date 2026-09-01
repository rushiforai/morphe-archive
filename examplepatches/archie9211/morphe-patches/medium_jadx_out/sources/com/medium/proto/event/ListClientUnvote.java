package com.medium.proto.event;

import android.os.Parcelable;
import com.medium.android.admin.stagebranch.uG.peNPu;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.g17;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h17;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB1\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J7\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0014\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/ListClientUnvote;", "Lcom/squareup/wire/AndroidMessage;", "Lg17;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "", "unvote_count", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ILh21;)V", "newBuilder", "()Lg17;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ILh21;)Lcom/medium/proto/event/ListClientUnvote;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "I", "Companion", "h17", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.clientUnvote")
public final class ListClientUnvote extends AndroidMessage<ListClientUnvote, g17> {
    public static final ProtoAdapter<ListClientUnvote> ADAPTER;
    public static final Parcelable.Creator<ListClientUnvote> CREATOR;
    public static final h17 Companion = new h17();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "unvoteCount", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final int unvote_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListClientUnvote.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListClientUnvote> protoAdapter = new ProtoAdapter<ListClientUnvote>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListClientUnvote$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListClientUnvote decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ListClientUnvote(analyticsEventCommonFieldsDecode, strDecode, iIntValue, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ListClientUnvote value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                int i = value.unvote_count;
                if (i != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 3, Integer.valueOf(i));
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListClientUnvote value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                int i = value.unvote_count;
                return i != 0 ? ProtoAdapter.INT32.encodedSizeWithTag(3, Integer.valueOf(i)) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListClientUnvote redact(ListClientUnvote value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListClientUnvote.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, 0, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListClientUnvote value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                int i = value.unvote_count;
                if (i != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 3, Integer.valueOf(i));
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ListClientUnvote(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? null : analyticsEventCommonFields, (i2 & 2) != 0 ? "" : str, (i2 & 4) != 0 ? 0 : i, (i2 & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListClientUnvote copy$default(ListClientUnvote listClientUnvote, AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            analyticsEventCommonFields = listClientUnvote.common_fields;
        }
        if ((i2 & 2) != 0) {
            str = listClientUnvote.list_id;
        }
        if ((i2 & 4) != 0) {
            i = listClientUnvote.unvote_count;
        }
        if ((i2 & 8) != 0) {
            h21Var = listClientUnvote.unknownFields();
        }
        return listClientUnvote.copy(analyticsEventCommonFields, str, i, h21Var);
    }

    public final ListClientUnvote copy(AnalyticsEventCommonFields common_fields, String list_id, int unvote_count, h21 unknownFields) {
        list_id.getClass();
        unknownFields.getClass();
        return new ListClientUnvote(common_fields, list_id, unvote_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListClientUnvote)) {
            return false;
        }
        ListClientUnvote listClientUnvote = (ListClientUnvote) other;
        return g76.L(unknownFields(), listClientUnvote.unknownFields()) && g76.L(this.common_fields, listClientUnvote.common_fields) && g76.L(this.list_id, listClientUnvote.list_id) && this.unvote_count == listClientUnvote.unvote_count;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id) + this.unvote_count;
        this.hashCode = iO;
        return iO;
    }

    @Override // com.squareup.wire.Message
    public final g17 newBuilder() {
        g17 g17Var = new g17();
        g17Var.b = "";
        g17Var.a = this.common_fields;
        g17Var.b = this.list_id;
        g17Var.c = this.unvote_count;
        g17Var.addUnknownFields(unknownFields());
        return g17Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        arrayList.add("unvote_count=" + this.unvote_count);
        return bu1.F0(arrayList, peNPu.jvMJgHgmeHXGki, "ListClientUnvote{", "}", null, 56);
    }

    public ListClientUnvote() {
        this(null, null, 0, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListClientUnvote(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.unvote_count = i;
    }
}
