package com.google.android.libraries.places.internal;

import android.os.Build;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
final class zzqv extends zzqp {
    static final boolean zza;
    static final boolean zzb;
    static final boolean zzc;
    private static final AtomicReference zzd;
    private static final AtomicLong zze;
    private static final ConcurrentLinkedQueue zzf;
    private volatile zzpw zzg;

    static {
        String str = Build.FINGERPRINT;
        zza = str == null || "robolectric".equals(str);
        String str2 = Build.HARDWARE;
        zzb = "goldfish".equals(str2) || "ranchu".equals(str2);
        String str3 = Build.TYPE;
        zzc = "eng".equals(str3) || "userdebug".equals(str3);
        zzd = new AtomicReference();
        zze = new AtomicLong();
        zzf = new ConcurrentLinkedQueue();
    }

    private zzqv(String str) {
        super(str);
        if (zza || zzb) {
            this.zzg = new zzqq().zza(zza());
        } else if (zzc) {
            this.zzg = zzrb.zzc().zzb(false).zza(zza());
        } else {
            this.zzg = null;
        }
    }

    public static zzpw zzb(String str) {
        AtomicReference atomicReference = zzd;
        if (atomicReference.get() != null) {
            return ((zzqr) atomicReference.get()).zza(str);
        }
        int length = str.length();
        while (true) {
            length--;
            if (length >= 0) {
                char cCharAt = str.charAt(length);
                if (cCharAt != '$') {
                    if (cCharAt == '.') {
                        break;
                    }
                } else {
                    str = str.replace('$', '.');
                    break;
                }
            } else {
                break;
            }
        }
        zzqv zzqvVar = new zzqv(str);
        zzqt.zza.offer(zzqvVar);
        if (zzd.get() != null) {
            while (true) {
                zzqv zzqvVar2 = (zzqv) zzqt.zza.poll();
                if (zzqvVar2 == null) {
                    break;
                }
                zzqvVar2.zzg = ((zzqr) zzd.get()).zza(zzqvVar2.zza());
            }
            if (((zzqu) zzf.poll()) != null) {
                zze.getAndDecrement();
                throw null;
            }
        }
        return zzqvVar;
    }
}
