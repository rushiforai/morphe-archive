package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzaso extends zzasq {
    private final InputStream zzf;
    private final byte[] zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private int zzk;
    private int zzl;
    private int zzm;

    public /* synthetic */ zzaso(InputStream inputStream, int i5, zzasn zzasnVar) {
        super(null);
        this.zzm = LayoutNode.NotPlacedPlaceOrder;
        byte[] bArr = zzaud.zzd;
        this.zzf = inputStream;
        this.zzg = new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
        this.zzh = 0;
        this.zzj = 0;
        this.zzl = 0;
    }

    private final List zzL(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        while (i5 > 0) {
            int iMin = Math.min(i5, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
            byte[] bArr = new byte[iMin];
            int i11 = 0;
            while (i11 < iMin) {
                int i12 = this.zzf.read(bArr, i11, iMin - i11);
                if (i12 == -1) {
                    throw zzauf.zzj();
                }
                this.zzl += i12;
                i11 += i12;
            }
            i5 -= iMin;
            arrayList.add(bArr);
        }
        return arrayList;
    }

    private final void zzM() {
        int i5 = this.zzh + this.zzi;
        this.zzh = i5;
        int i11 = this.zzl + i5;
        int i12 = this.zzm;
        if (i11 <= i12) {
            this.zzi = 0;
            return;
        }
        int i13 = i11 - i12;
        this.zzi = i13;
        this.zzh = i5 - i13;
    }

    private final void zzN(int i5) throws IOException {
        if (zzO(i5)) {
            return;
        }
        if (i5 <= (this.zzc - this.zzl) - this.zzj) {
            throw zzauf.zzj();
        }
        throw zzauf.zzi();
    }

    private final boolean zzO(int i5) throws IOException {
        int i11 = this.zzj;
        int i12 = i11 + i5;
        int i13 = this.zzh;
        if (i12 <= i13) {
            throw new IllegalStateException(c0.i(i5, "refillBuffer() called when ", " bytes were already available in buffer"));
        }
        int i14 = this.zzc;
        int i15 = this.zzl;
        if (i5 > (i14 - i15) - i11 || i15 + i11 + i5 > this.zzm) {
            return false;
        }
        if (i11 > 0) {
            if (i13 > i11) {
                byte[] bArr = this.zzg;
                System.arraycopy(bArr, i11, bArr, 0, i13 - i11);
            }
            i15 = this.zzl + i11;
            this.zzl = i15;
            i13 = this.zzh - i11;
            this.zzh = i13;
            this.zzj = 0;
        }
        try {
            int i16 = this.zzf.read(this.zzg, i13, Math.min(4096 - i13, (this.zzc - i15) - i13));
            if (i16 == 0 || i16 < -1 || i16 > 4096) {
                throw new IllegalStateException(String.valueOf(this.zzf.getClass()) + "#read(byte[]) returned invalid result: " + i16 + "\nThe InputStream implementation is buggy.");
            }
            if (i16 <= 0) {
                return false;
            }
            this.zzh += i16;
            zzM();
            if (this.zzh >= i5) {
                return true;
            }
            return zzO(i5);
        } catch (zzauf e3) {
            e3.zzk();
            throw e3;
        }
    }

    private final byte[] zzP(int i5, boolean z11) throws IOException {
        byte[] bArrZzQ = zzQ(i5);
        if (bArrZzQ != null) {
            return bArrZzQ;
        }
        int i11 = this.zzj;
        int i12 = this.zzh;
        int i13 = i12 - i11;
        this.zzl += i12;
        this.zzj = 0;
        this.zzh = 0;
        List<byte[]> listZzL = zzL(i5 - i13);
        byte[] bArr = new byte[i5];
        System.arraycopy(this.zzg, i11, bArr, 0, i13);
        for (byte[] bArr2 : listZzL) {
            int length = bArr2.length;
            System.arraycopy(bArr2, 0, bArr, i13, length);
            i13 += length;
        }
        return bArr;
    }

    private final byte[] zzQ(int i5) throws IOException {
        if (i5 == 0) {
            return zzaud.zzd;
        }
        int i11 = this.zzl;
        int i12 = this.zzj;
        int i13 = i11 + i12 + i5;
        if (i13 - this.zzc > 0) {
            throw zzauf.zzi();
        }
        int i14 = this.zzm;
        if (i13 > i14) {
            zzB((i14 - i11) - i12);
            throw zzauf.zzj();
        }
        int i15 = this.zzh - i12;
        int i16 = i5 - i15;
        if (i16 >= 4096) {
            try {
                if (i16 > this.zzf.available()) {
                    return null;
                }
            } catch (zzauf e3) {
                e3.zzk();
                throw e3;
            }
        }
        byte[] bArr = new byte[i5];
        System.arraycopy(this.zzg, this.zzj, bArr, 0, i15);
        this.zzl += this.zzh;
        this.zzj = 0;
        this.zzh = 0;
        while (i15 < i5) {
            try {
                int i17 = this.zzf.read(bArr, i15, i5 - i15);
                if (i17 == -1) {
                    throw zzauf.zzj();
                }
                this.zzl += i17;
                i15 += i17;
            } catch (zzauf e11) {
                e11.zzk();
                throw e11;
            }
        }
        return bArr;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final void zzA(int i5) {
        this.zzm = i5;
        zzM();
    }

    public final void zzB(int i5) throws IOException {
        int i11 = this.zzh;
        int i12 = this.zzj;
        int i13 = i11 - i12;
        if (i5 <= i13 && i5 >= 0) {
            this.zzj = i12 + i5;
            return;
        }
        if (i5 < 0) {
            throw zzauf.zzf();
        }
        int i14 = this.zzl;
        int i15 = i14 + i12;
        int i16 = this.zzm;
        if (i15 + i5 > i16) {
            zzB((i16 - i14) - i12);
            throw zzauf.zzj();
        }
        this.zzl = i15;
        this.zzh = 0;
        this.zzj = 0;
        while (i13 < i5) {
            try {
                long j11 = i5 - i13;
                try {
                    long jSkip = this.zzf.skip(j11);
                    if (jSkip < 0 || jSkip > j11) {
                        throw new IllegalStateException(String.valueOf(this.zzf.getClass()) + "#skip returned invalid result: " + jSkip + "\nThe InputStream implementation is buggy.");
                    }
                    if (jSkip == 0) {
                        break;
                    } else {
                        i13 += (int) jSkip;
                    }
                } catch (zzauf e3) {
                    e3.zzk();
                    throw e3;
                }
            } catch (Throwable th2) {
                this.zzl += i13;
                zzM();
                throw th2;
            }
        }
        this.zzl += i13;
        zzM();
        if (i13 >= i5) {
            return;
        }
        int i17 = this.zzh;
        int i18 = i17 - this.zzj;
        this.zzj = i17;
        zzN(1);
        while (true) {
            int i19 = i5 - i18;
            int i21 = this.zzh;
            if (i19 <= i21) {
                this.zzj = i19;
                return;
            } else {
                i18 += i21;
                this.zzj = i21;
                zzN(1);
            }
        }
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final boolean zzC() throws IOException {
        return this.zzj == this.zzh && !zzO(1);
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final boolean zzD() throws IOException {
        return zzr() != 0;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final boolean zzE(int i5) throws IOException {
        int iZzm;
        int i11 = i5 & 7;
        int i12 = 0;
        if (i11 == 0) {
            if (this.zzh - this.zzj < 10) {
                while (i12 < 10) {
                    if (zza() < 0) {
                        i12++;
                    }
                }
                throw zzauf.zze();
            }
            while (i12 < 10) {
                byte[] bArr = this.zzg;
                int i13 = this.zzj;
                this.zzj = i13 + 1;
                if (bArr[i13] < 0) {
                    i12++;
                }
            }
            throw zzauf.zze();
            return true;
        }
        if (i11 == 1) {
            zzB(8);
            return true;
        }
        if (i11 == 2) {
            zzB(zzj());
            return true;
        }
        if (i11 != 3) {
            if (i11 == 4) {
                return false;
            }
            if (i11 != 5) {
                throw zzauf.zza();
            }
            zzB(4);
            return true;
        }
        do {
            iZzm = zzm();
            if (iZzm == 0) {
                break;
            }
        } while (zzE(iZzm));
        zzz(((i5 >>> 3) << 3) | 4);
        return true;
    }

    public final byte zza() throws IOException {
        if (this.zzj == this.zzh) {
            zzN(1);
        }
        byte[] bArr = this.zzg;
        int i5 = this.zzj;
        this.zzj = i5 + 1;
        return bArr[i5];
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final double zzb() throws IOException {
        return Double.longBitsToDouble(zzq());
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final float zzc() throws IOException {
        return Float.intBitsToFloat(zzi());
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzd() {
        return this.zzl + this.zzj;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zze(int i5) throws zzauf {
        if (i5 < 0) {
            throw zzauf.zzf();
        }
        int i11 = this.zzl + this.zzj;
        int i12 = this.zzm;
        int i13 = i5 + i11;
        if (i13 > i12) {
            throw zzauf.zzj();
        }
        this.zzm = i13;
        zzM();
        return i12;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzf() throws IOException {
        return zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzg() throws IOException {
        return zzi();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzh() throws IOException {
        return zzj();
    }

    public final int zzi() throws IOException {
        int i5 = this.zzj;
        if (this.zzh - i5 < 4) {
            zzN(4);
            i5 = this.zzj;
        }
        byte[] bArr = this.zzg;
        this.zzj = i5 + 4;
        int i11 = bArr[i5] & 255;
        int i12 = bArr[i5 + 1] & 255;
        int i13 = bArr[i5 + 2] & 255;
        return ((bArr[i5 + 3] & 255) << 24) | (i12 << 8) | i11 | (i13 << 16);
    }

    public final int zzj() throws IOException {
        int i5;
        int i11 = this.zzj;
        int i12 = this.zzh;
        if (i12 != i11) {
            byte[] bArr = this.zzg;
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.zzj = i13;
                return b11;
            }
            if (i12 - i13 >= 9) {
                int i14 = i11 + 2;
                int i15 = (bArr[i13] << 7) ^ b11;
                if (i15 < 0) {
                    i5 = i15 ^ (-128);
                } else {
                    int i16 = i11 + 3;
                    int i17 = (bArr[i14] << 14) ^ i15;
                    if (i17 >= 0) {
                        i5 = i17 ^ 16256;
                    } else {
                        int i18 = i11 + 4;
                        int i19 = i17 ^ (bArr[i16] << 21);
                        if (i19 < 0) {
                            i5 = (-2080896) ^ i19;
                        } else {
                            i16 = i11 + 5;
                            byte b12 = bArr[i18];
                            int i21 = (i19 ^ (b12 << 28)) ^ 266354560;
                            if (b12 < 0) {
                                i18 = i11 + 6;
                                if (bArr[i16] < 0) {
                                    i16 = i11 + 7;
                                    if (bArr[i18] < 0) {
                                        i18 = i11 + 8;
                                        if (bArr[i16] < 0) {
                                            i16 = i11 + 9;
                                            if (bArr[i18] < 0) {
                                                int i22 = i11 + 10;
                                                if (bArr[i16] >= 0) {
                                                    i14 = i22;
                                                    i5 = i21;
                                                }
                                            }
                                        }
                                    }
                                }
                                i5 = i21;
                            }
                            i5 = i21;
                        }
                        i14 = i18;
                    }
                    i14 = i16;
                }
                this.zzj = i14;
                return i5;
            }
        }
        return (int) zzs();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzk() throws IOException {
        return zzi();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzl() throws IOException {
        return zzasq.zzF(zzj());
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzm() throws IOException {
        if (zzC()) {
            this.zzk = 0;
            return 0;
        }
        int iZzj = zzj();
        this.zzk = iZzj;
        if ((iZzj >>> 3) != 0) {
            return iZzj;
        }
        throw zzauf.zzc();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zzn() throws IOException {
        return zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final long zzo() throws IOException {
        return zzq();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final long zzp() throws IOException {
        return zzr();
    }

    public final long zzq() throws IOException {
        int i5 = this.zzj;
        if (this.zzh - i5 < 8) {
            zzN(8);
            i5 = this.zzj;
        }
        byte[] bArr = this.zzg;
        this.zzj = i5 + 8;
        long j11 = bArr[i5];
        long j12 = bArr[i5 + 2];
        long j13 = bArr[i5 + 3];
        return ((bArr[i5 + 6] & 255) << 48) | (j11 & 255) | ((bArr[i5 + 1] & 255) << 8) | ((j12 & 255) << 16) | ((j13 & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 7] & 255) << 56);
    }

    public final long zzr() throws IOException {
        long j11;
        long j12;
        int i5 = this.zzj;
        int i11 = this.zzh;
        if (i11 != i5) {
            byte[] bArr = this.zzg;
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.zzj = i12;
                return b11;
            }
            if (i11 - i12 >= 9) {
                int i13 = i5 + 2;
                int i14 = (bArr[i12] << 7) ^ b11;
                if (i14 < 0) {
                    j11 = i14 ^ (-128);
                } else {
                    int i15 = i5 + 3;
                    int i16 = (bArr[i13] << 14) ^ i14;
                    if (i16 >= 0) {
                        j11 = i16 ^ 16256;
                    } else {
                        int i17 = i5 + 4;
                        int i18 = i16 ^ (bArr[i15] << 21);
                        if (i18 < 0) {
                            long j13 = (-2080896) ^ i18;
                            i13 = i17;
                            j11 = j13;
                        } else {
                            i15 = i5 + 5;
                            long j14 = (bArr[i17] << 28) ^ i18;
                            if (j14 >= 0) {
                                j11 = j14 ^ 266354560;
                            } else {
                                i13 = i5 + 6;
                                long j15 = (bArr[i15] << 35) ^ j14;
                                if (j15 < 0) {
                                    j12 = -34093383808L;
                                } else {
                                    int i19 = i5 + 7;
                                    long j16 = j15 ^ (bArr[i13] << 42);
                                    if (j16 >= 0) {
                                        j11 = j16 ^ 4363953127296L;
                                    } else {
                                        i13 = i5 + 8;
                                        j15 = j16 ^ (bArr[i19] << 49);
                                        if (j15 < 0) {
                                            j12 = -558586000294016L;
                                        } else {
                                            i19 = i5 + 9;
                                            long j17 = (j15 ^ (bArr[i13] << 56)) ^ 71499008037633920L;
                                            if (j17 < 0) {
                                                i13 = i5 + 10;
                                                if (bArr[i19] >= 0) {
                                                    j11 = j17;
                                                }
                                            } else {
                                                j11 = j17;
                                            }
                                        }
                                    }
                                    i13 = i19;
                                }
                                j11 = j15 ^ j12;
                            }
                        }
                    }
                    i13 = i15;
                }
                this.zzj = i13;
                return j11;
            }
        }
        return zzs();
    }

    public final long zzs() throws IOException {
        long j11 = 0;
        for (int i5 = 0; i5 < 64; i5 += 7) {
            j11 |= (r3 & AbstractJsonLexerKt.TC_INVALID) << i5;
            if ((zza() & 128) == 0) {
                return j11;
            }
        }
        throw zzauf.zze();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final long zzt() throws IOException {
        return zzq();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final long zzu() throws IOException {
        return zzasq.zzH(zzr());
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final long zzv() throws IOException {
        return zzr();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final zzask zzw() throws IOException {
        int iZzj = zzj();
        int i5 = this.zzh;
        int i11 = this.zzj;
        if (iZzj <= i5 - i11 && iZzj > 0) {
            zzask zzaskVarZzl = zzask.zzl(this.zzg, i11, iZzj);
            this.zzj += iZzj;
            return zzaskVarZzl;
        }
        if (iZzj == 0) {
            return zzask.zzb;
        }
        if (iZzj < 0) {
            throw zzauf.zzf();
        }
        byte[] bArrZzQ = zzQ(iZzj);
        if (bArrZzQ != null) {
            return zzask.zzl(bArrZzQ, 0, bArrZzQ.length);
        }
        int i12 = this.zzj;
        int i13 = this.zzh;
        int i14 = i13 - i12;
        this.zzl += i13;
        this.zzj = 0;
        this.zzh = 0;
        List<byte[]> listZzL = zzL(iZzj - i14);
        byte[] bArr = new byte[iZzj];
        System.arraycopy(this.zzg, i12, bArr, 0, i14);
        for (byte[] bArr2 : listZzL) {
            int length = bArr2.length;
            System.arraycopy(bArr2, 0, bArr, i14, length);
            i14 += length;
        }
        return new zzash(bArr);
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final String zzx() throws IOException {
        int iZzj = zzj();
        if (iZzj > 0) {
            int i5 = this.zzh;
            int i11 = this.zzj;
            if (iZzj <= i5 - i11) {
                String str = new String(this.zzg, i11, iZzj, zzaud.zzb);
                this.zzj += iZzj;
                return str;
            }
        }
        if (iZzj == 0) {
            return b.f42142b;
        }
        if (iZzj < 0) {
            throw zzauf.zzf();
        }
        if (iZzj > this.zzh) {
            return new String(zzP(iZzj, false), zzaud.zzb);
        }
        zzN(iZzj);
        String str2 = new String(this.zzg, this.zzj, iZzj, zzaud.zzb);
        this.zzj += iZzj;
        return str2;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final String zzy() throws IOException {
        byte[] bArrZzP;
        int iZzj = zzj();
        int i5 = this.zzj;
        int i11 = this.zzh;
        if (iZzj <= i11 - i5 && iZzj > 0) {
            bArrZzP = this.zzg;
            this.zzj = i5 + iZzj;
        } else {
            if (iZzj == 0) {
                return b.f42142b;
            }
            if (iZzj < 0) {
                throw zzauf.zzf();
            }
            i5 = 0;
            if (iZzj <= i11) {
                zzN(iZzj);
                bArrZzP = this.zzg;
                this.zzj = iZzj;
            } else {
                bArrZzP = zzP(iZzj, false);
            }
        }
        return zzaxc.zzd(bArrZzP, i5, iZzj);
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final void zzz(int i5) throws zzauf {
        if (this.zzk != i5) {
            throw zzauf.zzb();
        }
    }
}
