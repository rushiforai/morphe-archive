package com.teslacoilsw.conditions.rules;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import java.time.DayOfWeek;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerialName;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.EnumsKt;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u0000 \u00022\u00020\u0001:\u0006\u0003\u0004\u0005\u0006\u0007\b\u0082\u0001\u0005\t\n\u000b\f\r¨\u0006\u000e"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "TimeOfDayHourRangeModel", "TimeOfDayDurationModel", "WeatherChangeModel", "WifiConnectedModel", "BluetoothConnectedModel", "kx/a", "Lcom/teslacoilsw/conditions/rules/ConditionModel$BluetoothConnectedModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel$TimeOfDayDurationModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel$TimeOfDayHourRangeModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel$WeatherChangeModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel$WifiConnectedModel;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes.dex */
public abstract class ConditionModel implements Parcelable {

    @NotNull
    public static final kx.a Companion = new kx.a();

    /* renamed from: a, reason: collision with root package name */
    public static final Object f45539a = LazyKt.b(LazyThreadSafetyMode.f71680b, new h50.q(13));

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel$BluetoothConnectedModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/teslacoilsw/conditions/rules/b", "com/teslacoilsw/conditions/rules/c", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    @SerialName("BluetoothConnected")
    public static final /* data */ class BluetoothConnectedModel extends ConditionModel {

        /* renamed from: b, reason: collision with root package name */
        public final List f45541b;

        @NotNull
        public static final c Companion = new c();

        @NotNull
        public static final Parcelable.Creator<BluetoothConnectedModel> CREATOR = new d();

        /* renamed from: c, reason: collision with root package name */
        public static final KSerializer[] f45540c = {new ArrayListSerializer(jx.p.f70422a)};

        public BluetoothConnectedModel(ArrayList arrayList) {
            this.f45541b = arrayList;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof BluetoothConnectedModel) && Intrinsics.b(this.f45541b, ((BluetoothConnectedModel) obj).f45541b);
        }

        public final int hashCode() {
            return this.f45541b.hashCode();
        }

        public final String toString() {
            return "BluetoothConnectedModel(devices=" + this.f45541b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            Iterator itK = fq.c.k(this.f45541b, parcel);
            while (itK.hasNext()) {
                ((SimpleBluetoothDevice) itK.next()).writeToParcel(parcel, i5);
            }
        }

        public /* synthetic */ BluetoothConnectedModel(int i5, List list) {
            if (1 != (i5 & 1)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 1, b.f45554a.getDescriptor());
            }
            this.f45541b = list;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel$WifiConnectedModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/teslacoilsw/conditions/rules/o", "com/teslacoilsw/conditions/rules/p", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    @SerialName("WifiConnected")
    public static final /* data */ class WifiConnectedModel extends ConditionModel {

        /* renamed from: b, reason: collision with root package name */
        public final String f45552b;

        @NotNull
        public static final p Companion = new p();

        @NotNull
        public static final Parcelable.Creator<WifiConnectedModel> CREATOR = new q();

        public WifiConnectedModel(String str) {
            this.f45552b = str;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof WifiConnectedModel) && Intrinsics.b(this.f45552b, ((WifiConnectedModel) obj).f45552b);
        }

        public final int hashCode() {
            return this.f45552b.hashCode();
        }

        public final String toString() {
            return c0.l("WifiConnectedModel(ssid=", this.f45552b, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeString(this.f45552b);
        }

        public /* synthetic */ WifiConnectedModel(int i5, String str) {
            if (1 != (i5 & 1)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 1, o.f45559a.getDescriptor());
            }
            this.f45552b = str;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel$WeatherChangeModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/teslacoilsw/conditions/rules/l", "com/teslacoilsw/conditions/rules/m", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    @SerialName("WeatherChange")
    public static final /* data */ class WeatherChangeModel extends ConditionModel {

        /* renamed from: b, reason: collision with root package name */
        public final long f45550b;

        /* renamed from: c, reason: collision with root package name */
        public final long f45551c;

        @NotNull
        public static final m Companion = new m();

        @NotNull
        public static final Parcelable.Creator<WeatherChangeModel> CREATOR = new n();

        public WeatherChangeModel(long j11, long j12) {
            this.f45550b = j11;
            this.f45551c = j12;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof WeatherChangeModel)) {
                return false;
            }
            WeatherChangeModel weatherChangeModel = (WeatherChangeModel) obj;
            return this.f45550b == weatherChangeModel.f45550b && this.f45551c == weatherChangeModel.f45551c;
        }

        public final int hashCode() {
            return Long.hashCode(this.f45551c) + (Long.hashCode(this.f45550b) * 31);
        }

        public final String toString() {
            return a2.c.i(this.f45551c, ")", c0.u(this.f45550b, "WeatherChangeModel(minutesBefore=", ", minutesAfter="));
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeLong(this.f45550b);
            parcel.writeLong(this.f45551c);
        }

