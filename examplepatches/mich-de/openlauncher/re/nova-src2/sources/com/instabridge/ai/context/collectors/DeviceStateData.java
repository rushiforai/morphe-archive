package com.instabridge.ai.context.collectors;

import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b!\b\u0087\b\u0018\u00002\u00020\u0001B{\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\t\u001a\u00020\u0005\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u000b\u001a\u00020\u0005\u0012\b\b\u0002\u0010\f\u001a\u00020\u0005\u0012\b\b\u0002\u0010\r\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u000e\u001a\u00020\u0005\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\u0004\b\u0011\u0010\u0012J\t\u0010 \u001a\u00020\u0003HÆ\u0003J\t\u0010!\u001a\u00020\u0005HÆ\u0003J\t\u0010\"\u001a\u00020\u0005HÆ\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\bHÆ\u0003J\t\u0010$\u001a\u00020\u0005HÆ\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\bHÆ\u0003J\t\u0010&\u001a\u00020\u0005HÆ\u0003J\t\u0010'\u001a\u00020\u0005HÆ\u0003J\t\u0010(\u001a\u00020\u0003HÆ\u0003J\t\u0010)\u001a\u00020\u0005HÆ\u0003J\u0010\u0010*\u001a\u0004\u0018\u00010\u0010HÆ\u0003¢\u0006\u0002\u0010\u001eJ\u0082\u0001\u0010+\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\t\u001a\u00020\u00052\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u000b\u001a\u00020\u00052\b\b\u0002\u0010\f\u001a\u00020\u00052\b\b\u0002\u0010\r\u001a\u00020\u00032\b\b\u0002\u0010\u000e\u001a\u00020\u00052\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÆ\u0001¢\u0006\u0002\u0010,J\u0013\u0010-\u001a\u00020\u00052\b\u0010.\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010/\u001a\u00020\u0003HÖ\u0001J\t\u00100\u001a\u00020\bHÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0004\u0010\u0015R\u0011\u0010\u0006\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0015R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0011\u0010\t\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u0015R\u0013\u0010\n\u001a\u0004\u0018\u00010\b¢\u0006\b\n\u0000\u001a\u0004\b\u001a\u0010\u0018R\u0011\u0010\u000b\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\u0015R\u0011\u0010\f\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u001b\u0010\u0015R\u0011\u0010\r\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u001c\u0010\u0014R\u0011\u0010\u000e\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u0015R\u0015\u0010\u000f\u001a\u0004\u0018\u00010\u0010¢\u0006\n\n\u0002\u0010\u001f\u001a\u0004\b\u001d\u0010\u001e¨\u00061"}, d2 = {"Lcom/instabridge/ai/context/collectors/DeviceStateData;", b.f42142b, "batteryPercent", b.f42142b, "isCharging", b.f42142b, "wifiConnected", "wifiSsid", b.f42142b, "cellularConnected", "cellularType", "isDndEnabled", "bluetoothEnabled", "bluetoothDeviceCount", "isScreenOn", "storageAvailableGb", b.f42142b, "<init>", "(IZZLjava/lang/String;ZLjava/lang/String;ZZIZLjava/lang/Float;)V", "getBatteryPercent", "()I", "()Z", "getWifiConnected", "getWifiSsid", "()Ljava/lang/String;", "getCellularConnected", "getCellularType", "getBluetoothEnabled", "getBluetoothDeviceCount", "getStorageAvailableGb", "()Ljava/lang/Float;", "Ljava/lang/Float;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "component9", "component10", "component11", "copy", "(IZZLjava/lang/String;ZLjava/lang/String;ZZIZLjava/lang/Float;)Lcom/instabridge/ai/context/collectors/DeviceStateData;", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class DeviceStateData {
    public static final int $stable = 0;
    private final int batteryPercent;
    private final int bluetoothDeviceCount;
    private final boolean bluetoothEnabled;
    private final boolean cellularConnected;

    @Nullable
    private final String cellularType;
    private final boolean isCharging;
    private final boolean isDndEnabled;
    private final boolean isScreenOn;

    @Nullable
    private final Float storageAvailableGb;
    private final boolean wifiConnected;

    @Nullable
    private final String wifiSsid;

    public DeviceStateData() {
        this(0, false, false, null, false, null, false, false, 0, false, null, 2047, null);
    }

    public static /* synthetic */ DeviceStateData copy$default(DeviceStateData deviceStateData, int i5, boolean z11, boolean z12, String str, boolean z13, String str2, boolean z14, boolean z15, int i11, boolean z16, Float f11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            i5 = deviceStateData.batteryPercent;
        }
        if ((i12 & 2) != 0) {
            z11 = deviceStateData.isCharging;
        }
        if ((i12 & 4) != 0) {
            z12 = deviceStateData.wifiConnected;
        }
        if ((i12 & 8) != 0) {
            str = deviceStateData.wifiSsid;
        }
        if ((i12 & 16) != 0) {
            z13 = deviceStateData.cellularConnected;
        }
        if ((i12 & 32) != 0) {
            str2 = deviceStateData.cellularType;
        }
        if ((i12 & 64) != 0) {
            z14 = deviceStateData.isDndEnabled;
        }
        if ((i12 & 128) != 0) {
            z15 = deviceStateData.bluetoothEnabled;
        }
        if ((i12 & 256) != 0) {
            i11 = deviceStateData.bluetoothDeviceCount;
        }
        if ((i12 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            z16 = deviceStateData.isScreenOn;
        }
        if ((i12 & 1024) != 0) {
            f11 = deviceStateData.storageAvailableGb;
        }
        boolean z17 = z16;
        Float f12 = f11;
        boolean z18 = z15;
        int i13 = i11;
        String str3 = str2;
        boolean z19 = z14;
        boolean z21 = z13;
        boolean z22 = z12;
        return deviceStateData.copy(i5, z11, z22, str, z21, str3, z19, z18, i13, z17, f12);
    }

    /* renamed from: component1, reason: from getter */
    public final int getBatteryPercent() {
        return this.batteryPercent;
    }

    /* renamed from: component10, reason: from getter */
    public final boolean getIsScreenOn() {
        return this.isScreenOn;
    }

    @Nullable
    /* renamed from: component11, reason: from getter */
    public final Float getStorageAvailableGb() {
        return this.storageAvailableGb;
    }

    /* renamed from: component2, reason: from getter */
    public final boolean getIsCharging() {
        return this.isCharging;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getWifiConnected() {
        return this.wifiConnected;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final String getWifiSsid() {
        return this.wifiSsid;
    }

    /* renamed from: component5, reason: from getter */
    public final boolean getCellularConnected() {
        return this.cellularConnected;
    }

    @Nullable
    /* renamed from: component6, reason: from getter */
    public final String getCellularType() {
        return this.cellularType;
    }

    /* renamed from: component7, reason: from getter */
    public final boolean getIsDndEnabled() {
        return this.isDndEnabled;
    }

    /* renamed from: component8, reason: from getter */
    public final boolean getBluetoothEnabled() {
        return this.bluetoothEnabled;
    }

    /* renamed from: component9, reason: from getter */
    public final int getBluetoothDeviceCount() {
        return this.bluetoothDeviceCount;
    }

    @NotNull
    public final DeviceStateData copy(int batteryPercent, boolean isCharging, boolean wifiConnected, @Nullable String wifiSsid, boolean cellularConnected, @Nullable String cellularType, boolean isDndEnabled, boolean bluetoothEnabled, int bluetoothDeviceCount, boolean isScreenOn, @Nullable Float storageAvailableGb) {
        return new DeviceStateData(batteryPercent, isCharging, wifiConnected, wifiSsid, cellularConnected, cellularType, isDndEnabled, bluetoothEnabled, bluetoothDeviceCount, isScreenOn, storageAvailableGb);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DeviceStateData)) {
            return false;
        }
        DeviceStateData deviceStateData = (DeviceStateData) other;
        return this.batteryPercent == deviceStateData.batteryPercent && this.isCharging == deviceStateData.isCharging && this.wifiConnected == deviceStateData.wifiConnected && Intrinsics.b(this.wifiSsid, deviceStateData.wifiSsid) && this.cellularConnected == deviceStateData.cellularConnected && Intrinsics.b(this.cellularType, deviceStateData.cellularType) && this.isDndEnabled == deviceStateData.isDndEnabled && this.bluetoothEnabled == deviceStateData.bluetoothEnabled && this.bluetoothDeviceCount == deviceStateData.bluetoothDeviceCount && this.isScreenOn == deviceStateData.isScreenOn && Intrinsics.b(this.storageAvailableGb, deviceStateData.storageAvailableGb);
    }

    public final int getBatteryPercent() {
        return this.batteryPercent;
    }

    public final int getBluetoothDeviceCount() {
        return this.bluetoothDeviceCount;
    }

    public final boolean getBluetoothEnabled() {
        return this.bluetoothEnabled;
    }

    public final boolean getCellularConnected() {
        return this.cellularConnected;
    }

    @Nullable
    public final String getCellularType() {
        return this.cellularType;
    }

    @Nullable
    public final Float getStorageAvailableGb() {
        return this.storageAvailableGb;
    }

    public final boolean getWifiConnected() {
        return this.wifiConnected;
    }

    @Nullable
    public final String getWifiSsid() {
        return this.wifiSsid;
    }

    public int hashCode() {
        int iF = c9.f(c9.f(Integer.hashCode(this.batteryPercent) * 31, 31, this.isCharging), 31, this.wifiConnected);
        String str = this.wifiSsid;
        int iF2 = c9.f((iF + (str == null ? 0 : str.hashCode())) * 31, 31, this.cellularConnected);
        String str2 = this.cellularType;
        int iF3 = c9.f(u4.a(this.bluetoothDeviceCount, c9.f(c9.f((iF2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.isDndEnabled), 31, this.bluetoothEnabled), 31), 31, this.isScreenOn);
        Float f11 = this.storageAvailableGb;
        return iF3 + (f11 != null ? f11.hashCode() : 0);
    }

    public final boolean isCharging() {
        return this.isCharging;
    }

    public final boolean isDndEnabled() {
        return this.isDndEnabled;
    }

    public final boolean isScreenOn() {
        return this.isScreenOn;
    }

    @NotNull
    public String toString() {
        return "DeviceStateData(batteryPercent=" + this.batteryPercent + ", isCharging=" + this.isCharging + ", wifiConnected=" + this.wifiConnected + ", wifiSsid=" + this.wifiSsid + ", cellularConnected=" + this.cellularConnected + ", cellularType=" + this.cellularType + ", isDndEnabled=" + this.isDndEnabled + ", bluetoothEnabled=" + this.bluetoothEnabled + ", bluetoothDeviceCount=" + this.bluetoothDeviceCount + ", isScreenOn=" + this.isScreenOn + ", storageAvailableGb=" + this.storageAvailableGb + ')';
    }

    public DeviceStateData(int i5, boolean z11, boolean z12, @Nullable String str, boolean z13, @Nullable String str2, boolean z14, boolean z15, int i11, boolean z16, @Nullable Float f11) {
        this.batteryPercent = i5;
        this.isCharging = z11;
        this.wifiConnected = z12;
        this.wifiSsid = str;
        this.cellularConnected = z13;
        this.cellularType = str2;
        this.isDndEnabled = z14;
        this.bluetoothEnabled = z15;
        this.bluetoothDeviceCount = i11;
        this.isScreenOn = z16;
        this.storageAvailableGb = f11;
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.getPhiList()" because "resultVar" is null
        	at jadx.core.dex.visitors.InitCodeVariables.collectConnectedVars(InitCodeVariables.java:119)
        	at jadx.core.dex.visitors.InitCodeVariables.setCodeVar(InitCodeVariables.java:82)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVar(InitCodeVariables.java:74)
        	at jadx.core.dex.visitors.InitCodeVariables.initCodeVars(InitCodeVariables.java:48)
        	at jadx.core.dex.visitors.InitCodeVariables.visit(InitCodeVariables.java:29)
        */
    public /* synthetic */ DeviceStateData(int r3, boolean r4, boolean r5, java.lang.String r6, boolean r7, java.lang.String r8, boolean r9, boolean r10, int r11, boolean r12, java.lang.Float r13, int r14, kotlin.jvm.internal.DefaultConstructorMarker r15) {
        /*
            r2 = this;
            r15 = r14 & 1
            if (r15 == 0) goto L5
            r3 = -1
        L5:
            r15 = r14 & 2
            r0 = 0
            if (r15 == 0) goto Lb
            r4 = r0
        Lb:
            r15 = r14 & 4
            if (r15 == 0) goto L10
            r5 = r0
        L10:
            r15 = r14 & 8
            r1 = 0
            if (r15 == 0) goto L16
            r6 = r1
        L16:
            r15 = r14 & 16
            if (r15 == 0) goto L1b
            r7 = r0
        L1b:
            r15 = r14 & 32
            if (r15 == 0) goto L20
            r8 = r1
        L20:
            r15 = r14 & 64
            if (r15 == 0) goto L25
            r9 = r0
        L25:
            r15 = r14 & 128(0x80, float:1.8E-43)
            if (r15 == 0) goto L2a
            r10 = r0
        L2a:
            r15 = r14 & 256(0x100, float:3.59E-43)
            if (r15 == 0) goto L2f
            r11 = r0
        L2f:
            r15 = r14 & 512(0x200, float:7.17E-43)
            if (r15 == 0) goto L34
            r12 = 1
        L34:
            r14 = r14 & 1024(0x400, float:1.435E-42)
            if (r14 == 0) goto L45
            r15 = r1
            r13 = r11
            r14 = r12
            r11 = r9
            r12 = r10
            r9 = r7
            r10 = r8
            r7 = r5
            r8 = r6
            r5 = r3
            r6 = r4
            r4 = r2
            goto L51
        L45:
            r15 = r13
            r14 = r12
            r12 = r10
            r13 = r11
            r10 = r8
            r11 = r9
            r8 = r6
            r9 = r7
            r6 = r4
            r7 = r5
            r4 = r2
            r5 = r3
        L51:
            r4.<init>(r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.instabridge.ai.context.collectors.DeviceStateData.<init>(int, boolean, boolean, java.lang.String, boolean, java.lang.String, boolean, boolean, int, boolean, java.lang.Float, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }
}
