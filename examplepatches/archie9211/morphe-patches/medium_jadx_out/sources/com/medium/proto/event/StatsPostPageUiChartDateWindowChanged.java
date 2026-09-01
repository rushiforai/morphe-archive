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
import defpackage.r34;
import defpackage.rqc;
import defpackage.sqc;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/StatsPostPageUiChartDateWindowChanged;", "Lcom/squareup/wire/AndroidMessage;", "Lrqc;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "post_id", "", "action_value", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lrqc;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/StatsPostPageUiChartDateWindowChanged;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "sqc", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("statsPostPage.ui.chartDateWindowChanged")
public final class StatsPostPageUiChartDateWindowChanged extends AndroidMessage<StatsPostPageUiChartDateWindowChanged, rqc> {
    public static final ProtoAdapter<StatsPostPageUiChartDateWindowChanged> ADAPTER;
    public static final Parcelable.Creator<StatsPostPageUiChartDateWindowChanged> CREATOR;
    public static final sqc Companion = new sqc();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 2, tag = 3)
    public final Integer action_value;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(StatsPostPageUiChartDateWindowChanged.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<StatsPostPageUiChartDateWindowChanged> protoAdapter = new ProtoAdapter<StatsPostPageUiChartDateWindowChanged>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.StatsPostPageUiChartDateWindowChanged$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final StatsPostPageUiChartDateWindowChanged decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new StatsPostPageUiChartDateWindowChanged(analyticsEventCommonFieldsDecode, strDecode, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, StatsPostPageUiChartDateWindowChanged value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.action_value);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(StatsPostPageUiChartDateWindowChanged value) {
                value.getClass();
                return ProtoAdapter.INT32.encodedSizeWithTag(3, value.action_value) + ProtoAdapter.STRING.encodedSizeWithTag(2, value.post_id) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final StatsPostPageUiChartDateWindowChanged redact(StatsPostPageUiChartDateWindowChanged value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return StatsPostPageUiChartDateWindowChanged.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, StatsPostPageUiChartDateWindowChanged value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 3, value.action_value);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.post_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ StatsPostPageUiChartDateWindowChanged(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : num, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ StatsPostPageUiChartDateWindowChanged copy$default(StatsPostPageUiChartDateWindowChanged statsPostPageUiChartDateWindowChanged, AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = statsPostPageUiChartDateWindowChanged.common_fields;
        }
        if ((i & 2) != 0) {
            str = statsPostPageUiChartDateWindowChanged.post_id;
        }
        if ((i & 4) != 0) {
            num = statsPostPageUiChartDateWindowChanged.action_value;
        }
        if ((i & 8) != 0) {
            h21Var = statsPostPageUiChartDateWindowChanged.unknownFields();
        }
        return statsPostPageUiChartDateWindowChanged.copy(analyticsEventCommonFields, str, num, h21Var);
    }

    public final StatsPostPageUiChartDateWindowChanged copy(AnalyticsEventCommonFields common_fields, String post_id, Integer action_value, h21 unknownFields) {
        unknownFields.getClass();
        return new StatsPostPageUiChartDateWindowChanged(common_fields, post_id, action_value, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof StatsPostPageUiChartDateWindowChanged)) {
            return false;
        }
        StatsPostPageUiChartDateWindowChanged statsPostPageUiChartDateWindowChanged = (StatsPostPageUiChartDateWindowChanged) other;
        return g76.L(unknownFields(), statsPostPageUiChartDateWindowChanged.unknownFields()) && g76.L(this.common_fields, statsPostPageUiChartDateWindowChanged.common_fields) && g76.L(this.post_id, statsPostPageUiChartDateWindowChanged.post_id) && g76.L(this.action_value, statsPostPageUiChartDateWindowChanged.action_value);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.action_value;
        int iIntValue = iHashCode3 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final rqc newBuilder() {
        rqc rqcVar = new rqc();
        rqcVar.a = this.common_fields;
        rqcVar.b = this.post_id;
        rqcVar.c = this.action_value;
        rqcVar.addUnknownFields(unknownFields());
        return rqcVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        Integer num = this.action_value;
        if (num != null) {
            lv8.B("action_value=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "StatsPostPageUiChartDateWindowChanged{", "}", null, 56);
    }

    public StatsPostPageUiChartDateWindowChanged() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StatsPostPageUiChartDateWindowChanged(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.post_id = str;
        this.action_value = num;
    }
}
