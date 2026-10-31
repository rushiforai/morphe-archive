package com.google.android.libraries.places.internal;

import com.google.android.gms.internal.measurement.k2;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class zzawo {
    private static final zzawo zza = new zzawo(0, new int[0], new Object[0], false);
    private int zzb;
    private int[] zzc;
    private Object[] zzd;
    private int zze;
    private boolean zzf;

    private zzawo(int i5, int[] iArr, Object[] objArr, boolean z11) {
        this.zze = -1;
        this.zzb = i5;
        this.zzc = iArr;
        this.zzd = objArr;
        this.zzf = z11;
    }

    public static zzawo zzc() {
        return zza;
    }

    public static zzawo zze(zzawo zzawoVar, zzawo zzawoVar2) {
        int i5 = zzawoVar.zzb + zzawoVar2.zzb;
        int[] iArrCopyOf = Arrays.copyOf(zzawoVar.zzc, i5);
        System.arraycopy(zzawoVar2.zzc, 0, iArrCopyOf, zzawoVar.zzb, zzawoVar2.zzb);
        Object[] objArrCopyOf = Arrays.copyOf(zzawoVar.zzd, i5);
        System.arraycopy(zzawoVar2.zzd, 0, objArrCopyOf, zzawoVar.zzb, zzawoVar2.zzb);
        return new zzawo(i5, iArrCopyOf, objArrCopyOf, true);
    }

    public static zzawo zzf() {
        return new zzawo(0, new int[8], new Object[8], true);
    }

    private final void zzm(int i5) {
        int[] iArr = this.zzc;
        if (i5 > iArr.length) {
            int i11 = this.zzb;
            int i12 = (i11 / 2) + i11;
            if (i12 >= i5) {
                i5 = i12;
            }
            if (i5 < 8) {
                i5 = 8;
            }
            this.zzc = Arrays.copyOf(iArr, i5);
            this.zzd = Arrays.copyOf(this.zzd, i5);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof zzawo)) {
            return false;
        }
        zzawo zzawoVar = (zzawo) obj;
        int i5 = this.zzb;
        if (i5 == zzawoVar.zzb) {
            int[] iArr = this.zzc;
            int[] iArr2 = zzawoVar.zzc;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    Object[] objArr = this.zzd;
                    Object[] objArr2 = zzawoVar.zzd;
                    int i12 = this.zzb;
                    for (int i13 = 0; i13 < i12; i13++) {
                        if (objArr[i13].equals(objArr2[i13])) {
                        }
                    }
                    return true;
                }
                if (iArr[i11] != iArr2[i11]) {
                    break;
                }
                i11++;
            }
        }
        return false;
    }

    public final int hashCode() {
        int i5 = this.zzb;
        int i11 = i5 + 527;
        int[] iArr = this.zzc;
        int iHashCode = 17;
        int i12 = 17;
        for (int i13 = 0; i13 < i5; i13++) {
            i12 = (i12 * 31) + iArr[i13];
        }
        int i14 = ((i11 * 31) + i12) * 31;
        Object[] objArr = this.zzd;
        int i15 = this.zzb;
        for (int i16 = 0; i16 < i15; i16++) {
            iHashCode = (iHashCode * 31) + objArr[i16].hashCode();
        }
        return i14 + iHashCode;
    }

    public final int zza() {
        int iZzB;
        int iZzC;
        int iZzB2;
        int i5 = this.zze;
        if (i5 != -1) {
            return i5;
        }
        int iZzB3 = 0;
        for (int i11 = 0; i11 < this.zzb; i11++) {
            int i12 = this.zzc[i11];
            int i13 = i12 >>> 3;
            int i14 = i12 & 7;
            if (i14 != 0) {
                if (i14 == 1) {
                    ((Long) this.zzd[i11]).getClass();
                    iZzB2 = zzasx.zzB(i13 << 3) + 8;
                } else if (i14 == 2) {
                    int i15 = i13 << 3;
                    zzask zzaskVar = (zzask) this.zzd[i11];
                    int iZzB4 = zzasx.zzB(i15);
                    int iZzd = zzaskVar.zzd();
                    iZzB3 = zzasx.zzB(iZzd) + iZzd + iZzB4 + iZzB3;
                } else if (i14 == 3) {
                    int iZzB5 = zzasx.zzB(i13 << 3);
                    iZzB = iZzB5 + iZzB5;
                    iZzC = ((zzawo) this.zzd[i11]).zza();
                } else {
                    if (i14 != 5) {
                        throw new IllegalStateException(zzauf.zza());
                    }
                    ((Integer) this.zzd[i11]).getClass();
                    iZzB2 = zzasx.zzB(i13 << 3) + 4;
                }
                iZzB3 = iZzB2 + iZzB3;
            } else {
                int i16 = i13 << 3;
                long jLongValue = ((Long) this.zzd[i11]).longValue();
                iZzB = zzasx.zzB(i16);
                iZzC = zzasx.zzC(jLongValue);
            }
            iZzB3 = iZzC + iZzB + iZzB3;
        }
        this.zze = iZzB3;
        return iZzB3;
    }

    public final int zzb() {
        int i5 = this.zze;
        if (i5 != -1) {
            return i5;
        }
        int iC = 0;
        for (int i11 = 0; i11 < this.zzb; i11++) {
            int i12 = this.zzc[i11] >>> 3;
            zzask zzaskVar = (zzask) this.zzd[i11];
            int iZzB = zzasx.zzB(8);
            int iZzB2 = zzasx.zzB(i12) + zzasx.zzB(16);
            int iZzB3 = zzasx.zzB(24);
            int iZzd = zzaskVar.zzd();
            iC += iZzB + iZzB + iZzB2 + k2.C(iZzd, iZzd, iZzB3);
        }
        this.zze = iC;
        return iC;
    }

    public final zzawo zzd(zzawo zzawoVar) {
        if (zzawoVar.equals(zza)) {
            return this;
        }
        zzg();
        int i5 = this.zzb + zzawoVar.zzb;
        zzm(i5);
        System.arraycopy(zzawoVar.zzc, 0, this.zzc, this.zzb, zzawoVar.zzb);
        System.arraycopy(zzawoVar.zzd, 0, this.zzd, this.zzb, zzawoVar.zzb);
        this.zzb = i5;
        return this;
    }

    public final void zzg() {
        if (!this.zzf) {
            throw new UnsupportedOperationException();
        }
    }

    public final void zzh() {
        if (this.zzf) {
            this.zzf = false;
        }
    }

    public final void zzi(StringBuilder sb2, int i5) {
        for (int i11 = 0; i11 < this.zzb; i11++) {
            zzavh.zzb(sb2, i5, String.valueOf(this.zzc[i11] >>> 3), this.zzd[i11]);
        }
    }

    public final void zzj(int i5, Object obj) {
        zzg();
        zzm(this.zzb + 1);
        int[] iArr = this.zzc;
        int i11 = this.zzb;
        iArr[i11] = i5;
        this.zzd[i11] = obj;
        this.zzb = i11 + 1;
    }

    public final void zzk(zzasy zzasyVar) throws IOException {
        for (int i5 = 0; i5 < this.zzb; i5++) {
            zzasyVar.zzw(this.zzc[i5] >>> 3, this.zzd[i5]);
        }
    }

    public final void zzl(zzasy zzasyVar) throws IOException {
        if (this.zzb != 0) {
            for (int i5 = 0; i5 < this.zzb; i5++) {
                int i11 = this.zzc[i5];
                Object obj = this.zzd[i5];
                int i12 = i11 & 7;
                int i13 = i11 >>> 3;
                if (i12 == 0) {
                    zzasyVar.zzt(i13, ((Long) obj).longValue());
                } else if (i12 == 1) {
                    zzasyVar.zzm(i13, ((Long) obj).longValue());
                } else if (i12 == 2) {
                    zzasyVar.zzd(i13, (zzask) obj);
                } else if (i12 == 3) {
                    zzasyVar.zzF(i13);
                    ((zzawo) obj).zzl(zzasyVar);
                    zzasyVar.zzh(i13);
                } else {
                    if (i12 != 5) {
                        throw new RuntimeException(zzauf.zza());
                    }
                    zzasyVar.zzk(i13, ((Integer) obj).intValue());
                }
            }
        }
    }

    private zzawo() {
        this(0, new int[8], new Object[8], true);
    }
}
