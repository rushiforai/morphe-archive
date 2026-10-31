package jx;

import android.bluetooth.BluetoothA2dp;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothHeadset;
import android.bluetooth.BluetoothHearingAid;
import android.bluetooth.BluetoothLeAudio;
import android.bluetooth.BluetoothProfile;
import android.os.Build;
import b.c0;
import hv.z1;
import i2.a1;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;

/* loaded from: classes4.dex */
public final class d implements BluetoothProfile.ServiceListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z1 f70401a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.m f70402b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f70403c;

    public d(z1 z1Var, t70.m mVar, int i5) {
        this.f70401a = z1Var;
        this.f70402b = mVar;
        this.f70403c = i5;
    }

    @Override // android.bluetooth.BluetoothProfile.ServiceListener
    public final void onServiceConnected(int i5, BluetoothProfile bluetoothProfile) {
        z1 z1Var = this.f70401a;
        int i11 = this.f70403c;
        t70.m mVar = this.f70402b;
        if (i5 == 1) {
            BluetoothHeadset bluetoothHeadset = bluetoothProfile instanceof BluetoothHeadset ? (BluetoothHeadset) bluetoothProfile : null;
            if (bluetoothHeadset == null) {
                IllegalStateException illegalStateException = new IllegalStateException(c0.h(i11, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
                int i12 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(illegalStateException));
                Unit unit = Unit.f71706a;
                return;
            }
            List<BluetoothDevice> connectedDevices = bluetoothHeadset.getConnectedDevices();
            z1Var.invoke(Integer.valueOf(i5), bluetoothHeadset);
            int i13 = Result.f71687b;
            mVar.resumeWith(connectedDevices);
            return;
        }
        if (i5 == 2) {
            BluetoothA2dp bluetoothA2dp = bluetoothProfile instanceof BluetoothA2dp ? (BluetoothA2dp) bluetoothProfile : null;
            if (bluetoothA2dp == null) {
                IllegalStateException illegalStateException2 = new IllegalStateException(c0.h(i11, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
                int i14 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(illegalStateException2));
                Unit unit2 = Unit.f71706a;
                return;
            }
            List<BluetoothDevice> connectedDevices2 = bluetoothA2dp.getConnectedDevices();
            z1Var.invoke(Integer.valueOf(i5), bluetoothA2dp);
            int i15 = Result.f71687b;
            mVar.resumeWith(connectedDevices2);
            return;
        }
        if (i5 == 21 && Build.VERSION.SDK_INT >= 29) {
            BluetoothHearingAid bluetoothHearingAidB = a1.r(bluetoothProfile) ? a1.b(bluetoothProfile) : null;
            if (bluetoothHearingAidB == null) {
                IllegalStateException illegalStateException3 = new IllegalStateException(c0.h(i11, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
                int i16 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(illegalStateException3));
                Unit unit3 = Unit.f71706a;
                return;
            }
            List connectedDevices3 = bluetoothHearingAidB.getConnectedDevices();
            z1Var.invoke(Integer.valueOf(i5), bluetoothHearingAidB);
            int i17 = Result.f71687b;
            mVar.resumeWith(connectedDevices3);
            return;
        }
        if (i5 != 22 || Build.VERSION.SDK_INT < 31) {
            IllegalStateException illegalStateException4 = new IllegalStateException(c0.h(i11, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
            int i18 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(illegalStateException4));
            Unit unit4 = Unit.f71706a;
            return;
        }
        BluetoothLeAudio bluetoothLeAudioC = ge.j.z(bluetoothProfile) ? ge.j.c(bluetoothProfile) : null;
        if (bluetoothLeAudioC == null) {
            IllegalStateException illegalStateException5 = new IllegalStateException(c0.h(i11, "BluetoothDataManager.getConnectedDevicesFromProfile failed for "));
            int i19 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(illegalStateException5));
            Unit unit5 = Unit.f71706a;
            return;
        }
        List connectedDevices4 = bluetoothLeAudioC.getConnectedDevices();
        z1Var.invoke(Integer.valueOf(i5), bluetoothLeAudioC);
        int i21 = Result.f71687b;
        mVar.resumeWith(connectedDevices4);
    }

    @Override // android.bluetooth.BluetoothProfile.ServiceListener
    public final void onServiceDisconnected(int i5) {
    }
}
