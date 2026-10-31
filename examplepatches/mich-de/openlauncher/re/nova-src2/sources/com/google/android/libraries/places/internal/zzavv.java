package com.google.android.libraries.places.internal;

import com.google.android.gms.internal.measurement.k2;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
final class zzavv {
    public static final /* synthetic */ int zza = 0;
    private static final Class zzb;
    private static final zzawn zzc;
    private static final zzawn zzd;

    static {
        Class<?> cls;
        Class<?> cls2;
        zzawn zzawnVar = null;
        try {
            cls = Class.forName("com.google.protobuf.GeneratedMessage");
        } catch (Throwable unused) {
            cls = null;
        }
        zzb = cls;
        try {
            cls2 = Class.forName("com.google.protobuf.UnknownFieldSetSchema");
        } catch (Throwable unused2) {
            cls2 = null;
        }
        if (cls2 != null) {
            try {
                zzawnVar = (zzawn) cls2.getConstructor(null).newInstance(null);
            } catch (Throwable unused3) {
            }
        }
        zzc = zzawnVar;
        zzd = new zzawp();
    }

    public static void zzA(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzs(i5, list, z11);
    }

    public static void zzB(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzu(i5, list, z11);
    }

    public static void zzC(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzy(i5, list, z11);
    }

    public static void zzD(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzA(i5, list, z11);
    }

    public static void zzE(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzC(i5, list, z11);
    }

    public static void zzF(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzE(i5, list, z11);
    }

    public static void zzG(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzJ(i5, list, z11);
    }

    public static void zzH(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzL(i5, list, z11);
    }

