package com.google.android.libraries.places.internal;

import androidx.recyclerview.widget.u1;
import java.io.IOException;
import java.util.Locale;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class zzbub implements zzbuf {
    private static final Logger zza = Logger.getLogger(zzbty.class.getName());
    private static final zzbwf zzb;

    static {
        zzbwe zzbweVar = zzbwf.zza;
        zzb = zzbwe.zza("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n");
    }

    public static /* bridge */ /* synthetic */ int zza(int i5, byte b11, short s11) throws IOException {
        if ((b11 & 8) != 0) {
            i5--;
        }
        if (s11 <= i5) {
            return i5 - s11;
        }
        throw zzi("PROTOCOL_ERROR padding %s > remaining length %s", Short.valueOf(s11), Integer.valueOf(i5));
    }

    public static /* bridge */ /* synthetic */ int zzb(zzbwd zzbwdVar) {
        return (zzbwdVar.zzc() & 255) | ((zzbwdVar.zzc() & 255) << 16) | ((zzbwdVar.zzc() & 255) << 8);
    }

    public static /* bridge */ /* synthetic */ IllegalArgumentException zzf(String str, Object[] objArr) {
        throw new IllegalArgumentException(String.format(Locale.US, str, objArr));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static IOException zzi(String str, Object... objArr) throws IOException {
        throw new IOException(String.format(Locale.US, str, objArr));
    }

    @Override // com.google.android.libraries.places.internal.zzbuf
    public final zzbtr zzc(zzbwd zzbwdVar, boolean z11) {
        return new zzbtz(zzbwdVar, u1.FLAG_APPEARED_IN_PRE_LAYOUT, true);
    }

    @Override // com.google.android.libraries.places.internal.zzbuf
    public final zzbts zzd(zzbwc zzbwcVar, boolean z11) {
        return new zzbua(zzbwcVar, true);
    }
}
