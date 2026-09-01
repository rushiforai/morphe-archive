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
import defpackage.kj4;
import defpackage.lj4;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.r34;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000e\b\u0007\u0018\u0000 \u001e2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001fBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u000f\u0010\u000e\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u001a\u0010\u0013\u001a\u00020\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0096\u0002¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J\u000f\u0010\u0017\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0017\u0010\u0018JG\u0010\u0019\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0019\u0010\u001aR\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001bR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001cR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001dR\u0016\u0010\t\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\u001d¨\u0006 "}, d2 = {"Lcom/medium/proto/event/FindYourFriendsCompleted;", "Lcom/squareup/wire/AndroidMessage;", "Lkj4;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "common_fields", "", "locale", "", "phone_numbers_count", "email_addresses_count", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lkj4;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/event/AnalyticsEventCommonFields;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)Lcom/medium/proto/event/FindYourFriendsCompleted;", "Lcom/medium/proto/event/AnalyticsEventCommonFields;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Companion", "lj4", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
@r34("findYourFriends.completed")
public final class FindYourFriendsCompleted extends AndroidMessage<FindYourFriendsCompleted, kj4> {
    public static final ProtoAdapter<FindYourFriendsCompleted> ADAPTER;
    public static final Parcelable.Creator<FindYourFriendsCompleted> CREATOR;
    public static final lj4 Companion = new lj4();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.event.AnalyticsEventCommonFields#ADAPTER", jsonName = "commonFields", label = WireField.Label.OMIT_IDENTITY, schemaIndex = 0, tag = 1)
    public final AnalyticsEventCommonFields common_fields;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "emailAddressesCount", schemaIndex = 3, tag = 4)
    public final Integer email_addresses_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String locale;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", jsonName = "phoneNumbersCount", schemaIndex = 2, tag = 3)
    public final Integer phone_numbers_count;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(FindYourFriendsCompleted.class);
        final Syntax syntax = Syntax.PROTO_3;
        ProtoAdapter<FindYourFriendsCompleted> protoAdapter = new ProtoAdapter<FindYourFriendsCompleted>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.event.FindYourFriendsCompleted$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final FindYourFriendsCompleted decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                AnalyticsEventCommonFields analyticsEventCommonFieldsDecode = null;
                String strDecode = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new FindYourFriendsCompleted(analyticsEventCommonFieldsDecode, strDecode, numDecode, numDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        analyticsEventCommonFieldsDecode = AnalyticsEventCommonFields.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        numDecode = ProtoAdapter.INT32.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        numDecode2 = ProtoAdapter.INT32.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, FindYourFriendsCompleted value) {
                writer.getClass();
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.locale);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 3, value.phone_numbers_count);
                protoAdapter2.encodeWithTag(writer, 4, value.email_addresses_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(FindYourFriendsCompleted value) {
                value.getClass();
                int iE = value.unknownFields().e();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    iE += AnalyticsEventCommonFields.ADAPTER.encodedSizeWithTag(1, analyticsEventCommonFields);
                }
                int iEncodedSizeWithTag = ProtoAdapter.STRING.encodedSizeWithTag(2, value.locale) + iE;
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(4, value.email_addresses_count) + protoAdapter2.encodedSizeWithTag(3, value.phone_numbers_count) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final FindYourFriendsCompleted redact(FindYourFriendsCompleted value) {
                value.getClass();
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                return FindYourFriendsCompleted.copy$default(value, analyticsEventCommonFields != null ? AnalyticsEventCommonFields.ADAPTER.redact(analyticsEventCommonFields) : null, null, null, null, h21.d, 14, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, FindYourFriendsCompleted value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 4, value.email_addresses_count);
                protoAdapter2.encodeWithTag(writer, 3, value.phone_numbers_count);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.locale);
                AnalyticsEventCommonFields analyticsEventCommonFields = value.common_fields;
                if (analyticsEventCommonFields != null) {
                    AnalyticsEventCommonFields.ADAPTER.encodeWithTag(writer, 1, analyticsEventCommonFields);
                }
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ FindYourFriendsCompleted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, Integer num2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : analyticsEventCommonFields, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : num, (i & 8) != 0 ? null : num2, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ FindYourFriendsCompleted copy$default(FindYourFriendsCompleted findYourFriendsCompleted, AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, Integer num2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            analyticsEventCommonFields = findYourFriendsCompleted.common_fields;
        }
        if ((i & 2) != 0) {
            str = findYourFriendsCompleted.locale;
        }
        if ((i & 4) != 0) {
            num = findYourFriendsCompleted.phone_numbers_count;
        }
        if ((i & 8) != 0) {
            num2 = findYourFriendsCompleted.email_addresses_count;
        }
        if ((i & 16) != 0) {
            h21Var = findYourFriendsCompleted.unknownFields();
        }
        h21 h21Var2 = h21Var;
        Integer num3 = num;
        return findYourFriendsCompleted.copy(analyticsEventCommonFields, str, num3, num2, h21Var2);
    }

    public final FindYourFriendsCompleted copy(AnalyticsEventCommonFields common_fields, String locale, Integer phone_numbers_count, Integer email_addresses_count, h21 unknownFields) {
        unknownFields.getClass();
        return new FindYourFriendsCompleted(common_fields, locale, phone_numbers_count, email_addresses_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof FindYourFriendsCompleted)) {
            return false;
        }
        FindYourFriendsCompleted findYourFriendsCompleted = (FindYourFriendsCompleted) other;
        return g76.L(unknownFields(), findYourFriendsCompleted.unknownFields()) && g76.L(this.common_fields, findYourFriendsCompleted.common_fields) && g76.L(this.locale, findYourFriendsCompleted.locale) && g76.L(this.phone_numbers_count, findYourFriendsCompleted.phone_numbers_count) && g76.L(this.email_addresses_count, findYourFriendsCompleted.email_addresses_count);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        int iHashCode2 = (iHashCode + (analyticsEventCommonFields != null ? analyticsEventCommonFields.hashCode() : 0)) * 37;
        String str = this.locale;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 37;
        Integer num = this.phone_numbers_count;
        int iIntValue = (iHashCode3 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.email_addresses_count;
        int iIntValue2 = iIntValue + (num2 != null ? num2.intValue() : 0);
        this.hashCode = iIntValue2;
        return iIntValue2;
    }

    @Override // com.squareup.wire.Message
    public final kj4 newBuilder() {
        kj4 kj4Var = new kj4();
        kj4Var.a = this.common_fields;
        kj4Var.b = this.locale;
        kj4Var.c = this.phone_numbers_count;
        kj4Var.d = this.email_addresses_count;
        kj4Var.addUnknownFields(unknownFields());
        return kj4Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        AnalyticsEventCommonFields analyticsEventCommonFields = this.common_fields;
        if (analyticsEventCommonFields != null) {
            y30.z("common_fields=", analyticsEventCommonFields, arrayList);
        }
        String str = this.locale;
        if (str != null) {
            lv8.D(str, "locale=", arrayList);
        }
        Integer num = this.phone_numbers_count;
        if (num != null) {
            lv8.B("phone_numbers_count=", num, arrayList);
        }
        Integer num2 = this.email_addresses_count;
        if (num2 != null) {
            lv8.B("email_addresses_count=", num2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "FindYourFriendsCompleted{", "}", null, 56);
    }

    public FindYourFriendsCompleted() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FindYourFriendsCompleted(AnalyticsEventCommonFields analyticsEventCommonFields, String str, Integer num, Integer num2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.common_fields = analyticsEventCommonFields;
        this.locale = str;
        this.phone_numbers_count = num;
        this.email_addresses_count = num2;
    }
}
