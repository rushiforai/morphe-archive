package com.google.android.libraries.places.internal;

import b.c0;
import b.u4;
import java.util.EnumMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
final class zzbsi {
    private final Logger zza;
    private final Level zzb;

    public zzbsi(Level level, Class cls) {
        Logger logger = Logger.getLogger(cls.getName());
        zzmt.zzc(level, "level");
        this.zzb = level;
        zzmt.zzc(logger, "logger");
        this.zza = logger;
    }

    private static String zzk(zzbwb zzbwbVar) {
        return zzbwbVar.zzg() <= 64 ? zzbwbVar.zzz().zze() : String.valueOf(zzbwbVar.zzA((int) Math.min(zzbwbVar.zzg(), 64L)).zze()).concat("...");
    }

    private final boolean zzl() {
        return this.zza.isLoggable(this.zzb);
    }

    public final void zza(int i5, int i11, zzbwb zzbwbVar, int i12, boolean z11) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logData", zzbsg.zza(i5) + " DATA: streamId=" + i11 + " endStream=" + z11 + " length=" + i12 + " bytes=" + zzk(zzbwbVar));
        }
    }

    public final void zzb(int i5, int i11, zzbtp zzbtpVar, zzbwf zzbwfVar) {
        if (zzl()) {
            Logger logger = this.zza;
            Level level = this.zzb;
            String strZza = zzbsg.zza(i5);
            String strValueOf = String.valueOf(zzbtpVar);
            int iZzc = zzbwfVar.zzc();
            zzbwb zzbwbVar = new zzbwb();
            zzbwbVar.zzk(zzbwfVar);
            logger.logp(level, "io.grpc.okhttp.OkHttpFrameLogger", "logGoAway", strZza + " GO_AWAY: lastStreamId=" + i11 + " errorCode=" + strValueOf + " length=" + iZzc + " bytes=" + zzk(zzbwbVar));
        }
    }

    public final void zzc(int i5, int i11, List list, boolean z11) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logHeaders", "INBOUND HEADERS: streamId=" + i11 + " headers=" + list.toString() + " endStream=" + z11);
        }
    }

    public final void zzd(int i5, long j11) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logPing", zzbsg.zza(i5) + " PING: ack=false bytes=" + j11);
        }
    }

    public final void zze(int i5, long j11) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logPingAck", zzbsg.zza(2) + " PING: ack=true bytes=" + j11);
        }
    }

    public final void zzf(int i5, int i11, int i12, List list) {
        if (zzl()) {
            Logger logger = this.zza;
            Level level = this.zzb;
            String string = list.toString();
            StringBuilder sbT = c0.t(i11, "INBOUND PUSH_PROMISE: streamId=", " promisedStreamId=", i12, " headers=");
            sbT.append(string);
            logger.logp(level, "io.grpc.okhttp.OkHttpFrameLogger", "logPushPromise", sbT.toString());
        }
    }

    public final void zzg(int i5, int i11, zzbtp zzbtpVar) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logRstStream", zzbsg.zza(i5) + " RST_STREAM: streamId=" + i11 + " errorCode=" + String.valueOf(zzbtpVar));
        }
    }

    public final void zzh(int i5, zzbue zzbueVar) {
        if (zzl()) {
            Logger logger = this.zza;
            Level level = this.zzb;
            String strZza = zzbsg.zza(i5);
            EnumMap enumMap = new EnumMap(zzbsh.class);
            for (zzbsh zzbshVar : zzbsh.values()) {
                if (zzbueVar.zzf(zzbshVar.zza())) {
                    enumMap.put((EnumMap) zzbshVar, (zzbsh) Integer.valueOf(zzbueVar.zza(zzbshVar.zza())));
                }
            }
            logger.logp(level, "io.grpc.okhttp.OkHttpFrameLogger", "logSettings", u4.m(strZza, " SETTINGS: ack=false settings=", enumMap.toString()));
        }
    }

    public final void zzi(int i5) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logSettingsAck", zzbsg.zza(2).concat(" SETTINGS: ack=true"));
        }
    }

    public final void zzj(int i5, int i11, long j11) {
        if (zzl()) {
            this.zza.logp(this.zzb, "io.grpc.okhttp.OkHttpFrameLogger", "logWindowsUpdate", zzbsg.zza(i5) + " WINDOW_UPDATE: streamId=" + i11 + " windowSizeIncrement=" + j11);
        }
    }
}
