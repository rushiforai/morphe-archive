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
import defpackage.iw7;
import defpackage.jw7;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JG\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001eR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/MembershipPaymentPageFrequencySelected;", "Lcom/squareup/wire/AndroidMessage;", "Liw7;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "Lcom/medium/proto/event/MembershipBillingFrequency;", "frequency", "", "dimension", "location_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lcom/medium/proto/event/MembershipBillingFrequency;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Liw7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Lcom/medium/proto/event/MembershipBillingFrequency;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/MembershipPaymentPageFrequencySelected;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Lcom/medium/proto/event/MembershipBillingFrequency;", "Ljava/lang/String;", "Companion", "jw7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("membershipPaymentPage.frequencySelected")
public final class MembershipPaymentPageFrequencySelected extends AndroidMessage<MembershipPaymentPageFrequencySelected, iw7> {
    public static final ProtoAdapter<MembershipPaymentPageFrequencySelected> ADAPTER;
    public static final Parcelable.Creator<MembershipPaymentPageFrequencySelected> CREATOR;
    public static final jw7 Companion = new jw7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String dimension;

    @WireField(adapter = "com.medium.proto.event.MembershipBillingFrequency#ADAPTER", schemaIndex = 1, tag = 2)
    public final MembershipBillingFrequency frequency;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String location_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MembershipPaymentPageFrequencySelected.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MembershipPaymentPageFrequencySelected> protoAdapter = new ProtoAdapter<MembershipPaymentPageFrequencySelected>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.MembershipPaymentPageFrequencySelected$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MembershipPaymentPageFrequencySelected decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                MembershipBillingFrequency membershipBillingFrequencyDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MembershipPaymentPageFrequencySelected(analyticsEventCommonFieldsDecode, membershipBillingFrequencyDecode, strDecode, strDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        try {
                            membershipBillingFrequencyDecode = MembershipBillingFrequency.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
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
            public final void encode(ProtoWriter writer, MembershipPaymentPageFrequencySelected value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                MembershipBillingFrequency.ADAPTER.encodeWithTag(writer, 2, value.frequency);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.dimension);
                protoAdapter2.encodeWithTag(writer, 4, value.location_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MembershipPaymentPageFrequencySelected value) {
                value.getClass();
                int iEncodedSizeWithTag = MembershipBillingFrequency.ADAPTER.encodedSizeWithTag(2, value.frequency) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(4, value.location_id) + protoAdapter2.encodedSizeWithTag(3, value.dimension) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MembershipPaymentPageFrequencySelected redact(MembershipPaymentPageFrequencySelected value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return MembershipPaymentPageFrequencySelected.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MembershipPaymentPageFrequencySelected value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.location_id);
                protoAdapter2.encodeWithTag(writer, 3, value.dimension);
                MembershipBillingFrequency.ADAPTER.encodeWithTag(writer, 2, value.frequency);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MembershipPaymentPageFrequencySelected(AnalyticsEventCommonFields analyticsEventCommonFields, MembershipBillingFrequency membershipBillingFrequency, String str, String str2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : membershipBillingFrequency, (i & 4) != 0 ? null : str, (i & 8) != 0 ? null : str2, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MembershipPaymentPageFrequencySelected copy$default(MembershipPaymentPageFrequencySelected membershipPaymentPageFrequencySelected, AnalyticsEventCommonFields analyticsEventCommonFields, MembershipBillingFrequency membershipBillingFrequency, String str, String str2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = membershipPaymentPageFrequencySelected.common_fields;
        }
        if ((i & 2) != 0) {
            membershipBillingFrequency = membershipPaymentPageFrequencySelected.frequency;
        }
        if ((i & 4) != 0) {
            str = membershipPaymentPageFrequencySelected.dimension;
        }
        if ((i & 8) != 0) {
            str2 = membershipPaymentPageFrequencySelected.location_id;
        }
        if ((i & 16) != 0) {
            h21Var = membershipPaymentPageFrequencySelected.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str3 = str;
        return membershipPaymentPageFrequencySelected.copy(analyticsEventCommonFields, membershipBillingFrequency, str3, str2, h21Var2);
    }

    public final MembershipPaymentPageFrequencySelected copy(AnalyticsEventCommonFields common_fields, MembershipBillingFrequency frequency, String dimension, String location_id, h21 unknownFields) {
        unknownFields.getClass();
        return new MembershipPaymentPageFrequencySelected(common_fields, frequency, dimension, location_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MembershipPaymentPageFrequencySelected)) {
            return false;
        }
        MembershipPaymentPageFrequencySelected membershipPaymentPageFrequencySelected = (MembershipPaymentPageFrequencySelected) other;
        return g76.L(unknownFields(), membershipPaymentPageFrequencySelected.unknownFields()) && g76.L(this.common_fields, membershipPaymentPageFrequencySelected.common_fields) && this.frequency == membershipPaymentPageFrequencySelected.frequency && g76.L(this.dimension, membershipPaymentPageFrequencySelected.dimension) && g76.L(this.location_id, membershipPaymentPageFrequencySelected.location_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        MembershipBillingFrequency membershipBillingFrequency = this.frequency;
        int iHashCode3 = (iHashCode2 + (membershipBillingFrequency != null ? membershipBillingFrequency.hashCode() : 0)) * 37;
        String str = this.dimension;
        int iHashCode4 = (iHashCode3 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.location_id;
        int iHashCode5 = iHashCode4 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final iw7 newBuilder() {
        iw7 iw7Var = new iw7();
        iw7Var.a = this.common_fields;
        iw7Var.b = this.frequency;
        iw7Var.c = this.dimension;
        iw7Var.d = this.location_id;
        iw7Var.addUnknownFields(unknownFields());
        return iw7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        MembershipBillingFrequency membershipBillingFrequency = this.frequency;
        if (membershipBillingFrequency != null) {
            arrayList.add("frequency=" + membershipBillingFrequency);
        }
        String str = this.dimension;
        if (str != null) {
            lv8.D(str, "dimension=", arrayList);
        }
        String str2 = this.location_id;
        if (str2 != null) {
            lv8.D(str2, "location_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MembershipPaymentPageFrequencySelected{", "}", null, 56);
    }

    public MembershipPaymentPageFrequencySelected() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MembershipPaymentPageFrequencySelected(AnalyticsEventCommonFields analyticsEventCommonFields, MembershipBillingFrequency membershipBillingFrequency, String str, String str2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.frequency = membershipBillingFrequency;
        this.dimension = str;
        this.location_id = str2;
    }
}
