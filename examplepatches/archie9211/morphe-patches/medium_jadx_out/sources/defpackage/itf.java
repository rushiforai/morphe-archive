package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class itf extends fnf {
    private static final itf zze;
    private static volatile mof zzf;
    private int zza = 0;
    private Object zzd;

    static {
        itf itfVar = new itf();
        zze = itfVar;
        fnf.l(itf.class, itfVar);
    }

    public static gtf v() {
        return (gtf) zze.h();
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u000b\u0001\u0000\u0001\u000b\u000b\u0000\u0000\u0000\u0001:\u0000\u0002=\u0000\u0003Ȼ\u0000\u0004B\u0000\u0005B\u0000\u0006>\u0000\u0007C\u0000\b6\u0000\t4\u0000\n3\u0000\u000bȻ\u0000", new Object[]{"zzd", "zza"});
        }
        if (i2 == 3) {
            return new itf();
        }
        if (i2 == 4) {
            return new gtf(zze);
        }
        if (i2 == 5) {
            return zze;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzf;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (itf.class) {
            try {
                dnfVar = zzf;
                if (dnfVar == null) {
                    dnfVar = new dnf(zze);
                    zzf = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void w() {
        this.zza = 1;
        this.zzd = Boolean.TRUE;
    }

    public final /* synthetic */ void x() {
        long j = Build.TIME;
        this.zza = 7;
        this.zzd = Long.valueOf(j);
    }

    public final /* synthetic */ void y(String str) {
        str.getClass();
        this.zza = 11;
        this.zzd = str;
    }
}
