package com.medium.proto.event;

import android.os.Parcelable;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.bv5;
import defpackage.cv5;
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
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BM\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0096\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\tH\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JS\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/IapPurchaseCanceled;", "Lcom/squareup/wire/AndroidMessage;", "Lbv5;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "product_id", "error_message", "error_domain", "", "error_code", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lbv5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/IapPurchaseCanceled;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "cv5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("iap.purchaseCanceled")
public final class IapPurchaseCanceled extends AndroidMessage<IapPurchaseCanceled, bv5> {
    public static final ProtoAdapter<IapPurchaseCanceled> ADAPTER;
    public static final Parcelable.Creator<IapPurchaseCanceled> CREATOR;
    public static final cv5 Companion = new cv5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 5)
    public final Integer error_code;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String error_domain;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String error_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String product_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(IapPurchaseCanceled.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<IapPurchaseCanceled> protoAdapter = new ProtoAdapter<IapPurchaseCanceled>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.IapPurchaseCanceled$Companion$ADAPTER$1
            {
                String str = kSWQKWZ.ONmPVZdwOrFSmiU;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final IapPurchaseCanceled decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Integer numDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new IapPurchaseCanceled(analyticsEventCommonFieldsDecode, strDecode, strDecode2, strDecode3, numDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 4) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 5) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, IapPurchaseCanceled value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.product_id);
                protoAdapter2.encodeWithTag(writer, 3, value.error_message);
                protoAdapter2.encodeWithTag(writer, 4, value.error_domain);
                ProtoAdapter.INT32.encodeWithTag(writer, 5, value.error_code);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(IapPurchaseCanceled value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return ProtoAdapter.INT32.encodedSizeWithTag(5, value.error_code) + protoAdapter2.encodedSizeWithTag(4, value.error_domain) + protoAdapter2.encodedSizeWithTag(3, value.error_message) + protoAdapter2.encodedSizeWithTag(2, value.product_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final IapPurchaseCanceled redact(IapPurchaseCanceled value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return IapPurchaseCanceled.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, null, h21.d, 30, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, IapPurchaseCanceled value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT32.encodeWithTag(writer, 5, value.error_code);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.error_domain);
                protoAdapter2.encodeWithTag(writer, 3, value.error_message);
                protoAdapter2.encodeWithTag(writer, 2, value.product_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ IapPurchaseCanceled(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Integer num, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : num, (i & 32) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ IapPurchaseCanceled copy$default(IapPurchaseCanceled iapPurchaseCanceled, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Integer num, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = iapPurchaseCanceled.common_fields;
        }
        if ((i & 2) != 0) {
            str = iapPurchaseCanceled.product_id;
        }
        if ((i & 4) != 0) {
            str2 = iapPurchaseCanceled.error_message;
        }
        if ((i & 8) != 0) {
            str3 = iapPurchaseCanceled.error_domain;
        }
        if ((i & 16) != 0) {
            num = iapPurchaseCanceled.error_code;
        }
        if ((i & 32) != 0) {
            h21Var = iapPurchaseCanceled.unknownFields();
        }
        Integer num2 = num;
        h21 h21Var2 = h21Var;
        return iapPurchaseCanceled.copy(analyticsEventCommonFields, str, str2, str3, num2, h21Var2);
    }

    public final IapPurchaseCanceled copy(AnalyticsEventCommonFields common_fields, String product_id, String error_message, String error_domain, Integer error_code, h21 unknownFields) {
        unknownFields.getClass();
        return new IapPurchaseCanceled(common_fields, product_id, error_message, error_domain, error_code, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof IapPurchaseCanceled)) {
            return false;
        }
        IapPurchaseCanceled iapPurchaseCanceled = (IapPurchaseCanceled) other;
        return g76.L(unknownFields(), iapPurchaseCanceled.unknownFields()) && g76.L(this.common_fields, iapPurchaseCanceled.common_fields) && g76.L(this.product_id, iapPurchaseCanceled.product_id) && g76.L(this.error_message, iapPurchaseCanceled.error_message) && g76.L(this.error_domain, iapPurchaseCanceled.error_domain) && g76.L(this.error_code, iapPurchaseCanceled.error_code);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.product_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.error_message;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.error_domain;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        Integer num = this.error_code;
        int iIntValue = iHashCode5 + (num != null ? num.intValue() : 0);
        this.hashCode = iIntValue;
        return iIntValue;
    }

    @Override // com.squareup.wire.Message
    public final bv5 newBuilder() {
        bv5 bv5Var = new bv5();
        bv5Var.a = this.common_fields;
        bv5Var.b = this.product_id;
        bv5Var.c = this.error_message;
        bv5Var.d = this.error_domain;
        bv5Var.e = this.error_code;
        bv5Var.addUnknownFields(unknownFields());
        return bv5Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.product_id;
        if (str != null) {
            lv8.D(str, "product_id=", arrayList);
        }
        String str2 = this.error_message;
        if (str2 != null) {
            lv8.D(str2, "error_message=", arrayList);
        }
        String str3 = this.error_domain;
        if (str3 != null) {
            lv8.D(str3, "error_domain=", arrayList);
        }
        Integer num = this.error_code;
        if (num != null) {
            lv8.B("error_code=", num, arrayList);
        }
        return bu1.F0(arrayList, ", ", "IapPurchaseCanceled{", "}", null, 56);
    }

    public IapPurchaseCanceled() {
        this(null, null, null, null, null, null, 63, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public IapPurchaseCanceled(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, Integer num, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.product_id = str;
        this.error_message = str2;
        this.error_domain = str3;
        this.error_code = num;
    }
}
