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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.t9;
import defpackage.u9;
import defpackage.wg6;
import defpackage.y30;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0019\u0018\u0000 F2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002GB\u0085\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\b\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\"\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u0011\u0012\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010*\u001a\u00020)¢\u0006\u0004\b+\u0010,J\u000f\u0010-\u001a\u00020\u0002H\u0016¢\u0006\u0004\b-\u0010.J\u001a\u00101\u001a\u00020\u00112\b\u00100\u001a\u0004\u0018\u00010/H\u0096\u0002¢\u0006\u0004\b1\u00102J\u000f\u00103\u001a\u00020\bH\u0016¢\u0006\u0004\b3\u00104J\u000f\u00105\u001a\u00020\u0003H\u0016¢\u0006\u0004\b5\u00106J\u008b\u0003\u00107\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\b2\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\"2\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010%\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010*\u001a\u00020)¢\u0006\u0004\b7\u00108R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u00109R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u00109R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010:R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010;R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010<R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u00109R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u00109R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u00109R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u00109R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u00109R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010=R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010=R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u00109R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u00109R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010>R\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010>R\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010>R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010;R\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010>R\u0016\u0010\u001c\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010>R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010=R\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u00109R\u0016\u0010\u001f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001f\u00109R\u0016\u0010 \u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u00109R\u0016\u0010!\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010=R\u0016\u0010#\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010?R\u001c\u0010$\u001a\u0004\u0018\u00010\u00118\u0006X\u0087\u0004¢\u0006\f\n\u0004\b$\u0010=\u0012\u0004\b@\u0010AR\u001c\u0010%\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b%\u00109\u0012\u0004\bB\u0010AR\u001c\u0010&\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b&\u00109\u0012\u0004\bC\u0010AR\u001c\u0010'\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b'\u00109\u0012\u0004\bD\u0010AR\u001c\u0010(\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b(\u00109\u0012\u0004\bE\u0010A¨\u0006H"}, d2 = {"Lgen/model/AddMembership;", "Lcom/squareup/wire/AndroidMessage;", "Lt9;", "", "membership_plan_id", "user_id", "Lgen/model/PaymentProvider;", "provider", "", "amount", "Lgen/model/MediumMembershipType;", "medium_membership_type", "coupon_id", "token", "nonce", "payment_method_id", "receipt_data", "", "request_trial", "request_employee_discount", "provider_membership_id", "provider_customer_id", "", "started_at", "current_period_started_at", "current_period_ends_at", "trial_duration_days", "trial_started_at", "trial_ends_at", "skip_receipt_validation", "subscribe_to_user_id", "subscribe_to_username", "currency", "is_introductory_offer", "Lgen/model/MembershipDiscount;", "discount", "payment_source_included_with_trial", "name", "email", "redirect_url", "membership_plan_name", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/PaymentProvider;Ljava/lang/Integer;Lgen/model/MediumMembershipType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/MembershipDiscount;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lt9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Lgen/model/PaymentProvider;Ljava/lang/Integer;Lgen/model/MediumMembershipType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lgen/model/MembershipDiscount;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/AddMembership;", "Ljava/lang/String;", "Lgen/model/PaymentProvider;", "Ljava/lang/Integer;", "Lgen/model/MediumMembershipType;", "Ljava/lang/Boolean;", "Ljava/lang/Long;", "Lgen/model/MembershipDiscount;", "getPayment_source_included_with_trial$annotations", "()V", "getName$annotations", "getEmail$annotations", "getRedirect_url$annotations", "getMembership_plan_name$annotations", "Companion", "u9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AddMembership extends AndroidMessage<AddMembership, t9> {
    public static final ProtoAdapter<AddMembership> ADAPTER;
    public static final Parcelable.Creator<AddMembership> CREATOR;
    public static final u9 Companion = new u9();
    public static final PaymentProvider DEFAULT_PROVIDER = PaymentProvider.UNKNOWN_PROVIDER;
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 3, tag = 5)
    public final Integer amount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 10)
    public final String coupon_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 23, tag = 26)
    public final String currency;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 16, tag = 8)
    public final Long current_period_ends_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 15, tag = 19)
    public final Long current_period_started_at;

    @WireField(adapter = "gen.model.MembershipDiscount#ADAPTER", schemaIndex = 25, tag = 31)
    public final MembershipDiscount discount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 28, tag = 17)
    public final String email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 24, tag = 30)
    public final Boolean is_introductory_offer;

    @WireField(adapter = "gen.model.MediumMembershipType#ADAPTER", schemaIndex = 4, tag = 12)
    public final MediumMembershipType medium_membership_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String membership_plan_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 30, tag = 27)
    public final String membership_plan_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 27, tag = 16)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 22)
    public final String nonce;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 28)
    public final String payment_method_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 26, tag = 11)
    public final Boolean payment_source_included_with_trial;

    @WireField(adapter = "gen.model.PaymentProvider#ADAPTER", schemaIndex = 2, tag = 4)
    public final PaymentProvider provider;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 15)
    public final String provider_customer_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 14)
    public final String provider_membership_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 6)
    public final String receipt_data;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 29, tag = 18)
    public final String redirect_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 11, tag = 24)
    public final Boolean request_employee_discount;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 10, tag = 23)
    public final Boolean request_trial;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 20, tag = 13)
    public final Boolean skip_receipt_validation;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 14, tag = 7)
    public final Long started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 21, tag = 25)
    public final String subscribe_to_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 22, tag = 29)
    public final String subscribe_to_username;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 3)
    public final String token;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 17, tag = 9)
    public final Integer trial_duration_days;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 19, tag = 21)
    public final Long trial_ends_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 18, tag = 20)
    public final Long trial_started_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(AddMembership.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<AddMembership> protoAdapter = new ProtoAdapter<AddMembership>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.AddMembership$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final AddMembership decode(ProtoReader reader) {
                String str;
                PaymentProvider paymentProvider;
                Integer num;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str2 = null;
                String strDecode2 = null;
                PaymentProvider paymentProviderDecode = null;
                Integer numDecode = null;
                MediumMembershipType mediumMembershipTypeDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Long lDecode3 = null;
                Integer numDecode2 = null;
                Long lDecode4 = null;
                Long lDecode5 = null;
                Boolean boolDecode3 = null;
                String strDecode10 = null;
                String strDecode11 = null;
                String strDecode12 = null;
                Boolean boolDecode4 = null;
                MembershipDiscount membershipDiscountDecode = null;
                Boolean boolDecode5 = null;
                String strDecode13 = null;
                String strDecode14 = null;
                String strDecode15 = null;
                String strDecode16 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new AddMembership(str2, strDecode2, paymentProviderDecode, numDecode, mediumMembershipTypeDecode, strDecode3, strDecode4, strDecode5, strDecode6, strDecode7, boolDecode, boolDecode2, strDecode8, strDecode9, lDecode, lDecode2, lDecode3, numDecode2, lDecode4, lDecode5, boolDecode3, strDecode10, strDecode11, strDecode12, boolDecode4, membershipDiscountDecode, boolDecode5, strDecode13, strDecode14, strDecode15, strDecode16, reader.endMessageAndGetUnknownFields(jBeginMessage));
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
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 4:
                            str = strDecode2;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            try {
                                paymentProviderDecode = PaymentProvider.ADAPTER.decode(reader);
                                strDecode2 = str;
                                numDecode = num;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str2;
                                strDecode2 = str;
                                paymentProviderDecode = paymentProvider;
                                numDecode = num;
                            }
                            break;
                        case 5:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str2;
                            break;
                        case 6:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 7:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 8:
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 9:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str2;
                            break;
                        case 10:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 11:
                            boolDecode5 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 12:
                            str = strDecode2;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            try {
                                mediumMembershipTypeDecode = MediumMembershipType.ADAPTER.decode(reader);
                                strDecode2 = str;
                                paymentProviderDecode = paymentProvider;
                                numDecode = num;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str2;
                                strDecode2 = str;
                                paymentProviderDecode = paymentProvider;
                                numDecode = num;
                            }
                            break;
                        case 13:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 14:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 15:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 16:
                            strDecode13 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 17:
                            strDecode14 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 18:
                            strDecode15 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 19:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 20:
                            lDecode4 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 21:
                            lDecode5 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 22:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 23:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 24:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 25:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 26:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 27:
                            strDecode16 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 28:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 29:
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 30:
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 31:
                            try {
                                membershipDiscountDecode = MembershipDiscount.ADAPTER.decode(reader);
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e3) {
                                str = strDecode2;
                                paymentProvider = paymentProviderDecode;
                                num = numDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e3.value));
                                strDecode = str2;
                                strDecode2 = str;
                                paymentProviderDecode = paymentProvider;
                                numDecode = num;
                            }
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode2;
                            paymentProvider = paymentProviderDecode;
                            num = numDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            paymentProviderDecode = paymentProvider;
                            numDecode = num;
                            break;
                    }
                    str2 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, AddMembership value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.membership_plan_id);
                protoAdapter2.encodeWithTag(writer, 2, value.user_id);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 4, value.provider);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 5, value.amount);
                MediumMembershipType.ADAPTER.encodeWithTag(writer, 12, value.medium_membership_type);
                protoAdapter2.encodeWithTag(writer, 10, value.coupon_id);
                protoAdapter2.encodeWithTag(writer, 3, value.token);
                protoAdapter2.encodeWithTag(writer, 22, value.nonce);
                protoAdapter2.encodeWithTag(writer, 28, value.payment_method_id);
                protoAdapter2.encodeWithTag(writer, 6, value.receipt_data);
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                protoAdapter4.encodeWithTag(writer, 23, value.request_trial);
                protoAdapter4.encodeWithTag(writer, 24, value.request_employee_discount);
                protoAdapter2.encodeWithTag(writer, 14, value.provider_membership_id);
                protoAdapter2.encodeWithTag(writer, 15, value.provider_customer_id);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 7, value.started_at);
                protoAdapter5.encodeWithTag(writer, 19, value.current_period_started_at);
                protoAdapter5.encodeWithTag(writer, 8, value.current_period_ends_at);
                protoAdapter3.encodeWithTag(writer, 9, value.trial_duration_days);
                protoAdapter5.encodeWithTag(writer, 20, value.trial_started_at);
                protoAdapter5.encodeWithTag(writer, 21, value.trial_ends_at);
                protoAdapter4.encodeWithTag(writer, 13, value.skip_receipt_validation);
                protoAdapter2.encodeWithTag(writer, 25, value.subscribe_to_user_id);
                protoAdapter2.encodeWithTag(writer, 29, value.subscribe_to_username);
                protoAdapter2.encodeWithTag(writer, 26, value.currency);
                protoAdapter4.encodeWithTag(writer, 30, value.is_introductory_offer);
                MembershipDiscount.ADAPTER.encodeWithTag(writer, 31, value.discount);
                protoAdapter4.encodeWithTag(writer, 11, value.payment_source_included_with_trial);
                protoAdapter2.encodeWithTag(writer, 16, value.name);
                protoAdapter2.encodeWithTag(writer, 17, value.email);
                protoAdapter2.encodeWithTag(writer, 18, value.redirect_url);
                protoAdapter2.encodeWithTag(writer, 27, value.membership_plan_name);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(AddMembership value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = PaymentProvider.ADAPTER.encodedSizeWithTag(4, value.provider) + protoAdapter2.encodedSizeWithTag(2, value.user_id) + protoAdapter2.encodedSizeWithTag(1, value.membership_plan_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(6, value.receipt_data) + protoAdapter2.encodedSizeWithTag(28, value.payment_method_id) + protoAdapter2.encodedSizeWithTag(22, value.nonce) + protoAdapter2.encodedSizeWithTag(3, value.token) + protoAdapter2.encodedSizeWithTag(10, value.coupon_id) + MediumMembershipType.ADAPTER.encodedSizeWithTag(12, value.medium_membership_type) + protoAdapter3.encodedSizeWithTag(5, value.amount) + iEncodedSizeWithTag;
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag3 = protoAdapter2.encodedSizeWithTag(15, value.provider_customer_id) + protoAdapter2.encodedSizeWithTag(14, value.provider_membership_id) + protoAdapter4.encodedSizeWithTag(24, value.request_employee_discount) + protoAdapter4.encodedSizeWithTag(23, value.request_trial) + iEncodedSizeWithTag2;
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                return protoAdapter2.encodedSizeWithTag(27, value.membership_plan_name) + protoAdapter2.encodedSizeWithTag(18, value.redirect_url) + protoAdapter2.encodedSizeWithTag(17, value.email) + protoAdapter2.encodedSizeWithTag(16, value.name) + protoAdapter4.encodedSizeWithTag(11, value.payment_source_included_with_trial) + MembershipDiscount.ADAPTER.encodedSizeWithTag(31, value.discount) + protoAdapter4.encodedSizeWithTag(30, value.is_introductory_offer) + protoAdapter2.encodedSizeWithTag(26, value.currency) + protoAdapter2.encodedSizeWithTag(29, value.subscribe_to_username) + protoAdapter2.encodedSizeWithTag(25, value.subscribe_to_user_id) + protoAdapter4.encodedSizeWithTag(13, value.skip_receipt_validation) + protoAdapter5.encodedSizeWithTag(21, value.trial_ends_at) + protoAdapter5.encodedSizeWithTag(20, value.trial_started_at) + protoAdapter3.encodedSizeWithTag(9, value.trial_duration_days) + protoAdapter5.encodedSizeWithTag(8, value.current_period_ends_at) + protoAdapter5.encodedSizeWithTag(19, value.current_period_started_at) + protoAdapter5.encodedSizeWithTag(7, value.started_at) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final AddMembership redact(AddMembership value) {
                value.getClass();
                return value.copy((Integer.MAX_VALUE & 1) != 0 ? value.membership_plan_id : null, (Integer.MAX_VALUE & 2) != 0 ? value.user_id : null, (Integer.MAX_VALUE & 4) != 0 ? value.provider : null, (Integer.MAX_VALUE & 8) != 0 ? value.amount : null, (Integer.MAX_VALUE & 16) != 0 ? value.medium_membership_type : null, (Integer.MAX_VALUE & 32) != 0 ? value.coupon_id : null, (Integer.MAX_VALUE & 64) != 0 ? value.token : null, (Integer.MAX_VALUE & 128) != 0 ? value.nonce : null, (Integer.MAX_VALUE & 256) != 0 ? value.payment_method_id : null, (Integer.MAX_VALUE & 512) != 0 ? value.receipt_data : null, (Integer.MAX_VALUE & 1024) != 0 ? value.request_trial : null, (Integer.MAX_VALUE & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.request_employee_discount : null, (Integer.MAX_VALUE & 4096) != 0 ? value.provider_membership_id : null, (Integer.MAX_VALUE & 8192) != 0 ? value.provider_customer_id : null, (Integer.MAX_VALUE & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.started_at : null, (Integer.MAX_VALUE & 32768) != 0 ? value.current_period_started_at : null, (Integer.MAX_VALUE & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.current_period_ends_at : null, (Integer.MAX_VALUE & 131072) != 0 ? value.trial_duration_days : null, (Integer.MAX_VALUE & 262144) != 0 ? value.trial_started_at : null, (Integer.MAX_VALUE & 524288) != 0 ? value.trial_ends_at : null, (Integer.MAX_VALUE & 1048576) != 0 ? value.skip_receipt_validation : null, (Integer.MAX_VALUE & 2097152) != 0 ? value.subscribe_to_user_id : null, (Integer.MAX_VALUE & 4194304) != 0 ? value.subscribe_to_username : null, (Integer.MAX_VALUE & 8388608) != 0 ? value.currency : null, (Integer.MAX_VALUE & 16777216) != 0 ? value.is_introductory_offer : null, (Integer.MAX_VALUE & 33554432) != 0 ? value.discount : null, (Integer.MAX_VALUE & 67108864) != 0 ? value.payment_source_included_with_trial : null, (Integer.MAX_VALUE & 134217728) != 0 ? value.name : null, (Integer.MAX_VALUE & 268435456) != 0 ? value.email : null, (Integer.MAX_VALUE & 536870912) != 0 ? value.redirect_url : null, (Integer.MAX_VALUE & 1073741824) != 0 ? value.membership_plan_name : null, (Integer.MAX_VALUE & Integer.MIN_VALUE) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, AddMembership value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 27, value.membership_plan_name);
                protoAdapter2.encodeWithTag(writer, 18, value.redirect_url);
                protoAdapter2.encodeWithTag(writer, 17, value.email);
                protoAdapter2.encodeWithTag(writer, 16, value.name);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 11, value.payment_source_included_with_trial);
                MembershipDiscount.ADAPTER.encodeWithTag(writer, 31, value.discount);
                protoAdapter3.encodeWithTag(writer, 30, value.is_introductory_offer);
                protoAdapter2.encodeWithTag(writer, 26, value.currency);
                protoAdapter2.encodeWithTag(writer, 29, value.subscribe_to_username);
                protoAdapter2.encodeWithTag(writer, 25, value.subscribe_to_user_id);
                protoAdapter3.encodeWithTag(writer, 13, value.skip_receipt_validation);
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                protoAdapter4.encodeWithTag(writer, 21, value.trial_ends_at);
                protoAdapter4.encodeWithTag(writer, 20, value.trial_started_at);
                ProtoAdapter<Integer> protoAdapter5 = ProtoAdapter.INT32;
                protoAdapter5.encodeWithTag(writer, 9, value.trial_duration_days);
                protoAdapter4.encodeWithTag(writer, 8, value.current_period_ends_at);
                protoAdapter4.encodeWithTag(writer, 19, value.current_period_started_at);
                protoAdapter4.encodeWithTag(writer, 7, value.started_at);
                protoAdapter2.encodeWithTag(writer, 15, value.provider_customer_id);
                protoAdapter2.encodeWithTag(writer, 14, value.provider_membership_id);
                protoAdapter3.encodeWithTag(writer, 24, value.request_employee_discount);
                protoAdapter3.encodeWithTag(writer, 23, value.request_trial);
                protoAdapter2.encodeWithTag(writer, 6, value.receipt_data);
                protoAdapter2.encodeWithTag(writer, 28, value.payment_method_id);
                protoAdapter2.encodeWithTag(writer, 22, value.nonce);
                protoAdapter2.encodeWithTag(writer, 3, value.token);
                protoAdapter2.encodeWithTag(writer, 10, value.coupon_id);
                MediumMembershipType.ADAPTER.encodeWithTag(writer, 12, value.medium_membership_type);
                protoAdapter5.encodeWithTag(writer, 5, value.amount);
                PaymentProvider.ADAPTER.encodeWithTag(writer, 4, value.provider);
                protoAdapter2.encodeWithTag(writer, 2, value.user_id);
                protoAdapter2.encodeWithTag(writer, 1, value.membership_plan_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ AddMembership(String str, String str2, PaymentProvider paymentProvider, Integer num, MediumMembershipType mediumMembershipType, String str3, String str4, String str5, String str6, String str7, Boolean bool, Boolean bool2, String str8, String str9, Long l, Long l2, Long l3, Integer num2, Long l4, Long l5, Boolean bool3, String str10, String str11, String str12, Boolean bool4, MembershipDiscount membershipDiscount, Boolean bool5, String str13, String str14, String str15, String str16, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : paymentProvider, (i & 8) != 0 ? null : num, (i & 16) != 0 ? null : mediumMembershipType, (i & 32) != 0 ? null : str3, (i & 64) != 0 ? null : str4, (i & 128) != 0 ? null : str5, (i & 256) != 0 ? null : str6, (i & 512) != 0 ? null : str7, (i & 1024) != 0 ? null : bool, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : bool2, (i & 4096) != 0 ? null : str8, (i & 8192) != 0 ? null : str9, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : l, (i & 32768) != 0 ? null : l2, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : l3, (i & 131072) != 0 ? null : num2, (i & 262144) != 0 ? null : l4, (i & 524288) != 0 ? null : l5, (i & 1048576) != 0 ? null : bool3, (i & 2097152) != 0 ? null : str10, (i & 4194304) != 0 ? null : str11, (i & 8388608) != 0 ? null : str12, (i & 16777216) != 0 ? null : bool4, (i & 33554432) != 0 ? null : membershipDiscount, (i & 67108864) != 0 ? null : bool5, (i & 134217728) != 0 ? null : str13, (i & 268435456) != 0 ? null : str14, (i & 536870912) != 0 ? null : str15, (i & 1073741824) != 0 ? null : str16, (i & Integer.MIN_VALUE) != 0 ? h21.d : h21Var);
    }

    public final AddMembership copy(String membership_plan_id, String user_id, PaymentProvider provider, Integer amount, MediumMembershipType medium_membership_type, String coupon_id, String token, String nonce, String payment_method_id, String receipt_data, Boolean request_trial, Boolean request_employee_discount, String provider_membership_id, String provider_customer_id, Long started_at, Long current_period_started_at, Long current_period_ends_at, Integer trial_duration_days, Long trial_started_at, Long trial_ends_at, Boolean skip_receipt_validation, String subscribe_to_user_id, String subscribe_to_username, String currency, Boolean is_introductory_offer, MembershipDiscount discount, Boolean payment_source_included_with_trial, String name, String email, String redirect_url, String membership_plan_name, h21 unknownFields) {
        unknownFields.getClass();
        return new AddMembership(membership_plan_id, user_id, provider, amount, medium_membership_type, coupon_id, token, nonce, payment_method_id, receipt_data, request_trial, request_employee_discount, provider_membership_id, provider_customer_id, started_at, current_period_started_at, current_period_ends_at, trial_duration_days, trial_started_at, trial_ends_at, skip_receipt_validation, subscribe_to_user_id, subscribe_to_username, currency, is_introductory_offer, discount, payment_source_included_with_trial, name, email, redirect_url, membership_plan_name, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof AddMembership)) {
            return false;
        }
        AddMembership addMembership = (AddMembership) other;
        return g76.L(unknownFields(), addMembership.unknownFields()) && g76.L(this.membership_plan_id, addMembership.membership_plan_id) && g76.L(this.user_id, addMembership.user_id) && this.provider == addMembership.provider && g76.L(this.amount, addMembership.amount) && this.medium_membership_type == addMembership.medium_membership_type && g76.L(this.coupon_id, addMembership.coupon_id) && g76.L(this.token, addMembership.token) && g76.L(this.nonce, addMembership.nonce) && g76.L(this.payment_method_id, addMembership.payment_method_id) && g76.L(this.receipt_data, addMembership.receipt_data) && g76.L(this.request_trial, addMembership.request_trial) && g76.L(this.request_employee_discount, addMembership.request_employee_discount) && g76.L(this.provider_membership_id, addMembership.provider_membership_id) && g76.L(this.provider_customer_id, addMembership.provider_customer_id) && g76.L(this.started_at, addMembership.started_at) && g76.L(this.current_period_started_at, addMembership.current_period_started_at) && g76.L(this.current_period_ends_at, addMembership.current_period_ends_at) && g76.L(this.trial_duration_days, addMembership.trial_duration_days) && g76.L(this.trial_started_at, addMembership.trial_started_at) && g76.L(this.trial_ends_at, addMembership.trial_ends_at) && g76.L(this.skip_receipt_validation, addMembership.skip_receipt_validation) && g76.L(this.subscribe_to_user_id, addMembership.subscribe_to_user_id) && g76.L(this.subscribe_to_username, addMembership.subscribe_to_username) && g76.L(this.currency, addMembership.currency) && g76.L(this.is_introductory_offer, addMembership.is_introductory_offer) && this.discount == addMembership.discount && g76.L(this.payment_source_included_with_trial, addMembership.payment_source_included_with_trial) && g76.L(this.name, addMembership.name) && g76.L(this.email, addMembership.email) && g76.L(this.redirect_url, addMembership.redirect_url) && g76.L(this.membership_plan_name, addMembership.membership_plan_name);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6 = this.hashCode;
        if (i6 != 0) {
            return i6;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.membership_plan_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.user_id;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        PaymentProvider paymentProvider = this.provider;
        int iHashCode4 = (iHashCode3 + (paymentProvider != null ? paymentProvider.hashCode() : 0)) * 37;
        Integer num = this.amount;
        int iIntValue = (iHashCode4 + (num != null ? num.intValue() : 0)) * 37;
        MediumMembershipType mediumMembershipType = this.medium_membership_type;
        int iHashCode5 = (iIntValue + (mediumMembershipType != null ? mediumMembershipType.hashCode() : 0)) * 37;
        String str3 = this.coupon_id;
        int iHashCode6 = (iHashCode5 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.token;
        int iHashCode7 = (iHashCode6 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.nonce;
        int iHashCode8 = (iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.payment_method_id;
        int iHashCode9 = (iHashCode8 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.receipt_data;
        int iHashCode10 = (iHashCode9 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Boolean bool = this.request_trial;
        int i7 = 1237;
        int i8 = (iHashCode10 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.request_employee_discount;
        int i9 = (i8 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str8 = this.provider_membership_id;
        int iHashCode11 = (i9 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.provider_customer_id;
        int iHashCode12 = (iHashCode11 + (str9 != null ? str9.hashCode() : 0)) * 37;
        Long l = this.started_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i10 = (iHashCode12 + i) * 37;
        Long l2 = this.current_period_started_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i11 = (i10 + i2) * 37;
        Long l3 = this.current_period_ends_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i12 = (i11 + i3) * 37;
        Integer num2 = this.trial_duration_days;
        int iIntValue2 = (i12 + (num2 != null ? num2.intValue() : 0)) * 37;
        Long l4 = this.trial_started_at;
        if (l4 != null) {
            long jLongValue4 = l4.longValue();
            i4 = (int) (jLongValue4 ^ (jLongValue4 >>> 32));
        } else {
            i4 = 0;
        }
        int i13 = (iIntValue2 + i4) * 37;
        Long l5 = this.trial_ends_at;
        if (l5 != null) {
            long jLongValue5 = l5.longValue();
            i5 = (int) (jLongValue5 ^ (jLongValue5 >>> 32));
        } else {
            i5 = 0;
        }
        int i14 = (i13 + i5) * 37;
        Boolean bool3 = this.skip_receipt_validation;
        int i15 = (i14 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str10 = this.subscribe_to_user_id;
        int iHashCode13 = (i15 + (str10 != null ? str10.hashCode() : 0)) * 37;
        String str11 = this.subscribe_to_username;
        int iHashCode14 = (iHashCode13 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.currency;
        int iHashCode15 = (iHashCode14 + (str12 != null ? str12.hashCode() : 0)) * 37;
        Boolean bool4 = this.is_introductory_offer;
        int i16 = (iHashCode15 + (bool4 != null ? bool4.booleanValue() ? 1231 : 1237 : 0)) * 37;
        MembershipDiscount membershipDiscount = this.discount;
        int iHashCode16 = (i16 + (membershipDiscount != null ? membershipDiscount.hashCode() : 0)) * 37;
        Boolean bool5 = this.payment_source_included_with_trial;
        if (bool5 == null) {
            i7 = 0;
        } else if (bool5.booleanValue()) {
            i7 = 1231;
        }
        int i17 = (iHashCode16 + i7) * 37;
        String str13 = this.name;
        int iHashCode17 = (i17 + (str13 != null ? str13.hashCode() : 0)) * 37;
        String str14 = this.email;
        int iHashCode18 = (iHashCode17 + (str14 != null ? str14.hashCode() : 0)) * 37;
        String str15 = this.redirect_url;
        int iHashCode19 = (iHashCode18 + (str15 != null ? str15.hashCode() : 0)) * 37;
        String str16 = this.membership_plan_name;
        int iHashCode20 = iHashCode19 + (str16 != null ? str16.hashCode() : 0);
        this.hashCode = iHashCode20;
        return iHashCode20;
    }

    @Override // com.squareup.wire.Message
    public final t9 newBuilder() {
        t9 t9Var = new t9();
        t9Var.a = this.membership_plan_id;
        t9Var.b = this.user_id;
        t9Var.c = this.provider;
        t9Var.d = this.amount;
        t9Var.e = this.medium_membership_type;
        t9Var.f = this.coupon_id;
        t9Var.g = this.token;
        t9Var.h = this.nonce;
        t9Var.i = this.payment_method_id;
        t9Var.j = this.receipt_data;
        t9Var.k = this.request_trial;
        t9Var.l = this.request_employee_discount;
        t9Var.m = this.provider_membership_id;
        t9Var.n = this.provider_customer_id;
        t9Var.o = this.started_at;
        t9Var.p = this.current_period_started_at;
        t9Var.q = this.current_period_ends_at;
        t9Var.r = this.trial_duration_days;
        t9Var.s = this.trial_started_at;
        t9Var.t = this.trial_ends_at;
        t9Var.u = this.skip_receipt_validation;
        t9Var.v = this.subscribe_to_user_id;
        t9Var.w = this.subscribe_to_username;
        t9Var.x = this.currency;
        t9Var.y = this.is_introductory_offer;
        t9Var.z = this.discount;
        t9Var.A = this.payment_source_included_with_trial;
        t9Var.B = this.name;
        t9Var.C = this.email;
        t9Var.D = this.redirect_url;
        t9Var.E = this.membership_plan_name;
        t9Var.addUnknownFields(unknownFields());
        return t9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.membership_plan_id;
        if (str != null) {
            lv8.D(str, "membership_plan_id=", arrayList);
        }
        String str2 = this.user_id;
        if (str2 != null) {
            lv8.D(str2, "user_id=", arrayList);
        }
        PaymentProvider paymentProvider = this.provider;
        if (paymentProvider != null) {
            arrayList.add("provider=" + paymentProvider);
        }
        Integer num = this.amount;
        if (num != null) {
            lv8.B("amount=", num, arrayList);
        }
        MediumMembershipType mediumMembershipType = this.medium_membership_type;
        if (mediumMembershipType != null) {
            arrayList.add("medium_membership_type=" + mediumMembershipType);
        }
        String str3 = this.coupon_id;
        if (str3 != null) {
            lv8.D(str3, "coupon_id=", arrayList);
        }
        String str4 = this.token;
        if (str4 != null) {
            lv8.D(str4, "token=", arrayList);
        }
        String str5 = this.nonce;
        if (str5 != null) {
            lv8.D(str5, "nonce=", arrayList);
        }
        String str6 = this.payment_method_id;
        if (str6 != null) {
            lv8.D(str6, "payment_method_id=", arrayList);
        }
        String str7 = this.receipt_data;
        if (str7 != null) {
            lv8.D(str7, "receipt_data=", arrayList);
        }
        Boolean bool = this.request_trial;
        if (bool != null) {
            lv8.A("request_trial=", bool, arrayList);
        }
        Boolean bool2 = this.request_employee_discount;
        if (bool2 != null) {
            lv8.A("request_employee_discount=", bool2, arrayList);
        }
        String str8 = this.provider_membership_id;
        if (str8 != null) {
            lv8.D(str8, "provider_membership_id=", arrayList);
        }
        String str9 = this.provider_customer_id;
        if (str9 != null) {
            lv8.D(str9, "provider_customer_id=", arrayList);
        }
        Long l = this.started_at;
        if (l != null) {
            y30.A("started_at=", l, arrayList);
        }
        Long l2 = this.current_period_started_at;
        if (l2 != null) {
            y30.A("current_period_started_at=", l2, arrayList);
        }
        Long l3 = this.current_period_ends_at;
        if (l3 != null) {
            y30.A("current_period_ends_at=", l3, arrayList);
        }
        Integer num2 = this.trial_duration_days;
        if (num2 != null) {
            lv8.B("trial_duration_days=", num2, arrayList);
        }
        Long l4 = this.trial_started_at;
        if (l4 != null) {
            y30.A("trial_started_at=", l4, arrayList);
        }
        Long l5 = this.trial_ends_at;
        if (l5 != null) {
            y30.A("trial_ends_at=", l5, arrayList);
        }
        Boolean bool3 = this.skip_receipt_validation;
        if (bool3 != null) {
            lv8.A("skip_receipt_validation=", bool3, arrayList);
        }
        String str10 = this.subscribe_to_user_id;
        if (str10 != null) {
            lv8.D(str10, "subscribe_to_user_id=", arrayList);
        }
        String str11 = this.subscribe_to_username;
        if (str11 != null) {
            lv8.D(str11, "subscribe_to_username=", arrayList);
        }
        String str12 = this.currency;
        if (str12 != null) {
            lv8.D(str12, "currency=", arrayList);
        }
        Boolean bool4 = this.is_introductory_offer;
        if (bool4 != null) {
            lv8.A("is_introductory_offer=", bool4, arrayList);
        }
        MembershipDiscount membershipDiscount = this.discount;
        if (membershipDiscount != null) {
            arrayList.add("discount=" + membershipDiscount);
        }
        Boolean bool5 = this.payment_source_included_with_trial;
        if (bool5 != null) {
            lv8.A("payment_source_included_with_trial=", bool5, arrayList);
        }
        String str13 = this.name;
        if (str13 != null) {
            lv8.D(str13, "name=", arrayList);
        }
        String str14 = this.email;
        if (str14 != null) {
            lv8.D(str14, "email=", arrayList);
        }
        String str15 = this.redirect_url;
        if (str15 != null) {
            lv8.D(str15, "redirect_url=", arrayList);
        }
        String str16 = this.membership_plan_name;
        if (str16 != null) {
            lv8.D(str16, "membership_plan_name=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "AddMembership{", "}", null, 56);
    }

    public AddMembership() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -1, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AddMembership(String str, String str2, PaymentProvider paymentProvider, Integer num, MediumMembershipType mediumMembershipType, String str3, String str4, String str5, String str6, String str7, Boolean bool, Boolean bool2, String str8, String str9, Long l, Long l2, Long l3, Integer num2, Long l4, Long l5, Boolean bool3, String str10, String str11, String str12, Boolean bool4, MembershipDiscount membershipDiscount, Boolean bool5, String str13, String str14, String str15, String str16, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.membership_plan_id = str;
        this.user_id = str2;
        this.provider = paymentProvider;
        this.amount = num;
        this.medium_membership_type = mediumMembershipType;
        this.coupon_id = str3;
        this.token = str4;
        this.nonce = str5;
        this.payment_method_id = str6;
        this.receipt_data = str7;
        this.request_trial = bool;
        this.request_employee_discount = bool2;
        this.provider_membership_id = str8;
        this.provider_customer_id = str9;
        this.started_at = l;
        this.current_period_started_at = l2;
        this.current_period_ends_at = l3;
        this.trial_duration_days = num2;
        this.trial_started_at = l4;
        this.trial_ends_at = l5;
        this.skip_receipt_validation = bool3;
        this.subscribe_to_user_id = str10;
        this.subscribe_to_username = str11;
        this.currency = str12;
        this.is_introductory_offer = bool4;
        this.discount = membershipDiscount;
        this.payment_source_included_with_trial = bool5;
        this.name = str13;
        this.email = str14;
        this.redirect_url = str15;
        this.membership_plan_name = str16;
    }

    public static /* synthetic */ void getEmail$annotations() {
    }

    public static /* synthetic */ void getMembership_plan_name$annotations() {
    }

    public static /* synthetic */ void getName$annotations() {
    }

    public static /* synthetic */ void getPayment_source_included_with_trial$annotations() {
    }

    public static /* synthetic */ void getRedirect_url$annotations() {
    }
}
