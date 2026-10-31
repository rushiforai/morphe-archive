package com.google.android.libraries.places.internal;

import b.c0;
import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes3.dex */
public final class zzmt {
    public static int zza(int i5, int i11, String str) {
        String strZzb;
        if (i5 >= 0 && i5 < i11) {
            return i5;
        }
        if (i5 < 0) {
            strZzb = zznb.zzb("%s (%s) must not be negative", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5));
        } else {
            if (i11 < 0) {
                throw new IllegalArgumentException(c0.h(i11, "negative size: "));
            }
            strZzb = zznb.zzb("%s (%s) must be less than size (%s)", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, Integer.valueOf(i5), Integer.valueOf(i11));
        }
        throw new IndexOutOfBoundsException(strZzb);
    }

    public static int zzb(int i5, int i11, String str) {
        if (i5 < 0 || i5 > i11) {
            throw new IndexOutOfBoundsException(zzt(i5, i11, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX));
        }
        return i5;
    }

    public static Object zzc(Object obj, Object obj2) {
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException((String) obj2);
    }

    public static Object zzd(Object obj, String str, Object obj2) {
        if (obj != null) {
            return obj;
        }
        throw new NullPointerException(zznb.zzb(str, obj2));
    }

    public static void zze(boolean z11) {
        if (!z11) {
            throw new IllegalArgumentException();
        }
    }

    public static void zzf(boolean z11, Object obj) {
        if (!z11) {
            throw new IllegalArgumentException(String.valueOf(obj));
        }
    }

    public static void zzg(boolean z11, String str, char c11) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, Character.valueOf(c11)));
        }
    }

    public static void zzh(boolean z11, String str, int i5) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, Integer.valueOf(i5)));
        }
    }

    public static void zzi(boolean z11, String str, long j11) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, Long.valueOf(j11)));
        }
    }

    public static void zzj(boolean z11, String str, Object obj) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, obj));
        }
    }

    public static void zzk(boolean z11, String str, int i5, Object obj) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, 4800, obj));
        }
    }

    public static void zzl(boolean z11, String str, Object obj, Object obj2) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, obj, obj2));
        }
    }

    public static void zzm(boolean z11, String str, Object obj, Object obj2, Object obj3) {
        if (!z11) {
            throw new IllegalArgumentException(zznb.zzb(str, obj, obj2, obj3));
        }
    }

    public static void zzn(int i5, int i11, int i12) {
        if (i5 < 0 || i11 < i5 || i11 > i12) {
            throw new IndexOutOfBoundsException((i5 < 0 || i5 > i12) ? zzt(i5, i12, "start index") : (i11 < 0 || i11 > i12) ? zzt(i11, i12, "end index") : zznb.zzb("end index (%s) must not be less than start index (%s)", Integer.valueOf(i11), Integer.valueOf(i5)));
        }
    }

    public static void zzo(boolean z11) {
        if (!z11) {
            throw new IllegalStateException();
        }
    }

    public static void zzp(boolean z11, Object obj) {
        if (!z11) {
            throw new IllegalStateException((String) obj);
        }
    }

    public static void zzq(boolean z11, String str, int i5) {
        if (!z11) {
            throw new IllegalStateException(zznb.zzb(str, Integer.valueOf(i5)));
        }
    }

    public static void zzr(boolean z11, String str, Object obj) {
        if (!z11) {
            throw new IllegalStateException(zznb.zzb(str, obj));
        }
    }

    public static void zzs(boolean z11, String str, Object obj, Object obj2, Object obj3) {
        if (!z11) {
            throw new IllegalStateException(zznb.zzb(str, obj, obj2, obj3));
        }
    }

    private static String zzt(int i5, int i11, String str) {
        if (i5 < 0) {
            return zznb.zzb("%s (%s) must not be negative", str, Integer.valueOf(i5));
        }
        if (i11 >= 0) {
            return zznb.zzb("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i5), Integer.valueOf(i11));
        }
        throw new IllegalArgumentException(c0.h(i11, "negative size: "));
    }
}
