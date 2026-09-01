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
import defpackage.m9c;
import defpackage.n1b;
import defpackage.n9c;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/ShowMeterBanner;", "Lcom/squareup/wire/AndroidMessage;", "Lm9c;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "unlock_count", "", "post_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lm9c;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/Integer;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/ShowMeterBanner;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Companion", "n9c", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("meter.showMeterBanner")
public final class ShowMeterBanner extends AndroidMessage<ShowMeterBanner, m9c> {
    public static final ProtoAdapter<ShowMeterBanner> ADAPTER;
    public static final Parcelable.Creator<ShowMeterBanner> CREATOR;
    public static final n9c Companion = new n9c();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 1, tag = 2)
    public final Integer unlock_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(ShowMeterBanner.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<ShowMeterBanner> protoAdapter = new ProtoAdapter<ShowMeterBanner>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.ShowMeterBanner$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final ShowMeterBanner decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                Integer numDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new ShowMeterBanner(analyticsEventCommonFieldsDecode, numDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, ShowMeterBanner value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.unlock_count);
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(ShowMeterBanner value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(3, value.post_id) + ProtoAdapter.INT32.encodedSizeWithTag(2, value.unlock_count) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final ShowMeterBanner redact(ShowMeterBanner value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return ShowMeterBanner.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, ShowMeterBanner value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.post_id);
                ProtoAdapter.INT32.encodeWithTag(writer, 2, value.unlock_count);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ ShowMeterBanner(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : num, (i & 4) != 0 ? null : str, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ ShowMeterBanner copy$default(ShowMeterBanner showMeterBanner, AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = showMeterBanner.common_fields;
        }
        if ((i & 2) != 0) {
            num = showMeterBanner.unlock_count;
        }
        if ((i & 4) != 0) {
            str = showMeterBanner.post_id;
        }
        if ((i & 8) != 0) {
            h21Var = showMeterBanner.unknownFields();
        }
        return showMeterBanner.copy(analyticsEventCommonFields, num, str, h21Var);
    }

    public final ShowMeterBanner copy(AnalyticsEventCommonFields common_fields, Integer unlock_count, String post_id, h21 unknownFields) {
        unknownFields.getClass();
        return new ShowMeterBanner(common_fields, unlock_count, post_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ShowMeterBanner)) {
            return false;
        }
        ShowMeterBanner showMeterBanner = (ShowMeterBanner) other;
        return g76.L(unknownFields(), showMeterBanner.unknownFields()) && g76.L(this.common_fields, showMeterBanner.common_fields) && g76.L(this.unlock_count, showMeterBanner.unlock_count) && g76.L(this.post_id, showMeterBanner.post_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        Integer num = this.unlock_count;
        int iIntValue = (iHashCode2 + (num != null ? num.intValue() : 0)) * 37;
        String str = this.post_id;
        int iHashCode3 = iIntValue + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final m9c newBuilder() {
        m9c m9cVar = new m9c();
        m9cVar.a = this.common_fields;
        m9cVar.b = this.unlock_count;
        m9cVar.c = this.post_id;
        m9cVar.addUnknownFields(unknownFields());
        return m9cVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        Integer num = this.unlock_count;
        if (num != null) {
            lv8.B("unlock_count=", num, arrayList);
        }
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "ShowMeterBanner{", "}", null, 56);
    }

    public ShowMeterBanner() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ShowMeterBanner(AnalyticsEventCommonFields analyticsEventCommonFields, Integer num, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.unlock_count = num;
        this.post_id = str;
    }
}
