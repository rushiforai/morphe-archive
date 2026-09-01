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
import defpackage.i17;
import defpackage.j17;
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
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB1\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J7\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0014\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/ListClientUpvote;", "Lcom/squareup/wire/AndroidMessage;", "Li17;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "", "vote_count", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ILh21;)V", "newBuilder", "()Li17;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ILh21;)Lcom/medium/proto/event/ListClientUpvote;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "I", "Companion", "j17", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.clientUpvote")
public final class ListClientUpvote extends AndroidMessage<ListClientUpvote, i17> {
    public static final ProtoAdapter<ListClientUpvote> ADAPTER;
    public static final Parcelable.Creator<ListClientUpvote> CREATOR;
    public static final j17 Companion = new j17();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "voteCount", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final int vote_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListClientUpvote.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListClientUpvote> protoAdapter = new ProtoAdapter<ListClientUpvote>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListClientUpvote$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListClientUpvote decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                int iIntValue = 0;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ListClientUpvote(analyticsEventCommonFieldsDecode, strDecode, iIntValue, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
            public final void encode(ProtoWriter writer, ListClientUpvote value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                int i = value.vote_count;
                if (i != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 3, Integer.valueOf(i));
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListClientUpvote value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                int i = value.vote_count;
                return i != 0 ? ProtoAdapter.INT32.encodedSizeWithTag(3, Integer.valueOf(i)) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListClientUpvote redact(ListClientUpvote value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListClientUpvote.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, 0, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListClientUpvote value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                int i = value.vote_count;
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

    public /* synthetic */ ListClientUpvote(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? null : analyticsEventCommonFields, (i2 & 2) != 0 ? "" : str, (i2 & 4) != 0 ? 0 : i, (i2 & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListClientUpvote copy$default(ListClientUpvote listClientUpvote, AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            analyticsEventCommonFields = listClientUpvote.common_fields;
        }
        if ((i2 & 2) != 0) {
            str = listClientUpvote.list_id;
        }
        if ((i2 & 4) != 0) {
            i = listClientUpvote.vote_count;
        }
        if ((i2 & 8) != 0) {
            h21Var = listClientUpvote.unknownFields();
        }
        return listClientUpvote.copy(analyticsEventCommonFields, str, i, h21Var);
    }

    public final ListClientUpvote copy(AnalyticsEventCommonFields common_fields, String list_id, int vote_count, h21 unknownFields) {
        list_id.getClass();
        unknownFields.getClass();
        return new ListClientUpvote(common_fields, list_id, vote_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListClientUpvote)) {
            return false;
        }
        ListClientUpvote listClientUpvote = (ListClientUpvote) other;
        return g76.L(unknownFields(), listClientUpvote.unknownFields()) && g76.L(this.common_fields, listClientUpvote.common_fields) && g76.L(this.list_id, listClientUpvote.list_id) && this.vote_count == listClientUpvote.vote_count;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id) + this.vote_count;
        this.hashCode = iO;
        return iO;
    }

    @Override // com.squareup.wire.Message
    public final i17 newBuilder() {
        i17 i17Var = new i17();
        i17Var.b = "";
        i17Var.a = this.common_fields;
        i17Var.b = this.list_id;
        i17Var.c = this.vote_count;
        i17Var.addUnknownFields(unknownFields());
        return i17Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        arrayList.add("vote_count=" + this.vote_count);
        return bu1.F0(arrayList, ", ", "ListClientUpvote{", "}", null, 56);
    }

    public ListClientUpvote() {
        this(null, null, 0, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListClientUpvote(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.vote_count = i;
    }
}
