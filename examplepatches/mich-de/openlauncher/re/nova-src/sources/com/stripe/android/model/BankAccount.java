package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.Keep;
import com.stripe.android.core.model.StripeModel;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/model/BankAccount;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Type", "Status", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class BankAccount implements StripeModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<BankAccount> CREATOR = new a();

    /* renamed from: a, reason: collision with root package name */
    public final String f43134a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43135b;

    /* renamed from: c, reason: collision with root package name */
    public final Type f43136c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43137d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43138e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43139f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43140g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43141h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43142i;

    /* renamed from: j, reason: collision with root package name */
    public final Status f43143j;

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/BankAccount$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/b", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Status {

        /* renamed from: b, reason: collision with root package name */
        public static final b f43144b;

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Status[] f43145c;

        /* renamed from: d, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43146d;

        /* renamed from: a, reason: collision with root package name */
        public final String f43147a;

        static {
            Status[] statusArr = {new Status("New", 0, "new"), new Status("Validated", 1, "validated"), new Status("Verified", 2, "verified"), new Status("VerificationFailed", 3, "verification_failed"), new Status("Errored", 4, "errored")};
            f43145c = statusArr;
            f43146d = EnumEntriesKt.a(statusArr);
            f43144b = new b();
        }

        public Status(String str, int i5, String str2) {
            this.f43147a = str2;
        }

        public static Status valueOf(String str) {
            return (Status) Enum.valueOf(Status.class, str);
        }

        public static Status[] values() {
            return (Status[]) f43145c.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43147a;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/BankAccount$Type;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/c", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Type {

        /* renamed from: b, reason: collision with root package name */
        public static final c f43148b;

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Type[] f43149c;

        /* renamed from: d, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43150d;

        /* renamed from: a, reason: collision with root package name */
        public final String f43151a;

        static {
            Type[] typeArr = {new Type("Company", 0, "company"), new Type("Individual", 1, "individual")};
            f43149c = typeArr;
            f43150d = EnumEntriesKt.a(typeArr);
            f43148b = new c();
        }

        public Type(String str, int i5, String str2) {
            this.f43151a = str2;
        }

        public static Type valueOf(String str) {
            return (Type) Enum.valueOf(Type.class, str);
        }

        public static Type[] values() {
            return (Type[]) f43149c.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43151a;
        }
    }

    public BankAccount(String str, String str2, Type type, String str3, String str4, String str5, String str6, String str7, String str8, Status status) {
        this.f43134a = str;
        this.f43135b = str2;
        this.f43136c = type;
        this.f43137d = str3;
        this.f43138e = str4;
        this.f43139f = str5;
        this.f43140g = str6;
        this.f43141h = str7;
        this.f43142i = str8;
        this.f43143j = status;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BankAccount)) {
            return false;
        }
        BankAccount bankAccount = (BankAccount) obj;
        return Intrinsics.b(this.f43134a, bankAccount.f43134a) && Intrinsics.b(this.f43135b, bankAccount.f43135b) && this.f43136c == bankAccount.f43136c && Intrinsics.b(this.f43137d, bankAccount.f43137d) && Intrinsics.b(this.f43138e, bankAccount.f43138e) && Intrinsics.b(this.f43139f, bankAccount.f43139f) && Intrinsics.b(this.f43140g, bankAccount.f43140g) && Intrinsics.b(this.f43141h, bankAccount.f43141h) && Intrinsics.b(this.f43142i, bankAccount.f43142i) && this.f43143j == bankAccount.f43143j;
    }

    public final int hashCode() {
        String str = this.f43134a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f43135b;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        Type type = this.f43136c;
        int iHashCode3 = (iHashCode2 + (type == null ? 0 : type.hashCode())) * 31;
        String str3 = this.f43137d;
        int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43138e;
        int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43139f;
        int iHashCode6 = (iHashCode5 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f43140g;
        int iHashCode7 = (iHashCode6 + (str6 == null ? 0 : str6.hashCode())) * 31;
        String str7 = this.f43141h;
        int iHashCode8 = (iHashCode7 + (str7 == null ? 0 : str7.hashCode())) * 31;
        String str8 = this.f43142i;
        int iHashCode9 = (iHashCode8 + (str8 == null ? 0 : str8.hashCode())) * 31;
        Status status = this.f43143j;
        return iHashCode9 + (status != null ? status.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("BankAccount(id=", this.f43134a, ", accountHolderName=", this.f43135b, ", accountHolderType=");
        sbW.append(this.f43136c);
        sbW.append(", bankName=");
        sbW.append(this.f43137d);
        sbW.append(", countryCode=");
        b.c0.D(sbW, this.f43138e, ", currency=", this.f43139f, ", fingerprint=");
        b.c0.D(sbW, this.f43140g, ", last4=", this.f43141h, ", routingNumber=");
        sbW.append(this.f43142i);
        sbW.append(", status=");
        sbW.append(this.f43143j);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43134a);
        dest.writeString(this.f43135b);
        Type type = this.f43136c;
        if (type == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(type.name());
        }
        dest.writeString(this.f43137d);
        dest.writeString(this.f43138e);
        dest.writeString(this.f43139f);
        dest.writeString(this.f43140g);
        dest.writeString(this.f43141h);
        dest.writeString(this.f43142i);
        Status status = this.f43143j;
        if (status == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(status.name());
        }
    }
}
