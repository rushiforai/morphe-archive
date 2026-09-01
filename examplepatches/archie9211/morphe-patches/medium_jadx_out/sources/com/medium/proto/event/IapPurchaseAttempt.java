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
import defpackage.av5;
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import defpackage.zu5;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lcom/medium/proto/event/IapPurchaseAttempt;", "Lcom/squareup/wire/AndroidMessage;", "Lzu5;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "product_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lzu5;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/IapPurchaseAttempt;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "av5", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("iap.purchaseAttempt")
public final class IapPurchaseAttempt extends AndroidMessage<IapPurchaseAttempt, zu5> {
    public static final ProtoAdapter<IapPurchaseAttempt> ADAPTER;
    public static final Parcelable.Creator<IapPurchaseAttempt> CREATOR;
    public static final av5 Companion = new av5();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String product_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(IapPurchaseAttempt.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<IapPurchaseAttempt> protoAdapter = new ProtoAdapter<IapPurchaseAttempt>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.IapPurchaseAttempt$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final IapPurchaseAttempt decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new IapPurchaseAttempt(analyticsEventCommonFieldsDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, IapPurchaseAttempt value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.product_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(IapPurchaseAttempt value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.product_id) + AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final IapPurchaseAttempt redact(IapPurchaseAttempt value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return IapPurchaseAttempt.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, h21.d, 2, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, IapPurchaseAttempt value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.product_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ IapPurchaseAttempt(AnalyticsEventCommonFields analyticsEventCommonFields, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ IapPurchaseAttempt copy$default(IapPurchaseAttempt iapPurchaseAttempt, AnalyticsEventCommonFields analyticsEventCommonFields, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = iapPurchaseAttempt.common_fields;
        }
        if ((i & 2) != 0) {
            str = iapPurchaseAttempt.product_id;
        }
        if ((i & 4) != 0) {
            h21Var = iapPurchaseAttempt.unknownFields();
        }
        return iapPurchaseAttempt.copy(analyticsEventCommonFields, str, h21Var);
    }

    public final IapPurchaseAttempt copy(AnalyticsEventCommonFields common_fields, String product_id, h21 unknownFields) {
        unknownFields.getClass();
        return new IapPurchaseAttempt(common_fields, product_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof IapPurchaseAttempt)) {
            return false;
        }
        IapPurchaseAttempt iapPurchaseAttempt = (IapPurchaseAttempt) other;
        return g76.L(unknownFields(), iapPurchaseAttempt.unknownFields()) && g76.L(this.common_fields, iapPurchaseAttempt.common_fields) && g76.L(this.product_id, iapPurchaseAttempt.product_id);
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
        int iHashCode3 = iHashCode2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final zu5 newBuilder() {
        zu5 zu5Var = new zu5();
        zu5Var.a = this.common_fields;
        zu5Var.b = this.product_id;
        zu5Var.addUnknownFields(unknownFields());
        return zu5Var;
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
        return bu1.F0(arrayList, ", ", "IapPurchaseAttempt{", "}", null, 56);
    }

    public IapPurchaseAttempt() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public IapPurchaseAttempt(AnalyticsEventCommonFields analyticsEventCommonFields, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.product_id = str;
    }
}
