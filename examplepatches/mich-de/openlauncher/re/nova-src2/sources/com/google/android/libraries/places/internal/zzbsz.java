package com.google.android.libraries.places.internal;

import a80.m;
import b.c0;
import java.util.Arrays;
import java.util.List;
import javax.net.ssl.SSLSocket;

/* loaded from: classes3.dex */
public final class zzbsz {
    public static final zzbsz zza;
    public static final zzbsz zzb;
    public static final zzbsz zzc;
    private static final zzbsw[] zzf;
    final boolean zzd;
    final boolean zze;
    private final String[] zzg;
    private final String[] zzh;

    static {
        zzbsw[] zzbswVarArr = {zzbsw.TLS_AES_128_GCM_SHA256, zzbsw.TLS_AES_256_GCM_SHA384, zzbsw.TLS_CHACHA20_POLY1305_SHA256, zzbsw.TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, zzbsw.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256, zzbsw.TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384, zzbsw.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384, zzbsw.TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256, zzbsw.TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256, zzbsw.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA, zzbsw.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA, zzbsw.TLS_RSA_WITH_AES_128_GCM_SHA256, zzbsw.TLS_RSA_WITH_AES_256_GCM_SHA384, zzbsw.TLS_RSA_WITH_AES_128_CBC_SHA, zzbsw.TLS_RSA_WITH_AES_256_CBC_SHA, zzbsw.TLS_RSA_WITH_3DES_EDE_CBC_SHA};
        zzf = zzbswVarArr;
        zzbsx zzbsxVar = new zzbsx(true);
        zzbsxVar.zza(zzbswVarArr);
        zzbtn zzbtnVar = zzbtn.TLS_1_3;
        zzbtn zzbtnVar2 = zzbtn.TLS_1_2;
        zzbsxVar.zzd(zzbtnVar, zzbtnVar2);
        zzbsxVar.zzc(true);
        zzbsz zzbszVar = new zzbsz(zzbsxVar);
        zza = zzbszVar;
        zzbsx zzbsxVar2 = new zzbsx(zzbszVar);
        zzbsxVar2.zzd(zzbtnVar, zzbtnVar2, zzbtn.TLS_1_1, zzbtn.TLS_1_0);
        zzbsxVar2.zzc(true);
        zzb = new zzbsz(zzbsxVar2);
        zzc = new zzbsz(new zzbsx(false));
    }

    private zzbsz(zzbsx zzbsxVar) {
        this.zzd = zzbsxVar.zza;
        this.zzg = zzbsxVar.zzb;
        this.zzh = zzbsxVar.zzc;
        this.zze = zzbsxVar.zzd;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbsz)) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        zzbsz zzbszVar = (zzbsz) obj;
        boolean z11 = this.zzd;
        if (z11 != zzbszVar.zzd) {
            return false;
        }
        return !z11 || (Arrays.equals(this.zzg, zzbszVar.zzg) && Arrays.equals(this.zzh, zzbszVar.zzh) && this.zze == zzbszVar.zze);
    }

    public final int hashCode() {
        if (!this.zzd) {
            return 17;
        }
        return ((((Arrays.hashCode(this.zzg) + 527) * 31) + Arrays.hashCode(this.zzh)) * 31) + (!this.zze ? 1 : 0);
    }

    public final String toString() {
        List listZza;
        zzbtn zzbtnVar;
        if (!this.zzd) {
            return "ConnectionSpec()";
        }
        String[] strArr = this.zzg;
        int i5 = 0;
        if (strArr == null) {
            listZza = null;
        } else {
            zzbsw[] zzbswVarArr = new zzbsw[strArr.length];
            int i11 = 0;
            while (true) {
                String[] strArr2 = this.zzg;
                if (i11 >= strArr2.length) {
                    break;
                }
                String str = strArr2[i11];
                zzbsw zzbswVar = zzbsw.TLS_RSA_WITH_NULL_MD5;
                zzbswVarArr[i11] = str.startsWith("SSL_") ? zzbsw.zza("TLS_".concat(String.valueOf(str.substring(4)))) : zzbsw.zza(str);
                i11++;
            }
            listZza = zzbto.zza(zzbswVarArr);
        }
        String string = listZza == null ? "[use default]" : listZza.toString();
        zzbtn[] zzbtnVarArr = new zzbtn[this.zzh.length];
        while (true) {
            String[] strArr3 = this.zzh;
            if (i5 >= strArr3.length) {
                return m.k(c0.w("ConnectionSpec(cipherSuites=", string, ", tlsVersions=", String.valueOf(zzbto.zza(zzbtnVarArr)), ", supportsTlsExtensions="), this.zze, ")");
            }
            String str2 = strArr3[i5];
            zzbtn zzbtnVar2 = zzbtn.TLS_1_3;
            if ("TLSv1.3".equals(str2)) {
                zzbtnVar = zzbtn.TLS_1_3;
            } else if ("TLSv1.2".equals(str2)) {
                zzbtnVar = zzbtn.TLS_1_2;
            } else if ("TLSv1.1".equals(str2)) {
                zzbtnVar = zzbtn.TLS_1_1;
            } else if ("TLSv1".equals(str2)) {
                zzbtnVar = zzbtn.TLS_1_0;
            } else {
                if (!"SSLv3".equals(str2)) {
                    throw new IllegalArgumentException("Unexpected TLS version: ".concat(String.valueOf(str2)));
                }
                zzbtnVar = zzbtn.SSL_3_0;
            }
            zzbtnVarArr[i5] = zzbtnVar;
            i5++;
        }
    }

    public final void zza(SSLSocket sSLSocket, boolean z11) throws CloneNotSupportedException {
        String[] strArr;
        if (this.zzg != null) {
            strArr = (String[]) zzbto.zzb(String.class, this.zzg, sSLSocket.getEnabledCipherSuites());
        } else {
            strArr = null;
        }
        String[] strArr2 = (String[]) zzbto.zzb(String.class, this.zzh, sSLSocket.getEnabledProtocols());
        zzbsx zzbsxVar = new zzbsx(this);
        zzbsxVar.zzb(strArr);
        zzbsxVar.zze(strArr2);
        zzbsz zzbszVar = new zzbsz(zzbsxVar);
        sSLSocket.setEnabledProtocols(zzbszVar.zzh);
        String[] strArr3 = zzbszVar.zzg;
        if (strArr3 != null) {
            sSLSocket.setEnabledCipherSuites(strArr3);
        }
    }

    public final boolean zzb() {
        return this.zze;
    }
}
