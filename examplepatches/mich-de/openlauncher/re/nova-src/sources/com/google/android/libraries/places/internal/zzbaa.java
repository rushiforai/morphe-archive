package com.google.android.libraries.places.internal;

import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzbaa extends zzbdd {
    private final SocketAddress zza;
    private final InetSocketAddress zzb;
    private final String zzc;
    private final String zzd;

    public /* synthetic */ zzbaa(SocketAddress socketAddress, InetSocketAddress inetSocketAddress, String str, String str2, zzazz zzazzVar) {
        zzmt.zzc(socketAddress, "proxyAddress");
        zzmt.zzc(inetSocketAddress, "targetAddress");
        if (socketAddress instanceof InetSocketAddress) {
            zzmt.zzr(!((InetSocketAddress) socketAddress).isUnresolved(), "The proxy address %s is not resolved", socketAddress);
        }
        this.zza = socketAddress;
        this.zzb = inetSocketAddress;
        this.zzc = str;
        this.zzd = str2;
    }

    public static zzazy zza() {
        return new zzazy(null);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbaa)) {
            return false;
        }
        zzbaa zzbaaVar = (zzbaa) obj;
        return zzmo.zza(this.zza, zzbaaVar.zza) && zzmo.zza(this.zzb, zzbaaVar.zzb) && zzmo.zza(this.zzc, zzbaaVar.zzc) && zzmo.zza(this.zzd, zzbaaVar.zzd);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zza, this.zzb, this.zzc, this.zzd});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("proxyAddr", this.zza);
        zzmmVarZzb.zzd("targetAddr", this.zzb);
        zzmmVarZzb.zzd("username", this.zzc);
        zzmmVarZzb.zze("hasPassword", this.zzd != null);
        return zzmmVarZzb.toString();
    }

    public final String zzb() {
        return this.zzd;
    }

    public final String zzc() {
        return this.zzc;
    }

    public final InetSocketAddress zzd() {
        return this.zzb;
    }

    public final SocketAddress zze() {
        return this.zza;
    }
}
