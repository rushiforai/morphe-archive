package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
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
import defpackage.kw7;
import defpackage.lv8;
import defpackage.lw7;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001b\b\u0007\u0018\u0000 @2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002AB\u008d\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\t\u0012\b\b\u0002\u0010 \u001a\u00020\u001f¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u0002H\u0016¢\u0006\u0004\b#\u0010$J\u001a\u0010(\u001a\u00020'2\b\u0010&\u001a\u0004\u0018\u00010%H\u0096\u0002¢\u0006\u0004\b(\u0010)J\u000f\u0010*\u001a\u00020\tH\u0016¢\u0006\u0004\b*\u0010+J\u000f\u0010,\u001a\u00020\u0003H\u0016¢\u0006\u0004\b,\u0010-J\u0093\u0002\u0010.\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\t2\b\b\u0002\u0010 \u001a\u00020\u001f¢\u0006\u0004\b.\u0010/R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u00100R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u00101R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u00102R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u00103R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u00104R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u00105R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u00103R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u00100R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u00100R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u00100R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u00106R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u00106R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u00103R\u001c\u0010\u0017\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0017\u00100\u0012\u0004\b7\u00108R\u001c\u0010\u0018\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0018\u00100\u0012\u0004\b9\u00108R\u001c\u0010\u0019\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0019\u00100\u0012\u0004\b:\u00108R\u001c\u0010\u001a\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001a\u00103\u0012\u0004\b;\u00108R\u001c\u0010\u001b\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001b\u00103\u0012\u0004\b<\u00108R\u001c\u0010\u001c\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001c\u00103\u0012\u0004\b=\u00108R\u001c\u0010\u001d\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001d\u00103\u0012\u0004\b>\u00108R\u001c\u0010\u001e\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u001e\u00103\u0012\u0004\b?\u00108¨\u0006B"}, d2 = {"Lgen/model/MembershipPlan;", "Lcom/squareup/wire/AndroidMessage;", "Lkw7;", "", "membership_plan_id", "Lgen/model/MembershipType;", "membership_type", "Lgen/model/PaymentProvider;", "provider", "", "amount", "Lgen/model/PaymentCurrency;", "currency", "Lgen/model/PaymentRecurrenceInterval;", "interval", "interval_count", "name", "tier", "collection_id", "", "discontinued_at", "created_at", "trial_period_days", "solicitation_message", "thanks_message", "email_welcome_message", "member_count", "recurring_amount_net", "active_member_count", "cancellation_pending_member_count", "cancelled_member_count", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/MembershipType;Lgen/model/PaymentProvider;Ljava/lang/Integer;Lgen/model/PaymentCurrency;Lgen/model/PaymentRecurrenceInterval;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lkw7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/MembershipType;Lgen/model/PaymentProvider;Ljava/lang/Integer;Lgen/model/PaymentCurrency;Lgen/model/PaymentRecurrenceInterval;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)Lgen/model/MembershipPlan;", "Ljava/lang/String;", "Lgen/model/MembershipType;", "Lgen/model/PaymentProvider;", "Ljava/lang/Integer;", "Lgen/model/PaymentCurrency;", "Lgen/model/PaymentRecurrenceInterval;", "Ljava/lang/Long;", "getSolicitation_message$annotations", "()V", "getThanks_message$annotations", "getEmail_welcome_message$annotations", "getMember_count$annotations", "getRecurring_amount_net$annotations", "getActive_member_count$annotations", "getCancellation_pending_member_count$annotations", "getCancelled_member_count$annotations", "Companion", "lw7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipPlan extends AndroidMessage<MembershipPlan, kw7> {
    public static final ProtoAdapter<MembershipPlan> ADAPTER;
    public static final Parcelable.Creator<MembershipPlan> CREATOR;
    public static final lw7 Companion = new lw7();
    public static final MembershipType DEFAULT_MEMBERSHIP_TYPE = MembershipType.COLLECTION_MEMBERSHIP;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 18, tag = 15)
    public final Integer active_member_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 2)
    public final Integer amount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 19, tag = 16)
    public final Integer cancellation_pending_member_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 20, tag = 17)
    public final Integer cancelled_member_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 8)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 11, tag = 18)
    public final Long created_at;

    @WireField(adapter = "gen.model.PaymentCurrency#ADAPTER", schemaIndex = 4, tag = 3)
    public final PaymentCurrency currency;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 10, tag = 14)
    public final Long discontinued_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 15, tag = 11)
    public final String email_welcome_message;

    @WireField(adapter = "gen.model.PaymentRecurrenceInterval#ADAPTER", schemaIndex = 5, tag = 4)
    public final PaymentRecurrenceInterval interval;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 6, tag = 5)
    public final Integer interval_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 16, tag = 12)
    public final Integer member_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String membership_plan_id;

    @WireField(adapter = "gen.model.MembershipType#ADAPTER", schemaIndex = 1, tag = 19)
    public final MembershipType membership_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 6)
    public final String name;

    @WireField(adapter = "gen.model.PaymentProvider#ADAPTER", schemaIndex = 2, tag = 21)
    public final PaymentProvider provider;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 17, tag = 13)
    public final Integer recurring_amount_net;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 9)
    public final String solicitation_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 10)
    public final String thanks_message;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 7)
    public final String tier;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 12, tag = 20)
    public final Integer trial_period_days;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MembershipPlan.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MembershipPlan> protoAdapter = new ProtoAdapter<MembershipPlan>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MembershipPlan$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MembershipPlan decode(ProtoReader reader) {
                MembershipType membershipType;
                PaymentProvider paymentProvider;
                Integer num;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str = null;
                MembershipType membershipTypeDecode = null;
                PaymentProvider paymentProviderDecode = null;
                Integer numDecode = null;
                PaymentCurrency paymentCurrencyDecode = null;
                PaymentRecurrenceInterval paymentRecurrenceIntervalDecode = null;
                Integer numDecode2 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Integer numDecode3 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Integer numDecode4 = null;
                Integer numDecode5 = null;
                Integer numDecode6 = null;
                Integer numDecode7 = null;
                Integer numDecode8 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MembershipPlan(str, membershipTypeDecode, paymentProviderDecode, numDecode, paymentCurrencyDecode, paymentRecurrenceIntervalDecode, numDecode2, strDecode2, strDecode3, strDecode4, lDecode, lDecode2, numDecode3, strDecode5, strDecode6, strDecode7, numDecode4, numDecode5, numDecode6, numDecode7, numDecode8, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 3:
                            membershipType = membershipTypeDecode;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            try {
                                paymentCurrencyDecode = PaymentCurrency.ADAPTER.decode(reader);
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                                strDecode = str;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str;
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                            }
                            break;
                        case 4:
                            membershipType = membershipTypeDecode;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            try {
                                paymentRecurrenceIntervalDecode = PaymentRecurrenceInterval.ADAPTER.decode(reader);
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                                strDecode = str;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str;
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                            }
                            break;
                        case 5:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 6:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 7:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 8:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 9:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 10:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 11:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            break;
                        case 12:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 13:
                            numDecode5 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 14:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            break;
                        case 15:
                            numDecode6 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 16:
                            numDecode7 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 17:
                            numDecode8 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 18:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            break;
                        case 19:
                            membershipType = membershipTypeDecode;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            try {
                                membershipTypeDecode = MembershipType.ADAPTER.decode(reader);
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                                strDecode = str;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str;
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                            }
                            break;
                        case 20:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 21:
                            try {
                                paymentProviderDecode = PaymentProvider.ADAPTER.decode(reader);
                                strDecode = str;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                membershipType = membershipTypeDecode;
                                paymentProvider = paymentProviderDecode;
                                num = numDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                strDecode = str;
                                membershipTypeDecode = membershipType;
                                numDecode = num;
                                paymentProviderDecode = paymentProvider;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            membershipType = membershipTypeDecode;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            strDecode = str;
                            membershipTypeDecode = membershipType;
                            numDecode = num;
                            paymentProviderDecode = paymentProvider;
                            break;
                    }
                    str = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MembershipPlan value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.membership_plan_id);
                MembershipType.ADAPTER.encodeWithTag(writer, 19, value.membership_type);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 21, value.provider);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 2, value.amount);
                PaymentCurrency.ADAPTER.encodeWithTag(writer, 3, value.currency);
                PaymentRecurrenceInterval.ADAPTER.encodeWithTag(writer, 4, value.interval);
                protoAdapter3.encodeWithTag(writer, 5, value.interval_count);
                protoAdapter2.encodeWithTag(writer, 6, value.name);
                protoAdapter2.encodeWithTag(writer, 7, value.tier);
                protoAdapter2.encodeWithTag(writer, 8, value.collection_id);
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                protoAdapter4.encodeWithTag(writer, 14, value.discontinued_at);
                protoAdapter4.encodeWithTag(writer, 18, value.created_at);
                protoAdapter3.encodeWithTag(writer, 20, value.trial_period_days);
                protoAdapter2.encodeWithTag(writer, 9, value.solicitation_message);
                protoAdapter2.encodeWithTag(writer, 10, value.thanks_message);
                protoAdapter2.encodeWithTag(writer, 11, value.email_welcome_message);
                protoAdapter3.encodeWithTag(writer, 12, value.member_count);
                protoAdapter3.encodeWithTag(writer, 13, value.recurring_amount_net);
                protoAdapter3.encodeWithTag(writer, 15, value.active_member_count);
                protoAdapter3.encodeWithTag(writer, 16, value.cancellation_pending_member_count);
                protoAdapter3.encodeWithTag(writer, 17, value.cancelled_member_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MembershipPlan value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = PaymentProvider.ADAPTER.encodedSizeWithTag(21, value.provider) + MembershipType.ADAPTER.encodedSizeWithTag(19, value.membership_type) + protoAdapter2.encodedSizeWithTag(1, value.membership_plan_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(8, value.collection_id) + protoAdapter2.encodedSizeWithTag(7, value.tier) + protoAdapter2.encodedSizeWithTag(6, value.name) + protoAdapter3.encodedSizeWithTag(5, value.interval_count) + PaymentRecurrenceInterval.ADAPTER.encodedSizeWithTag(4, value.interval) + PaymentCurrency.ADAPTER.encodedSizeWithTag(3, value.currency) + protoAdapter3.encodedSizeWithTag(2, value.amount) + iEncodedSizeWithTag;
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                return protoAdapter3.encodedSizeWithTag(17, value.cancelled_member_count) + protoAdapter3.encodedSizeWithTag(16, value.cancellation_pending_member_count) + protoAdapter3.encodedSizeWithTag(15, value.active_member_count) + protoAdapter3.encodedSizeWithTag(13, value.recurring_amount_net) + protoAdapter3.encodedSizeWithTag(12, value.member_count) + protoAdapter2.encodedSizeWithTag(11, value.email_welcome_message) + protoAdapter2.encodedSizeWithTag(10, value.thanks_message) + protoAdapter2.encodedSizeWithTag(9, value.solicitation_message) + protoAdapter3.encodedSizeWithTag(20, value.trial_period_days) + protoAdapter4.encodedSizeWithTag(18, value.created_at) + protoAdapter4.encodedSizeWithTag(14, value.discontinued_at) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MembershipPlan redact(MembershipPlan value) {
                value.getClass();
                return value.copy((2097151 & 1) != 0 ? value.membership_plan_id : null, (2097151 & 2) != 0 ? value.membership_type : null, (2097151 & 4) != 0 ? value.provider : null, (2097151 & 8) != 0 ? value.amount : null, (2097151 & 16) != 0 ? value.currency : null, (2097151 & 32) != 0 ? value.interval : null, (2097151 & 64) != 0 ? value.interval_count : null, (2097151 & 128) != 0 ? value.name : null, (2097151 & 256) != 0 ? value.tier : null, (2097151 & 512) != 0 ? value.collection_id : null, (2097151 & 1024) != 0 ? value.discontinued_at : null, (2097151 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.created_at : null, (2097151 & 4096) != 0 ? value.trial_period_days : null, (2097151 & 8192) != 0 ? value.solicitation_message : null, (2097151 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.thanks_message : null, (2097151 & 32768) != 0 ? value.email_welcome_message : null, (2097151 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.member_count : null, (2097151 & 131072) != 0 ? value.recurring_amount_net : null, (2097151 & 262144) != 0 ? value.active_member_count : null, (2097151 & 524288) != 0 ? value.cancellation_pending_member_count : null, (2097151 & 1048576) != 0 ? value.cancelled_member_count : null, (2097151 & 2097152) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MembershipPlan value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 17, value.cancelled_member_count);
                protoAdapter2.encodeWithTag(writer, 16, value.cancellation_pending_member_count);
                protoAdapter2.encodeWithTag(writer, 15, value.active_member_count);
                protoAdapter2.encodeWithTag(writer, 13, value.recurring_amount_net);
                protoAdapter2.encodeWithTag(writer, 12, value.member_count);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 11, value.email_welcome_message);
                protoAdapter3.encodeWithTag(writer, 10, value.thanks_message);
                protoAdapter3.encodeWithTag(writer, 9, value.solicitation_message);
                protoAdapter2.encodeWithTag(writer, 20, value.trial_period_days);
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                protoAdapter4.encodeWithTag(writer, 18, value.created_at);
                protoAdapter4.encodeWithTag(writer, 14, value.discontinued_at);
                protoAdapter3.encodeWithTag(writer, 8, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 7, value.tier);
                protoAdapter3.encodeWithTag(writer, 6, value.name);
                protoAdapter2.encodeWithTag(writer, 5, value.interval_count);
                PaymentRecurrenceInterval.ADAPTER.encodeWithTag(writer, 4, value.interval);
                PaymentCurrency.ADAPTER.encodeWithTag(writer, 3, value.currency);
                protoAdapter2.encodeWithTag(writer, 2, value.amount);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 21, value.provider);
                MembershipType.ADAPTER.encodeWithTag(writer, 19, value.membership_type);
                protoAdapter3.encodeWithTag(writer, 1, value.membership_plan_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MembershipPlan(String str, MembershipType membershipType, PaymentProvider paymentProvider, Integer num, PaymentCurrency paymentCurrency, PaymentRecurrenceInterval paymentRecurrenceInterval, Integer num2, String str2, String str3, String str4, Long l, Long l2, Integer num3, String str5, String str6, String str7, Integer num4, Integer num5, Integer num6, Integer num7, Integer num8, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : membershipType, (i & 4) != 0 ? null : paymentProvider, (i & 8) != 0 ? null : num, (i & 16) != 0 ? null : paymentCurrency, (i & 32) != 0 ? null : paymentRecurrenceInterval, (i & 64) != 0 ? null : num2, (i & 128) != 0 ? null : str2, (i & 256) != 0 ? null : str3, (i & 512) != 0 ? null : str4, (i & 1024) != 0 ? null : l, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : l2, (i & 4096) != 0 ? null : num3, (i & 8192) != 0 ? null : str5, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str6, (i & 32768) != 0 ? null : str7, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : num4, (i & 131072) != 0 ? null : num5, (i & 262144) != 0 ? null : num6, (i & 524288) != 0 ? null : num7, (i & 1048576) != 0 ? null : num8, (i & 2097152) != 0 ? h21.d : h21Var);
    }

    public final MembershipPlan copy(String membership_plan_id, MembershipType membership_type, PaymentProvider provider, Integer amount, PaymentCurrency currency, PaymentRecurrenceInterval interval, Integer interval_count, String name, String tier, String collection_id, Long discontinued_at, Long created_at, Integer trial_period_days, String solicitation_message, String thanks_message, String email_welcome_message, Integer member_count, Integer recurring_amount_net, Integer active_member_count, Integer cancellation_pending_member_count, Integer cancelled_member_count, h21 unknownFields) {
        unknownFields.getClass();
        return new MembershipPlan(membership_plan_id, membership_type, provider, amount, currency, interval, interval_count, name, tier, collection_id, discontinued_at, created_at, trial_period_days, solicitation_message, thanks_message, email_welcome_message, member_count, recurring_amount_net, active_member_count, cancellation_pending_member_count, cancelled_member_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MembershipPlan)) {
            return false;
        }
        MembershipPlan membershipPlan = (MembershipPlan) other;
        return g76.L(unknownFields(), membershipPlan.unknownFields()) && g76.L(this.membership_plan_id, membershipPlan.membership_plan_id) && this.membership_type == membershipPlan.membership_type && this.provider == membershipPlan.provider && g76.L(this.amount, membershipPlan.amount) && this.currency == membershipPlan.currency && this.interval == membershipPlan.interval && g76.L(this.interval_count, membershipPlan.interval_count) && g76.L(this.name, membershipPlan.name) && g76.L(this.tier, membershipPlan.tier) && g76.L(this.collection_id, membershipPlan.collection_id) && g76.L(this.discontinued_at, membershipPlan.discontinued_at) && g76.L(this.created_at, membershipPlan.created_at) && g76.L(this.trial_period_days, membershipPlan.trial_period_days) && g76.L(this.solicitation_message, membershipPlan.solicitation_message) && g76.L(this.thanks_message, membershipPlan.thanks_message) && g76.L(this.email_welcome_message, membershipPlan.email_welcome_message) && g76.L(this.member_count, membershipPlan.member_count) && g76.L(this.recurring_amount_net, membershipPlan.recurring_amount_net) && g76.L(this.active_member_count, membershipPlan.active_member_count) && g76.L(this.cancellation_pending_member_count, membershipPlan.cancellation_pending_member_count) && g76.L(this.cancelled_member_count, membershipPlan.cancelled_member_count);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.membership_plan_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        MembershipType membershipType = this.membership_type;
        int iHashCode3 = (iHashCode2 + (membershipType != null ? membershipType.hashCode() : 0)) * 37;
        PaymentProvider paymentProvider = this.provider;
        int iHashCode4 = (iHashCode3 + (paymentProvider != null ? paymentProvider.hashCode() : 0)) * 37;
        Integer num = this.amount;
        int iIntValue = (iHashCode4 + (num != null ? num.intValue() : 0)) * 37;
        PaymentCurrency paymentCurrency = this.currency;
        int iHashCode5 = (iIntValue + (paymentCurrency != null ? paymentCurrency.hashCode() : 0)) * 37;
        PaymentRecurrenceInterval paymentRecurrenceInterval = this.interval;
        int iHashCode6 = (iHashCode5 + (paymentRecurrenceInterval != null ? paymentRecurrenceInterval.hashCode() : 0)) * 37;
        Integer num2 = this.interval_count;
        int iIntValue2 = (iHashCode6 + (num2 != null ? num2.intValue() : 0)) * 37;
        String str2 = this.name;
        int iHashCode7 = (iIntValue2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.tier;
        int iHashCode8 = (iHashCode7 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.collection_id;
        int iHashCode9 = (iHashCode8 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Long l = this.discontinued_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iHashCode9 + i) * 37;
        Long l2 = this.created_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i5 = (i4 + i2) * 37;
        Integer num3 = this.trial_period_days;
        int iIntValue3 = (i5 + (num3 != null ? num3.intValue() : 0)) * 37;
        String str5 = this.solicitation_message;
        int iHashCode10 = (iIntValue3 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.thanks_message;
        int iHashCode11 = (iHashCode10 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.email_welcome_message;
        int iHashCode12 = (iHashCode11 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Integer num4 = this.member_count;
        int iIntValue4 = (iHashCode12 + (num4 != null ? num4.intValue() : 0)) * 37;
        Integer num5 = this.recurring_amount_net;
        int iIntValue5 = (iIntValue4 + (num5 != null ? num5.intValue() : 0)) * 37;
        Integer num6 = this.active_member_count;
        int iIntValue6 = (iIntValue5 + (num6 != null ? num6.intValue() : 0)) * 37;
        Integer num7 = this.cancellation_pending_member_count;
        int iIntValue7 = (iIntValue6 + (num7 != null ? num7.intValue() : 0)) * 37;
        Integer num8 = this.cancelled_member_count;
        int iIntValue8 = iIntValue7 + (num8 != null ? num8.intValue() : 0);
        this.hashCode = iIntValue8;
        return iIntValue8;
    }

    @Override // com.squareup.wire.Message
    public final kw7 newBuilder() {
        kw7 kw7Var = new kw7();
        kw7Var.a = this.membership_plan_id;
        kw7Var.b = this.membership_type;
        kw7Var.c = this.provider;
        kw7Var.d = this.amount;
        kw7Var.e = this.currency;
        kw7Var.f = this.interval;
        kw7Var.g = this.interval_count;
        kw7Var.h = this.name;
        kw7Var.i = this.tier;
        kw7Var.j = this.collection_id;
        kw7Var.k = this.discontinued_at;
        kw7Var.l = this.created_at;
        kw7Var.m = this.trial_period_days;
        kw7Var.n = this.solicitation_message;
        kw7Var.o = this.thanks_message;
        kw7Var.p = this.email_welcome_message;
        kw7Var.q = this.member_count;
        kw7Var.r = this.recurring_amount_net;
        kw7Var.s = this.active_member_count;
        kw7Var.t = this.cancellation_pending_member_count;
        kw7Var.u = this.cancelled_member_count;
        kw7Var.addUnknownFields(unknownFields());
        return kw7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.membership_plan_id;
        if (str != null) {
            lv8.D(str, "membership_plan_id=", arrayList);
        }
        MembershipType membershipType = this.membership_type;
        if (membershipType != null) {
            arrayList.add("membership_type=" + membershipType);
        }
        PaymentProvider paymentProvider = this.provider;
        if (paymentProvider != null) {
            arrayList.add("provider=" + paymentProvider);
        }
        Integer num = this.amount;
        if (num != null) {
            lv8.B("amount=", num, arrayList);
        }
        PaymentCurrency paymentCurrency = this.currency;
        if (paymentCurrency != null) {
            arrayList.add("currency=" + paymentCurrency);
        }
        PaymentRecurrenceInterval paymentRecurrenceInterval = this.interval;
        if (paymentRecurrenceInterval != null) {
            arrayList.add("interval=" + paymentRecurrenceInterval);
        }
        Integer num2 = this.interval_count;
        if (num2 != null) {
            lv8.B("interval_count=", num2, arrayList);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.tier;
        if (str3 != null) {
            lv8.D(str3, "tier=", arrayList);
        }
        String str4 = this.collection_id;
        if (str4 != null) {
            lv8.D(str4, "collection_id=", arrayList);
        }
        Long l = this.discontinued_at;
        if (l != null) {
            y30.A("discontinued_at=", l, arrayList);
        }
        Long l2 = this.created_at;
        if (l2 != null) {
            y30.A("created_at=", l2, arrayList);
        }
        Integer num3 = this.trial_period_days;
        if (num3 != null) {
            lv8.B("trial_period_days=", num3, arrayList);
        }
        String str5 = this.solicitation_message;
        if (str5 != null) {
            lv8.D(str5, "solicitation_message=", arrayList);
        }
        String str6 = this.thanks_message;
        if (str6 != null) {
            lv8.D(str6, "thanks_message=", arrayList);
        }
        String str7 = this.email_welcome_message;
        if (str7 != null) {
            lv8.D(str7, "email_welcome_message=", arrayList);
        }
        Integer num4 = this.member_count;
        if (num4 != null) {
            lv8.B("member_count=", num4, arrayList);
        }
        Integer num5 = this.recurring_amount_net;
        if (num5 != null) {
            lv8.B("recurring_amount_net=", num5, arrayList);
        }
        Integer num6 = this.active_member_count;
        if (num6 != null) {
            lv8.B("active_member_count=", num6, arrayList);
        }
        Integer num7 = this.cancellation_pending_member_count;
        if (num7 != null) {
            lv8.B("cancellation_pending_member_count=", num7, arrayList);
        }
        Integer num8 = this.cancelled_member_count;
        if (num8 != null) {
            lv8.B("cancelled_member_count=", num8, arrayList);
        }
        return bu1.F0(arrayList, ", ", "MembershipPlan{", "}", null, 56);
    }

    public MembershipPlan() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 4194303, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MembershipPlan(String str, MembershipType membershipType, PaymentProvider paymentProvider, Integer num, PaymentCurrency paymentCurrency, PaymentRecurrenceInterval paymentRecurrenceInterval, Integer num2, String str2, String str3, String str4, Long l, Long l2, Integer num3, String str5, String str6, String str7, Integer num4, Integer num5, Integer num6, Integer num7, Integer num8, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.membership_plan_id = str;
        this.membership_type = membershipType;
        this.provider = paymentProvider;
        this.amount = num;
        this.currency = paymentCurrency;
        this.interval = paymentRecurrenceInterval;
        this.interval_count = num2;
        this.name = str2;
        this.tier = str3;
        this.collection_id = str4;
        this.discontinued_at = l;
        this.created_at = l2;
        this.trial_period_days = num3;
        this.solicitation_message = str5;
        this.thanks_message = str6;
        this.email_welcome_message = str7;
        this.member_count = num4;
        this.recurring_amount_net = num5;
        this.active_member_count = num6;
        this.cancellation_pending_member_count = num7;
        this.cancelled_member_count = num8;
    }

    public static /* synthetic */ void getActive_member_count$annotations() {
    }

    public static /* synthetic */ void getCancellation_pending_member_count$annotations() {
    }

    public static /* synthetic */ void getCancelled_member_count$annotations() {
    }

    public static /* synthetic */ void getEmail_welcome_message$annotations() {
    }

    public static /* synthetic */ void getMember_count$annotations() {
    }

    public static /* synthetic */ void getRecurring_amount_net$annotations() {
    }

    public static /* synthetic */ void getSolicitation_message$annotations() {
    }

    public static /* synthetic */ void getThanks_message$annotations() {
    }
}
