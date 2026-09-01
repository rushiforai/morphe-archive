package defpackage;

import android.os.Build;
import java.util.Iterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ypf extends fnf {
    private static final ypf zzj;
    private static volatile mof zzk;
    private int zza;
    private String zzd = "";
    private String zze = "";
    private String zzf = "";
    private String zzg = "";
    private String zzh = "";
    private qnf zzi = gnf.e;

    static {
        ypf ypfVar = new ypf();
        zzj = ypfVar;
        fnf.l(ypf.class, ypfVar);
    }

    public static wpf v() {
        return (wpf) zzj.h();
    }

    public final /* synthetic */ void A(String str) {
        String str2 = Build.MANUFACTURER;
        str2.getClass();
        this.zzg = str2;
    }

    public final /* synthetic */ void B(String str) {
        str.getClass();
        this.zzh = str;
    }

    public final void C(Iterable iterable) {
        RandomAccess randomAccess = this.zzi;
        if (!((fmf) randomAccess).a) {
            gnf gnfVar = (gnf) randomAccess;
            int i = gnfVar.c;
            this.zzi = gnfVar.n(i + i);
        }
        Iterator it2 = iterable.iterator();
        while (it2.hasNext()) {
            xpf xpfVar = (xpf) it2.next();
            ((gnf) this.zzi).m(xpfVar.zza());
        }
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzj, "\u0000\u0007\u0000\u0000\u0001\u0007\u0007\u0000\u0001\u0000\u0001\u0004\u0002Ȉ\u0003Ȉ\u0004Ȉ\u0005Ȉ\u0006Ȉ\u0007,", new Object[]{"zza", "zzd", "zze", "zzf", "zzg", "zzh", "zzi"});
        }
        if (i2 == 3) {
            return new ypf();
        }
        if (i2 == 4) {
            return new wpf(zzj);
        }
        if (i2 == 5) {
            return zzj;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzk;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ypf.class) {
            try {
                dnfVar = zzk;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzj);
                    zzk = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }

    public final /* synthetic */ void w(int i) {
        this.zza = i;
    }

    public final /* synthetic */ void x(String str) {
        str.getClass();
        this.zzd = str;
    }

    public final /* synthetic */ void y(String str) {
        this.zze = "18.9.1";
    }

    public final /* synthetic */ void z(String str) {
        String str2 = Build.MODEL;
        str2.getClass();
        this.zzf = str2;
    }
}
