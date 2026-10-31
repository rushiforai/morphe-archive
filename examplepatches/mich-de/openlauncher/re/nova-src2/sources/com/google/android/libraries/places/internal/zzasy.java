package com.google.android.libraries.places.internal;

import java.io.IOException;
import java.util.List;

/* loaded from: classes3.dex */
final class zzasy {
    private final zzasx zza;

    private zzasy(zzasx zzasxVar) {
        byte[] bArr = zzaud.zzd;
        this.zza = zzasxVar;
        zzasxVar.zze = this;
    }

    public static zzasy zza(zzasx zzasxVar) {
        zzasy zzasyVar = zzasxVar.zze;
        return zzasyVar != null ? zzasyVar : new zzasy(zzasxVar);
    }

    public final void zzA(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzj(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzk(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public final void zzB(int i5, int i11) throws IOException {
        this.zza.zzt(i5, (i11 >> 31) ^ (i11 + i11));
    }

    public final void zzC(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                zzasx zzasxVar = this.zza;
                int iIntValue = ((Integer) list.get(i11)).intValue();
                zzasxVar.zzt(i5, (iIntValue >> 31) ^ (iIntValue + iIntValue));
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzB = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            int iIntValue2 = ((Integer) list.get(i12)).intValue();
            iZzB += zzasx.zzB((iIntValue2 >> 31) ^ (iIntValue2 + iIntValue2));
        }
        this.zza.zzu(iZzB);
        while (i11 < list.size()) {
            zzasx zzasxVar2 = this.zza;
            int iIntValue3 = ((Integer) list.get(i11)).intValue();
            zzasxVar2.zzu((iIntValue3 >> 31) ^ (iIntValue3 + iIntValue3));
            i11++;
        }
    }

    public final void zzD(int i5, long j11) throws IOException {
        this.zza.zzv(i5, (j11 >> 63) ^ (j11 + j11));
    }

    public final void zzE(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                zzasx zzasxVar = this.zza;
                long jLongValue = ((Long) list.get(i11)).longValue();
                zzasxVar.zzv(i5, (jLongValue >> 63) ^ (jLongValue + jLongValue));
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzC = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            long jLongValue2 = ((Long) list.get(i12)).longValue();
            iZzC += zzasx.zzC((jLongValue2 >> 63) ^ (jLongValue2 + jLongValue2));
        }
        this.zza.zzu(iZzC);
        while (i11 < list.size()) {
            zzasx zzasxVar2 = this.zza;
            long jLongValue3 = ((Long) list.get(i11)).longValue();
            zzasxVar2.zzw((jLongValue3 >> 63) ^ (jLongValue3 + jLongValue3));
            i11++;
        }
    }

    @Deprecated
    public final void zzF(int i5) throws IOException {
        this.zza.zzs(i5, 3);
    }

    public final void zzG(int i5, String str) throws IOException {
        this.zza.zzq(i5, str);
    }

    public final void zzH(int i5, List list) throws IOException {
        int i11 = 0;
        if (!(list instanceof zzaun)) {
            while (i11 < list.size()) {
                this.zza.zzq(i5, (String) list.get(i11));
                i11++;
            }
            return;
        }
        zzaun zzaunVar = (zzaun) list;
        while (i11 < list.size()) {
            Object objZzf = zzaunVar.zzf(i11);
            if (objZzf instanceof String) {
                this.zza.zzq(i5, (String) objZzf);
            } else {
                this.zza.zzM(i5, (zzask) objZzf);
            }
            i11++;
        }
    }

    public final void zzI(int i5, int i11) throws IOException {
        this.zza.zzt(i5, i11);
    }

    public final void zzJ(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzt(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzB = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iZzB += zzasx.zzB(((Integer) list.get(i12)).intValue());
        }
        this.zza.zzu(iZzB);
        while (i11 < list.size()) {
            this.zza.zzu(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public final void zzK(int i5, long j11) throws IOException {
        this.zza.zzv(i5, j11);
    }

    public final void zzL(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzv(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzC = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iZzC += zzasx.zzC(((Long) list.get(i12)).longValue());
        }
        this.zza.zzu(iZzC);
        while (i11 < list.size()) {
            this.zza.zzw(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public final void zzb(int i5, boolean z11) throws IOException {
        this.zza.zzL(i5, z11);
    }

    public final void zzc(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzL(i5, ((Boolean) list.get(i11)).booleanValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Boolean) list.get(i13)).getClass();
            i12++;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzK(((Boolean) list.get(i11)).booleanValue() ? (byte) 1 : (byte) 0);
            i11++;
        }
    }

    public final void zzd(int i5, zzask zzaskVar) throws IOException {
        this.zza.zzM(i5, zzaskVar);
    }

    public final void zze(int i5, List list) throws IOException {
        for (int i11 = 0; i11 < list.size(); i11++) {
            this.zza.zzM(i5, (zzask) list.get(i11));
        }
    }

    public final void zzf(int i5, double d5) throws IOException {
        this.zza.zzj(i5, Double.doubleToRawLongBits(d5));
    }

    public final void zzg(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzj(i5, Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Double) list.get(i13)).getClass();
            i12 += 8;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzk(Double.doubleToRawLongBits(((Double) list.get(i11)).doubleValue()));
            i11++;
        }
    }

    @Deprecated
    public final void zzh(int i5) throws IOException {
        this.zza.zzs(i5, 4);
    }

    public final void zzi(int i5, int i11) throws IOException {
        this.zza.zzl(i5, i11);
    }

    public final void zzj(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzl(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzC = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iZzC += zzasx.zzC(((Integer) list.get(i12)).intValue());
        }
        this.zza.zzu(iZzC);
        while (i11 < list.size()) {
            this.zza.zzm(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public final void zzk(int i5, int i11) throws IOException {
        this.zza.zzh(i5, i11);
    }

    public final void zzl(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzh(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Integer) list.get(i13)).getClass();
            i12 += 4;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzi(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public final void zzm(int i5, long j11) throws IOException {
        this.zza.zzj(i5, j11);
    }

    public final void zzn(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzj(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Long) list.get(i13)).getClass();
            i12 += 8;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzk(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public final void zzo(int i5, float f11) throws IOException {
        this.zza.zzh(i5, Float.floatToRawIntBits(f11));
    }

    public final void zzp(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzh(i5, Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Float) list.get(i13)).getClass();
            i12 += 4;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzi(Float.floatToRawIntBits(((Float) list.get(i11)).floatValue()));
            i11++;
        }
    }

    public final void zzq(int i5, Object obj, zzavt zzavtVar) throws IOException {
        zzasx zzasxVar = this.zza;
        zzasxVar.zzs(i5, 3);
        zzavtVar.zzj((zzavf) obj, zzasxVar.zze);
        zzasxVar.zzs(i5, 4);
    }

    public final void zzr(int i5, int i11) throws IOException {
        this.zza.zzl(i5, i11);
    }

    public final void zzs(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzl(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzC = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iZzC += zzasx.zzC(((Integer) list.get(i12)).intValue());
        }
        this.zza.zzu(iZzC);
        while (i11 < list.size()) {
            this.zza.zzm(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public final void zzt(int i5, long j11) throws IOException {
        this.zza.zzv(i5, j11);
    }

    public final void zzu(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzv(i5, ((Long) list.get(i11)).longValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int iZzC = 0;
        for (int i12 = 0; i12 < list.size(); i12++) {
            iZzC += zzasx.zzC(((Long) list.get(i12)).longValue());
        }
        this.zza.zzu(iZzC);
        while (i11 < list.size()) {
            this.zza.zzw(((Long) list.get(i11)).longValue());
            i11++;
        }
    }

    public final void zzv(int i5, Object obj, zzavt zzavtVar) throws IOException {
        this.zza.zzn(i5, (zzavf) obj, zzavtVar);
    }

    public final void zzw(int i5, Object obj) throws IOException {
        if (obj instanceof zzask) {
            this.zza.zzp(i5, (zzask) obj);
        } else {
            this.zza.zzo(i5, (zzavf) obj);
        }
    }

    public final void zzx(int i5, int i11) throws IOException {
        this.zza.zzh(i5, i11);
    }

    public final void zzy(int i5, List list, boolean z11) throws IOException {
        int i11 = 0;
        if (!z11) {
            while (i11 < list.size()) {
                this.zza.zzh(i5, ((Integer) list.get(i11)).intValue());
                i11++;
            }
            return;
        }
        this.zza.zzs(i5, 2);
        int i12 = 0;
        for (int i13 = 0; i13 < list.size(); i13++) {
            ((Integer) list.get(i13)).getClass();
            i12 += 4;
        }
        this.zza.zzu(i12);
        while (i11 < list.size()) {
            this.zza.zzi(((Integer) list.get(i11)).intValue());
            i11++;
        }
    }

    public final void zzz(int i5, long j11) throws IOException {
        this.zza.zzj(i5, j11);
    }
}
