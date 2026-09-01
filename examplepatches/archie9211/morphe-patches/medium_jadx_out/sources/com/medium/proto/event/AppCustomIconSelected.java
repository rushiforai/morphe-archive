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
import defpackage.e40;
import defpackage.f40;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB'\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J-\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001b¨\u0006\u001e"}, d2 = {"Lcom/medium/proto/event/AppCustomIconSelected;", "Lcom/squareup/wire/AndroidMessage;", "Le40;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "Lcom/medium/proto/event/AppIconName;", "icon_name", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lcom/medium/proto/event/AppIconName;Lh21;)V", "newBuilder", "()Le40;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lcom/medium/proto/event/AppIconName;Lh21;)Lcom/medium/proto/event/AppCustomIconSelected;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Lcom/medium/proto/event/AppIconName;", "Companion", "f40", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("appCustomIcon.selected")
public final class AppCustomIconSelected extends AndroidMessage<AppCustomIconSelected, e40> {
    public static final ProtoAdapter<AppCustomIconSelected> ADAPTER;
    public static final Parcelable.Creator<AppCustomIconSelected> CREATOR;
    public static final f40 Companion = new f40();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.medium.proto.event.AppIconName#ADAPTER", jsonName = "iconName", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final AppIconName icon_name;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AppCustomIconSelected.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<AppCustomIconSelected> protoAdapter = new ProtoAdapter<AppCustomIconSelected>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.AppCustomIconSelected$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AppCustomIconSelected decode(ProtoReader reader) {
                reader.getClass();
                AppIconName appIconNameDecode = AppIconName.APP_ICON_NAME_BLACK;
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AppCustomIconSelected(analyticsEventCommonFieldsDecode, appIconNameDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        try {
                            appIconNameDecode = AppIconName.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AppCustomIconSelected value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                AppIconName appIconName = value.icon_name;
                if (appIconName != AppIconName.APP_ICON_NAME_BLACK) {
                    AppIconName.ADAPTER.encodeWithTag(writer, 2, appIconName);
                }
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AppCustomIconSelected value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                AppIconName appIconName = value.icon_name;
                return appIconName != AppIconName.APP_ICON_NAME_BLACK ? AppIconName.ADAPTER.encodedSizeWithTag(2, appIconName) + iE : iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AppCustomIconSelected redact(AppCustomIconSelected value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return AppCustomIconSelected.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AppCustomIconSelected value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                AppIconName appIconName = value.icon_name;
                if (appIconName != AppIconName.APP_ICON_NAME_BLACK) {
                    AppIconName.ADAPTER.encodeWithTag(writer, 2, appIconName);
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

    public /* synthetic */ AppCustomIconSelected(AnalyticsEventCommonFields analyticsEventCommonFields, AppIconName appIconName, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? AppIconName.APP_ICON_NAME_BLACK : appIconName, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AppCustomIconSelected copy$default(AppCustomIconSelected appCustomIconSelected, AnalyticsEventCommonFields analyticsEventCommonFields, AppIconName appIconName, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = appCustomIconSelected.common_fields;
        }
        if ((i & 2) != 0) {
            appIconName = appCustomIconSelected.icon_name;
        }
        if ((i & 4) != 0) {
            h21Var = appCustomIconSelected.unknownFields();
        }
        return appCustomIconSelected.copy(analyticsEventCommonFields, appIconName, h21Var);
    }

    public final AppCustomIconSelected copy(AnalyticsEventCommonFields common_fields, AppIconName icon_name, h21 unknownFields) {
        icon_name.getClass();
        unknownFields.getClass();
        return new AppCustomIconSelected(common_fields, icon_name, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AppCustomIconSelected)) {
            return false;
        }
        AppCustomIconSelected appCustomIconSelected = (AppCustomIconSelected) other;
        return g76.L(unknownFields(), appCustomIconSelected.unknownFields()) && g76.L(this.common_fields, appCustomIconSelected.common_fields) && this.icon_name == appCustomIconSelected.icon_name;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = this.icon_name.hashCode() + ((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final e40 newBuilder() {
        e40 e40Var = new e40();
        e40Var.b = AppIconName.APP_ICON_NAME_BLACK;
        e40Var.a = this.common_fields;
        e40Var.b = this.icon_name;
        e40Var.addUnknownFields(unknownFields());
        return e40Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        arrayList.add("icon_name=" + this.icon_name);
        return bu1.F0(arrayList, ", ", "AppCustomIconSelected{", "}", null, 56);
    }

    public AppCustomIconSelected() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppCustomIconSelected(AnalyticsEventCommonFields analyticsEventCommonFields, AppIconName appIconName, h21 h21Var) {
        super(ADAPTER, h21Var);
        appIconName.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.icon_name = appIconName;
    }
}
