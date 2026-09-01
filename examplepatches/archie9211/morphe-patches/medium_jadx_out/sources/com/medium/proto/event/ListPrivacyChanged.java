package com.medium.proto.event;

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
import defpackage.n27;
import defpackage.o27;
import defpackage.r34;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fB1\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J7\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0014\u0010\b\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/ListPrivacyChanged;", "Lcom/squareup/wire/AndroidMessage;", "Ln27;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "list_id", "Lcom/medium/proto/event/ListPrivacyLevel;", "list_privacy_level", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Lcom/medium/proto/event/ListPrivacyLevel;Lh21;)V", "newBuilder", "()Ln27;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Lcom/medium/proto/event/ListPrivacyLevel;Lh21;)Lcom/medium/proto/event/ListPrivacyChanged;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lcom/medium/proto/event/ListPrivacyLevel;", "Companion", "o27", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("list.privacyChanged")
public final class ListPrivacyChanged extends AndroidMessage<ListPrivacyChanged, n27> {
    public static final ProtoAdapter<ListPrivacyChanged> ADAPTER;
    public static final Parcelable.Creator<ListPrivacyChanged> CREATOR;
    public static final o27 Companion = new o27();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "listId", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String list_id;

    @WireField(adapter = "com.medium.proto.event.ListPrivacyLevel#ADAPTER", jsonName = "listPrivacyLevel", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 2, tag = 3)
    public final ListPrivacyLevel list_privacy_level;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ListPrivacyChanged.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<ListPrivacyChanged> protoAdapter = new ProtoAdapter<ListPrivacyChanged>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ListPrivacyChanged$Companion$ADAPTER$1
            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ListPrivacyChanged value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.list_id);
                }
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                if (listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC) {
                    ListPrivacyLevel.ADAPTER.encodeWithTag(writer, 3, listPrivacyLevel);
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ListPrivacyChanged value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.list_id, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.list_id);
                }
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                return listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC ? ListPrivacyLevel.ADAPTER.encodedSizeWithTag(3, listPrivacyLevel) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ListPrivacyChanged redact(ListPrivacyChanged value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ListPrivacyChanged.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ListPrivacyChanged decode(ProtoReader reader) {
                reader.getClass();
                ListPrivacyLevel listPrivacyLevelDecode = ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC;
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = nGxjfIr.LvnKduldCMOK;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag != -1) {
                        if (iNextTag != 1) {
                            if (iNextTag != 2) {
                                if (iNextTag != 3) {
                                    reader.readUnknownField(iNextTag);
                                } else {
                                    try {
                                        listPrivacyLevelDecode = ListPrivacyLevel.ADAPTER.decode(reader);
                                    } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                        reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                    }
                                }
                            } else {
                                strDecode = ProtoAdapter.STRING.decode(reader);
                            }
                        } else {
                            analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                        }
                    } else {
                        return new ListPrivacyChanged(analyticsEventCommonFieldsDecode, strDecode, listPrivacyLevelDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ListPrivacyChanged value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ListPrivacyLevel listPrivacyLevel = value.list_privacy_level;
                if (listPrivacyLevel != ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC) {
                    ListPrivacyLevel.ADAPTER.encodeWithTag(writer, 3, listPrivacyLevel);
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

    public /* synthetic */ ListPrivacyChanged(AnalyticsEventCommonFields analyticsEventCommonFields, String str, ListPrivacyLevel listPrivacyLevel, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC : listPrivacyLevel, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ListPrivacyChanged copy$default(ListPrivacyChanged listPrivacyChanged, AnalyticsEventCommonFields analyticsEventCommonFields, String str, ListPrivacyLevel listPrivacyLevel, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = listPrivacyChanged.common_fields;
        }
        if ((i & 2) != 0) {
            str = listPrivacyChanged.list_id;
        }
        if ((i & 4) != 0) {
            listPrivacyLevel = listPrivacyChanged.list_privacy_level;
        }
        if ((i & 8) != 0) {
            h21Var = listPrivacyChanged.unknownFields();
        }
        return listPrivacyChanged.copy(analyticsEventCommonFields, str, listPrivacyLevel, h21Var);
    }

    public final ListPrivacyChanged copy(AnalyticsEventCommonFields common_fields, String list_id, ListPrivacyLevel list_privacy_level, h21 unknownFields) {
        list_id.getClass();
        list_privacy_level.getClass();
        unknownFields.getClass();
        return new ListPrivacyChanged(common_fields, list_id, list_privacy_level, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ListPrivacyChanged)) {
            return false;
        }
        ListPrivacyChanged listPrivacyChanged = (ListPrivacyChanged) other;
        return g76.L(unknownFields(), listPrivacyChanged.unknownFields()) && g76.L(this.common_fields, listPrivacyChanged.common_fields) && g76.L(this.list_id, listPrivacyChanged.list_id) && this.list_privacy_level == listPrivacyChanged.list_privacy_level;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = this.list_privacy_level.hashCode() + wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.list_id);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final n27 newBuilder() {
        n27 n27Var = new n27();
        n27Var.b = "";
        n27Var.c = ListPrivacyLevel.LIST_PRIVACY_LEVEL_PUBLIC;
        n27Var.a = this.common_fields;
        n27Var.b = this.list_id;
        n27Var.c = this.list_privacy_level;
        n27Var.addUnknownFields(unknownFields());
        return n27Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.list_id, "list_id=", arrayList);
        arrayList.add("list_privacy_level=" + this.list_privacy_level);
        return bu1.F0(arrayList, ", ", "ListPrivacyChanged{", "}", null, 56);
    }

    public ListPrivacyChanged() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ListPrivacyChanged(AnalyticsEventCommonFields analyticsEventCommonFields, String str, ListPrivacyLevel listPrivacyLevel, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        listPrivacyLevel.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.list_id = str;
        this.list_privacy_level = listPrivacyLevel;
    }
}
