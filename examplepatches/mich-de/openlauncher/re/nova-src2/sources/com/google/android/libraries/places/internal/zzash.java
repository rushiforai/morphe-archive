package com.google.android.libraries.places.internal;

import b.c0;
import java.io.IOException;
import java.nio.charset.Charset;

/* loaded from: classes3.dex */
class zzash extends zzasg {
    protected final byte[] zza;

    public zzash(byte[] bArr) {
        super(null);
        bArr.getClass();
        this.zza = bArr;
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzask) || zzd() != ((zzask) obj).zzd()) {
            return false;
        }
        if (zzd() == 0) {
            return true;
        }
        if (!(obj instanceof zzash)) {
            return obj.equals(this);
        }
        zzash zzashVar = (zzash) obj;
        int iZzk = zzk();
        int iZzk2 = zzashVar.zzk();
        if (iZzk != 0 && iZzk2 != 0 && iZzk != iZzk2) {
            return false;
        }
        int iZzd = zzd();
        if (iZzd > zzashVar.zzd()) {
            throw new IllegalArgumentException("Length too large: " + iZzd + zzd());
        }
        if (iZzd > zzashVar.zzd()) {
            throw new IllegalArgumentException(c0.g(iZzd, zzashVar.zzd(), "Ran off end of other: 0, ", ", "));
        }
        byte[] bArr = this.zza;
        byte[] bArr2 = zzashVar.zza;
        zzashVar.zzc();
        int i5 = 0;
        int i11 = 0;
        while (i5 < iZzd) {
            if (bArr[i5] != bArr2[i11]) {
                return false;
            }
            i5++;
            i11++;
        }
        return true;
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public byte zza(int i5) {
        return this.zza[i5];
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public byte zzb(int i5) {
        return this.zza[i5];
    }

    public int zzc() {
        return 0;
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public int zzd() {
        return this.zza.length;
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final int zze(int i5, int i11, int i12) {
        return zzaud.zzb(i5, this.zza, 0, i12);
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final zzask zzf(int i5, int i11) {
        int iZzj = zzask.zzj(0, i11, zzd());
        return iZzj == 0 ? zzask.zzb : new zzasd(this.zza, 0, iZzj);
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final String zzg(Charset charset) {
        return new String(this.zza, 0, zzd(), charset);
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final void zzh(zzarz zzarzVar) throws IOException {
        zzarzVar.zza(this.zza, 0, zzd());
    }

    @Override // com.google.android.libraries.places.internal.zzask
    public final boolean zzi() {
        return zzaxc.zzf(this.zza, 0, zzd());
    }
}
