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
import defpackage.l27;
import defpackage.lv8;
import defpackage.m27;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB1\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00072\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J7\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0014\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/ListPresented;", "Lcom/squareup/wire/AndroidMessage;", "Ll27;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "", "is_viewing_local_content", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ZLh21;)V", "newBuilder", "()Ll27;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;ZLh21;)Lcom/medium/proto/event/ListPresented;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Z", "Companion", "m27", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.presented")
public final class ListPresented extends AndroidMessage<ListPresented, l27> {
    public static final ProtoAdapter<ListPresented> ADAPTER;
    public static final Parcelable.Creator<ListPresented> CREATOR;
    public static final m27 Companion = new m27();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", jsonName = "isViewingLocalContent", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final boolean is_viewing_local_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListPresented.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListPresented> protoAdapter = new ProtoAdapter<ListPresented>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListPresented$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListPresented decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                boolean zBooleanValue = false;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ListPresented(analyticsEventCommonFieldsDecode, strDecode, zBooleanValue, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        zBooleanValue = ProtoAdapter.BOOL.decode(reader).booleanValue();
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ListPresented value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                boolean z = value.is_viewing_local_content;
                if (z) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 3, Boolean.valueOf(z));
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListPresented value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                boolean z = value.is_viewing_local_content;
                return z ? ProtoAdapter.BOOL.encodedSizeWithTag(3, Boolean.valueOf(z)) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListPresented redact(ListPresented value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListPresented.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, false, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListPresented value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                boolean z = value.is_viewing_local_content;
                if (z) {
                    ProtoAdapter.BOOL.encodeWithTag(writer, 3, Boolean.valueOf(z));
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

    public /* synthetic */ ListPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, boolean z, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? false : z, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListPresented copy$default(ListPresented listPresented, AnalyticsEventCommonFields analyticsEventCommonFields, String str, boolean z, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = listPresented.common_fields;
        }
        if ((i & 2) != 0) {
            str = listPresented.list_id;
        }
        if ((i & 4) != 0) {
            z = listPresented.is_viewing_local_content;
        }
        if ((i & 8) != 0) {
            h21Var = listPresented.unknownFields();
        }
        return listPresented.copy(analyticsEventCommonFields, str, z, h21Var);
    }

    public final ListPresented copy(AnalyticsEventCommonFields common_fields, String list_id, boolean is_viewing_local_content, h21 unknownFields) {
        list_id.getClass();
        unknownFields.getClass();
        return new ListPresented(common_fields, list_id, is_viewing_local_content, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListPresented)) {
            return false;
        }
        ListPresented listPresented = (ListPresented) other;
        return g76.L(unknownFields(), listPresented.unknownFields()) && g76.L(this.common_fields, listPresented.common_fields) && g76.L(this.list_id, listPresented.list_id) && this.is_viewing_local_content == listPresented.is_viewing_local_content;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id) + (this.is_viewing_local_content ? 1231 : 1237);
        this.hashCode = iO;
        return iO;
    }

    @Override // com.squareup.wire.Message
    public final l27 newBuilder() {
        l27 l27Var = new l27();
        l27Var.b = "";
        l27Var.a = this.common_fields;
        l27Var.b = this.list_id;
        l27Var.c = this.is_viewing_local_content;
        l27Var.addUnknownFields(unknownFields());
        return l27Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        arrayList.add("is_viewing_local_content=" + this.is_viewing_local_content);
        return bu1.F0(arrayList, ", ", "ListPresented{", "}", null, 56);
    }

    public ListPresented() {
        this(null, null, false, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListPresented(AnalyticsEventCommonFields analyticsEventCommonFields, String str, boolean z, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.is_viewing_local_content = z;
    }
}
