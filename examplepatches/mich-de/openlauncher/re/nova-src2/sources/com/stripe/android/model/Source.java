package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.Keep;
import com.stripe.android.core.model.StripeModel;
import java.util.Map;
import kotlin.Metadata;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002:\u0003\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/Source;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Status", "Usage", "Owner", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class Source implements StripeModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<Source> CREATOR = new t4();

    /* renamed from: a, reason: collision with root package name */
    public final String f43796a;

    /* renamed from: b, reason: collision with root package name */
    public final Long f43797b;

    /* renamed from: c, reason: collision with root package name */
    public final String f43798c;

    /* renamed from: d, reason: collision with root package name */
    public final Long f43799d;

    /* renamed from: e, reason: collision with root package name */
    public final String f43800e;

    /* renamed from: f, reason: collision with root package name */
    public final Boolean f43801f;

    /* renamed from: g, reason: collision with root package name */
    public final Owner f43802g;

    /* renamed from: h, reason: collision with root package name */
    public final Status f43803h;

    /* renamed from: i, reason: collision with root package name */
    public final Map f43804i;

    /* renamed from: j, reason: collision with root package name */
    public final SourceTypeModel f43805j;

    /* renamed from: k, reason: collision with root package name */
    public final String f43806k;

    /* renamed from: l, reason: collision with root package name */
    public final String f43807l;

    /* renamed from: m, reason: collision with root package name */
    public final Usage f43808m;
    public final SourceOrder n;
    public final String o;

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/Source$Owner;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Owner implements StripeModel {

        @NotNull
        public static final Parcelable.Creator<Owner> CREATOR = new u4();

        /* renamed from: a, reason: collision with root package name */
        public final Address f43809a;

        /* renamed from: b, reason: collision with root package name */
        public final String f43810b;

        /* renamed from: c, reason: collision with root package name */
        public final String f43811c;

        /* renamed from: d, reason: collision with root package name */
        public final String f43812d;

        /* renamed from: e, reason: collision with root package name */
        public final Address f43813e;

        /* renamed from: f, reason: collision with root package name */
        public final String f43814f;

        /* renamed from: g, reason: collision with root package name */
        public final String f43815g;

        /* renamed from: h, reason: collision with root package name */
        public final String f43816h;

        public Owner(Address address, String str, String str2, String str3, Address address2, String str4, String str5, String str6) {
            this.f43809a = address;
            this.f43810b = str;
            this.f43811c = str2;
            this.f43812d = str3;
            this.f43813e = address2;
            this.f43814f = str4;
            this.f43815g = str5;
            this.f43816h = str6;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof Owner)) {
                return false;
            }
            Owner owner = (Owner) obj;
            return Intrinsics.b(this.f43809a, owner.f43809a) && Intrinsics.b(this.f43810b, owner.f43810b) && Intrinsics.b(this.f43811c, owner.f43811c) && Intrinsics.b(this.f43812d, owner.f43812d) && Intrinsics.b(this.f43813e, owner.f43813e) && Intrinsics.b(this.f43814f, owner.f43814f) && Intrinsics.b(this.f43815g, owner.f43815g) && Intrinsics.b(this.f43816h, owner.f43816h);
        }

        public final int hashCode() {
            Address address = this.f43809a;
            int iHashCode = (address == null ? 0 : address.hashCode()) * 31;
            String str = this.f43810b;
            int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
            String str2 = this.f43811c;
            int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
            String str3 = this.f43812d;
            int iHashCode4 = (iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31;
            Address address2 = this.f43813e;
            int iHashCode5 = (iHashCode4 + (address2 == null ? 0 : address2.hashCode())) * 31;
            String str4 = this.f43814f;
            int iHashCode6 = (iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 31;
            String str5 = this.f43815g;
            int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
            String str6 = this.f43816h;
            return iHashCode7 + (str6 != null ? str6.hashCode() : 0);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("Owner(address=");
            sb2.append(this.f43809a);
            sb2.append(", email=");
            sb2.append(this.f43810b);
            sb2.append(", name=");
            b.c0.D(sb2, this.f43811c, ", phone=", this.f43812d, ", verifiedAddress=");
            sb2.append(this.f43813e);
            sb2.append(", verifiedEmail=");
            sb2.append(this.f43814f);
            sb2.append(", verifiedName=");
            return b.c0.s(sb2, this.f43815g, ", verifiedPhone=", this.f43816h, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            Address address = this.f43809a;
            if (address == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43810b);
            dest.writeString(this.f43811c);
            dest.writeString(this.f43812d);
            Address address2 = this.f43813e;
            if (address2 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                address2.writeToParcel(dest, i5);
            }
            dest.writeString(this.f43814f);
            dest.writeString(this.f43815g);
            dest.writeString(this.f43816h);
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/Source$Status;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/v4", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Status {

        /* renamed from: b, reason: collision with root package name */
        public static final v4 f43817b;

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Status[] f43818c;

        /* renamed from: d, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43819d;

        /* renamed from: a, reason: collision with root package name */
        public final String f43820a;

        static {
            Status[] statusArr = {new Status("Canceled", 0, "canceled"), new Status("Chargeable", 1, "chargeable"), new Status("Consumed", 2, "consumed"), new Status("Failed", 3, "failed"), new Status("Pending", 4, "pending")};
            f43818c = statusArr;
            f43819d = EnumEntriesKt.a(statusArr);
            f43817b = new v4();
        }

        public Status(String str, int i5, String str2) {
            this.f43820a = str2;
        }

        public static Status valueOf(String str) {
            return (Status) Enum.valueOf(Status.class, str);
        }

        public static Status[] values() {
            return (Status[]) f43818c.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43820a;
        }
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0005J\u000f\u0010\u0003\u001a\u00020\u0002H\u0017¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/model/Source$Usage;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "()Ljava/lang/String;", "com/stripe/android/model/w4", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Usage {

        /* renamed from: b, reason: collision with root package name */
        public static final w4 f43821b;

        /* renamed from: c, reason: collision with root package name */
        public static final /* synthetic */ Usage[] f43822c;

        /* renamed from: d, reason: collision with root package name */
        public static final /* synthetic */ i70.a f43823d;

        /* renamed from: a, reason: collision with root package name */
        public final String f43824a;

        static {
            Usage[] usageArr = {new Usage("Reusable", 0, "reusable"), new Usage("SingleUse", 1, "single_use")};
            f43822c = usageArr;
            f43823d = EnumEntriesKt.a(usageArr);
            f43821b = new w4();
        }

        public Usage(String str, int i5, String str2) {
            this.f43824a = str2;
        }

        public static Usage valueOf(String str) {
            return (Usage) Enum.valueOf(Usage.class, str);
        }

        public static Usage[] values() {
            return (Usage[]) f43822c.clone();
        }

        @Override // java.lang.Enum
        @Keep
        @NotNull
        public String toString() {
            return this.f43824a;
        }
    }

    public Source(String str, Long l9, String str2, Long l11, String str3, Boolean bool, Owner owner, Status status, Map map, SourceTypeModel sourceTypeModel, String type, String typeRaw, Usage usage, SourceOrder sourceOrder, String str4) {
        Intrinsics.g(type, "type");
        Intrinsics.g(typeRaw, "typeRaw");
        this.f43796a = str;
        this.f43797b = l9;
        this.f43798c = str2;
        this.f43799d = l11;
        this.f43800e = str3;
        this.f43801f = bool;
        this.f43802g = owner;
        this.f43803h = status;
        this.f43804i = map;
        this.f43805j = sourceTypeModel;
        this.f43806k = type;
        this.f43807l = typeRaw;
        this.f43808m = usage;
        this.n = sourceOrder;
        this.o = str4;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Source)) {
            return false;
        }
        Source source = (Source) obj;
        return Intrinsics.b(this.f43796a, source.f43796a) && Intrinsics.b(this.f43797b, source.f43797b) && Intrinsics.b(this.f43798c, source.f43798c) && Intrinsics.b(this.f43799d, source.f43799d) && Intrinsics.b(this.f43800e, source.f43800e) && Intrinsics.b(this.f43801f, source.f43801f) && Intrinsics.b(this.f43802g, source.f43802g) && this.f43803h == source.f43803h && Intrinsics.b(this.f43804i, source.f43804i) && Intrinsics.b(this.f43805j, source.f43805j) && Intrinsics.b(this.f43806k, source.f43806k) && Intrinsics.b(this.f43807l, source.f43807l) && this.f43808m == source.f43808m && Intrinsics.b(this.n, source.n) && Intrinsics.b(this.o, source.o);
    }

    public final int hashCode() {
        String str = this.f43796a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        Long l9 = this.f43797b;
        int iHashCode2 = (iHashCode + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str2 = this.f43798c;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Long l11 = this.f43799d;
        int iHashCode4 = (iHashCode3 + (l11 == null ? 0 : l11.hashCode())) * 31;
        String str3 = this.f43800e;
        int iHashCode5 = (iHashCode4 + (str3 == null ? 0 : str3.hashCode())) * 31;
        Boolean bool = this.f43801f;
        int iHashCode6 = (iHashCode5 + (bool == null ? 0 : bool.hashCode())) * 31;
        Owner owner = this.f43802g;
        int iHashCode7 = (iHashCode6 + (owner == null ? 0 : owner.hashCode())) * 31;
        Status status = this.f43803h;
        int iHashCode8 = (iHashCode7 + (status == null ? 0 : status.hashCode())) * 31;
        Map map = this.f43804i;
        int iHashCode9 = (iHashCode8 + (map == null ? 0 : map.hashCode())) * 31;
        SourceTypeModel sourceTypeModel = this.f43805j;
        int iE = b.c0.e(b.c0.e((iHashCode9 + (sourceTypeModel == null ? 0 : sourceTypeModel.hashCode())) * 31, 31, this.f43806k), 31, this.f43807l);
        Usage usage = this.f43808m;
        int iHashCode10 = (iE + (usage == null ? 0 : usage.hashCode())) * 31;
        SourceOrder sourceOrder = this.n;
        int iHashCode11 = (iHashCode10 + (sourceOrder == null ? 0 : sourceOrder.hashCode())) * 31;
        String str4 = this.o;
        return iHashCode11 + (str4 != null ? str4.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Source(id=");
        sb2.append(this.f43796a);
        sb2.append(", amount=");
        sb2.append(this.f43797b);
        sb2.append(", clientSecret=");
        sb2.append(this.f43798c);
        sb2.append(", created=");
        sb2.append(this.f43799d);
        sb2.append(", currency=");
        sb2.append(this.f43800e);
        sb2.append(", isLiveMode=");
        sb2.append(this.f43801f);
        sb2.append(", owner=");
        sb2.append(this.f43802g);
        sb2.append(", status=");
        sb2.append(this.f43803h);
        sb2.append(", sourceTypeData=");
        sb2.append(this.f43804i);
        sb2.append(", sourceTypeModel=");
        sb2.append(this.f43805j);
        sb2.append(", type=");
        b.c0.D(sb2, this.f43806k, ", typeRaw=", this.f43807l, ", usage=");
        sb2.append(this.f43808m);
        sb2.append(", sourceOrder=");
        sb2.append(this.n);
        sb2.append(", statementDescriptor=");
        return b.c0.q(sb2, this.o, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43796a);
        Long l9 = this.f43797b;
        if (l9 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l9.longValue());
        }
        dest.writeString(this.f43798c);
        Long l11 = this.f43799d;
        if (l11 == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeLong(l11.longValue());
        }
        dest.writeString(this.f43800e);
        Boolean bool = this.f43801f;
        if (bool == null) {
            dest.writeInt(0);
        } else {
            com.google.android.gms.internal.measurement.k2.w(dest, 1, bool);
        }
        Owner owner = this.f43802g;
        if (owner == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            owner.writeToParcel(dest, i5);
        }
        Status status = this.f43803h;
        if (status == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(status.name());
        }
        Map map = this.f43804i;
        if (map == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeInt(map.size());
            for (Map.Entry entry : map.entrySet()) {
                dest.writeString((String) entry.getKey());
                dest.writeValue(entry.getValue());
            }
        }
        dest.writeParcelable(this.f43805j, i5);
        dest.writeString(this.f43806k);
        dest.writeString(this.f43807l);
        Usage usage = this.f43808m;
        if (usage == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(usage.name());
        }
        SourceOrder sourceOrder = this.n;
        if (sourceOrder == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            sourceOrder.writeToParcel(dest, i5);
        }
        dest.writeString(this.o);
    }
}
