package com.google.android.libraries.places.internal;

import androidx.compose.ui.node.LayoutNode;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
final class zzasm extends zzasq {
    private final byte[] zzf;
    private int zzg;
    private int zzh;
    private int zzi;
    private int zzj;
    private int zzk;

    public /* synthetic */ zzasm(byte[] bArr, int i5, int i11, boolean z11, zzasl zzaslVar) {
        super(null);
        this.zzk = LayoutNode.NotPlacedPlaceOrder;
        this.zzf = bArr;
        this.zzg = i11;
        this.zzi = 0;
    }

    private final void zzL() {
        int i5 = this.zzg + this.zzh;
        this.zzg = i5;
        int i11 = this.zzk;
        if (i5 <= i11) {
            this.zzh = 0;
            return;
        }
        int i12 = i5 - i11;
        this.zzh = i12;
        this.zzg = i5 - i12;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final void zzA(int i5) {
        this.zzk = i5;
        zzL();
    }

    public final void zzB(int i5) throws IOException {
        if (i5 >= 0) {
            int i11 = this.zzg;
            int i12 = this.zzi;
            if (i5 <= i11 - i12) {
                this.zzi = i12 + i5;
                return;
            }
        }
        if (i5 >= 0) {
            throw zzauf.zzj();
        }
        throw zzauf.zzf();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final boolean zzC() throws IOException {
        return this.zzi == this.zzg;
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
            if (this.zzg - this.zzi < 10) {
                while (i12 < 10) {
                    if (zza() < 0) {
                        i12++;
                    }
                }
                throw zzauf.zze();
            }
            while (i12 < 10) {
                byte[] bArr = this.zzf;
                int i13 = this.zzi;
                this.zzi = i13 + 1;
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
        int i5 = this.zzi;
        if (i5 == this.zzg) {
            throw zzauf.zzj();
        }
        byte[] bArr = this.zzf;
        this.zzi = i5 + 1;
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
        return this.zzi;
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final int zze(int i5) throws zzauf {
        if (i5 < 0) {
            throw zzauf.zzf();
        }
        int i11 = i5 + this.zzi;
        if (i11 < 0) {
            throw zzauf.zzg();
        }
        int i12 = this.zzk;
        if (i11 > i12) {
            throw zzauf.zzj();
        }
        this.zzk = i11;
        zzL();
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
        int i5 = this.zzi;
        if (this.zzg - i5 < 4) {
            throw zzauf.zzj();
        }
        byte[] bArr = this.zzf;
        this.zzi = i5 + 4;
        int i11 = bArr[i5] & 255;
        int i12 = bArr[i5 + 1] & 255;
        int i13 = bArr[i5 + 2] & 255;
        return ((bArr[i5 + 3] & 255) << 24) | (i12 << 8) | i11 | (i13 << 16);
    }

    public final int zzj() throws IOException {
        int i5;
        int i11 = this.zzi;
        int i12 = this.zzg;
        if (i12 != i11) {
            byte[] bArr = this.zzf;
            int i13 = i11 + 1;
            byte b11 = bArr[i11];
            if (b11 >= 0) {
                this.zzi = i13;
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
                this.zzi = i14;
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
            this.zzj = 0;
            return 0;
        }
        int iZzj = zzj();
        this.zzj = iZzj;
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
        int i5 = this.zzi;
        if (this.zzg - i5 < 8) {
            throw zzauf.zzj();
        }
        byte[] bArr = this.zzf;
        this.zzi = i5 + 8;
        long j11 = bArr[i5];
        long j12 = bArr[i5 + 2];
        long j13 = bArr[i5 + 3];
        return ((bArr[i5 + 6] & 255) << 48) | (j11 & 255) | ((bArr[i5 + 1] & 255) << 8) | ((j12 & 255) << 16) | ((j13 & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 7] & 255) << 56);
    }

    public final long zzr() throws IOException {
        long j11;
        long j12;
        int i5 = this.zzi;
        int i11 = this.zzg;
        if (i11 != i5) {
            byte[] bArr = this.zzf;
            int i12 = i5 + 1;
            byte b11 = bArr[i5];
            if (b11 >= 0) {
                this.zzi = i12;
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
                this.zzi = i13;
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
        if (iZzj > 0) {
            int i5 = this.zzg;
            int i11 = this.zzi;
            if (iZzj <= i5 - i11) {
                zzask zzaskVarZzl = zzask.zzl(this.zzf, i11, iZzj);
                this.zzi += iZzj;
                return zzaskVarZzl;
            }
        }
        if (iZzj == 0) {
            return zzask.zzb;
        }
        if (iZzj > 0) {
            int i12 = this.zzg;
            int i13 = this.zzi;
            if (iZzj <= i12 - i13) {
                int i14 = iZzj + i13;
                this.zzi = i14;
                return new zzash(Arrays.copyOfRange(this.zzf, i13, i14));
            }
        }
        if (iZzj <= 0) {
            throw zzauf.zzf();
        }
        throw zzauf.zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final String zzx() throws IOException {
        int iZzj = zzj();
        if (iZzj > 0) {
            int i5 = this.zzg;
            int i11 = this.zzi;
            if (iZzj <= i5 - i11) {
                String str = new String(this.zzf, i11, iZzj, zzaud.zzb);
                this.zzi += iZzj;
                return str;
            }
        }
        if (iZzj == 0) {
            return b.f42142b;
        }
        if (iZzj < 0) {
            throw zzauf.zzf();
        }
        throw zzauf.zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final String zzy() throws IOException {
        int iZzj = zzj();
        if (iZzj > 0) {
            int i5 = this.zzg;
            int i11 = this.zzi;
            if (iZzj <= i5 - i11) {
                String strZzd = zzaxc.zzd(this.zzf, i11, iZzj);
                this.zzi += iZzj;
                return strZzd;
            }
        }
        if (iZzj == 0) {
            return b.f42142b;
        }
        if (iZzj <= 0) {
            throw zzauf.zzf();
        }
        throw zzauf.zzj();
    }

    @Override // com.google.android.libraries.places.internal.zzasq
    public final void zzz(int i5) throws zzauf {
        if (this.zzj != i5) {
            throw zzauf.zzb();
        }
    }
}
