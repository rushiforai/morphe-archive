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
import defpackage.cl4;
import defpackage.dl4;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import defpackage.z73;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u000f\u001a\u00020\u00052\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u0012\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/FirstTimeAppLogin;", "Lcom/squareup/wire/AndroidMessage;", "Lcl4;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "is_in_app_flirty_thirty", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lcl4;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/FirstTimeAppLogin;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Boolean;", "is_in_app_flirty_thirty$annotations", "()V", "Companion", "dl4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("app.firstTimeAppLogin")
public final class FirstTimeAppLogin extends AndroidMessage<FirstTimeAppLogin, cl4> {
    public static final ProtoAdapter<FirstTimeAppLogin> ADAPTER;
    public static final Parcelable.Creator<FirstTimeAppLogin> CREATOR;
    public static final dl4 Companion = new dl4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean is_in_app_flirty_thirty;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FirstTimeAppLogin.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<FirstTimeAppLogin> protoAdapter = new ProtoAdapter<FirstTimeAppLogin>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.FirstTimeAppLogin$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final FirstTimeAppLogin decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FirstTimeAppLogin(analyticsEventCommonFieldsDecode, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FirstTimeAppLogin value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.is_in_app_flirty_thirty);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FirstTimeAppLogin value) {
                value.getClass();
                return ProtoAdapter.BOOL.encodedSizeWithTag(2, value.is_in_app_flirty_thirty) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FirstTimeAppLogin redact(FirstTimeAppLogin value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return FirstTimeAppLogin.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FirstTimeAppLogin value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.is_in_app_flirty_thirty);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ FirstTimeAppLogin(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ FirstTimeAppLogin copy$default(FirstTimeAppLogin firstTimeAppLogin, AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = firstTimeAppLogin.common_fields;
        }
        if ((i & 2) != 0) {
            bool = firstTimeAppLogin.is_in_app_flirty_thirty;
        }
        if ((i & 4) != 0) {
            h21Var = firstTimeAppLogin.unknownFields();
        }
        return firstTimeAppLogin.copy(analyticsEventCommonFields, bool, h21Var);
    }

    public final FirstTimeAppLogin copy(AnalyticsEventCommonFields common_fields, Boolean is_in_app_flirty_thirty, h21 unknownFields) {
        unknownFields.getClass();
        return new FirstTimeAppLogin(common_fields, is_in_app_flirty_thirty, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FirstTimeAppLogin)) {
            return false;
        }
        FirstTimeAppLogin firstTimeAppLogin = (FirstTimeAppLogin) other;
        return g76.L(unknownFields(), firstTimeAppLogin.unknownFields()) && g76.L(this.common_fields, firstTimeAppLogin.common_fields) && g76.L(this.is_in_app_flirty_thirty, firstTimeAppLogin.is_in_app_flirty_thirty);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int i2 = 0;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Boolean bool = this.is_in_app_flirty_thirty;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iHashCode2 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final cl4 newBuilder() {
        cl4 cl4Var = new cl4();
        cl4Var.a = this.common_fields;
        cl4Var.b = this.is_in_app_flirty_thirty;
        cl4Var.addUnknownFields(unknownFields());
        return cl4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Boolean bool = this.is_in_app_flirty_thirty;
        if (bool != null) {
            lv8.A("is_in_app_flirty_thirty=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "FirstTimeAppLogin{", "}", null, 56);
    }

    @z73
    public static /* synthetic */ void is_in_app_flirty_thirty$annotations() {
    }

    public FirstTimeAppLogin() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FirstTimeAppLogin(AnalyticsEventCommonFields analyticsEventCommonFields, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.is_in_app_flirty_thirty = bool;
    }
}
