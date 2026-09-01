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
import defpackage.c08;
import defpackage.d08;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/MeterViewed;", "Lcom/squareup/wire/AndroidMessage;", "Lc08;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "meter_count", "", "post_id", "ui_type", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lc08;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/MeterViewed;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Companion", "d08", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("meter.viewed")
public final class MeterViewed extends AndroidMessage<MeterViewed, c08> {
    public static final ProtoAdapter<MeterViewed> ADAPTER;
    public static final Parcelable.Creator<MeterViewed> CREATOR;
    public static final d08 Companion = new d08();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer meter_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String ui_type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MeterViewed.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MeterViewed> protoAdapter = new ProtoAdapter<MeterViewed>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.MeterViewed$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MeterViewed decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Integer numDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MeterViewed(analyticsEventCommonFieldsDecode, numDecode, strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MeterViewed value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.meter_count);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.ui_type);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MeterViewed value) {
                value.getClass();
                int iEncodedSizeWithTag = ProtoAdapter.INT32.encodedSizeWithTag(2, value.meter_count) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(4, value.ui_type) + protoAdapter2.encodedSizeWithTag(3, value.post_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MeterViewed redact(MeterViewed value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return MeterViewed.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MeterViewed value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.ui_type);
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.meter_count);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MeterViewed(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : str, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MeterViewed copy$default(MeterViewed meterViewed, AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = meterViewed.common_fields;
        }
        if ((i & 2) != 0) {
            num = meterViewed.meter_count;
        }
        if ((i & 4) != 0) {
            str = meterViewed.post_id;
        }
        if ((i & 8) != 0) {
            str2 = meterViewed.ui_type;
        }
        if ((i & 16) != 0) {
            h21Var = meterViewed.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str3 = str;
        return meterViewed.copy(analyticsEventCommonFields, num, str3, str2, h21Var2);
    }

    public final MeterViewed copy(AnalyticsEventCommonFields common_fields, Integer meter_count, String post_id, String ui_type, h21 unknownFields) {
        unknownFields.getClass();
        return new MeterViewed(common_fields, meter_count, post_id, ui_type, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MeterViewed)) {
            return false;
        }
        MeterViewed meterViewed = (MeterViewed) other;
        return g76.L(unknownFields(), meterViewed.unknownFields()) && g76.L(this.common_fields, meterViewed.common_fields) && g76.L(this.meter_count, meterViewed.meter_count) && g76.L(this.post_id, meterViewed.post_id) && g76.L(this.ui_type, meterViewed.ui_type);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Integer num = this.meter_count;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = (iIntValue + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.ui_type;
        int iHashCode4 = iHashCode3 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final c08 newBuilder() {
        c08 c08Var = new c08();
        c08Var.a = this.common_fields;
        c08Var.b = this.meter_count;
        c08Var.c = this.post_id;
        c08Var.d = this.ui_type;
        c08Var.addUnknownFields(unknownFields());
        return c08Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Integer num = this.meter_count;
        if (num != null) {
            lv8.B("meter_count=", num, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        String str2 = this.ui_type;
        if (str2 != null) {
            lv8.D(str2, "ui_type=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MeterViewed{", "}", null, 56);
    }

    public MeterViewed() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MeterViewed(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.meter_count = num;
        this.post_id = str;
        this.ui_type = str2;
    }
}
