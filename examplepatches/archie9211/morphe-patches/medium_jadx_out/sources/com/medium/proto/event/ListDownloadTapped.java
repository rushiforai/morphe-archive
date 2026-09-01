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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.p17;
import defpackage.q17;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0010\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 B;\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0013\u001a\u00020\t2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JA\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0014\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0014\u0010\n\u001a\u00020\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/ListDownloadTapped;", "Lcom/squareup/wire/AndroidMessage;", "Lp17;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "", "items_count", "", "is_medium_member", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;IZLh21;)V", "newBuilder", "()Lp17;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;IZLh21;)Lcom/medium/proto/event/ListDownloadTapped;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "I", "Z", "Companion", "q17", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.downloadTapped")
public final class ListDownloadTapped extends AndroidMessage<ListDownloadTapped, p17> {
    public static final ProtoAdapter<ListDownloadTapped> ADAPTER;
    public static final Parcelable.Creator<ListDownloadTapped> CREATOR;
    public static final q17 Companion = new q17();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", jsonName = "isMediumMember", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 3, tag = 4)
    public final boolean is_medium_member;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "itemsCount", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final int items_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListDownloadTapped.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListDownloadTapped> protoAdapter = new ProtoAdapter<ListDownloadTapped>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListDownloadTapped$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListDownloadTapped decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                int iIntValue = 0;
                boolean zBooleanValue = false;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ListDownloadTapped(analyticsEventCommonFieldsDecode, strDecode, iIntValue, zBooleanValue, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        iIntValue = ProtoAdapter.INT32.decode(reader).intValue();
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        zBooleanValue = ProtoAdapter.BOOL.decode(reader).booleanValue();
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ListDownloadTapped value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                int i = value.items_count;
                if (i != 0) {
                    ProtoAdapter.INT32.encodeWithTag(writer, 3, Integer.valueOf(i));
                }
                boolean z = value.is_medium_member;
                if (z) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 4, Boolean.valueOf(z));
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListDownloadTapped value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                int i = value.items_count;
                if (i != 0) {
                    iE += ProtoAdapter.INT32.encodedSizeWithTag(3, Integer.valueOf(i));
                }
                boolean z = value.is_medium_member;
                return z ? ProtoAdapter.BOOL.encodedSizeWithTag(4, Boolean.valueOf(z)) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListDownloadTapped redact(ListDownloadTapped value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListDownloadTapped.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, 0, false, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListDownloadTapped value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                boolean z = value.is_medium_member;
                if (z) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 4, Boolean.valueOf(z));
                }
                int i = value.items_count;
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

    public /* synthetic */ ListDownloadTapped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, boolean z, h21 h21Var, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? null : analyticsEventCommonFields, (i2 & 2) != 0 ? "" : str, (i2 & 4) != 0 ? 0 : i, (i2 & 8) != 0 ? false : z, (i2 & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListDownloadTapped copy$default(ListDownloadTapped listDownloadTapped, AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, boolean z, h21 h21Var, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            analyticsEventCommonFields = listDownloadTapped.common_fields;
        }
        if ((i2 & 2) != 0) {
            str = listDownloadTapped.list_id;
        }
        if ((i2 & 4) != 0) {
            i = listDownloadTapped.items_count;
        }
        if ((i2 & 8) != 0) {
            z = listDownloadTapped.is_medium_member;
        }
        if ((i2 & 16) != 0) {
            h21Var = listDownloadTapped.unknownFields();
        }
        h21 h21Var2 = h21Var;
        int i3 = i;
        return listDownloadTapped.copy(analyticsEventCommonFields, str, i3, z, h21Var2);
    }

    public final ListDownloadTapped copy(AnalyticsEventCommonFields common_fields, String list_id, int items_count, boolean is_medium_member, h21 unknownFields) {
        list_id.getClass();
        unknownFields.getClass();
        return new ListDownloadTapped(common_fields, list_id, items_count, is_medium_member, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListDownloadTapped)) {
            return false;
        }
        ListDownloadTapped listDownloadTapped = (ListDownloadTapped) other;
        return g76.L(unknownFields(), listDownloadTapped.unknownFields()) && g76.L(this.common_fields, listDownloadTapped.common_fields) && g76.L(this.list_id, listDownloadTapped.list_id) && this.items_count == listDownloadTapped.items_count && this.is_medium_member == listDownloadTapped.is_medium_member;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = ((wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id) + this.items_count) * 37) + (this.is_medium_member ? 1231 : 1237);
        this.hashCode = iO;
        return iO;
    }

    @Override // com.squareup.wire.Message
    public final p17 newBuilder() {
        p17 p17Var = new p17();
        p17Var.b = "";
        p17Var.a = this.common_fields;
        p17Var.b = this.list_id;
        p17Var.c = this.items_count;
        p17Var.d = this.is_medium_member;
        p17Var.addUnknownFields(unknownFields());
        return p17Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        arrayList.add("items_count=" + this.items_count);
        arrayList.add("is_medium_member=" + this.is_medium_member);
        return bu1.F0(arrayList, ", ", "ListDownloadTapped{", "}", null, 56);
    }

    public ListDownloadTapped() {
        this(null, null, 0, false, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListDownloadTapped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, int i, boolean z, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.items_count = i;
        this.is_medium_member = z;
    }
}
