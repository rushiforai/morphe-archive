package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.lang.annotation.Annotation;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0003\u0004\u0005\u0006¨\u0006\u0007"}, d2 = {"Lcom/stripe/android/financialconnections/model/Balance;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "Type", "com/stripe/android/financialconnections/model/a", "xr/a", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class Balance implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final int f42697a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f42698b;

    /* renamed from: c, reason: collision with root package name */
    public final Type f42699c;

    /* renamed from: d, reason: collision with root package name */
    public final CashBalance f42700d;

    /* renamed from: e, reason: collision with root package name */
    public final CreditBalance f42701e;

    @NotNull
    public static final xr.a Companion = new xr.a();

    @NotNull
    public static final Parcelable.Creator<Balance> CREATOR = new b();

    /* renamed from: f, reason: collision with root package name */
    public static final KSerializer[] f42696f = {null, new LinkedHashMapSerializer(StringSerializer.INSTANCE, IntSerializer.INSTANCE), Type.Companion.serializer(), null, null};

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\f\b\u0087\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\nB\u0011\b\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0006\u001a\u0004\b\u0007\u0010\bj\u0002\b\u000bj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lcom/stripe/android/financialconnections/model/Balance$Type;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "value", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "Ljava/lang/String;", "getValue", "()Ljava/lang/String;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/stripe/android/financialconnections/model/c", "CASH", "CREDIT", "UNKNOWN", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    public static final class Type {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Type[] $VALUES;

        @NotNull
        private static final Lazy<KSerializer<Object>> $cachedSerializer$delegate;

        @NotNull
        public static final c Companion;

        @NotNull
        private final String value;

        @SerialName("cash")
        public static final Type CASH = new Type("CASH", 0, "cash");

        @SerialName("credit")
        public static final Type CREDIT = new Type("CREDIT", 1, "credit");
        public static final Type UNKNOWN = new Type("UNKNOWN", 2, "unknown");

        private static final /* synthetic */ Type[] $values() {
            return new Type[]{CASH, CREDIT, UNKNOWN};
        }

        static {
            Type[] typeArr$values = $values();
            $VALUES = typeArr$values;
            $ENTRIES = EnumEntriesKt.a(typeArr$values);
            Companion = new c();
            $cachedSerializer$delegate = LazyKt.b(LazyThreadSafetyMode.f71680b, new ww.e(5));
        }

        private Type(String str, int i5, String str2) {
            this.value = str2;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final /* synthetic */ KSerializer _init_$_anonymous_() {
            return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.financialconnections.model.Balance.Type", values(), new String[]{"cash", "credit", null}, new Annotation[][]{null, null, null}, null);
        }

        @NotNull
        public static EnumEntries<Type> getEntries() {
            return $ENTRIES;
        }

        public static Type valueOf(String str) {
            return (Type) Enum.valueOf(Type.class, str);
        }

        public static Type[] values() {
            return (Type[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    public /* synthetic */ Balance(int i5, int i11, Map map, Type type, CashBalance cashBalance, CreditBalance creditBalance) {
        if (3 != (i5 & 3)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 3, a.f42752a.getDescriptor());
        }
        this.f42697a = i11;
        this.f42698b = map;
        if ((i5 & 4) == 0) {
            this.f42699c = Type.UNKNOWN;
        } else {
            this.f42699c = type;
        }
        if ((i5 & 8) == 0) {
            this.f42700d = null;
        } else {
            this.f42700d = cashBalance;
        }
        if ((i5 & 16) == 0) {
            this.f42701e = null;
        } else {
            this.f42701e = creditBalance;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Balance)) {
            return false;
        }
        Balance balance = (Balance) obj;
        return this.f42697a == balance.f42697a && Intrinsics.b(this.f42698b, balance.f42698b) && this.f42699c == balance.f42699c && Intrinsics.b(this.f42700d, balance.f42700d) && Intrinsics.b(this.f42701e, balance.f42701e);
    }

    public final int hashCode() {
        int iHashCode = (this.f42699c.hashCode() + x8.h.c(this.f42698b, Integer.hashCode(this.f42697a) * 31, 31)) * 31;
        CashBalance cashBalance = this.f42700d;
        int iHashCode2 = (iHashCode + (cashBalance == null ? 0 : cashBalance.hashCode())) * 31;
        CreditBalance creditBalance = this.f42701e;
        return iHashCode2 + (creditBalance != null ? creditBalance.hashCode() : 0);
    }

    public final String toString() {
        return "Balance(asOf=" + this.f42697a + ", current=" + this.f42698b + ", type=" + this.f42699c + ", cash=" + this.f42700d + ", credit=" + this.f42701e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42697a);
        Map map = this.f42698b;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeInt(((Number) entry.getValue()).intValue());
        }
        dest.writeString(this.f42699c.name());
        CashBalance cashBalance = this.f42700d;
        if (cashBalance == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            cashBalance.writeToParcel(dest, i5);
        }
        CreditBalance creditBalance = this.f42701e;
        if (creditBalance == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            creditBalance.writeToParcel(dest, i5);
        }
    }

    public Balance(int i5, LinkedHashMap linkedHashMap, Type type, CashBalance cashBalance, CreditBalance creditBalance) {
        Intrinsics.g(type, "type");
        this.f42697a = i5;
        this.f42698b = linkedHashMap;
        this.f42699c = type;
        this.f42700d = cashBalance;
        this.f42701e = creditBalance;
    }
}
