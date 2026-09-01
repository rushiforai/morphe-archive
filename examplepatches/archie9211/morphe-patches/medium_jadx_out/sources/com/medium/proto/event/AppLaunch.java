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
import defpackage.p50;
import defpackage.q50;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import defpackage.z73;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 B5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00072\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001b\u0012\u0004\b\u001c\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/AppLaunch;", "Lcom/squareup/wire/AndroidMessage;", "Lp50;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "launch_count", "", "is_first_launch", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/Boolean;Lh21;)V", "newBuilder", "()Lp50;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/Boolean;Lh21;)Lcom/medium/proto/event/AppLaunch;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Integer;", "getLaunch_count$annotations", "()V", "Ljava/lang/Boolean;", "Companion", "q50", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("app.launch")
public final class AppLaunch extends AndroidMessage<AppLaunch, p50> {
    public static final ProtoAdapter<AppLaunch> ADAPTER;
    public static final Parcelable.Creator<AppLaunch> CREATOR;
    public static final q50 Companion = new q50();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 2, tag = 3)
    public final Boolean is_first_launch;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer launch_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AppLaunch.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AppLaunch> protoAdapter = new ProtoAdapter<AppLaunch>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.AppLaunch$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AppLaunch decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Integer numDecode = null;
                Boolean boolDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AppLaunch(analyticsEventCommonFieldsDecode, numDecode, boolDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AppLaunch value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.launch_count);
                ProtoAdapter.BOOL.encodeWithTag(writer, 3, value.is_first_launch);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AppLaunch value) {
                value.getClass();
                return ProtoAdapter.BOOL.encodedSizeWithTag(3, value.is_first_launch) + ProtoAdapter.INT32.encodedSizeWithTag(2, value.launch_count) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AppLaunch redact(AppLaunch value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return AppLaunch.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AppLaunch value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.BOOL.encodeWithTag(writer, 3, value.is_first_launch);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.launch_count);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AppLaunch(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, Boolean bool, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : bool, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ AppLaunch copy$default(AppLaunch appLaunch, AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, Boolean bool, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = appLaunch.common_fields;
        }
        if ((i & 2) != 0) {
            num = appLaunch.launch_count;
        }
        if ((i & 4) != 0) {
            bool = appLaunch.is_first_launch;
        }
        if ((i & 8) != 0) {
            h21Var = appLaunch.unknownFields();
        }
        return appLaunch.copy(analyticsEventCommonFields, num, bool, h21Var);
    }

    public final AppLaunch copy(AnalyticsEventCommonFields common_fields, Integer launch_count, Boolean is_first_launch, h21 unknownFields) {
        unknownFields.getClass();
        return new AppLaunch(common_fields, launch_count, is_first_launch, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AppLaunch)) {
            return false;
        }
        AppLaunch appLaunch = (AppLaunch) other;
        return g76.L(unknownFields(), appLaunch.unknownFields()) && g76.L(this.common_fields, appLaunch.common_fields) && g76.L(this.launch_count, appLaunch.launch_count) && g76.L(this.is_first_launch, appLaunch.is_first_launch);
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
        Integer num = this.launch_count;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        Boolean bool = this.is_first_launch;
        if (bool != null) {
            i2 = bool.booleanValue() ? 1231 : 1237;
        }
        int i3 = iIntValue + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final p50 newBuilder() {
        p50 p50Var = new p50();
        p50Var.a = this.common_fields;
        p50Var.b = this.launch_count;
        p50Var.c = this.is_first_launch;
        p50Var.addUnknownFields(unknownFields());
        return p50Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Integer num = this.launch_count;
        if (num != null) {
            lv8.B("launch_count=", num, arrayList);
        }
        Boolean bool = this.is_first_launch;
        if (bool != null) {
            lv8.A("is_first_launch=", bool, arrayList);
        }
        return bu1.F0(arrayList, ", ", "AppLaunch{", "}", null, 56);
    }

    @z73
    public static /* synthetic */ void getLaunch_count$annotations() {
    }

    public AppLaunch() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppLaunch(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, Boolean bool, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.launch_count = num;
        this.is_first_launch = bool;
    }
}
