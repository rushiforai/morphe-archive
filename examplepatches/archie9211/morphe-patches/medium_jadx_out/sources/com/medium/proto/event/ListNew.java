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
import defpackage.a27;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import defpackage.z17;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 B;\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0005\u0012\b\b\u0002\u0010\t\u001a\u00020\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JA\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0014\u0010\u0007\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0014\u0010\t\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/ListNew;", "Lcom/squareup/wire/AndroidMessage;", "Lz17;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "list_name", "Lcom/medium/proto/event/ListPrivacyLevel;", "list_privacy_level", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/ListPrivacyLevel;Lh21;)V", "newBuilder", "()Lz17;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/event/ListPrivacyLevel;Lh21;)Lcom/medium/proto/event/ListNew;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lcom/medium/proto/event/ListPrivacyLevel;", "Companion", "a27", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.new")
public final class ListNew extends AndroidMessage<ListNew, z17> {
    public static final ProtoAdapter<ListNew> ADAPTER;
    public static final Parcelable.Creator<ListNew> CREATOR;
    public static final a27 Companion = new a27();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listName", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final String list_name;

    @WireField(adapter = "com.medium.proto.event.ListPrivacyLevel#ADAPTER", jsonName = "listPrivacyLevel", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 3, tag = 4)
    public final ListPrivacyLevel list_privacy_level;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListNew.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListNew> protoAdapter = new ProtoAdapter<ListNew>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListNew$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListNew decode(ProtoReader reader) {
                reader.getClass();
                ListPrivacyLevel listPrivacyLevelDecode = ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC;
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = "";
                String strDecode2 = strDecode;
                while (true) {
                    AnalyticsEventCommonFields analyticsEventCommonFields = analyticsEventCommonFieldsDecode;
                    while (true) {
                        int iNextTag = reader.nextTag();
                        if (iNextTag == -1) {
                            return new ListNew(analyticsEventCommonFields, strDecode, strDecode2, listPrivacyLevelDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                        }
                        if (iNextTag != 1) {
                            if (iNextTag == 2) {
                                strDecode = ProtoAdapter.STRING.decode(reader);
                            } else if (iNextTag == 3) {
                                strDecode2 = ProtoAdapter.STRING.decode(reader);
                            } else if (iNextTag != 4) {
                                reader.readUnknownField(iNextTag);
                            } else {
                                try {
                                    listPrivacyLevelDecode = ListPrivacyLevel.ADAPTER.decode(reader);
                                } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                    reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                }
                            }
                        }
                    }
                    analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ListNew value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                if (!g76.L(value.list_name, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value.list_name);
                }
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                if (listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC) {
                    ListPrivacyLevel.ADAPTER.encodeWithTag(writer, 4, listPrivacyLevel);
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListNew value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                if (!g76.L(value.list_name, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(3, value.list_name);
                }
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                return listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC ? ListPrivacyLevel.ADAPTER.encodedSizeWithTag(4, listPrivacyLevel) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListNew redact(ListNew value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListNew.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListNew value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                if (listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC) {
                    ListPrivacyLevel.ADAPTER.encodeWithTag(writer, 4, listPrivacyLevel);
                }
                if (!g76.L(value.list_name, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 3, value.list_name);
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

    public /* synthetic */ ListNew(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, ListPrivacyLevel listPrivacyLevel, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? "" : str2, (i & 8) != 0 ? ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC : listPrivacyLevel, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListNew copy$default(ListNew listNew, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, ListPrivacyLevel listPrivacyLevel, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = listNew.common_fields;
        }
        if ((i & 2) != 0) {
            str = listNew.list_id;
        }
        if ((i & 4) != 0) {
            str2 = listNew.list_name;
        }
        if ((i & 8) != 0) {
            listPrivacyLevel = listNew.list_privacy_level;
        }
        if ((i & 16) != 0) {
            h21Var = listNew.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str3 = str2;
        return listNew.copy(analyticsEventCommonFields, str, str3, listPrivacyLevel, h21Var2);
    }

    public final ListNew copy(AnalyticsEventCommonFields common_fields, String list_id, String list_name, ListPrivacyLevel list_privacy_level, h21 unknownFields) {
        list_id.getClass();
        list_name.getClass();
        list_privacy_level.getClass();
        unknownFields.getClass();
        return new ListNew(common_fields, list_id, list_name, list_privacy_level, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListNew)) {
            return false;
        }
        ListNew listNew = (ListNew) other;
        return g76.L(unknownFields(), listNew.unknownFields()) && g76.L(this.common_fields, listNew.common_fields) && g76.L(this.list_id, listNew.list_id) && g76.L(this.list_name, listNew.list_name) && this.list_privacy_level == listNew.list_privacy_level;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = this.list_privacy_level.hashCode() + wgd.o(wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id), 37, this.list_name);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final z17 newBuilder() {
        z17 z17Var = new z17();
        z17Var.b = "";
        z17Var.c = "";
        z17Var.d = ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC;
        z17Var.a = this.common_fields;
        z17Var.b = this.list_id;
        z17Var.c = this.list_name;
        z17Var.d = this.list_privacy_level;
        z17Var.addUnknownFields(unknownFields());
        return z17Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        lv8.D(this.list_name, "list_name=", arrayList);
        arrayList.add("list_privacy_level=" + this.list_privacy_level);
        return bu1.F0(arrayList, ", ", "ListNew{", "}", null, 56);
    }

    public ListNew() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListNew(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, ListPrivacyLevel listPrivacyLevel, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        listPrivacyLevel.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.list_name = str2;
        this.list_privacy_level = listPrivacyLevel;
    }
}
