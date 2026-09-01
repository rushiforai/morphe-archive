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
import defpackage.us8;
import defpackage.vs8;
import defpackage.wg6;
import defpackage.y30;
import gen.model.EntityClientPresentedType;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\f\b\u0007\u0018\u0000 \u001f2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002 BA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u0015H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0018\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0018\u0010\u0019JG\u0010\u001a\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u001a\u0010\u001bR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001cR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001dR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001e¨\u0006!"}, d2 = {"Lcom/medium/proto/event/OnboardingStarterPackEntitySkipped;", "Lcom/squareup/wire/AndroidMessage;", "Lus8;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "topic_category_id", "entity_id", "Lgen/model/EntityClientPresentedType;", "entity_type", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/EntityClientPresentedType;Lh21;)V", "newBuilder", "()Lus8;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/String;Lgen/model/EntityClientPresentedType;Lh21;)Lcom/medium/proto/event/OnboardingStarterPackEntitySkipped;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Lgen/model/EntityClientPresentedType;", "Companion", "vs8", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("onboarding.starterPack.entitySkipped")
public final class OnboardingStarterPackEntitySkipped extends AndroidMessage<OnboardingStarterPackEntitySkipped, us8> {
    public static final ProtoAdapter<OnboardingStarterPackEntitySkipped> ADAPTER;
    public static final Parcelable.Creator<OnboardingStarterPackEntitySkipped> CREATOR;
    public static final vs8 Companion = new vs8();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String entity_id;

    @WireField(adapter = "gen.model.EntityClientPresentedType#ADAPTER", schemaIndex = 3, tag = 4)
    public final EntityClientPresentedType entity_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String topic_category_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(OnboardingStarterPackEntitySkipped.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<OnboardingStarterPackEntitySkipped> protoAdapter = new ProtoAdapter<OnboardingStarterPackEntitySkipped>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.OnboardingStarterPackEntitySkipped$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final OnboardingStarterPackEntitySkipped decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                String strDecode2 = null;
                EntityClientPresentedType entityClientPresentedTypeDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new OnboardingStarterPackEntitySkipped(analyticsEventCommonFieldsDecode, strDecode, strDecode2, entityClientPresentedTypeDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        try {
                            entityClientPresentedTypeDecode = EntityClientPresentedType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, OnboardingStarterPackEntitySkipped value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 2, value.topic_category_id);
                protoAdapter2.encodeWithTag(writer, 3, value.entity_id);
                EntityClientPresentedType.ADAPTER.encodeWithTag(writer, 4, value.entity_type);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(OnboardingStarterPackEntitySkipped value) {
                value.getClass();
                int iEncodedSizeWithTag = AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, value.common_fields) + value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return EntityClientPresentedType.ADAPTER.encodedSizeWithTag(4, value.entity_type) + protoAdapter2.encodedSizeWithTag(3, value.entity_id) + protoAdapter2.encodedSizeWithTag(2, value.topic_category_id) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final OnboardingStarterPackEntitySkipped redact(OnboardingStarterPackEntitySkipped value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return OnboardingStarterPackEntitySkipped.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, OnboardingStarterPackEntitySkipped value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                EntityClientPresentedType.ADAPTER.encodeWithTag(writer, 4, value.entity_type);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 3, value.entity_id);
                protoAdapter2.encodeWithTag(writer, 2, value.topic_category_id);
                AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, value.common_fields);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ OnboardingStarterPackEntitySkipped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, EntityClientPresentedType entityClientPresentedType, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : entityClientPresentedType, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ OnboardingStarterPackEntitySkipped copy$default(OnboardingStarterPackEntitySkipped onboardingStarterPackEntitySkipped, AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, EntityClientPresentedType entityClientPresentedType, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = onboardingStarterPackEntitySkipped.common_fields;
        }
        if ((i & 2) != 0) {
            str = onboardingStarterPackEntitySkipped.topic_category_id;
        }
        if ((i & 4) != 0) {
            str2 = onboardingStarterPackEntitySkipped.entity_id;
        }
        if ((i & 8) != 0) {
            entityClientPresentedType = onboardingStarterPackEntitySkipped.entity_type;
        }
        if ((i & 16) != 0) {
            h21Var = onboardingStarterPackEntitySkipped.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str3 = str2;
        return onboardingStarterPackEntitySkipped.copy(analyticsEventCommonFields, str, str3, entityClientPresentedType, h21Var2);
    }

    public final OnboardingStarterPackEntitySkipped copy(AnalyticsEventCommonFields common_fields, String topic_category_id, String entity_id, EntityClientPresentedType entity_type, h21 unknownFields) {
        unknownFields.getClass();
        return new OnboardingStarterPackEntitySkipped(common_fields, topic_category_id, entity_id, entity_type, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof OnboardingStarterPackEntitySkipped)) {
            return false;
        }
        OnboardingStarterPackEntitySkipped onboardingStarterPackEntitySkipped = (OnboardingStarterPackEntitySkipped) other;
        return g76.L(unknownFields(), onboardingStarterPackEntitySkipped.unknownFields()) && g76.L(this.common_fields, onboardingStarterPackEntitySkipped.common_fields) && g76.L(this.topic_category_id, onboardingStarterPackEntitySkipped.topic_category_id) && g76.L(this.entity_id, onboardingStarterPackEntitySkipped.entity_id) && this.entity_type == onboardingStarterPackEntitySkipped.entity_type;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.topic_category_id;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.entity_id;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        EntityClientPresentedType entityClientPresentedType = this.entity_type;
        int iHashCode5 = iHashCode4 + (entityClientPresentedType != null ? entityClientPresentedType.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final us8 newBuilder() {
        us8 us8Var = new us8();
        us8Var.a = this.common_fields;
        us8Var.b = this.topic_category_id;
        us8Var.c = this.entity_id;
        us8Var.d = this.entity_type;
        us8Var.addUnknownFields(unknownFields());
        return us8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.topic_category_id;
        if (str != null) {
            lv8.D(str, "topic_category_id=", arrayList);
        }
        String str2 = this.entity_id;
        if (str2 != null) {
            lv8.D(str2, "entity_id=", arrayList);
        }
        EntityClientPresentedType entityClientPresentedType = this.entity_type;
        if (entityClientPresentedType != null) {
            arrayList.add("entity_type=" + entityClientPresentedType);
        }
        return bu1.F0(arrayList, ", ", "OnboardingStarterPackEntitySkipped{", "}", null, 56);
    }

    public OnboardingStarterPackEntitySkipped() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public OnboardingStarterPackEntitySkipped(AnalyticsEventCommonFields analyticsEventCommonFields, String str, String str2, EntityClientPresentedType entityClientPresentedType, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.topic_category_id = str;
        this.entity_id = str2;
        this.entity_type = entityClientPresentedType;
    }
}
