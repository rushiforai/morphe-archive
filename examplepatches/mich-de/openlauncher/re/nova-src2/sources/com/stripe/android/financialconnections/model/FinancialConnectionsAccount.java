package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.recyclerview.widget.u1;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\b\u0087\b\u0018\u0000 \u00042\u00020\u00012\u00020\u00022\u00020\u0003:\u0007\u0005\u0006\u0007\b\t\n\u000b¨\u0006\f"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", "Lcom/stripe/android/financialconnections/model/PaymentAccount;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Category", "Status", "Subcategory", "SupportedPaymentMethodTypes", "Permissions", "xr/i", "com/stripe/android/financialconnections/model/g", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class FinancialConnectionsAccount extends PaymentAccount implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final Category f42715a;

    /* renamed from: b, reason: collision with root package name */
    public final int f42716b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42717c;

    /* renamed from: d, reason: collision with root package name */
    public final String f42718d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f42719e;

    /* renamed from: f, reason: collision with root package name */
    public final Status f42720f;

    /* renamed from: g, reason: collision with root package name */
    public final Subcategory f42721g;

    /* renamed from: h, reason: collision with root package name */
    public final List f42722h;

    /* renamed from: i, reason: collision with root package name */
    public final Balance f42723i;

    /* renamed from: j, reason: collision with root package name */
    public final BalanceRefresh f42724j;

    /* renamed from: k, reason: collision with root package name */
    public final String f42725k;

    /* renamed from: l, reason: collision with root package name */
    public final String f42726l;

    /* renamed from: m, reason: collision with root package name */
    public final String f42727m;
    public final OwnershipRefresh n;
    public final List o;

    /* renamed from: p, reason: collision with root package name */
    public final String f42728p;

    @NotNull
    public static final xr.i Companion = new xr.i();

    @NotNull
    public static final Parcelable.Creator<FinancialConnectionsAccount> CREATOR = new j();

    /* renamed from: q, reason: collision with root package name */
    public static final KSerializer[] f42714q = {null, null, null, null, null, null, null, new ArrayListSerializer(r.f42761e), null, null, null, null, null, null, new ArrayListSerializer(l.f42758e), null};

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u000f\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount$Category;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/i", "com/stripe/android/financialconnections/model/h", "CASH", "CREDIT", "INVESTMENT", NativeAdContent.ViewTag.OTHER, "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = i.class)
    public static final class Category {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Category[] $VALUES;

        @NotNull
        public static final h Companion;

        @NotNull
        private final String value;

        @SerialName("cash")
        public static final Category CASH = new Category("CASH", 0, "cash");

        @SerialName("credit")
        public static final Category CREDIT = new Category("CREDIT", 1, "credit");

        @SerialName("investment")
        public static final Category INVESTMENT = new Category("INVESTMENT", 2, "investment");

        @SerialName(InneractiveMediationNameConsts.OTHER)
        public static final Category OTHER = new Category(NativeAdContent.ViewTag.OTHER, 3, InneractiveMediationNameConsts.OTHER);
        public static final Category UNKNOWN = new Category("UNKNOWN", 4, "unknown");

        private static final /* synthetic */ Category[] $values() {
            return new Category[]{CASH, CREDIT, INVESTMENT, OTHER, UNKNOWN};
        }

        static {
            Category[] categoryArr$values = $values();
            $VALUES = categoryArr$values;
            $ENTRIES = EnumEntriesKt.a(categoryArr$values);
            Companion = new h();
        }

        private Category(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Category> getEntries() {
            return $ENTRIES;
        }

        public static Category valueOf(String str) {
            return (Category) Enum.valueOf(Category.class, str);
        }

        public static Category[] values() {
            return (Category[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0010\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0012"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount$Permissions;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/l", "com/stripe/android/financialconnections/model/k", "BALANCES", "OWNERSHIP", "PAYMENT_METHOD", "TRANSACTIONS", "ACCOUNT_NUMBERS", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = l.class)
    public static final class Permissions {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Permissions[] $VALUES;

        @NotNull
        public static final k Companion;

        @NotNull
        private final String value;

        @SerialName("balances")
        public static final Permissions BALANCES = new Permissions("BALANCES", 0, "balances");

        @SerialName("ownership")
        public static final Permissions OWNERSHIP = new Permissions("OWNERSHIP", 1, "ownership");

        @SerialName("payment_method")
        public static final Permissions PAYMENT_METHOD = new Permissions("PAYMENT_METHOD", 2, "payment_method");

        @SerialName("transactions")
        public static final Permissions TRANSACTIONS = new Permissions("TRANSACTIONS", 3, "transactions");

        @SerialName("account_numbers")
        public static final Permissions ACCOUNT_NUMBERS = new Permissions("ACCOUNT_NUMBERS", 4, "account_numbers");
        public static final Permissions UNKNOWN = new Permissions("UNKNOWN", 5, "unknown");

        private static final /* synthetic */ Permissions[] $values() {
            return new Permissions[]{BALANCES, OWNERSHIP, PAYMENT_METHOD, TRANSACTIONS, ACCOUNT_NUMBERS, UNKNOWN};
        }

        static {
            Permissions[] permissionsArr$values = $values();
            $VALUES = permissionsArr$values;
            $ENTRIES = EnumEntriesKt.a(permissionsArr$values);
            Companion = new k();
        }

        private Permissions(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Permissions> getEntries() {
            return $ENTRIES;
        }

        public static Permissions valueOf(String str) {
            return (Permissions) Enum.valueOf(Permissions.class, str);
        }

        public static Permissions[] values() {
            return (Permissions[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u000e\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/n", "com/stripe/android/financialconnections/model/m", "ACTIVE", "DISCONNECTED", "INACTIVE", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = n.class)
    public static final class Status {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Status[] $VALUES;

        @NotNull
        public static final m Companion;

        @NotNull
        private final String value;

        @SerialName("active")
        public static final Status ACTIVE = new Status("ACTIVE", 0, "active");

        @SerialName("disconnected")
        public static final Status DISCONNECTED = new Status("DISCONNECTED", 1, "disconnected");

        @SerialName("inactive")
        public static final Status INACTIVE = new Status("INACTIVE", 2, "inactive");
        public static final Status UNKNOWN = new Status("UNKNOWN", 3, "unknown");

        private static final /* synthetic */ Status[] $values() {
            return new Status[]{ACTIVE, DISCONNECTED, INACTIVE, UNKNOWN};
        }

        static {
            Status[] statusArr$values = $values();
            $VALUES = statusArr$values;
            $ENTRIES = EnumEntriesKt.a(statusArr$values);
            Companion = new m();
        }

        private Status(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Status> getEntries() {
            return $ENTRIES;
        }

        public static Status valueOf(String str) {
            return (Status) Enum.valueOf(Status.class, str);
        }

        public static Status[] values() {
            return (Status[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0011\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount$Subcategory;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/p", "com/stripe/android/financialconnections/model/o", "CHECKING", "CREDIT_CARD", "LINE_OF_CREDIT", "MORTGAGE", NativeAdContent.ViewTag.OTHER, "SAVINGS", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = p.class)
    public static final class Subcategory {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Subcategory[] $VALUES;

        @NotNull
        public static final o Companion;

        @NotNull
        private final String value;

        @SerialName("checking")
        public static final Subcategory CHECKING = new Subcategory("CHECKING", 0, "checking");

        @SerialName("credit_card")
        public static final Subcategory CREDIT_CARD = new Subcategory("CREDIT_CARD", 1, "credit_card");

        @SerialName("line_of_credit")
        public static final Subcategory LINE_OF_CREDIT = new Subcategory("LINE_OF_CREDIT", 2, "line_of_credit");

        @SerialName("mortgage")
        public static final Subcategory MORTGAGE = new Subcategory("MORTGAGE", 3, "mortgage");

        @SerialName(InneractiveMediationNameConsts.OTHER)
        public static final Subcategory OTHER = new Subcategory(NativeAdContent.ViewTag.OTHER, 4, InneractiveMediationNameConsts.OTHER);

        @SerialName("savings")
        public static final Subcategory SAVINGS = new Subcategory("SAVINGS", 5, "savings");
        public static final Subcategory UNKNOWN = new Subcategory("UNKNOWN", 6, "unknown");

        private static final /* synthetic */ Subcategory[] $values() {
            return new Subcategory[]{CHECKING, CREDIT_CARD, LINE_OF_CREDIT, MORTGAGE, OTHER, SAVINGS, UNKNOWN};
        }

        static {
            Subcategory[] subcategoryArr$values = $values();
            $VALUES = subcategoryArr$values;
            $ENTRIES = EnumEntriesKt.a(subcategoryArr$values);
            Companion = new o();
        }

        private Subcategory(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Subcategory> getEntries() {
            return $ENTRIES;
        }

        public static Subcategory valueOf(String str) {
            return (Subcategory) Enum.valueOf(Subcategory.class, str);
        }

        public static Subcategory[] values() {
            return (Subcategory[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\r\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0002\n\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccount$SupportedPaymentMethodTypes;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/r", "com/stripe/android/financialconnections/model/q", "LINK", "US_BANK_ACCOUNT", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable(with = r.class)
    public static final class SupportedPaymentMethodTypes {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ SupportedPaymentMethodTypes[] $VALUES;

        @NotNull
        public static final q Companion;

        @NotNull
        private final String value;

        @SerialName("link")
        public static final SupportedPaymentMethodTypes LINK = new SupportedPaymentMethodTypes("LINK", 0, "link");

        @SerialName("us_bank_account")
        public static final SupportedPaymentMethodTypes US_BANK_ACCOUNT = new SupportedPaymentMethodTypes("US_BANK_ACCOUNT", 1, "us_bank_account");
        public static final SupportedPaymentMethodTypes UNKNOWN = new SupportedPaymentMethodTypes("UNKNOWN", 2, "unknown");

        private static final /* synthetic */ SupportedPaymentMethodTypes[] $values() {
            return new SupportedPaymentMethodTypes[]{LINK, US_BANK_ACCOUNT, UNKNOWN};
        }

        static {
            SupportedPaymentMethodTypes[] supportedPaymentMethodTypesArr$values = $values();
            $VALUES = supportedPaymentMethodTypesArr$values;
            $ENTRIES = EnumEntriesKt.a(supportedPaymentMethodTypesArr$values);
            Companion = new q();
        }

        private SupportedPaymentMethodTypes(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<SupportedPaymentMethodTypes> getEntries() {
            return $ENTRIES;
        }

        public static SupportedPaymentMethodTypes valueOf(String str) {
            return (SupportedPaymentMethodTypes) Enum.valueOf(SupportedPaymentMethodTypes.class, str);
        }

        public static SupportedPaymentMethodTypes[] values() {
            return (SupportedPaymentMethodTypes[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    public FinancialConnectionsAccount(int i5, Category category, int i11, String str, String str2, boolean z11, Status status, Subcategory subcategory, List list, Balance balance, BalanceRefresh balanceRefresh, String str3, String str4, String str5, OwnershipRefresh ownershipRefresh, List list2, String str6) {
        if (32926 != (i5 & 32926)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 32926, g.f42756a.getDescriptor());
        }
        this.f42715a = (i5 & 1) == 0 ? Category.UNKNOWN : category;
        this.f42716b = i11;
        this.f42717c = str;
        this.f42718d = str2;
        this.f42719e = z11;
        if ((i5 & 32) == 0) {
            this.f42720f = Status.UNKNOWN;
        } else {
            this.f42720f = status;
        }
        if ((i5 & 64) == 0) {
            this.f42721g = Subcategory.UNKNOWN;
        } else {
            this.f42721g = subcategory;
        }
        this.f42722h = list;
        if ((i5 & 256) == 0) {
            this.f42723i = null;
        } else {
            this.f42723i = balance;
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0) {
            this.f42724j = null;
        } else {
            this.f42724j = balanceRefresh;
        }
        if ((i5 & 1024) == 0) {
            this.f42725k = null;
        } else {
            this.f42725k = str3;
        }
        if ((i5 & 2048) == 0) {
            this.f42726l = null;
        } else {
            this.f42726l = str4;
        }
        if ((i5 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) == 0) {
            this.f42727m = null;
        } else {
            this.f42727m = str5;
        }
        if ((i5 & UserMetadata.MAX_INTERNAL_KEY_SIZE) == 0) {
            this.n = null;
        } else {
            this.n = ownershipRefresh;
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) == 0) {
            this.o = null;
        } else {
            this.o = list2;
        }
        this.f42728p = str6;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FinancialConnectionsAccount)) {
            return false;
        }
        FinancialConnectionsAccount financialConnectionsAccount = (FinancialConnectionsAccount) obj;
        return this.f42715a == financialConnectionsAccount.f42715a && this.f42716b == financialConnectionsAccount.f42716b && Intrinsics.b(this.f42717c, financialConnectionsAccount.f42717c) && Intrinsics.b(this.f42718d, financialConnectionsAccount.f42718d) && this.f42719e == financialConnectionsAccount.f42719e && this.f42720f == financialConnectionsAccount.f42720f && this.f42721g == financialConnectionsAccount.f42721g && Intrinsics.b(this.f42722h, financialConnectionsAccount.f42722h) && Intrinsics.b(this.f42723i, financialConnectionsAccount.f42723i) && Intrinsics.b(this.f42724j, financialConnectionsAccount.f42724j) && Intrinsics.b(this.f42725k, financialConnectionsAccount.f42725k) && Intrinsics.b(this.f42726l, financialConnectionsAccount.f42726l) && Intrinsics.b(this.f42727m, financialConnectionsAccount.f42727m) && Intrinsics.b(this.n, financialConnectionsAccount.n) && Intrinsics.b(this.o, financialConnectionsAccount.o);
    }

    public final int hashCode() {
        int iC = u4.c((this.f42721g.hashCode() + ((this.f42720f.hashCode() + c9.f(b.c0.e(b.c0.e(u4.a(this.f42716b, this.f42715a.hashCode() * 31, 31), 31, this.f42717c), 31, this.f42718d), 31, this.f42719e)) * 31)) * 31, 31, this.f42722h);
        Balance balance = this.f42723i;
        int iHashCode = (iC + (balance == null ? 0 : balance.hashCode())) * 31;
        BalanceRefresh balanceRefresh = this.f42724j;
        int iHashCode2 = (iHashCode + (balanceRefresh == null ? 0 : balanceRefresh.hashCode())) * 31;
        String str = this.f42725k;
        int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f42726l;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f42727m;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        OwnershipRefresh ownershipRefresh = this.n;
        int iHashCode6 = (iHashCode5 + (ownershipRefresh == null ? 0 : ownershipRefresh.hashCode())) * 31;
        List list = this.o;
        return iHashCode6 + (list != null ? list.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FinancialConnectionsAccount(category=");
        sb2.append(this.f42715a);
        sb2.append(", created=");
        sb2.append(this.f42716b);
        sb2.append(", id=");
        b.c0.D(sb2, this.f42717c, ", institutionName=", this.f42718d, ", livemode=");
        sb2.append(this.f42719e);
        sb2.append(", status=");
        sb2.append(this.f42720f);
        sb2.append(", subcategory=");
        sb2.append(this.f42721g);
        sb2.append(", supportedPaymentMethodTypes=");
        sb2.append(this.f42722h);
        sb2.append(", balance=");
        sb2.append(this.f42723i);
        sb2.append(", balanceRefresh=");
        sb2.append(this.f42724j);
        sb2.append(", displayName=");
        b.c0.D(sb2, this.f42725k, ", last4=", this.f42726l, ", ownership=");
        sb2.append(this.f42727m);
        sb2.append(", ownershipRefresh=");
        sb2.append(this.n);
        sb2.append(", permissions=");
        return a80.m.j(sb2, this.o, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42715a.name());
        dest.writeInt(this.f42716b);
        dest.writeString(this.f42717c);
        dest.writeString(this.f42718d);
        dest.writeInt(this.f42719e ? 1 : 0);
        dest.writeString(this.f42720f.name());
        dest.writeString(this.f42721g.name());
        Iterator itK = fq.c.k(this.f42722h, dest);
        while (itK.hasNext()) {
            dest.writeString(((SupportedPaymentMethodTypes) itK.next()).name());
        }
        Balance balance = this.f42723i;
        if (balance == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            balance.writeToParcel(dest, i5);
        }
        BalanceRefresh balanceRefresh = this.f42724j;
        if (balanceRefresh == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            balanceRefresh.writeToParcel(dest, i5);
        }
        dest.writeString(this.f42725k);
        dest.writeString(this.f42726l);
        dest.writeString(this.f42727m);
        OwnershipRefresh ownershipRefresh = this.n;
        if (ownershipRefresh == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            ownershipRefresh.writeToParcel(dest, i5);
        }
        List list = this.o;
        if (list == null) {
            dest.writeInt(0);
            return;
        }
        dest.writeInt(1);
        dest.writeInt(list.size());
        Iterator it = list.iterator();
        while (it.hasNext()) {
            dest.writeString(((Permissions) it.next()).name());
        }
    }

    public FinancialConnectionsAccount(Category category, int i5, String id2, String institutionName, boolean z11, Status status, Subcategory subcategory, ArrayList arrayList, Balance balance, BalanceRefresh balanceRefresh, String str, String str2, String str3, OwnershipRefresh ownershipRefresh, ArrayList arrayList2) {
        Intrinsics.g(category, "category");
        Intrinsics.g(id2, "id");
        Intrinsics.g(institutionName, "institutionName");
        Intrinsics.g(status, "status");
        Intrinsics.g(subcategory, "subcategory");
        this.f42715a = category;
        this.f42716b = i5;
        this.f42717c = id2;
        this.f42718d = institutionName;
        this.f42719e = z11;
        this.f42720f = status;
        this.f42721g = subcategory;
        this.f42722h = arrayList;
        this.f42723i = balance;
        this.f42724j = balanceRefresh;
        this.f42725k = str;
        this.f42726l = str2;
        this.f42727m = str3;
        this.n = ownershipRefresh;
        this.o = arrayList2;
        this.f42728p = "financial_connections.account";
    }
}
