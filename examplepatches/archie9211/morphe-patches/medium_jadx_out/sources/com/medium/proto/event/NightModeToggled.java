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
import defpackage.jg8;
import defpackage.kg8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import gen.model.DisplayModeTheme;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\t\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J/\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001b¨\u0006\u001e"}, d2 = {"Lcom/medium/proto/event/NightModeToggled;", "Lcom/squareup/wire/AndroidMessage;", "Ljg8;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "Lgen/model/DisplayModeTheme;", "theme", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lgen/model/DisplayModeTheme;Lh21;)V", "newBuilder", "()Ljg8;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lgen/model/DisplayModeTheme;Lh21;)Lcom/medium/proto/event/NightModeToggled;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Lgen/model/DisplayModeTheme;", "Companion", "kg8", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("displayMode.updated")
public final class NightModeToggled extends AndroidMessage<NightModeToggled, jg8> {
    public static final ProtoAdapter<NightModeToggled> ADAPTER;
    public static final Parcelable.Creator<NightModeToggled> CREATOR;
    public static final kg8 Companion = new kg8();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "gen.model.DisplayModeTheme#ADAPTER", schemaIndex = 1, tag = 2)
    public final DisplayModeTheme theme;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(NightModeToggled.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<NightModeToggled> protoAdapter = new ProtoAdapter<NightModeToggled>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.NightModeToggled$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final NightModeToggled decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                DisplayModeTheme displayModeThemeDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new NightModeToggled(analyticsEventCommonFieldsDecode, displayModeThemeDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        try {
                            displayModeThemeDecode = DisplayModeTheme.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, NightModeToggled value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                DisplayModeTheme.ADAPTER.encodeWithTag(writer, 2, value.theme);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(NightModeToggled value) {
                value.getClass();
                return DisplayModeTheme.ADAPTER.encodedSizeWithTag(2, value.theme) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final NightModeToggled redact(NightModeToggled value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return NightModeToggled.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, NightModeToggled value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                DisplayModeTheme.ADAPTER.encodeWithTag(writer, 2, value.theme);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ NightModeToggled(AnalyticsEventCommonFields analyticsEventCommonFields, DisplayModeTheme displayModeTheme, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : displayModeTheme, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ NightModeToggled copy$default(NightModeToggled nightModeToggled, AnalyticsEventCommonFields analyticsEventCommonFields, DisplayModeTheme displayModeTheme, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = nightModeToggled.common_fields;
        }
        if ((i & 2) != 0) {
            displayModeTheme = nightModeToggled.theme;
        }
        if ((i & 4) != 0) {
            h21Var = nightModeToggled.unknownFields();
        }
        return nightModeToggled.copy(analyticsEventCommonFields, displayModeTheme, h21Var);
    }

    public final NightModeToggled copy(AnalyticsEventCommonFields common_fields, DisplayModeTheme theme, h21 unknownFields) {
        unknownFields.getClass();
        return new NightModeToggled(common_fields, theme, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof NightModeToggled)) {
            return false;
        }
        NightModeToggled nightModeToggled = (NightModeToggled) other;
        return g76.L(unknownFields(), nightModeToggled.unknownFields()) && g76.L(this.common_fields, nightModeToggled.common_fields) && this.theme == nightModeToggled.theme;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        DisplayModeTheme displayModeTheme = this.theme;
        int iHashCode3 = iHashCode2 + (displayModeTheme != null ? displayModeTheme.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final jg8 newBuilder() {
        jg8 jg8Var = new jg8();
        jg8Var.a = this.common_fields;
        jg8Var.b = this.theme;
        jg8Var.addUnknownFields(unknownFields());
        return jg8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        DisplayModeTheme displayModeTheme = this.theme;
        if (displayModeTheme != null) {
            arrayList.add("theme=" + displayModeTheme);
        }
        return bu1.F0(arrayList, ", ", "NightModeToggled{", "}", null, 56);
    }

    public NightModeToggled() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public NightModeToggled(AnalyticsEventCommonFields analyticsEventCommonFields, DisplayModeTheme displayModeTheme, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.theme = displayModeTheme;
    }
}
