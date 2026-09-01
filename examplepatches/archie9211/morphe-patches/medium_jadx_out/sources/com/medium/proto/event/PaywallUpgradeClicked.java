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
import defpackage.t79;
import defpackage.u79;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB?\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0012\u001a\u00020\u00112\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JE\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0014\u0010\u0006\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/event/PaywallUpgradeClicked;", "Lcom/squareup/wire/AndroidMessage;", "Lt79;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "dimension", "post_id", "user_id", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lt79;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lcom/medium/proto/event/PaywallUpgradeClicked;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Companion", "u79", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("paywall.upgradeClicked")
public final class PaywallUpgradeClicked extends AndroidMessage<PaywallUpgradeClicked, t79> {
    public static final ProtoAdapter<PaywallUpgradeClicked> ADAPTER;
    public static final Parcelable.Creator<PaywallUpgradeClicked> CREATOR;
    public static final u79 Companion = new u79();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 1, tag = 2)
    public final String dimension;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "postId", schemaIndex = 2, tag = 3)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", jsonName = "userId", schemaIndex = 3, tag = 4)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PaywallUpgradeClicked.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<PaywallUpgradeClicked> protoAdapter = new ProtoAdapter<PaywallUpgradeClicked>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.PaywallUpgradeClicked$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PaywallUpgradeClicked decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = "";
                String strDecode3 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PaywallUpgradeClicked(analyticsEventCommonFieldsDecode, strDecode2, strDecode3, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PaywallUpgradeClicked value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                if (!g76.L(value.dimension, "")) {
                    ProtoAdapter.STRING.encodeWithTag(writer, 2, value.dimension);
                }
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                protoAdapter2.encodeWithTag(writer, 4, value.user_id);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PaywallUpgradeClicked value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                if (!g76.L(value.dimension, "")) {
                    iE += ProtoAdapter.STRING.encodedSizeWithTag(2, value.dimension);
                }
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(4, value.user_id) + protoAdapter2.encodedSizeWithTag(3, value.post_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PaywallUpgradeClicked redact(PaywallUpgradeClicked value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return PaywallUpgradeClicked.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PaywallUpgradeClicked value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.user_id);
                protoAdapter2.encodeWithTag(writer, 3, value.post_id);
                if (!g76.L(value.dimension, "")) {
                    protoAdapter2.encodeWithTag(writer, 2, value.dimension);
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

    public /* synthetic */ PaywallUpgradeClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? "" : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PaywallUpgradeClicked copy$default(PaywallUpgradeClicked paywallUpgradeClicked, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = paywallUpgradeClicked.common_fields;
        }
        if ((i & 2) != 0) {
            str = paywallUpgradeClicked.dimension;
        }
        if ((i & 4) != 0) {
            str2 = paywallUpgradeClicked.post_id;
        }
        if ((i & 8) != 0) {
            str3 = paywallUpgradeClicked.user_id;
        }
        if ((i & 16) != 0) {
            h21Var = paywallUpgradeClicked.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str4 = str2;
        return paywallUpgradeClicked.copy(analyticsEventCommonFields, str, str4, str3, h21Var2);
    }

    public final PaywallUpgradeClicked copy(AnalyticsEventCommonFields common_fields, String dimension, String post_id, String user_id, h21 unknownFields) {
        dimension.getClass();
        unknownFields.getClass();
        return new PaywallUpgradeClicked(common_fields, dimension, post_id, user_id, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PaywallUpgradeClicked)) {
            return false;
        }
        PaywallUpgradeClicked paywallUpgradeClicked = (PaywallUpgradeClicked) other;
        return g76.L(unknownFields(), paywallUpgradeClicked.unknownFields()) && g76.L(this.common_fields, paywallUpgradeClicked.common_fields) && g76.L(this.dimension, paywallUpgradeClicked.dimension) && g76.L(this.post_id, paywallUpgradeClicked.post_id) && g76.L(this.user_id, paywallUpgradeClicked.user_id);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iO = wgd.o((iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37, 37, this.dimension);
        String str = this.post_id;
        int iHashCode2 = (iO + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.user_id;
        int iHashCode3 = iHashCode2 + (str2 != null ? str2.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final t79 newBuilder() {
        t79 t79Var = new t79();
        t79Var.b = "";
        t79Var.a = this.common_fields;
        t79Var.b = this.dimension;
        t79Var.c = this.post_id;
        t79Var.d = this.user_id;
        t79Var.addUnknownFields(unknownFields());
        return t79Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        lv8.D(this.dimension, "dimension=", arrayList);
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        String str2 = this.user_id;
        if (str2 != null) {
            lv8.D(str2, "user_id=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "PaywallUpgradeClicked{", "}", null, 56);
    }

    public PaywallUpgradeClicked() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PaywallUpgradeClicked(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, String str3, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.dimension = str;
        this.post_id = str2;
        this.user_id = str3;
    }
}
