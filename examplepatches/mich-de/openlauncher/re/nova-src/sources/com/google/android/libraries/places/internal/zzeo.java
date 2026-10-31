package com.google.android.libraries.places.internal;

import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.text.TextUtils;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzeo {
    private final String zza;
    private final int zzb;
    private final zzen zzc;
    private final boolean zzd;
    private final int zze;

    public zzeo(WifiInfo wifiInfo, ScanResult scanResult) {
        zzen zzenVar;
        String str = scanResult.BSSID;
        String str2 = scanResult.capabilities;
        int i5 = scanResult.level;
        int i11 = scanResult.frequency;
        if (TextUtils.isEmpty(str2)) {
            zzenVar = zzen.OTHER;
        } else {
            String upperCase = str2.toUpperCase(Locale.getDefault());
            zzenVar = (upperCase.equals("[ESS]") || upperCase.equals("[IBSS]")) ? zzen.NONE : upperCase.matches(".*WPA[0-9]*-PSK.*") ? zzen.PSK : upperCase.matches(".*WPA[0-9]*-EAP.*") ? zzen.EAP : zzen.OTHER;
        }
        boolean z11 = false;
        if (wifiInfo != null && !TextUtils.isEmpty(str) && str.equalsIgnoreCase(wifiInfo.getBSSID())) {
            z11 = true;
        }
        this.zza = str;
        this.zzb = i5;
        this.zzc = zzenVar;
        this.zzd = z11;
        this.zze = i11;
    }

    public final int zza() {
        return this.zze;
    }

    public final int zzb() {
        return this.zzb;
    }

    public final zzen zzc() {
        return this.zzc;
    }

    public final String zzd() {
        return this.zza;
    }

    public final boolean zze() {
        return this.zzd;
    }
}
