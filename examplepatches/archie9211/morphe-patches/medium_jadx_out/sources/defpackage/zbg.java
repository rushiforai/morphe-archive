package defpackage;

import android.os.Build;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zbg extends h5g {
    private static final zbg zzb;
    private int zzd;
    private int zzh;
    private long zzi;
    private long zzj;
    private boolean zzk;
    private int zzl;
    private int zzm;
    private long zzn;
    private int zzs;
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzo = "";
    private String zzp = "";
    private String zzq = "";
    private String zzr = "";

    static {
        zbg zbgVar = new zbg();
        zzb = zbgVar;
        h5g.f(zbg.class, zbgVar);
    }

    public static sbg A() {
        return (sbg) zzb.k();
    }

    public static /* synthetic */ void B(zbg zbgVar, int i) {
        zbgVar.zzd |= 128;
        zbgVar.zzl = i;
    }

    public static /* synthetic */ void C(zbg zbgVar, int i) {
        zbgVar.zzd |= 256;
        zbgVar.zzm = i;
    }

    public static /* synthetic */ void D(zbg zbgVar, int i) {
        zbgVar.zzd |= 8;
        zbgVar.zzh = i;
    }

    public static /* synthetic */ void E(zbg zbgVar, long j) {
        zbgVar.zzd |= 16;
        zbgVar.zzi = j;
    }

    public static /* synthetic */ void F(zbg zbgVar, long j) {
        zbgVar.zzd |= 32;
        zbgVar.zzj = j;
    }

    public static /* synthetic */ void q(zbg zbgVar) {
        zbgVar.zzd |= 512;
        zbgVar.zzn = 912213584L;
    }

    public static /* synthetic */ void r(zbg zbgVar, String str) {
        str.getClass();
        zbgVar.zzd |= 4;
        zbgVar.zzg = str;
    }

    public static /* synthetic */ void s(zbg zbgVar) {
        String str = Build.BRAND;
        str.getClass();
        zbgVar.zzd |= 1024;
        zbgVar.zzo = str;
    }

    public static /* synthetic */ void t(zbg zbgVar) {
        String str = Build.FINGERPRINT;
        str.getClass();
        zbgVar.zzd |= 8192;
        zbgVar.zzr = str;
    }

    public static /* synthetic */ void u(zbg zbgVar) {
        String str = Build.MANUFACTURER;
        str.getClass();
        zbgVar.zzd |= 4096;
        zbgVar.zzq = str;
    }

    public static /* synthetic */ void v(zbg zbgVar) {
        String str = Build.MODEL;
        str.getClass();
        zbgVar.zzd |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        zbgVar.zzp = str;
    }

    public static /* synthetic */ void w(zbg zbgVar, int i) {
        zbgVar.zzd |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
        zbgVar.zzs = i;
    }

    public static /* synthetic */ void x(zbg zbgVar, boolean z) {
        zbgVar.zzd |= 64;
        zbgVar.zzk = z;
    }

    public static /* synthetic */ void y(zbg zbgVar) {
        zbgVar.zzd |= 1;
        zbgVar.zze = "9.0.0";
    }

    public static /* synthetic */ void z(zbg zbgVar, String str) {
        zbgVar.zzd |= 2;
        zbgVar.zzf = str;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\u000f\u0000\u0001\u0001\u000f\u000f\u0000\u0000\u0000\u0001ဈ\u0000\u0002ဈ\u0002\u0003င\u0003\u0004ဂ\u0004\u0005ဈ\u0001\u0006ဂ\u0005\u0007ဇ\u0006\bင\u0007\tင\b\nဂ\t\u000bဈ\n\fဈ\u000b\rဈ\f\u000eဈ\r\u000fင\u000e", new Object[]{"zzd", "zze", "zzg", "zzh", "zzi", "zzf", "zzj", "zzk", "zzl", "zzm", "zzn", "zzo", "zzp", "zzq", "zzr", "zzs"});
        }
        if (i2 == 3) {
            return new zbg();
        }
        if (i2 == 4) {
            return new sbg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
