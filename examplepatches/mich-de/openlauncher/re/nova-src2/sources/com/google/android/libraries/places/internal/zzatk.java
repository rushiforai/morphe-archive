package com.google.android.libraries.places.internal;

import com.google.android.gms.internal.measurement.k2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
final class zzatk {
    private static final zzatk zzb = new zzatk(true);
    final zzawg zza = new zzavw(16);
    private boolean zzc;
    private boolean zzd;

    private zzatk() {
    }

    public static int zza(zzaxd zzaxdVar, int i5, Object obj) {
        zzasx.zzB(i5 << 3);
        if (zzaxd.zzj == null) {
            byte[] bArr = zzaud.zzd;
            if (((zzavf) obj) instanceof zzaru) {
                throw null;
            }
        }
        zzaxe zzaxeVar = zzaxe.INT;
        throw null;
    }

    public static int zzb(zzatj zzatjVar, Object obj) {
        zzaxd zzaxdVarZzd = zzatjVar.zzd();
        int iZza = zzatjVar.zza();
        if (!zzatjVar.zzg()) {
            return zza(zzaxdVarZzd, iZza, obj);
        }
        List list = (List) obj;
        int iZza2 = 0;
        if (!zzatjVar.zzf()) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                iZza2 += zza(zzaxdVarZzd, iZza, it.next());
            }
            return iZza2;
        }
        if (list.isEmpty()) {
            return 0;
        }
        Iterator it2 = list.iterator();
        if (!it2.hasNext()) {
            return zzasx.zzB(0) + zzasx.zzB(iZza << 3);
        }
        it2.next();
        zzaxd zzaxdVar = zzaxd.zza;
        zzaxe zzaxeVar = zzaxe.INT;
        throw null;
    }

    public static zzatk zzd() {
        return zzb;
    }

    private static Object zzk(Object obj) {
        if (obj instanceof zzavk) {
            return ((zzavk) obj).zzc();
        }
        if (!(obj instanceof byte[])) {
            return obj;
        }
        byte[] bArr = (byte[]) obj;
        int length = bArr.length;
        byte[] bArr2 = new byte[length];
        System.arraycopy(bArr, 0, bArr2, 0, length);
        return bArr2;
    }

    private final void zzl(Map.Entry entry) {
        zzatj zzatjVar = (zzatj) entry.getKey();
        Object value = entry.getValue();
        boolean z11 = value instanceof zzauk;
        if (zzatjVar.zzg()) {
            if (z11) {
                throw new IllegalStateException("Lazy fields can not be repeated");
            }
            Object objZze = zze(zzatjVar);
            if (objZze == null) {
                objZze = new ArrayList();
            }
            Iterator it = ((List) value).iterator();
            while (it.hasNext()) {
                ((List) objZze).add(zzk(it.next()));
            }
            this.zza.put(zzatjVar, objZze);
            return;
        }
        if (zzatjVar.zze() != zzaxe.MESSAGE) {
            if (z11) {
                throw new IllegalStateException("Lazy fields must be message-valued");
            }
            this.zza.put(zzatjVar, zzk(value));
            return;
        }
        Object objZze2 = zze(zzatjVar);
        if (objZze2 != null) {
            if (z11) {
                throw null;
            }
            this.zza.put(zzatjVar, objZze2 instanceof zzavk ? zzatjVar.zzc((zzavk) objZze2, (zzavk) value) : zzatjVar.zzb(((zzavf) objZze2).zzaJ(), (zzavf) value).zzt());
        } else {
            this.zza.put(zzatjVar, zzk(value));
            if (z11) {
                this.zzd = true;
            }
        }
    }

    private static boolean zzm(Map.Entry entry) {
        zzatj zzatjVar = (zzatj) entry.getKey();
        if (zzatjVar.zze() != zzaxe.MESSAGE) {
            return true;
        }
        if (!zzatjVar.zzg()) {
            return zzn(entry.getValue());
        }
        Iterator it = ((List) entry.getValue()).iterator();
        while (it.hasNext()) {
            if (!zzn(it.next())) {
                return false;
            }
        }
        return true;
    }

    private static boolean zzn(Object obj) {
        if (obj instanceof zzavg) {
            return ((zzavg) obj).zzaM();
        }
        if (obj instanceof zzauk) {
            return true;
        }
        throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
    }

    private static final int zzo(Map.Entry entry) {
        int i5;
        int iZzB;
        int iC;
        zzatj zzatjVar = (zzatj) entry.getKey();
        Object value = entry.getValue();
        if (zzatjVar.zze() != zzaxe.MESSAGE || zzatjVar.zzg() || zzatjVar.zzf()) {
            return zzb(zzatjVar, value);
        }
        if (value instanceof zzauk) {
            int iZza = ((zzatj) entry.getKey()).zza();
            int iZzB2 = zzasx.zzB(8);
            i5 = iZzB2 + iZzB2;
            iZzB = zzasx.zzB(iZza) + zzasx.zzB(16);
            int iZzB3 = zzasx.zzB(24);
            int iZza2 = ((zzauk) value).zza();
            iC = k2.C(iZza2, iZza2, iZzB3);
        } else {
            int iZza3 = ((zzatj) entry.getKey()).zza();
            int iZzB4 = zzasx.zzB(8);
            i5 = iZzB4 + iZzB4;
            iZzB = zzasx.zzB(iZza3) + zzasx.zzB(16);
            int iZzB5 = zzasx.zzB(24);
            int iZzaq = ((zzavf) value).zzaq();
            iC = k2.C(iZzaq, iZzaq, iZzB5);
        }
        return i5 + iZzB + iC;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0047 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static final void zzp(zzatj zzatjVar, Object obj) {
        boolean z11;
        zzatjVar.zzd();
        byte[] bArr = zzaud.zzd;
        obj.getClass();
        zzaxd zzaxdVar = zzaxd.zza;
        zzaxe zzaxeVar = zzaxe.INT;
        switch (r0.zza()) {
            case INT:
                z11 = obj instanceof Integer;
                if (z11) {
                    return;
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case LONG:
                z11 = obj instanceof Long;
                if (z11) {
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case FLOAT:
                z11 = obj instanceof Float;
                if (z11) {
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case DOUBLE:
                z11 = obj instanceof Double;
                if (z11) {
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case BOOLEAN:
                z11 = obj instanceof Boolean;
                if (z11) {
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case STRING:
                z11 = obj instanceof String;
                if (z11) {
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case BYTE_STRING:
                if ((obj instanceof zzask) || (obj instanceof byte[])) {
                    return;
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case ENUM:
                if ((obj instanceof Integer) || (obj instanceof zzatw)) {
                    return;
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            case MESSAGE:
                if ((obj instanceof zzavf) || (obj instanceof zzauk)) {
                    return;
                }
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
            default:
                throw new IllegalArgumentException(String.format("Wrong object type used with protocol message reflection.\nField number: %d, field java type: %s, value type: %s\n", Integer.valueOf(zzatjVar.zza()), zzatjVar.zzd().zza(), obj.getClass().getName()));
        }
    }

    public final /* bridge */ /* synthetic */ Object clone() throws CloneNotSupportedException {
        zzatk zzatkVar = new zzatk();
        for (int i5 = 0; i5 < this.zza.zzb(); i5++) {
            Map.Entry entryZzg = this.zza.zzg(i5);
            zzatkVar.zzi((zzatj) entryZzg.getKey(), entryZzg.getValue());
        }
        for (Map.Entry entry : this.zza.zzc()) {
            zzatkVar.zzi((zzatj) entry.getKey(), entry.getValue());
        }
        zzatkVar.zzd = this.zzd;
        return zzatkVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof zzatk) {
            return this.zza.equals(((zzatk) obj).zza);
        }
        return false;
    }

    public final int hashCode() {
        return this.zza.hashCode();
    }

    public final int zzc() {
        int iZzo = 0;
        for (int i5 = 0; i5 < this.zza.zzb(); i5++) {
            iZzo += zzo(this.zza.zzg(i5));
        }
        Iterator it = this.zza.zzc().iterator();
        while (it.hasNext()) {
            iZzo += zzo((Map.Entry) it.next());
        }
        return iZzo;
    }

    public final Object zze(zzatj zzatjVar) {
        Object obj = this.zza.get(zzatjVar);
        if (obj instanceof zzauk) {
            throw null;
        }
        return obj;
    }

    public final Iterator zzf() {
        return this.zzd ? new zzauj(this.zza.entrySet().iterator()) : this.zza.entrySet().iterator();
    }

    public final void zzg() {
        if (this.zzc) {
            return;
        }
        for (int i5 = 0; i5 < this.zza.zzb(); i5++) {
            Map.Entry entryZzg = this.zza.zzg(i5);
            if (entryZzg.getValue() instanceof zzatu) {
                ((zzatu) entryZzg.getValue()).zzaC();
            }
        }
        this.zza.zza();
        this.zzc = true;
    }

    public final void zzh(zzatk zzatkVar) {
        for (int i5 = 0; i5 < zzatkVar.zza.zzb(); i5++) {
            zzl(zzatkVar.zza.zzg(i5));
        }
        Iterator it = zzatkVar.zza.zzc().iterator();
        while (it.hasNext()) {
            zzl((Map.Entry) it.next());
        }
    }

    public final void zzi(zzatj zzatjVar, Object obj) {
        if (!zzatjVar.zzg()) {
            zzp(zzatjVar, obj);
        } else {
            if (!(obj instanceof List)) {
                throw new IllegalArgumentException("Wrong object type used with protocol message reflection.");
            }
            ArrayList arrayList = new ArrayList();
            arrayList.addAll((List) obj);
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                zzp(zzatjVar, arrayList.get(i5));
            }
            obj = arrayList;
        }
        if (obj instanceof zzauk) {
            this.zzd = true;
        }
        this.zza.put(zzatjVar, obj);
    }

    public final boolean zzj() {
        for (int i5 = 0; i5 < this.zza.zzb(); i5++) {
            if (!zzm(this.zza.zzg(i5))) {
                return false;
            }
        }
        Iterator it = this.zza.zzc().iterator();
        while (it.hasNext()) {
            if (!zzm((Map.Entry) it.next())) {
                return false;
            }
        }
        return true;
    }

    private zzatk(boolean z11) {
        zzg();
        zzg();
    }
}
