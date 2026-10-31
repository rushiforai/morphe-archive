package com.google.android.libraries.places.internal;

import androidx.recyclerview.widget.u1;
import b.c0;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* loaded from: classes3.dex */
final class zzbtu {
    int zzb;
    private final zzbwd zzf;
    private final List zze = new ArrayList();
    zzbtt[] zza = new zzbtt[8];
    int zzc = 0;
    int zzd = 0;
    private int zzg = u1.FLAG_APPEARED_IN_PRE_LAYOUT;
    private int zzh = u1.FLAG_APPEARED_IN_PRE_LAYOUT;

    public zzbtu(int i5, int i11, zzbws zzbwsVar) {
        this.zzb = r1.length - 1;
        this.zzf = zzbwh.zzb(zzbwsVar);
    }

    private final int zzf(int i5) {
        return this.zzb + 1 + i5;
    }

    private final int zzg(int i5) {
        int i11;
        int i12 = 0;
        if (i5 > 0) {
            int length = this.zza.length;
            while (true) {
                length--;
                i11 = this.zzb;
                if (length < i11 || i5 <= 0) {
                    break;
                }
                int i13 = this.zza[length].zzj;
                i5 -= i13;
                this.zzd -= i13;
                this.zzc--;
                i12++;
            }
            zzbtt[] zzbttVarArr = this.zza;
            int i14 = i11 + 1;
            System.arraycopy(zzbttVarArr, i14, zzbttVarArr, i14 + i12, this.zzc);
            this.zzb += i12;
        }
        return i12;
    }

    private final int zzh() throws IOException {
        return this.zzf.zzc() & 255;
    }

    private final zzbwf zzi(int i5) throws IOException {
        if (zzm(i5)) {
            return zzbtw.zzb[i5].zzh;
        }
        int length = zzbtw.zzb.length;
        int iZzf = zzf(i5 - 61);
        if (iZzf >= 0) {
            zzbtt[] zzbttVarArr = this.zza;
            if (iZzf < zzbttVarArr.length) {
                return zzbttVarArr[iZzf].zzh;
            }
        }
        throw new IOException(c0.h(i5 + 1, "Header index too large "));
    }

    private final void zzj() {
        int i5 = this.zzh;
        int i11 = this.zzd;
        if (i5 < i11) {
            if (i5 == 0) {
                zzk();
            } else {
                zzg(i11 - i5);
            }
        }
    }

    private final void zzk() {
        Arrays.fill(this.zza, (Object) null);
        this.zzb = this.zza.length - 1;
        this.zzc = 0;
        this.zzd = 0;
    }

    private final void zzl(int i5, zzbtt zzbttVar) {
        this.zze.add(zzbttVar);
        int i11 = zzbttVar.zzj;
        int i12 = this.zzh;
        if (i11 > i12) {
            zzk();
            return;
        }
        zzg((this.zzd + i11) - i12);
        int i13 = this.zzc + 1;
        zzbtt[] zzbttVarArr = this.zza;
        int length = zzbttVarArr.length;
        if (i13 > length) {
            zzbtt[] zzbttVarArr2 = new zzbtt[length + length];
            System.arraycopy(zzbttVarArr, 0, zzbttVarArr2, length, length);
            this.zzb = this.zza.length - 1;
            this.zza = zzbttVarArr2;
        }
        int i14 = this.zzb;
        this.zzb = i14 - 1;
        this.zza[i14] = zzbttVar;
        this.zzc++;
        this.zzd += i11;
    }

    private static final boolean zzm(int i5) {
        if (i5 < 0) {
            return false;
        }
        int length = zzbtw.zzb.length;
        return i5 <= 60;
    }

    public final int zza(int i5, int i11) throws IOException {
        int i12 = i5 & i11;
        if (i12 < i11) {
            return i12;
        }
        int i13 = 0;
        while (true) {
            int iZzh = zzh();
            if ((iZzh & 128) == 0) {
                return i11 + (iZzh << i13);
            }
            i11 += (iZzh & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i13;
            i13 += 7;
        }
    }

    public final List zzb() {
        ArrayList arrayList = new ArrayList(this.zze);
        this.zze.clear();
        return arrayList;
    }

    public final zzbwf zzc() throws IOException {
        int iZzh = zzh();
        int i5 = iZzh & 128;
        long jZza = zza(iZzh, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        if (i5 != 128) {
            return this.zzf.zzy(jZza);
        }
        zzbwd zzbwdVar = this.zzf;
        zzbud zzbudVarZza = zzbud.zza();
        zzbwl zzbwlVar = (zzbwl) zzbwdVar;
        zzbwlVar.zzD(jZza);
        byte[] bArrZzb = zzbudVarZza.zzb(zzbwlVar.zzb.zzH(jZza));
        zzbwe zzbweVar = zzbwf.zza;
        return zzbwe.zzb(bArrZzb);
    }

    public final void zzd(int i5) {
        this.zzg = i5;
        this.zzh = i5;
        zzj();
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0071, code lost:
    
        throw new java.io.IOException(b.c0.h(r0, "Header index too large "));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void zze() throws IOException {
        int iZza;
        while (true) {
            zzbwl zzbwlVar = (zzbwl) this.zzf;
            if (zzbwlVar.zzc) {
                throw new IllegalStateException("closed");
            }
            zzbwb zzbwbVar = zzbwlVar.zzb;
            if (zzbwbVar.zzG() && zzbwlVar.zza.zza(zzbwbVar, 8192L) == -1) {
                return;
            }
            byte bZzc = this.zzf.zzc();
            int i5 = bZzc & 255;
            if (i5 == 128) {
                throw new IOException("index == 0");
            }
            if ((bZzc & 128) == 128) {
                int iZza2 = zza(i5, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
                int i11 = iZza2 - 1;
                if (!zzm(i11)) {
                    int length = zzbtw.zzb.length;
                    int iZzf = zzf(iZza2 - 62);
                    if (iZzf < 0) {
                        break;
                    }
                    zzbtt[] zzbttVarArr = this.zza;
                    if (iZzf > zzbttVarArr.length - 1) {
                        break;
                    } else {
                        this.zze.add(zzbttVarArr[iZzf]);
                    }
                } else {
                    this.zze.add(zzbtw.zzb[i11]);
                }
            } else if (i5 == 64) {
                zzbwf zzbwfVarZzc = zzc();
                zzbtw.zzc(zzbwfVarZzc);
                zzl(-1, new zzbtt(zzbwfVarZzc, zzc()));
            } else if ((bZzc & 64) == 64) {
                zzl(-1, new zzbtt(zzi(zza(i5, 63) - 1), zzc()));
            } else if ((bZzc & 32) == 32) {
                iZza = zza(i5, 31);
                this.zzh = iZza;
                if (iZza < 0 || iZza > this.zzg) {
                    break;
                } else {
                    zzj();
                }
            } else if (i5 == 16 || i5 == 0) {
                zzbwf zzbwfVarZzc2 = zzc();
                zzbtw.zzc(zzbwfVarZzc2);
                this.zze.add(new zzbtt(zzbwfVarZzc2, zzc()));
            } else {
                this.zze.add(new zzbtt(zzi(zza(i5, 15) - 1), zzc()));
            }
        }
        throw new IOException(c0.h(iZza, "Invalid dynamic table size update "));
    }
}
