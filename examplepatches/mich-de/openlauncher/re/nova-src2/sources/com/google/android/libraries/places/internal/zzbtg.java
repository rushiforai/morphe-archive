package com.google.android.libraries.places.internal;

import java.lang.reflect.Method;
import java.security.Provider;
import java.util.List;
import javax.net.ssl.SSLSocket;

/* loaded from: classes3.dex */
final class zzbtg extends zzbtl {
    private final zzbtf zzb;
    private final zzbtf zzc;
    private final Method zzd;
    private final Method zze;
    private final zzbtf zzf;
    private final zzbtf zzg;
    private final int zzh;

    public zzbtg(zzbtf zzbtfVar, zzbtf zzbtfVar2, Method method, Method method2, zzbtf zzbtfVar3, zzbtf zzbtfVar4, Provider provider, int i5) {
        super(provider);
        this.zzb = zzbtfVar;
        this.zzc = zzbtfVar2;
        this.zzd = method;
        this.zze = method2;
        this.zzf = zzbtfVar3;
        this.zzg = zzbtfVar4;
        this.zzh = i5;
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final String zza(SSLSocket sSLSocket) {
        byte[] bArr;
        if (this.zzf.zzc(sSLSocket) && (bArr = (byte[]) this.zzf.zzb(sSLSocket, new Object[0])) != null) {
            return new String(bArr, zzbto.zzb);
        }
        return null;
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final void zzb(SSLSocket sSLSocket, String str, List list) throws NoSuchMethodException, SecurityException {
        if (str != null) {
            this.zzb.zza(sSLSocket, Boolean.TRUE);
            this.zzc.zza(sSLSocket, str);
        }
        if (this.zzg.zzc(sSLSocket)) {
            this.zzg.zzb(sSLSocket, zzbtl.zzg(list));
        }
    }

    @Override // com.google.android.libraries.places.internal.zzbtl
    public final int zzc() {
        return this.zzh;
    }
}
