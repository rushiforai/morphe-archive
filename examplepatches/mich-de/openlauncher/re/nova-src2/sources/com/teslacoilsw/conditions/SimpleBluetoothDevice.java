package com.teslacoilsw.conditions;

import android.bluetooth.BluetoothClass;
import android.bluetooth.BluetoothDevice;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.u4;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import ji.a;
import jx.p;
import jx.q;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/teslacoilsw/conditions/SimpleBluetoothDevice;", "Landroid/os/Parcelable;", k.O, "jx/p", "jx/q", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class SimpleBluetoothDevice implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final String f45534a;

    /* renamed from: b, reason: collision with root package name */
    public final int f45535b;

    /* renamed from: c, reason: collision with root package name */
    public final String f45536c;

    /* renamed from: d, reason: collision with root package name */
    public final int f45537d;

    /* renamed from: e, reason: collision with root package name */
    public final int f45538e;

    @NotNull
    public static final q Companion = new q();

    @NotNull
    public static final Parcelable.Creator<SimpleBluetoothDevice> CREATOR = new a(10);

    public /* synthetic */ SimpleBluetoothDevice(int i5, int i11, int i12, int i13, String str, String str2) {
        if (31 != (i5 & 31)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 31, p.f70422a.getDescriptor());
        }
        this.f45534a = str;
        this.f45535b = i11;
        this.f45536c = str2;
        this.f45537d = i12;
        this.f45538e = i13;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SimpleBluetoothDevice)) {
            return false;
        }
        SimpleBluetoothDevice simpleBluetoothDevice = (SimpleBluetoothDevice) obj;
        return Intrinsics.b(this.f45534a, simpleBluetoothDevice.f45534a) && this.f45535b == simpleBluetoothDevice.f45535b && Intrinsics.b(this.f45536c, simpleBluetoothDevice.f45536c) && this.f45537d == simpleBluetoothDevice.f45537d && this.f45538e == simpleBluetoothDevice.f45538e;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f45538e) + u4.a(this.f45537d, c0.e(u4.a(this.f45535b, this.f45534a.hashCode() * 31, 31), 31, this.f45536c), 31);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("SimpleBluetoothDevice(name=", this.f45535b, this.f45534a, ", type=", ", address=");
        sbV.append(this.f45536c);
        sbV.append(", bluetoothClass=");
        sbV.append(this.f45537d);
        sbV.append(", bluetoothClassMajor=");
        return c0.o(sbV, this.f45538e, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f45534a);
        parcel.writeInt(this.f45535b);
        parcel.writeString(this.f45536c);
        parcel.writeInt(this.f45537d);
        parcel.writeInt(this.f45538e);
    }

    public SimpleBluetoothDevice(String str, int i5, String str2, int i11, int i12) {
        this.f45534a = str;
        this.f45535b = i5;
        this.f45536c = str2;
        this.f45537d = i11;
        this.f45538e = i12;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public SimpleBluetoothDevice(BluetoothDevice bluetoothDevice) {
        String name = bluetoothDevice.getName();
        int type = bluetoothDevice.getType();
        String address = bluetoothDevice.getAddress();
        BluetoothClass bluetoothClass = bluetoothDevice.getBluetoothClass();
        int deviceClass = bluetoothClass != null ? bluetoothClass.getDeviceClass() : 0;
        BluetoothClass bluetoothClass2 = bluetoothDevice.getBluetoothClass();
        this(name, type, address, deviceClass, bluetoothClass2 != null ? bluetoothClass2.getMajorDeviceClass() : 7936);
    }
}
