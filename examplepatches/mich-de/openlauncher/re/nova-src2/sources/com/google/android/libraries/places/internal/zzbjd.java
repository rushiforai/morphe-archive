package com.google.android.libraries.places.internal;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.InetSocketAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.util.Collections;
import java.util.EnumSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class zzbjd {
    public static final zzbca zzc;
    public static final zzbca zzd;
    public static final zzbca zze;
    public static final zzbca zzf;
    static final zzbca zzg;
    public static final zzbca zzh;
    public static final zzbca zzi;
    public static final zzbca zzj;
    public static final zzmy zzk;
    public static final long zzl;
    public static final zzbde zzm;
    public static final zzbde zzn;
    public static final zzayh zzo;
    public static final zzbql zzp;
    public static final zzbql zzq;
    public static final zznc zzr;
    private static final zzayx zzu;
    private static final Logger zzs = Logger.getLogger(zzbjd.class.getName());
    private static final Set zzt = Collections.unmodifiableSet(EnumSet.of(zzbdj.OK, zzbdj.INVALID_ARGUMENT, zzbdj.NOT_FOUND, zzbdj.ALREADY_EXISTS, zzbdj.FAILED_PRECONDITION, zzbdj.ABORTED, zzbdj.OUT_OF_RANGE, zzbdj.DATA_LOSS));
    public static final Charset zza = Charset.forName("US-ASCII");
    public static final zzbca zzb = zzbca.zzc("grpc-timeout", new zzbjc());

    static {
        zzbbx zzbbxVar = zzbcf.zzb;
        zzc = zzbca.zzc("grpc-encoding", zzbbxVar);
        zzd = zzbar.zzb("grpc-accept-encoding", new zzbja(null));
        zze = zzbca.zzc("content-encoding", zzbbxVar);
        zzf = zzbar.zzb("accept-encoding", new zzbja(null));
        zzg = zzbca.zzc("content-length", zzbbxVar);
        zzh = zzbca.zzc("content-type", zzbbxVar);
        zzi = zzbca.zzc("te", zzbbxVar);
        zzj = zzbca.zzc("user-agent", zzbbxVar);
        zzk = zzmy.zzb(zzma.zzb(AbstractJsonLexerKt.COMMA)).zzc(zzma.zzc());
        TimeUnit timeUnit = TimeUnit.SECONDS;
        zzl = timeUnit.toNanos(20L);
        TimeUnit.HOURS.toNanos(2L);
        timeUnit.toNanos(20L);
        zzm = new zzbnu();
        zzn = new zzbiu();
        zzo = zzayh.zza("io.grpc.internal.CALL_OPTIONS_RPC_OWNED_BY_BALANCER");
        zzu = new zzbiv();
        zzp = new zzbiw();
        zzq = new zzbix();
        zzr = new zzbiy();
    }

    private zzbjd() {
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0035  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static zzbdo zza(int i5) {
        zzbdj zzbdjVar;
        if ((i5 < 100 || i5 >= 200) && i5 != 400) {
            if (i5 == 401) {
                zzbdjVar = zzbdj.UNAUTHENTICATED;
            } else if (i5 == 403) {
                zzbdjVar = zzbdj.PERMISSION_DENIED;
            } else if (i5 == 404) {
                zzbdjVar = zzbdj.UNIMPLEMENTED;
            } else if (i5 == 429) {
                zzbdjVar = zzbdj.UNAVAILABLE;
            } else if (i5 != 431) {
                switch (i5) {
                    case PglCryptUtils.INPUT_INVALID /* 502 */:
                    case PglCryptUtils.COMPRESS_FAILED /* 503 */:
                    case PglCryptUtils.BASE64_FAILED /* 504 */:
                        break;
                    default:
                        zzbdjVar = zzbdj.UNKNOWN;
                        break;
                }
            } else {
                zzbdjVar = zzbdj.INTERNAL;
            }
        }
        return zzbdjVar.zzb().zzg("HTTP status code " + i5);
    }

    public static zzbdo zzb(zzbdo zzbdoVar) {
        if (!zzt.contains(zzbdoVar.zza())) {
            return zzbdoVar;
        }
        return zzbdo.zzo.zzg("Inappropriate status code from control plane: " + zzbdoVar.zza().toString() + " " + zzbdoVar.zzi()).zzf(zzbdoVar.zzj());
    }

    public static zzbfu zzc(zzbbe zzbbeVar, boolean z11) {
        zzbfu zzbfuVarZzh;
        zzbbj zzbbjVarZze = zzbbeVar.zze();
        if (zzbbjVarZze != null) {
            zzblx zzblxVar = (zzblx) zzbbjVarZze;
            zzmt.zzp(zzblxVar.zzg, "Subchannel is not started");
            zzbfuVarZzh = zzblxVar.zzf.zzh();
        } else {
            zzbfuVarZzh = null;
        }
        if (zzbfuVarZzh != null) {
            return zzbfuVarZzh;
        }
        if (!zzbbeVar.zzf().zzl()) {
            if (zzbbeVar.zzg()) {
                return new zzbim(zzb(zzbbeVar.zzf()), zzbfs.DROPPED);
            }
            if (!z11) {
                return new zzbim(zzb(zzbbeVar.zzf()), zzbfs.PROCESSED);
            }
        }
        return null;
    }

    public static String zzd(String str, int i5) {
        try {
            return new URI(null, null, "places.googleapis.com", 443, null, null, null).getAuthority();
        } catch (URISyntaxException e3) {
            throw new IllegalArgumentException("Invalid host or port: places.googleapis.com 443", e3);
        }
    }

    public static String zze(InetSocketAddress inetSocketAddress) {
        try {
            return (String) InetSocketAddress.class.getMethod("getHostString", null).invoke(inetSocketAddress, null);
        } catch (IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
            return inetSocketAddress.getHostName();
        }
    }

    public static URI zzf(String str) {
        String str2;
        zzmt.zzc(str, "authority");
        try {
            str2 = str;
            try {
                return new URI(null, str2, null, null, null);
            } catch (URISyntaxException e3) {
                e = e3;
                throw new IllegalArgumentException("Invalid authority: ".concat(String.valueOf(str2)), e);
            }
        } catch (URISyntaxException e11) {
            e = e11;
            str2 = str;
        }
    }

    public static ThreadFactory zzg(String str, boolean z11) {
        zzakd zzakdVar = new zzakd();
        zzakdVar.zza(true);
        zzakdVar.zzb(str);
        return zzakdVar.zzc();
    }

    public static void zzh(zzbqq zzbqqVar) throws IOException {
        while (true) {
            InputStream inputStreamZza = zzbqqVar.zza();
            if (inputStreamZza == null) {
                return;
            } else {
                zzi(inputStreamZza);
            }
        }
    }

    public static void zzi(Closeable closeable) throws IOException {
        try {
            closeable.close();
        } catch (IOException e3) {
            zzs.logp(Level.WARNING, "io.grpc.internal.GrpcUtil", "closeQuietly", "exception caught in closeQuietly", (Throwable) e3);
        }
    }

    public static boolean zzj(String str, boolean z11) {
        String strTrim = System.getenv(str);
        if (strTrim == null) {
            strTrim = System.getProperty(str);
        }
        if (strTrim != null) {
            strTrim = strTrim.trim();
        }
        return zznb.zzd(strTrim) || Boolean.parseBoolean(strTrim);
    }

    public static zzayx[] zzk(zzayj zzayjVar, zzbcf zzbcfVar, int i5, boolean z11) {
        List listZzm = zzayjVar.zzm();
        int size = listZzm.size();
        zzayx[] zzayxVarArr = new zzayx[size + 1];
        zzayv zzayvVarZza = zzayw.zza();
        zzayvVarZza.zza(zzayjVar);
        zzayvVarZza.zzc(i5);
        zzayvVarZza.zzb(z11);
        zzayw zzaywVarZzd = zzayvVarZza.zzd();
        for (int i11 = 0; i11 < listZzm.size(); i11++) {
            zzayxVarArr[i11] = ((zzayu) listZzm.get(i11)).zza(zzaywVarZzd, zzbcfVar);
        }
        zzayxVarArr[size] = zzu;
        return zzayxVarArr;
    }
}
