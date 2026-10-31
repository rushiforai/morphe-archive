package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzbjf implements zzbaq {
    @Override // com.google.android.libraries.places.internal.zzbce
    public final /* bridge */ /* synthetic */ Object zza(byte[] bArr) {
        if (bArr.length < 3) {
            throw new NumberFormatException("Malformed status code ".concat(new String(bArr, zzbar.zza)));
        }
        return Integer.valueOf(((bArr[1] - 48) * 10) + ((bArr[0] - 48) * 100) + (bArr[2] - 48));
    }

    @Override // com.google.android.libraries.places.internal.zzbce
    public final /* synthetic */ byte[] zzb(Object obj) {
        throw new UnsupportedOperationException();
    }
}
