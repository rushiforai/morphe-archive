package com.stripe.android.lpmfoundations.paymentmethod;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.google.android.gms.internal.measurement.k2;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import p10.y1;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata;", "Landroid/os/Parcelable;", "Value", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class AnalyticsMetadata implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<AnalyticsMetadata> CREATOR = new cf.a(22);

    /* renamed from: a, reason: collision with root package name */
    public final Object f43066a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f43067b;

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value;", "Landroid/os/Parcelable;", "Nested", "SimpleString", "SimpleBoolean", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$Nested;", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$SimpleBoolean;", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$SimpleString;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Value implements Parcelable {

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$Nested;", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class Nested extends Value {

            @NotNull
            public static final Parcelable.Creator<Nested> CREATOR = new a();

            /* renamed from: a, reason: collision with root package name */
            public final Object f43068a;

            public Nested(Map map) {
                this.f43068a = map;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof Nested) && this.f43068a.equals(((Nested) obj).f43068a);
            }

            public final int hashCode() {
                return this.f43068a.hashCode();
            }

            public final String toString() {
                return "Nested(value=" + this.f43068a + ")";
            }

            /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.Map] */
            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                ?? r02 = this.f43068a;
                dest.writeInt(r02.size());
                for (Map.Entry entry : r02.entrySet()) {
                    dest.writeString((String) entry.getKey());
                    dest.writeParcelable((Parcelable) entry.getValue(), i5);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$SimpleBoolean;", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class SimpleBoolean extends Value {

            @NotNull
            public static final Parcelable.Creator<SimpleBoolean> CREATOR = new b();

            /* renamed from: a, reason: collision with root package name */
            public final Boolean f43069a;

            public SimpleBoolean(Boolean bool) {
                this.f43069a = bool;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof SimpleBoolean) && Intrinsics.b(this.f43069a, ((SimpleBoolean) obj).f43069a);
            }

            public final int hashCode() {
                Boolean bool = this.f43069a;
                if (bool == null) {
                    return 0;
                }
                return bool.hashCode();
            }

            public final String toString() {
                return "SimpleBoolean(value=" + this.f43069a + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                Boolean bool = this.f43069a;
                if (bool == null) {
                    dest.writeInt(0);
                } else {
                    k2.w(dest, 1, bool);
                }
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value$SimpleString;", "Lcom/stripe/android/lpmfoundations/paymentmethod/AnalyticsMetadata$Value;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class SimpleString extends Value {

            @NotNull
            public static final Parcelable.Creator<SimpleString> CREATOR = new c();

            /* renamed from: a, reason: collision with root package name */
            public final String f43070a;

            public SimpleString(String str) {
                this.f43070a = str;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                return (obj instanceof SimpleString) && Intrinsics.b(this.f43070a, ((SimpleString) obj).f43070a);
            }

            public final int hashCode() {
                String str = this.f43070a;
                if (str == null) {
                    return 0;
                }
                return str.hashCode();
            }

            public final String toString() {
                return c0.l("SimpleString(value=", this.f43070a, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f43070a);
            }
        }
    }

    public AnalyticsMetadata(Map map) {
        this.f43066a = map;
        this.f43067b = a(map);
    }

    /* JADX WARN: Type inference failed for: r1v14, types: [java.lang.Object, java.util.Map] */
    public static Map a(Map map) {
        Object objA;
        LinkedHashMap linkedHashMap = new LinkedHashMap(b70.k.d0(map.size()));
        for (Map.Entry entry : map.entrySet()) {
            Object key = entry.getKey();
            Value value = (Value) entry.getValue();
            if (value instanceof Value.Nested) {
                objA = a(((Value.Nested) value).f43068a);
            } else if (value instanceof Value.SimpleBoolean) {
                objA = ((Value.SimpleBoolean) value).f43069a;
            } else if (value instanceof Value.SimpleString) {
                objA = ((Value.SimpleString) value).f43070a;
            } else {
                if (value != null) {
                    throw new NoWhenBranchMatchedException();
                }
                objA = null;
            }
            linkedHashMap.put(key, objA);
        }
        return y1.z(linkedHashMap);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof AnalyticsMetadata) && this.f43066a.equals(((AnalyticsMetadata) obj).f43066a);
    }

    public final int hashCode() {
        return this.f43066a.hashCode();
    }

    public final String toString() {
        return "AnalyticsMetadata(values=" + this.f43066a + ")";
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.lang.Object, java.util.Map] */
    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        ?? r02 = this.f43066a;
        dest.writeInt(r02.size());
        for (Map.Entry entry : r02.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeParcelable((Parcelable) entry.getValue(), i5);
        }
    }
}
