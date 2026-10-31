package com.google.android.libraries.places.internal;

import android.content.Context;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class zzeq {
    public static final /* synthetic */ int zza = 0;
    private static final long zzb = TimeUnit.MINUTES.toMicros(1);
    private final zzdv zzc;
    private final Context zzd;

    public zzeq(Context context, zzdv zzdvVar) {
        this.zzd = context;
        this.zzc = zzdvVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x006b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final zznx zza(String str) {
        boolean z11;
        WifiManager wifiManager = (WifiManager) this.zzd.getSystemService("wifi");
        if (wifiManager == null || !wifiManager.isWifiEnabled()) {
            return zznx.zzl();
        }
        List<ScanResult> scanResults = wifiManager.getScanResults();
        if (scanResults == null || scanResults.isEmpty()) {
            return zznx.zzl();
        }
        zznx zznxVarZzp = zznx.zzp(zzoj.zza(new Comparator() { // from class: com.google.android.libraries.places.internal.zzep
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                int i5 = zzeq.zza;
                return ((ScanResult) obj2).level - ((ScanResult) obj).level;
            }
        }), scanResults);
        ArrayList arrayList = new ArrayList();
        WifiInfo connectionInfo = wifiManager.getConnectionInfo();
        int size = zznxVarZzp.size();
        for (int i5 = 0; i5 < size; i5++) {
            ScanResult scanResult = (ScanResult) zznxVarZzp.get(i5);
            if (scanResult != null && !TextUtils.isEmpty(scanResult.SSID)) {
                long jZza = (this.zzc.zza() * 1000) - scanResult.timestamp;
                long j11 = zzb;
                String str2 = scanResult.SSID;
                if (str2 == null) {
                    throw new IllegalArgumentException("Null SSID.");
                }
                if (str2.indexOf(95) < 0) {
                    z11 = false;
                    if (jZza > j11 && !z11) {
                        arrayList.add(new zzeo(connectionInfo, scanResult));
                    }
                } else {
                    String lowerCase = str2.toLowerCase(Locale.ENGLISH);
                    z11 = true;
                    if (!lowerCase.contains("_nomap") && !lowerCase.contains("_optout")) {
                    }
                    if (jZza > j11) {
                    }
                }
            }
        }
        return zznx.zzj(arrayList);
    }
}
