package com.google.android.libraries.places.internal;

import java.text.ParseException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;

/* loaded from: classes3.dex */
final class zzbmg {
    static final zzayh zza = zzayh.zza("io.grpc.internal.ManagedChannelServiceConfig.MethodInfo");
    final Long zzb;
    final Boolean zzc;
    final Integer zzd;
    final Integer zze;
    final zzbpp zzf;
    final zzbje zzg;

    public zzbmg(Map map, boolean z11, int i5, int i11) throws NumberFormatException, ParseException {
        long j11;
        zzbpp zzbppVar;
        zzbje zzbjeVar;
        this.zzb = zzbkg.zzd(map, "timeout");
        this.zzc = zzbkg.zza(map, "waitForReady");
        Integer numZzc = zzbkg.zzc(map, "maxResponseMessageBytes");
        this.zzd = numZzc;
        if (numZzc != null) {
            zzmt.zzj(numZzc.intValue() >= 0, "maxInboundMessageSize %s exceeds bounds", numZzc);
        }
        Integer numZzc2 = zzbkg.zzc(map, "maxRequestMessageBytes");
        this.zze = numZzc2;
        if (numZzc2 != null) {
            zzmt.zzj(numZzc2.intValue() >= 0, "maxOutboundMessageSize %s exceeds bounds", numZzc2);
        }
        Map mapZzj = z11 ? zzbkg.zzj(map, "retryPolicy") : null;
        if (mapZzj == null) {
            j11 = 0;
            zzbppVar = null;
        } else {
            Integer numZzc3 = zzbkg.zzc(mapZzj, "maxAttempts");
            zzmt.zzc(numZzc3, "maxAttempts cannot be empty");
            int iIntValue = numZzc3.intValue();
            zzmt.zzh(iIntValue >= 2, "maxAttempts must be greater than 1: %s", iIntValue);
            int iMin = Math.min(iIntValue, 5);
            Long lZzd = zzbkg.zzd(mapZzj, "initialBackoff");
            zzmt.zzc(lZzd, "initialBackoff cannot be empty");
            long jLongValue = lZzd.longValue();
            zzmt.zzi(jLongValue > 0, "initialBackoffNanos must be greater than 0: %s", jLongValue);
            Long lZzd2 = zzbkg.zzd(mapZzj, "maxBackoff");
            zzmt.zzc(lZzd2, "maxBackoff cannot be empty");
            long jLongValue2 = lZzd2.longValue();
            zzmt.zzi(jLongValue2 > 0, "maxBackoff must be greater than 0: %s", jLongValue2);
            Double dZzb = zzbkg.zzb(mapZzj, "backoffMultiplier");
            zzmt.zzc(dZzb, "backoffMultiplier cannot be empty");
            double dDoubleValue = dZzb.doubleValue();
            j11 = 0;
            zzmt.zzj(dDoubleValue > 0.0d, "backoffMultiplier must be greater than 0: %s", dZzb);
            Long lZzd3 = zzbkg.zzd(mapZzj, "perAttemptRecvTimeout");
            zzmt.zzj(lZzd3 == null || lZzd3.longValue() >= 0, "perAttemptRecvTimeout cannot be negative: %s", lZzd3);
            Set setZzb = zzbqh.zzb(mapZzj);
            zzmt.zzf((lZzd3 == null && setZzb.isEmpty()) ? false : true, "retryableStatusCodes cannot be empty without perAttemptRecvTimeout");
            zzbppVar = new zzbpp(iMin, jLongValue, jLongValue2, dDoubleValue, lZzd3, setZzb);
        }
        this.zzf = zzbppVar;
        Map mapZzj2 = z11 ? zzbkg.zzj(map, "hedgingPolicy") : null;
        if (mapZzj2 == null) {
            zzbjeVar = null;
        } else {
            Integer numZzc4 = zzbkg.zzc(mapZzj2, "maxAttempts");
            zzmt.zzc(numZzc4, "maxAttempts cannot be empty");
            int iIntValue2 = numZzc4.intValue();
            zzmt.zzh(iIntValue2 >= 2, "maxAttempts must be greater than 1: %s", iIntValue2);
            int iMin2 = Math.min(iIntValue2, 5);
            Long lZzd4 = zzbkg.zzd(mapZzj2, "hedgingDelay");
            zzmt.zzc(lZzd4, "hedgingDelay cannot be empty");
            long jLongValue3 = lZzd4.longValue();
            zzmt.zzi(jLongValue3 >= j11, "hedgingDelay must not be negative: %s", jLongValue3);
            zzbjeVar = new zzbje(iMin2, jLongValue3, zzbqh.zza(mapZzj2));
        }
        this.zzg = zzbjeVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof zzbmg)) {
            return false;
        }
        zzbmg zzbmgVar = (zzbmg) obj;
        return zzmo.zza(this.zzb, zzbmgVar.zzb) && zzmo.zza(this.zzc, zzbmgVar.zzc) && zzmo.zza(this.zzd, zzbmgVar.zzd) && zzmo.zza(this.zze, zzbmgVar.zze) && zzmo.zza(this.zzf, zzbmgVar.zzf) && zzmo.zza(this.zzg, zzbmgVar.zzg);
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.zzb, this.zzc, this.zzd, this.zze, this.zzf, this.zzg});
    }

    public final String toString() {
        zzmm zzmmVarZzb = zzmn.zzb(this);
        zzmmVarZzb.zzd("timeoutNanos", this.zzb);
        zzmmVarZzb.zzd("waitForReady", this.zzc);
        zzmmVarZzb.zzd("maxInboundMessageSize", this.zzd);
        zzmmVarZzb.zzd("maxOutboundMessageSize", this.zze);
        zzmmVarZzb.zzd("retryPolicy", this.zzf);
        zzmmVarZzb.zzd("hedgingPolicy", this.zzg);
        return zzmmVarZzb.toString();
    }
}