    public static int zza(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzatv)) {
            int iZzC = 0;
            while (i5 < size) {
                iZzC += zzasx.zzC(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iZzC;
        }
        zzatv zzatvVar = (zzatv) list;
        int iZzC2 = 0;
        while (i5 < size) {
            iZzC2 += zzasx.zzC(zzatvVar.zze(i5));
            i5++;
        }
        return iZzC2;
    }

    public static int zzb(int i5, List list, boolean z11) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (zzasx.zzB(i5 << 3) + 4) * size;
    }

    public static int zzc(List list) {
        return list.size() * 4;
    }

    public static int zzd(int i5, List list, boolean z11) {
        int size = list.size();
        if (size == 0) {
            return 0;
        }
        return (zzasx.zzB(i5 << 3) + 8) * size;
    }

    public static int zze(List list) {
        return list.size() * 8;
    }

    public static int zzf(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzatv)) {
            int iZzC = 0;
            while (i5 < size) {
                iZzC += zzasx.zzC(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iZzC;
        }
        zzatv zzatvVar = (zzatv) list;
        int iZzC2 = 0;
        while (i5 < size) {
            iZzC2 += zzasx.zzC(zzatvVar.zze(i5));
            i5++;
        }
        return iZzC2;
    }

    public static int zzg(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzauu)) {
            int iZzC = 0;
            while (i5 < size) {
                iZzC += zzasx.zzC(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iZzC;
        }
        zzauu zzauuVar = (zzauu) list;
        int iZzC2 = 0;
        while (i5 < size) {
            iZzC2 += zzasx.zzC(zzauuVar.zze(i5));
            i5++;
        }
        return iZzC2;
    }

    public static int zzh(int i5, Object obj, zzavt zzavtVar) {
        int i11 = i5 << 3;
        if (!(obj instanceof zzaul)) {
            return zzasx.zzz((zzavf) obj, zzavtVar) + zzasx.zzB(i11);
        }
        int iZzB = zzasx.zzB(i11);
        int iZza = ((zzaul) obj).zza();
        return k2.C(iZza, iZza, iZzB);
    }

    public static int zzi(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzatv)) {
            int iZzB = 0;
            while (i5 < size) {
                int iIntValue = ((Integer) list.get(i5)).intValue();
                iZzB += zzasx.zzB((iIntValue >> 31) ^ (iIntValue + iIntValue));
                i5++;
            }
            return iZzB;
        }
        zzatv zzatvVar = (zzatv) list;
        int iZzB2 = 0;
        while (i5 < size) {
            int iZze = zzatvVar.zze(i5);
            iZzB2 += zzasx.zzB((iZze >> 31) ^ (iZze + iZze));
            i5++;
        }
        return iZzB2;
    }

    public static int zzj(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzauu)) {
            int iZzC = 0;
            while (i5 < size) {
                long jLongValue = ((Long) list.get(i5)).longValue();
                iZzC += zzasx.zzC((jLongValue >> 63) ^ (jLongValue + jLongValue));
                i5++;
            }
            return iZzC;
        }
        zzauu zzauuVar = (zzauu) list;
        int iZzC2 = 0;
        while (i5 < size) {
            long jZze = zzauuVar.zze(i5);
            iZzC2 += zzasx.zzC((jZze >> 63) ^ (jZze + jZze));
            i5++;
        }
        return iZzC2;
    }

    public static int zzk(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzatv)) {
            int iZzB = 0;
            while (i5 < size) {
                iZzB += zzasx.zzB(((Integer) list.get(i5)).intValue());
                i5++;
            }
            return iZzB;
        }
        zzatv zzatvVar = (zzatv) list;
        int iZzB2 = 0;
        while (i5 < size) {
            iZzB2 += zzasx.zzB(zzatvVar.zze(i5));
            i5++;
        }
        return iZzB2;
    }

    public static int zzl(List list) {
        int size = list.size();
        int i5 = 0;
        if (size == 0) {
            return 0;
        }
        if (!(list instanceof zzauu)) {
            int iZzC = 0;
            while (i5 < size) {
                iZzC += zzasx.zzC(((Long) list.get(i5)).longValue());
                i5++;
            }
            return iZzC;
        }
        zzauu zzauuVar = (zzauu) list;
        int iZzC2 = 0;
        while (i5 < size) {
            iZzC2 += zzasx.zzC(zzauuVar.zze(i5));
            i5++;
        }
        return iZzC2;
    }

    public static zzawn zzm() {
        return zzc;
    }

    public static zzawn zzn() {
        return zzd;
    }

    public static Object zzo(Object obj, int i5, List list, zzaty zzatyVar, Object obj2, zzawn zzawnVar) {
        if (zzatyVar == null) {
            return obj2;
        }
        if (!(list instanceof RandomAccess)) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                int iIntValue = ((Integer) it.next()).intValue();
                if (!zzatyVar.zza(iIntValue)) {
                    obj2 = zzp(obj, i5, iIntValue, obj2, zzawnVar);
                    it.remove();
                }
            }
            return obj2;
        }
        int size = list.size();
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            Integer num = (Integer) list.get(i12);
            int iIntValue2 = num.intValue();
            if (zzatyVar.zza(iIntValue2)) {
                if (i12 != i11) {
                    list.set(i11, num);
                }
                i11++;
            } else {
                obj2 = zzp(obj, i5, iIntValue2, obj2, zzawnVar);
            }
        }
        if (i11 != size) {
            list.subList(i11, size).clear();
        }
        return obj2;
    }

    public static Object zzp(Object obj, int i5, int i11, Object obj2, zzawn zzawnVar) {
        if (obj2 == null) {
            obj2 = zzawnVar.zzc(obj);
        }
        zzawnVar.zzl(obj2, i5, i11);
        return obj2;
    }

    public static void zzq(zzatg zzatgVar, Object obj, Object obj2) {
        zzatk zzatkVarZzb = zzatgVar.zzb(obj2);
        if (zzatkVarZzb.zza.isEmpty()) {
            return;
        }
        zzatgVar.zzc(obj).zzh(zzatkVarZzb);
    }

    public static void zzr(zzawn zzawnVar, Object obj, Object obj2) {
        zzawnVar.zzo(obj, zzawnVar.zze(zzawnVar.zzd(obj), zzawnVar.zzd(obj2)));
    }

    public static void zzs(Class cls) {
        Class cls2;
        if (!zzatu.class.isAssignableFrom(cls) && (cls2 = zzb) != null && !cls2.isAssignableFrom(cls)) {
            throw new IllegalArgumentException("Message classes must extend GeneratedMessage or GeneratedMessageLite");
        }
    }

    public static boolean zzt(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static void zzu(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzc(i5, list, z11);
    }

    public static void zzv(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzg(i5, list, z11);
    }

    public static void zzw(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzj(i5, list, z11);
    }

    public static void zzx(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzl(i5, list, z11);
    }

    public static void zzy(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzn(i5, list, z11);
    }

    public static void zzz(int i5, List list, zzasy zzasyVar, boolean z11) throws IOException {
        if (list == null || list.isEmpty()) {
            return;
        }
        zzasyVar.zzp(i5, list, z11);
    }
}