        public /* synthetic */ WeatherChangeModel(int i5, long j11, long j12) {
            if (3 != (i5 & 3)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 3, l.f45558a.getDescriptor());
            }
            this.f45550b = j11;
            this.f45551c = j12;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel$TimeOfDayDurationModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/teslacoilsw/conditions/rules/e", "com/teslacoilsw/conditions/rules/f", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    @SerialName("TimeOfDayDuration")
    public static final /* data */ class TimeOfDayDurationModel extends ConditionModel {

        /* renamed from: b, reason: collision with root package name */
        public final LocalTime f45543b;

        /* renamed from: c, reason: collision with root package name */
        public final long f45544c;

        /* renamed from: d, reason: collision with root package name */
        public final List f45545d;

        @NotNull
        public static final f Companion = new f();

        @NotNull
        public static final Parcelable.Creator<TimeOfDayDurationModel> CREATOR = new g();

        /* renamed from: e, reason: collision with root package name */
        public static final KSerializer[] f45542e = {null, null, new ArrayListSerializer(EnumsKt.createSimpleEnumSerializer("java.time.DayOfWeek", DayOfWeek.values()))};

        public TimeOfDayDurationModel(LocalTime localTime, long j11, List list) {
            this.f45543b = localTime;
            this.f45544c = j11;
            this.f45545d = list;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TimeOfDayDurationModel)) {
                return false;
            }
            TimeOfDayDurationModel timeOfDayDurationModel = (TimeOfDayDurationModel) obj;
            return Intrinsics.b(this.f45543b, timeOfDayDurationModel.f45543b) && this.f45544c == timeOfDayDurationModel.f45544c && Intrinsics.b(this.f45545d, timeOfDayDurationModel.f45545d);
        }

        public final int hashCode() {
            return this.f45545d.hashCode() + c0.d(this.f45543b.hashCode() * 31, 31, this.f45544c);
        }

        public final String toString() {
            return "TimeOfDayDurationModel(start=" + this.f45543b + ", durationMinutes=" + this.f45544c + ", days=" + this.f45545d + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeSerializable(this.f45543b);
            parcel.writeLong(this.f45544c);
            Iterator itK = fq.c.k(this.f45545d, parcel);
            while (itK.hasNext()) {
                parcel.writeString(((DayOfWeek) itK.next()).name());
            }
        }

        public /* synthetic */ TimeOfDayDurationModel(int i5, LocalTime localTime, long j11, List list) {
            if (7 != (i5 & 7)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 7, e.f45555a.getDescriptor());
            }
            this.f45543b = localTime;
            this.f45544c = j11;
            this.f45545d = list;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/rules/ConditionModel$TimeOfDayHourRangeModel;", "Lcom/teslacoilsw/conditions/rules/ConditionModel;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "com/teslacoilsw/conditions/rules/i", "com/teslacoilsw/conditions/rules/j", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @Serializable
    @SerialName("TimeOfDayHourRange")
    public static final /* data */ class TimeOfDayHourRangeModel extends ConditionModel {

        /* renamed from: b, reason: collision with root package name */
        public final LocalTime f45547b;

        /* renamed from: c, reason: collision with root package name */
        public final LocalTime f45548c;

        /* renamed from: d, reason: collision with root package name */
        public final List f45549d;

        @NotNull
        public static final j Companion = new j();

        @NotNull
        public static final Parcelable.Creator<TimeOfDayHourRangeModel> CREATOR = new k();

        /* renamed from: e, reason: collision with root package name */
        public static final KSerializer[] f45546e = {null, null, new ArrayListSerializer(EnumsKt.createSimpleEnumSerializer("java.time.DayOfWeek", DayOfWeek.values()))};

        public TimeOfDayHourRangeModel(LocalTime localTime, LocalTime localTime2, ArrayList arrayList) {
            this.f45547b = localTime;
            this.f45548c = localTime2;
            this.f45549d = arrayList;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof TimeOfDayHourRangeModel)) {
                return false;
            }
            TimeOfDayHourRangeModel timeOfDayHourRangeModel = (TimeOfDayHourRangeModel) obj;
            return Intrinsics.b(this.f45547b, timeOfDayHourRangeModel.f45547b) && Intrinsics.b(this.f45548c, timeOfDayHourRangeModel.f45548c) && Intrinsics.b(this.f45549d, timeOfDayHourRangeModel.f45549d);
        }

        public final int hashCode() {
            return this.f45549d.hashCode() + ((this.f45548c.hashCode() + (this.f45547b.hashCode() * 31)) * 31);
        }

        public final String toString() {
            StringBuilder sb2 = new StringBuilder("TimeOfDayHourRangeModel(start=");
            sb2.append(this.f45547b);
            sb2.append(", end=");
            sb2.append(this.f45548c);
            sb2.append(", days=");
            return a80.m.j(sb2, this.f45549d, ")");
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeSerializable(this.f45547b);
            parcel.writeSerializable(this.f45548c);
            Iterator itK = fq.c.k(this.f45549d, parcel);
            while (itK.hasNext()) {
                parcel.writeString(((DayOfWeek) itK.next()).name());
            }
        }

        public /* synthetic */ TimeOfDayHourRangeModel(int i5, LocalTime localTime, LocalTime localTime2, List list) {
            if (7 != (i5 & 7)) {
                PluginExceptionsKt.throwMissingFieldException(i5, 7, i.f45557a.getDescriptor());
            }
            this.f45547b = localTime;
            this.f45548c = localTime2;
            this.f45549d = list;
        }
    }
}
