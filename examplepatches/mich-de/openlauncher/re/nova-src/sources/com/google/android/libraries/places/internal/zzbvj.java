package com.google.android.libraries.places.internal;

import java.net.SocketAddress;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class zzbvj {
    final String[] zza;
    final int zzb;

    public zzbvj(zzazs zzazsVar) {
        zzmt.zzc(zzazsVar, "eag");
        this.zza = new String[zzazsVar.zzb().size()];
        Iterator it = zzazsVar.zzb().iterator();
        int i5 = 0;
        while (it.hasNext()) {
            this.zza[i5] = ((SocketAddress) it.next()).toString();
            i5++;
        }
        Arrays.sort(this.zza);
        this.zzb = Arrays.hashCode(this.zza);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof zzbvj)) {
            return false;
        }
        zzbvj zzbvjVar = (zzbvj) obj;
        if (zzbvjVar.zzb == this.zzb) {
            String[] strArr = zzbvjVar.zza;
            String[] strArr2 = this.zza;
            if (strArr.length == strArr2.length) {
                return Arrays.equals(strArr, strArr2);
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.zzb;
    }

    public final String toString() {
        return Arrays.toString(this.zza);
    }
}
