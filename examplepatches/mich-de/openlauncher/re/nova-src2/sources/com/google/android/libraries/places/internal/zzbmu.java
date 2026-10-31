package com.google.android.libraries.places.internal;

import java.io.OutputStream;

/* loaded from: classes3.dex */
final class zzbmu extends OutputStream {
    final /* synthetic */ zzbmw zza;

    public /* synthetic */ zzbmu(zzbmw zzbmwVar, zzbmt zzbmtVar) {
        this.zza = zzbmwVar;
    }

    @Override // java.io.OutputStream
    public final void write(int i5) {
        this.zza.zzk(new byte[]{(byte) i5}, 0, 1);
    }

    @Override // java.io.OutputStream
    public final void write(byte[] bArr, int i5, int i11) {
        this.zza.zzk(bArr, i5, i11);
    }
}
