package i2;

import android.bluetooth.BluetoothHearingAid;
import android.bluetooth.BluetoothProfile;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class a1 {
    public static /* bridge */ /* synthetic */ BluetoothHearingAid b(BluetoothProfile bluetoothProfile) {
        return (BluetoothHearingAid) bluetoothProfile;
    }

    public static /* bridge */ /* synthetic */ boolean r(BluetoothProfile bluetoothProfile) {
        return bluetoothProfile instanceof BluetoothHearingAid;
    }
}
