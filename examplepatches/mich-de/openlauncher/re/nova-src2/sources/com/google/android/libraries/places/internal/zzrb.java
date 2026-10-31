package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class zzrb extends zzqp {
    private static final Set zza;
    private static final zzqh zzb;
    private static final zzqy zzc;
    private final String zzd;
    private final zzpu zze;
    private final Level zzf;
    private final Set zzg;
    private final zzqh zzh;

    static {
        Set setUnmodifiableSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(zzpo.zza, zzpt.zza)));
        zza = setUnmodifiableSet;
        zzb = zzqk.zza(setUnmodifiableSet).zzd();
        zzc = new zzqy();
    }

    public /* synthetic */ zzrb(String str, String str2, boolean z11, zzpu zzpuVar, Level level, Set set, zzqh zzqhVar, zzra zzraVar) {
        super(str2);
        if (str2.length() > 23) {
            int i5 = -1;
            for (int length = str2.length() - 1; length >= 0; length--) {
                char cCharAt = str2.charAt(length);
                if (cCharAt == '.' || cCharAt == '$') {
                    i5 = length;
                    break;
                }
            }
            str2 = str2.substring(i5 + 1);
        }
        String strConcat = b.f42142b.concat(String.valueOf(str2));
        this.zzd = strConcat.substring(0, Math.min(strConcat.length(), 23));
        this.zze = zzpuVar;
        this.zzf = level;
        this.zzg = set;
        this.zzh = zzqhVar;
    }

    public static zzqy zzc() {
        return zzc;
    }
}
