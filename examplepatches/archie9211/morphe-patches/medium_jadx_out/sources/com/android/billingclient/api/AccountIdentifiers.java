package com.android.billingclient.api;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class AccountIdentifiers {
    private final String zza;
    private final String zzb;

    public AccountIdentifiers(String str, String str2) {
        this.zza = str;
        this.zzb = str2;
    }

    public String getObfuscatedAccountId() {
        return this.zza;
    }

    public String getObfuscatedProfileId() {
        return this.zzb;
    }
}
