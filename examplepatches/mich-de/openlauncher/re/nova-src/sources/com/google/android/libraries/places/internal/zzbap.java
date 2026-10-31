package com.google.android.libraries.places.internal;

import com.tiktok.util.TTConst;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes3.dex */
public final class zzbap {
    private static final AtomicLong zza = new AtomicLong();
    private final String zzb;
    private final String zzc;
    private final long zzd;

    public zzbap(String str, String str2, long j11) {
        zzmt.zzc(str, "typeName");
        zzmt.zzf(!str.isEmpty(), "empty type");
        this.zzb = str;
        this.zzc = str2;
        this.zzd = j11;
    }

    public static zzbap zzb(Class cls, String str) {
        zzmt.zzc(cls, TTConst.TRACK_TYPE);
        String simpleName = cls.getSimpleName();
        if (simpleName.isEmpty()) {
            simpleName = cls.getName().substring(cls.getPackage().getName().length() + 1);
        }
        return zzc(simpleName, str);
    }

    public static zzbap zzc(String str, String str2) {
        return new zzbap(str, str2, zza.incrementAndGet());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.zzb + "<" + this.zzd + ">");
        if (this.zzc != null) {
            sb2.append(": (");
            sb2.append(this.zzc);
            sb2.append(')');
        }
        return sb2.toString();
    }

    public final long zza() {
        return this.zzd;
    }
}
