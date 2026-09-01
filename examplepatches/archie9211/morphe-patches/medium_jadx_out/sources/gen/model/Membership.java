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
import defpackage.hv7;
import defpackage.iv7;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0019\b\u0007\u0018\u0000 K2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002LBù\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001e\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010%\u001a\u0004\u0018\u00010$\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010$\u0012\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*\u0012\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010/\u001a\u00020.¢\u0006\u0004\b0\u00101J\u000f\u00102\u001a\u00020\u0002H\u0016¢\u0006\u0004\b2\u00103J\u001a\u00106\u001a\u00020$2\b\u00105\u001a\u0004\u0018\u000104H\u0096\u0002¢\u0006\u0004\b6\u00107J\u000f\u00108\u001a\u00020\nH\u0016¢\u0006\u0004\b8\u00109J\u000f\u0010:\u001a\u00020\u0003H\u0016¢\u0006\u0004\b:\u0010;Jÿ\u0002\u0010<\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u001e2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010$2\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'2\n\b\u0002\u0010)\u001a\u0004\u0018\u00010$2\n\b\u0002\u0010+\u001a\u0004\u0018\u00010*2\n\b\u0002\u0010,\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010-\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010/\u001a\u00020.¢\u0006\u0004\b<\u0010=R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010>R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010>R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010?R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010@R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010AR\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010BR\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010>R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010CR\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010DR\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010DR\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010>R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010ER\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010DR\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010DR\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010DR\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010DR\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010DR\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010FR\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u001e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010GR\u0016\u0010 \u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010>R\u0016\u0010!\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010DR\u0016\u0010\"\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010DR\u0016\u0010#\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010AR\u0016\u0010%\u001a\u0004\u0018\u00010$8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b%\u0010HR\u0016\u0010&\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010DR\u0016\u0010(\u001a\u0004\u0018\u00010'8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010IR\u0016\u0010)\u001a\u0004\u0018\u00010$8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b)\u0010HR\u0016\u0010+\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b+\u0010JR\u0016\u0010,\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b,\u0010DR\u0016\u0010-\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b-\u0010@¨\u0006M"}, d2 = {"Lgen/model/Membership;", "Lcom/squareup/wire/AndroidMessage;", "Lhv7;", "", "membership_id", "membership_plan_id", "Lgen/model/MembershipPlan;", "membership_plan", "Lgen/model/MediumMembershipType;", "medium_membership_type", "", "amount", "Lgen/model/PaymentCurrency;", "currency", "member_user_id", "Lgen/model/User;", "member", "", "started_at", "ended_at", "collection_id", "", "application_fee_percent", "cancellation_requested_at", "became_delinquent_at", "delinquent_period_ends_at", "current_period_started_at", "current_period_ends_at", "Lgen/model/CancellationType;", "cancellation_type", "Lgen/model/PaymentProvider;", "provider", "payment_method_id", "trial_started_at", "trial_ended_at", "trial_duration_days", "", "is_trial_member", "payment_source_added_at", "Lgen/model/PaymentMembershipStatus;", "payment_membership_status", "is_introductory_offer", "Lgen/model/MembershipDiscount;", "discount", "premium_at", "scheduled_switch_medium_membership_type", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/MembershipPlan;Lgen/model/MediumMembershipType;Ljava/lang/Integer;Lgen/model/PaymentCurrency;Ljava/lang/String;Lgen/model/User;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/CancellationType;Lgen/model/PaymentProvider;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;Lgen/model/PaymentMembershipStatus;Ljava/lang/Boolean;Lgen/model/MembershipDiscount;Ljava/lang/Long;Lgen/model/MediumMembershipType;Lh21;)V", "newBuilder", "()Lhv7;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/MembershipPlan;Lgen/model/MediumMembershipType;Ljava/lang/Integer;Lgen/model/PaymentCurrency;Ljava/lang/String;Lgen/model/User;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/Float;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/CancellationType;Lgen/model/PaymentProvider;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Long;Lgen/model/PaymentMembershipStatus;Ljava/lang/Boolean;Lgen/model/MembershipDiscount;Ljava/lang/Long;Lgen/model/MediumMembershipType;Lh21;)Lgen/model/Membership;", "Ljava/lang/String;", "Lgen/model/MembershipPlan;", "Lgen/model/MediumMembershipType;", "Ljava/lang/Integer;", "Lgen/model/PaymentCurrency;", "Lgen/model/User;", "Ljava/lang/Long;", "Ljava/lang/Float;", "Lgen/model/CancellationType;", "Lgen/model/PaymentProvider;", "Ljava/lang/Boolean;", "Lgen/model/PaymentMembershipStatus;", "Lgen/model/MembershipDiscount;", "Companion", "iv7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Membership extends AndroidMessage<Membership, hv7> {
    public static final ProtoAdapter<Membership> ADAPTER;
    public static final Parcelable.Creator<Membership> CREATOR;
    public static final iv7 Companion = new iv7();
    public static final MediumMembershipType DEFAULT_MEDIUM_MEMBERSHIP_TYPE = MediumMembershipType.MEDIUM_MONTHLY;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 3)
    public final Integer amount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#FLOAT", schemaIndex = 11, tag = 9)
    public final Float application_fee_percent;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 13, tag = 15)
    public final Long became_delinquent_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 12, tag = 10)
    public final Long cancellation_requested_at;

    @WireField(adapter = "gen.model.CancellationType#ADAPTER", schemaIndex = 17, tag = 14)
    public final CancellationType cancellation_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 8)
    public final String collection_id;

    @WireField(adapter = "gen.model.PaymentCurrency#ADAPTER", schemaIndex = 5, tag = 4)
    public final PaymentCurrency currency;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 16, tag = 11)
    public final Long current_period_ends_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 15, tag = 23)
    public final Long current_period_started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 14, tag = 25)
    public final Long delinquent_period_ends_at;

    @WireField(adapter = "gen.model.MembershipDiscount#ADAPTER", schemaIndex = 27, tag = 28)
    public final MembershipDiscount discount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 9, tag = 7)
    public final Long ended_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 26, tag = 27)
    public final Boolean is_introductory_offer;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 23, tag = 24)
    public final Boolean is_trial_member;

    @WireField(adapter = "gen.model.MediumMembershipType#ADAPTER", schemaIndex = 3, tag = 22)
    public final MediumMembershipType medium_membership_type;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 7, tag = 12)
    public final User member;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 5)
    public final String member_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String membership_id;

    @WireField(adapter = "gen.model.MembershipPlan#ADAPTER", schemaIndex = 2, tag = 13)
    public final MembershipPlan membership_plan;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String membership_plan_id;

    @WireField(adapter = "gen.model.PaymentMembershipStatus#ADAPTER", schemaIndex = 25, tag = 21)
    public final PaymentMembershipStatus payment_membership_status;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 19, tag = 26)
    public final String payment_method_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 24, tag = 20)
    public final Long payment_source_added_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 28, tag = 29)
    public final Long premium_at;

    @WireField(adapter = "gen.model.PaymentProvider#ADAPTER", schemaIndex = 18, tag = 16)
    public final PaymentProvider provider;

    @WireField(adapter = "gen.model.MediumMembershipType#ADAPTER", schemaIndex = 29, tag = 30)
    public final MediumMembershipType scheduled_switch_medium_membership_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 8, tag = 6)
    public final Long started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 22, tag = 19)
    public final Integer trial_duration_days;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 21, tag = 18)
    public final Long trial_ended_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 20, tag = 17)
    public final Long trial_started_at;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Membership.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Membership> protoAdapter = new ProtoAdapter<Membership>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Membership$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Membership decode(ProtoReader reader) {
                String str;
                MembershipPlan membershipPlan;
                MediumMembershipType mediumMembershipType;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str2 = null;
                String strDecode2 = null;
                MembershipPlan membershipPlanDecode = null;
                MediumMembershipType mediumMembershipTypeDecode = null;
                Integer numDecode = null;
                PaymentCurrency paymentCurrencyDecode = null;
                String strDecode3 = null;
                User userDecode = null;
                Long lDecode = null;
                Long lDecode2 = null;
                String strDecode4 = null;
                Float fDecode = null;
                Long lDecode3 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                Long lDecode6 = null;
                Long lDecode7 = null;
                CancellationType cancellationTypeDecode = null;
                PaymentProvider paymentProviderDecode = null;
                String strDecode5 = null;
                Long lDecode8 = null;
                Long lDecode9 = null;
                Integer numDecode2 = null;
                Boolean boolDecode = null;
                Long lDecode10 = null;
                PaymentMembershipStatus paymentMembershipStatusDecode = null;
                Boolean boolDecode2 = null;
                MembershipDiscount membershipDiscountDecode = null;
                Long lDecode11 = null;
                MediumMembershipType mediumMembershipTypeDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Membership(str2, strDecode2, membershipPlanDecode, mediumMembershipTypeDecode, numDecode, paymentCurrencyDecode, strDecode3, userDecode, lDecode, lDecode2, strDecode4, fDecode, lDecode3, lDecode4, lDecode5, lDecode6, lDecode7, cancellationTypeDecode, paymentProviderDecode, strDecode5, lDecode8, lDecode9, numDecode2, boolDecode, lDecode10, paymentMembershipStatusDecode, boolDecode2, membershipDiscountDecode, lDecode11, mediumMembershipTypeDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 3:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str2;
                            break;
                        case 4:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                paymentCurrencyDecode = PaymentCurrency.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 5:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 6:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 7:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 8:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 9:
                            fDecode = ProtoAdapter.FLOAT.decode(reader);
                            strDecode = str2;
                            break;
                        case 10:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 11:
                            lDecode7 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 12:
                            userDecode = User.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 13:
                            membershipPlanDecode = MembershipPlan.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 14:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                cancellationTypeDecode = CancellationType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 15:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 16:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                paymentProviderDecode = PaymentProvider.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 17:
                            lDecode8 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 18:
                            lDecode9 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 19:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str2;
                            break;
                        case 20:
                            lDecode10 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 21:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                paymentMembershipStatusDecode = PaymentMembershipStatus.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e4) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e4.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 22:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                mediumMembershipTypeDecode = MediumMembershipType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e5) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e5.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 23:
                            lDecode6 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 24:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 25:
                            lDecode5 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 26:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 27:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 28:
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            try {
                                membershipDiscountDecode = MembershipDiscount.ADAPTER.decode(reader);
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e6) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e6.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        case 29:
                            lDecode11 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 30:
                            try {
                                mediumMembershipTypeDecode2 = MediumMembershipType.ADAPTER.decode(reader);
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e7) {
                                str = strDecode2;
                                membershipPlan = membershipPlanDecode;
                                mediumMembershipType = mediumMembershipTypeDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e7.value));
                                strDecode = str2;
                                strDecode2 = str;
                                membershipPlanDecode = membershipPlan;
                                mediumMembershipTypeDecode = mediumMembershipType;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode2;
                            membershipPlan = membershipPlanDecode;
                            mediumMembershipType = mediumMembershipTypeDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            membershipPlanDecode = membershipPlan;
                            mediumMembershipTypeDecode = mediumMembershipType;
                            break;
                    }
                    str2 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Membership value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.membership_id);
                protoAdapter2.encodeWithTag(writer, 2, value.membership_plan_id);
                MembershipPlan.ADAPTER.encodeWithTag(writer, 13, value.membership_plan);
                ProtoAdapter<MediumMembershipType> protoAdapter3 = MediumMembershipType.ADAPTER;
                protoAdapter3.encodeWithTag(writer, 22, value.medium_membership_type);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 3, value.amount);
                PaymentCurrency.ADAPTER.encodeWithTag(writer, 4, value.currency);
                protoAdapter2.encodeWithTag(writer, 5, value.member_user_id);
                User.ADAPTER.encodeWithTag(writer, 12, value.member);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 6, value.started_at);
                protoAdapter5.encodeWithTag(writer, 7, value.ended_at);
                protoAdapter2.encodeWithTag(writer, 8, value.collection_id);
                ProtoAdapter.FLOAT.encodeWithTag(writer, 9, value.application_fee_percent);
                protoAdapter5.encodeWithTag(writer, 10, value.cancellation_requested_at);
                protoAdapter5.encodeWithTag(writer, 15, value.became_delinquent_at);
                protoAdapter5.encodeWithTag(writer, 25, value.delinquent_period_ends_at);
                protoAdapter5.encodeWithTag(writer, 23, value.current_period_started_at);
                protoAdapter5.encodeWithTag(writer, 11, value.current_period_ends_at);
                CancellationType.ADAPTER.encodeWithTag(writer, 14, value.cancellation_type);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 16, value.provider);
                protoAdapter2.encodeWithTag(writer, 26, value.payment_method_id);
                protoAdapter5.encodeWithTag(writer, 17, value.trial_started_at);
                protoAdapter5.encodeWithTag(writer, 18, value.trial_ended_at);
                protoAdapter4.encodeWithTag(writer, 19, value.trial_duration_days);
                ProtoAdapter<Boolean> protoAdapter6 = ProtoAdapter.BOOL;
                protoAdapter6.encodeWithTag(writer, 24, value.is_trial_member);
                protoAdapter5.encodeWithTag(writer, 20, value.payment_source_added_at);
                PaymentMembershipStatus.ADAPTER.encodeWithTag(writer, 21, value.payment_membership_status);
                protoAdapter6.encodeWithTag(writer, 27, value.is_introductory_offer);
                MembershipDiscount.ADAPTER.encodeWithTag(writer, 28, value.discount);
                protoAdapter5.encodeWithTag(writer, 29, value.premium_at);
                protoAdapter3.encodeWithTag(writer, 30, value.scheduled_switch_medium_membership_type);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Membership value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = MembershipPlan.ADAPTER.encodedSizeWithTag(13, value.membership_plan) + protoAdapter2.encodedSizeWithTag(2, value.membership_plan_id) + protoAdapter2.encodedSizeWithTag(1, value.membership_id) + iE;
                ProtoAdapter<MediumMembershipType> protoAdapter3 = MediumMembershipType.ADAPTER;
                int iEncodedSizeWithTag2 = protoAdapter3.encodedSizeWithTag(22, value.medium_membership_type) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = User.ADAPTER.encodedSizeWithTag(12, value.member) + protoAdapter2.encodedSizeWithTag(5, value.member_user_id) + PaymentCurrency.ADAPTER.encodedSizeWithTag(4, value.currency) + protoAdapter4.encodedSizeWithTag(3, value.amount) + iEncodedSizeWithTag2;
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag4 = protoAdapter4.encodedSizeWithTag(19, value.trial_duration_days) + protoAdapter5.encodedSizeWithTag(18, value.trial_ended_at) + protoAdapter5.encodedSizeWithTag(17, value.trial_started_at) + protoAdapter2.encodedSizeWithTag(26, value.payment_method_id) + PaymentProvider.ADAPTER.encodedSizeWithTag(16, value.provider) + CancellationType.ADAPTER.encodedSizeWithTag(14, value.cancellation_type) + protoAdapter5.encodedSizeWithTag(11, value.current_period_ends_at) + protoAdapter5.encodedSizeWithTag(23, value.current_period_started_at) + protoAdapter5.encodedSizeWithTag(25, value.delinquent_period_ends_at) + protoAdapter5.encodedSizeWithTag(15, value.became_delinquent_at) + protoAdapter5.encodedSizeWithTag(10, value.cancellation_requested_at) + ProtoAdapter.FLOAT.encodedSizeWithTag(9, value.application_fee_percent) + protoAdapter2.encodedSizeWithTag(8, value.collection_id) + protoAdapter5.encodedSizeWithTag(7, value.ended_at) + protoAdapter5.encodedSizeWithTag(6, value.started_at) + iEncodedSizeWithTag3;
                ProtoAdapter<Boolean> protoAdapter6 = ProtoAdapter.BOOL;
                return protoAdapter3.encodedSizeWithTag(30, value.scheduled_switch_medium_membership_type) + protoAdapter5.encodedSizeWithTag(29, value.premium_at) + MembershipDiscount.ADAPTER.encodedSizeWithTag(28, value.discount) + protoAdapter6.encodedSizeWithTag(27, value.is_introductory_offer) + PaymentMembershipStatus.ADAPTER.encodedSizeWithTag(21, value.payment_membership_status) + protoAdapter5.encodedSizeWithTag(20, value.payment_source_added_at) + protoAdapter6.encodedSizeWithTag(24, value.is_trial_member) + iEncodedSizeWithTag4;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Membership redact(Membership value) {
                value.getClass();
                MembershipPlan membershipPlan = value.membership_plan;
                MembershipPlan membershipPlanRedact = membershipPlan != null ? MembershipPlan.ADAPTER.redact(membershipPlan) : null;
                User user = value.member;
                return value.copy((1073741691 & 1) != 0 ? value.membership_id : null, (1073741691 & 2) != 0 ? value.membership_plan_id : null, (1073741691 & 4) != 0 ? value.membership_plan : membershipPlanRedact, (1073741691 & 8) != 0 ? value.medium_membership_type : null, (1073741691 & 16) != 0 ? value.amount : null, (1073741691 & 32) != 0 ? value.currency : null, (1073741691 & 64) != 0 ? value.member_user_id : null, (1073741691 & 128) != 0 ? value.member : user != null ? User.ADAPTER.redact(user) : null, (1073741691 & 256) != 0 ? value.started_at : null, (1073741691 & 512) != 0 ? value.ended_at : null, (1073741691 & 1024) != 0 ? value.collection_id : null, (1073741691 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.application_fee_percent : null, (1073741691 & 4096) != 0 ? value.cancellation_requested_at : null, (1073741691 & 8192) != 0 ? value.became_delinquent_at : null, (1073741691 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.delinquent_period_ends_at : null, (1073741691 & 32768) != 0 ? value.current_period_started_at : null, (1073741691 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.current_period_ends_at : null, (1073741691 & 131072) != 0 ? value.cancellation_type : null, (1073741691 & 262144) != 0 ? value.provider : null, (1073741691 & 524288) != 0 ? value.payment_method_id : null, (1073741691 & 1048576) != 0 ? value.trial_started_at : null, (1073741691 & 2097152) != 0 ? value.trial_ended_at : null, (1073741691 & 4194304) != 0 ? value.trial_duration_days : null, (1073741691 & 8388608) != 0 ? value.is_trial_member : null, (1073741691 & 16777216) != 0 ? value.payment_source_added_at : null, (1073741691 & 33554432) != 0 ? value.payment_membership_status : null, (1073741691 & 67108864) != 0 ? value.is_introductory_offer : null, (1073741691 & 134217728) != 0 ? value.discount : null, (1073741691 & 268435456) != 0 ? value.premium_at : null, (1073741691 & 536870912) != 0 ? value.scheduled_switch_medium_membership_type : null, (1073741691 & 1073741824) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Membership value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<MediumMembershipType> protoAdapter2 = MediumMembershipType.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 30, value.scheduled_switch_medium_membership_type);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 29, value.premium_at);
                MembershipDiscount.ADAPTER.encodeWithTag(writer, 28, value.discount);
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                protoAdapter4.encodeWithTag(writer, 27, value.is_introductory_offer);
                PaymentMembershipStatus.ADAPTER.encodeWithTag(writer, 21, value.payment_membership_status);
                protoAdapter3.encodeWithTag(writer, 20, value.payment_source_added_at);
                protoAdapter4.encodeWithTag(writer, 24, value.is_trial_member);
                ProtoAdapter<Integer> protoAdapter5 = ProtoAdapter.INT32;
                protoAdapter5.encodeWithTag(writer, 19, value.trial_duration_days);
                protoAdapter3.encodeWithTag(writer, 18, value.trial_ended_at);
                protoAdapter3.encodeWithTag(writer, 17, value.trial_started_at);
                ProtoAdapter<String> protoAdapter6 = ProtoAdapter.STRING;
                protoAdapter6.encodeWithTag(writer, 26, value.payment_method_id);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 16, value.provider);
                CancellationType.ADAPTER.encodeWithTag(writer, 14, value.cancellation_type);
                protoAdapter3.encodeWithTag(writer, 11, value.current_period_ends_at);
                protoAdapter3.encodeWithTag(writer, 23, value.current_period_started_at);
                protoAdapter3.encodeWithTag(writer, 25, value.delinquent_period_ends_at);
                protoAdapter3.encodeWithTag(writer, 15, value.became_delinquent_at);
                protoAdapter3.encodeWithTag(writer, 10, value.cancellation_requested_at);
                ProtoAdapter.FLOAT.encodeWithTag(writer, 9, value.application_fee_percent);
                protoAdapter6.encodeWithTag(writer, 8, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 7, value.ended_at);
                protoAdapter3.encodeWithTag(writer, 6, value.started_at);
                User.ADAPTER.encodeWithTag(writer, 12, value.member);
                protoAdapter6.encodeWithTag(writer, 5, value.member_user_id);
                PaymentCurrency.ADAPTER.encodeWithTag(writer, 4, value.currency);
                protoAdapter5.encodeWithTag(writer, 3, value.amount);
                protoAdapter2.encodeWithTag(writer, 22, value.medium_membership_type);
                MembershipPlan.ADAPTER.encodeWithTag(writer, 13, value.membership_plan);
                protoAdapter6.encodeWithTag(writer, 2, value.membership_plan_id);
                protoAdapter6.encodeWithTag(writer, 1, value.membership_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Membership(String str, String str2, MembershipPlan membershipPlan, MediumMembershipType mediumMembershipType, Integer num, PaymentCurrency paymentCurrency, String str3, User user, Long l, Long l2, String str4, Float f, Long l3, Long l4, Long l5, Long l6, Long l7, CancellationType cancellationType, PaymentProvider paymentProvider, String str5, Long l8, Long l9, Integer num2, Boolean bool, Long l10, PaymentMembershipStatus paymentMembershipStatus, Boolean bool2, MembershipDiscount membershipDiscount, Long l11, MediumMembershipType mediumMembershipType2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : membershipPlan, (i & 8) != 0 ? null : mediumMembershipType, (i & 16) != 0 ? null : num, (i & 32) != 0 ? null : paymentCurrency, (i & 64) != 0 ? null : str3, (i & 128) != 0 ? null : user, (i & 256) != 0 ? null : l, (i & 512) != 0 ? null : l2, (i & 1024) != 0 ? null : str4, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : f, (i & 4096) != 0 ? null : l3, (i & 8192) != 0 ? null : l4, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : l5, (i & 32768) != 0 ? null : l6, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : l7, (i & 131072) != 0 ? null : cancellationType, (i & 262144) != 0 ? null : paymentProvider, (i & 524288) != 0 ? null : str5, (i & 1048576) != 0 ? null : l8, (i & 2097152) != 0 ? null : l9, (i & 4194304) != 0 ? null : num2, (i & 8388608) != 0 ? null : bool, (i & 16777216) != 0 ? null : l10, (i & 33554432) != 0 ? null : paymentMembershipStatus, (i & 67108864) != 0 ? null : bool2, (i & 134217728) != 0 ? null : membershipDiscount, (i & 268435456) != 0 ? null : l11, (i & 536870912) != 0 ? null : mediumMembershipType2, (i & 1073741824) != 0 ? h21.d : h21Var);
    }

    public final Membership copy(String membership_id, String membership_plan_id, MembershipPlan membership_plan, MediumMembershipType medium_membership_type, Integer amount, PaymentCurrency currency, String member_user_id, User member, Long started_at, Long ended_at, String collection_id, Float application_fee_percent, Long cancellation_requested_at, Long became_delinquent_at, Long delinquent_period_ends_at, Long current_period_started_at, Long current_period_ends_at, CancellationType cancellation_type, PaymentProvider provider, String payment_method_id, Long trial_started_at, Long trial_ended_at, Integer trial_duration_days, Boolean is_trial_member, Long payment_source_added_at, PaymentMembershipStatus payment_membership_status, Boolean is_introductory_offer, MembershipDiscount discount, Long premium_at, MediumMembershipType scheduled_switch_medium_membership_type, h21 unknownFields) {
        unknownFields.getClass();
        return new Membership(membership_id, membership_plan_id, membership_plan, medium_membership_type, amount, currency, member_user_id, member, started_at, ended_at, collection_id, application_fee_percent, cancellation_requested_at, became_delinquent_at, delinquent_period_ends_at, current_period_started_at, current_period_ends_at, cancellation_type, provider, payment_method_id, trial_started_at, trial_ended_at, trial_duration_days, is_trial_member, payment_source_added_at, payment_membership_status, is_introductory_offer, discount, premium_at, scheduled_switch_medium_membership_type, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Membership)) {
            return false;
        }
        Membership membership = (Membership) other;
        return g76.L(unknownFields(), membership.unknownFields()) && g76.L(this.membership_id, membership.membership_id) && g76.L(this.membership_plan_id, membership.membership_plan_id) && g76.L(this.membership_plan, membership.membership_plan) && this.medium_membership_type == membership.medium_membership_type && g76.L(this.amount, membership.amount) && this.currency == membership.currency && g76.L(this.member_user_id, membership.member_user_id) && g76.L(this.member, membership.member) && g76.L(this.started_at, membership.started_at) && g76.L(this.ended_at, membership.ended_at) && g76.L(this.collection_id, membership.collection_id) && g76.K(this.application_fee_percent, membership.application_fee_percent) && g76.L(this.cancellation_requested_at, membership.cancellation_requested_at) && g76.L(this.became_delinquent_at, membership.became_delinquent_at) && g76.L(this.delinquent_period_ends_at, membership.delinquent_period_ends_at) && g76.L(this.current_period_started_at, membership.current_period_started_at) && g76.L(this.current_period_ends_at, membership.current_period_ends_at) && this.cancellation_type == membership.cancellation_type && this.provider == membership.provider && g76.L(this.payment_method_id, membership.payment_method_id) && g76.L(this.trial_started_at, membership.trial_started_at) && g76.L(this.trial_ended_at, membership.trial_ended_at) && g76.L(this.trial_duration_days, membership.trial_duration_days) && g76.L(this.is_trial_member, membership.is_trial_member) && g76.L(this.payment_source_added_at, membership.payment_source_added_at) && this.payment_membership_status == membership.payment_membership_status && g76.L(this.is_introductory_offer, membership.is_introductory_offer) && this.discount == membership.discount && g76.L(this.premium_at, membership.premium_at) && this.scheduled_switch_medium_membership_type == membership.scheduled_switch_medium_membership_type;
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int i11;
        int i12 = this.hashCode;
        if (i12 != 0) {
            return i12;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.membership_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.membership_plan_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        MembershipPlan membershipPlan = this.membership_plan;
        int iHashCode4 = (iHashCode3 + (membershipPlan != null ? membershipPlan.hashCode() : 0)) * 37;
        MediumMembershipType mediumMembershipType = this.medium_membership_type;
        int iHashCode5 = (iHashCode4 + (mediumMembershipType != null ? mediumMembershipType.hashCode() : 0)) * 37;
        Integer num = this.amount;
        int iIntValue = (iHashCode5 + (num != null ? num.intValue() : 0)) * 37;
        PaymentCurrency paymentCurrency = this.currency;
        int iHashCode6 = (iIntValue + (paymentCurrency != null ? paymentCurrency.hashCode() : 0)) * 37;
        String str3 = this.member_user_id;
        int iHashCode7 = (iHashCode6 + (str3 != null ? str3.hashCode() : 0)) * 37;
        User user = this.member;
        int iHashCode8 = (iHashCode7 + (user != null ? user.hashCode() : 0)) * 37;
        Long l = this.started_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i13 = (iHashCode8 + i) * 37;
        Long l2 = this.ended_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i14 = (i13 + i2) * 37;
        String str4 = this.collection_id;
        int iHashCode9 = (i14 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Float f = this.application_fee_percent;
        int iFloatToIntBits = (iHashCode9 + (f != null ? Float.floatToIntBits(f.floatValue()) : 0)) * 37;
        Long l3 = this.cancellation_requested_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i15 = (iFloatToIntBits + i3) * 37;
        Long l4 = this.became_delinquent_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i16 = (i15 + i4) * 37;
        Long l5 = this.delinquent_period_ends_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i5 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        } else {
            i5 = 0;
        }
        int i17 = (i16 + i5) * 37;
        Long l6 = this.current_period_started_at;
        if (l6 != null) {
            long jLongValue6 = l6.longValue();
            i6 = (int) (jLongValue6 ^ (jLongValue6 >>> 32));
        } else {
            i6 = 0;
        }
        int i18 = (i17 + i6) * 37;
        Long l7 = this.current_period_ends_at;
        if (l7 != null) {
            long jLongValue7 = l7.longValue();
            i7 = (int) (jLongValue7 ^ (jLongValue7 >>> 32));
        } else {
            i7 = 0;
        }
        int i19 = (i18 + i7) * 37;
        CancellationType cancellationType = this.cancellation_type;
        int iHashCode10 = (i19 + (cancellationType != null ? cancellationType.hashCode() : 0)) * 37;
        PaymentProvider paymentProvider = this.provider;
        int iHashCode11 = (iHashCode10 + (paymentProvider != null ? paymentProvider.hashCode() : 0)) * 37;
        String str5 = this.payment_method_id;
        int iHashCode12 = (iHashCode11 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Long l8 = this.trial_started_at;
        if (l8 != null) {
            long jLongValue8 = l8.longValue();
            i8 = (int) (jLongValue8 ^ (jLongValue8 >>> 32));
        } else {
            i8 = 0;
        }
        int i20 = (iHashCode12 + i8) * 37;
        Long l9 = this.trial_ended_at;
        if (l9 != null) {
            long jLongValue9 = l9.longValue();
            i9 = (int) (jLongValue9 ^ (jLongValue9 >>> 32));
        } else {
            i9 = 0;
        }
        int i21 = (i20 + i9) * 37;
        Integer num2 = this.trial_duration_days;
        int iIntValue2 = (i21 + (num2 != null ? num2.intValue() : 0)) * 37;
        Boolean bool = this.is_trial_member;
        int i22 = 1237;
        int i23 = (iIntValue2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Long l10 = this.payment_source_added_at;
        if (l10 != null) {
            long jLongValue10 = l10.longValue();
            i10 = (int) (jLongValue10 ^ (jLongValue10 >>> 32));
        } else {
            i10 = 0;
        }
        int i24 = (i23 + i10) * 37;
        PaymentMembershipStatus paymentMembershipStatus = this.payment_membership_status;
        int iHashCode13 = (i24 + (paymentMembershipStatus != null ? paymentMembershipStatus.hashCode() : 0)) * 37;
        Boolean bool2 = this.is_introductory_offer;
        if (bool2 == null) {
            i22 = 0;
        } else if (bool2.booleanValue()) {
            i22 = 1231;
        }
        int i25 = (iHashCode13 + i22) * 37;
        MembershipDiscount membershipDiscount = this.discount;
        int iHashCode14 = (i25 + (membershipDiscount != null ? membershipDiscount.hashCode() : 0)) * 37;
        Long l11 = this.premium_at;
        if (l11 != null) {
            long jLongValue11 = l11.longValue();
            i11 = (int) (jLongValue11 ^ (jLongValue11 >>> 32));
        } else {
            i11 = 0;
        }
        int i26 = (iHashCode14 + i11) * 37;
        MediumMembershipType mediumMembershipType2 = this.scheduled_switch_medium_membership_type;
        int iHashCode15 = i26 + (mediumMembershipType2 != null ? mediumMembershipType2.hashCode() : 0);
        this.hashCode = iHashCode15;
        return iHashCode15;
    }

    @Override // com.squareup.wire.Message
    public final hv7 newBuilder() {
        hv7 hv7Var = new hv7();
        hv7Var.a = this.membership_id;
        hv7Var.b = this.membership_plan_id;
        hv7Var.c = this.membership_plan;
        hv7Var.d = this.medium_membership_type;
        hv7Var.e = this.amount;
        hv7Var.f = this.currency;
        hv7Var.g = this.member_user_id;
        hv7Var.h = this.member;
        hv7Var.i = this.started_at;
        hv7Var.j = this.ended_at;
        hv7Var.k = this.collection_id;
        hv7Var.l = this.application_fee_percent;
        hv7Var.m = this.cancellation_requested_at;
        hv7Var.n = this.became_delinquent_at;
        hv7Var.o = this.delinquent_period_ends_at;
        hv7Var.p = this.current_period_started_at;
        hv7Var.q = this.current_period_ends_at;
        hv7Var.r = this.cancellation_type;
        hv7Var.s = this.provider;
        hv7Var.t = this.payment_method_id;
        hv7Var.u = this.trial_started_at;
        hv7Var.v = this.trial_ended_at;
        hv7Var.w = this.trial_duration_days;
        hv7Var.x = this.is_trial_member;
        hv7Var.y = this.payment_source_added_at;
        hv7Var.z = this.payment_membership_status;
        hv7Var.A = this.is_introductory_offer;
        hv7Var.B = this.discount;
        hv7Var.C = this.premium_at;
        hv7Var.D = this.scheduled_switch_medium_membership_type;
        hv7Var.addUnknownFields(unknownFields());
        return hv7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.membership_id;
        if (str != null) {
            lv8.D(str, "membership_id=", arrayList);
        }
        String str2 = this.membership_plan_id;
        if (str2 != null) {
            lv8.D(str2, "membership_plan_id=", arrayList);
        }
        MembershipPlan membershipPlan = this.membership_plan;
        if (membershipPlan != null) {
            arrayList.add("membership_plan=" + membershipPlan);
        }
        MediumMembershipType mediumMembershipType = this.medium_membership_type;
        if (mediumMembershipType != null) {
            arrayList.add("medium_membership_type=" + mediumMembershipType);
        }
        Integer num = this.amount;
        if (num != null) {
            lv8.B("amount=", num, arrayList);
        }
        PaymentCurrency paymentCurrency = this.currency;
        if (paymentCurrency != null) {
            arrayList.add("currency=" + paymentCurrency);
        }
        String str3 = this.member_user_id;
        if (str3 != null) {
            lv8.D(str3, "member_user_id=", arrayList);
        }
        User user = this.member;
        if (user != null) {
            arrayList.add("member=" + user);
        }
        Long l = this.started_at;
        if (l != null) {
            y30.A("started_at=", l, arrayList);
        }
        Long l2 = this.ended_at;
        if (l2 != null) {
            y30.A("ended_at=", l2, arrayList);
        }
        String str4 = this.collection_id;
        if (str4 != null) {
            lv8.D(str4, "collection_id=", arrayList);
        }
        Float f = this.application_fee_percent;
        if (f != null) {
            arrayList.add("application_fee_percent=" + f);
        }
        Long l3 = this.cancellation_requested_at;
        if (l3 != null) {
            y30.A("cancellation_requested_at=", l3, arrayList);
        }
        Long l4 = this.became_delinquent_at;
        if (l4 != null) {
            y30.A("became_delinquent_at=", l4, arrayList);
        }
        Long l5 = this.delinquent_period_ends_at;
        if (l5 != null) {
            y30.A("delinquent_period_ends_at=", l5, arrayList);
        }
        Long l6 = this.current_period_started_at;
        if (l6 != null) {
            y30.A("current_period_started_at=", l6, arrayList);
        }
        Long l7 = this.current_period_ends_at;
        if (l7 != null) {
            y30.A("current_period_ends_at=", l7, arrayList);
        }
        CancellationType cancellationType = this.cancellation_type;
        if (cancellationType != null) {
            arrayList.add("cancellation_type=" + cancellationType);
        }
        PaymentProvider paymentProvider = this.provider;
        if (paymentProvider != null) {
            arrayList.add("provider=" + paymentProvider);
        }
        String str5 = this.payment_method_id;
        if (str5 != null) {
            lv8.D(str5, "payment_method_id=", arrayList);
        }
        Long l8 = this.trial_started_at;
        if (l8 != null) {
            y30.A("trial_started_at=", l8, arrayList);
        }
        Long l9 = this.trial_ended_at;
        if (l9 != null) {
            y30.A("trial_ended_at=", l9, arrayList);
        }
        Integer num2 = this.trial_duration_days;
        if (num2 != null) {
            lv8.B("trial_duration_days=", num2, arrayList);
        }
        Boolean bool = this.is_trial_member;
        if (bool != null) {
            lv8.A("is_trial_member=", bool, arrayList);
        }
        Long l10 = this.payment_source_added_at;
        if (l10 != null) {
            y30.A("payment_source_added_at=", l10, arrayList);
        }
        PaymentMembershipStatus paymentMembershipStatus = this.payment_membership_status;
        if (paymentMembershipStatus != null) {
            arrayList.add("payment_membership_status=" + paymentMembershipStatus);
        }
        Boolean bool2 = this.is_introductory_offer;
        if (bool2 != null) {
            lv8.A("is_introductory_offer=", bool2, arrayList);
        }
        MembershipDiscount membershipDiscount = this.discount;
        if (membershipDiscount != null) {
            arrayList.add("discount=" + membershipDiscount);
        }
        Long l11 = this.premium_at;
        if (l11 != null) {
            y30.A("premium_at=", l11, arrayList);
        }
        MediumMembershipType mediumMembershipType2 = this.scheduled_switch_medium_membership_type;
        if (mediumMembershipType2 != null) {
            arrayList.add("scheduled_switch_medium_membership_type=" + mediumMembershipType2);
        }
        return bu1.F0(arrayList, ", ", "Membership{", "}", null, 56);
    }

    public Membership() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, Integer.MAX_VALUE, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Membership(String str, String str2, MembershipPlan membershipPlan, MediumMembershipType mediumMembershipType, Integer num, PaymentCurrency paymentCurrency, String str3, User user, Long l, Long l2, String str4, Float f, Long l3, Long l4, Long l5, Long l6, Long l7, CancellationType cancellationType, PaymentProvider paymentProvider, String str5, Long l8, Long l9, Integer num2, Boolean bool, Long l10, PaymentMembershipStatus paymentMembershipStatus, Boolean bool2, MembershipDiscount membershipDiscount, Long l11, MediumMembershipType mediumMembershipType2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.membership_id = str;
        this.membership_plan_id = str2;
        this.membership_plan = membershipPlan;
        this.medium_membership_type = mediumMembershipType;
        this.amount = num;
        this.currency = paymentCurrency;
        this.member_user_id = str3;
        this.member = user;
        this.started_at = l;
        this.ended_at = l2;
        this.collection_id = str4;
        this.application_fee_percent = f;
        this.cancellation_requested_at = l3;
        this.became_delinquent_at = l4;
        this.delinquent_period_ends_at = l5;
        this.current_period_started_at = l6;
        this.current_period_ends_at = l7;
        this.cancellation_type = cancellationType;
        this.provider = paymentProvider;
        this.payment_method_id = str5;
        this.trial_started_at = l8;
        this.trial_ended_at = l9;
        this.trial_duration_days = num2;
        this.is_trial_member = bool;
        this.payment_source_added_at = l10;
        this.payment_membership_status = paymentMembershipStatus;
        this.is_introductory_offer = bool2;
        this.discount = membershipDiscount;
        this.premium_at = l11;
        this.scheduled_switch_medium_membership_type = mediumMembershipType2;
    }
}
