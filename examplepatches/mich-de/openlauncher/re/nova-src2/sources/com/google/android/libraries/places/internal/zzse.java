package com.google.android.libraries.places.internal;

import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.io.IOException;

/* loaded from: classes3.dex */
final class zzse extends zzsh {
    final char[] zza;

    private zzse(zzsd zzsdVar) {
        super(zzsdVar, null);
        this.zza = new char[EventBridgeChannel.QUEUE_CAPACITY];
        zzmt.zze(zzsdVar.zzf.length == 16);
        for (int i5 = 0; i5 < 256; i5++) {
            this.zza[i5] = zzsdVar.zza(i5 >>> 4);
            this.zza[i5 | 256] = zzsdVar.zza(i5 & 15);
        }
    }

    @Override // com.google.android.libraries.places.internal.zzsh, com.google.android.libraries.places.internal.zzsi
    public final int zza(byte[] bArr, CharSequence charSequence) throws zzsg {
        if (charSequence.length() % 2 == 1) {
            throw new zzsg(c0.h(charSequence.length(), "Invalid input length "));
        }
        int i5 = 0;
        int i11 = 0;
        while (i5 < charSequence.length()) {
            bArr[i11] = (byte) ((this.zzb.zzb(charSequence.charAt(i5)) << 4) | this.zzb.zzb(charSequence.charAt(i5 + 1)));
            i5 += 2;
            i11++;
        }
        return i11;
    }

    @Override // com.google.android.libraries.places.internal.zzsh
    public final zzsi zzb(zzsd zzsdVar, Character ch) {
        return new zzse(zzsdVar);
    }

    @Override // com.google.android.libraries.places.internal.zzsh, com.google.android.libraries.places.internal.zzsi
    public final void zzc(Appendable appendable, byte[] bArr, int i5, int i11) throws IOException {
        zzmt.zzn(0, i11, bArr.length);
        for (int i12 = 0; i12 < i11; i12++) {
            int i13 = bArr[i12] & 255;
            appendable.append(this.zza[i13]);
            appendable.append(this.zza[i13 | 256]);
        }
    }

    public zzse(String str, String str2) {
        this(new zzsd("base16()", "0123456789ABCDEF".toCharArray()));
    }
}
