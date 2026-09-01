package defpackage;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ctf extends fnf {
    private static final ctf zzk;
    private static volatile mof zzl;
    private int zza;
    private int zzd;
    private int zze;
    private int zzf;
    private int zzg;
    private zsf zzh;
    private int zzi;
    private ltf zzj;

    static {
        ctf ctfVar = new ctf();
        zzk = ctfVar;
        fnf.l(ctf.class, ctfVar);
    }

    public static btf v() {
        return (btf) zzk.h();
    }

    public final /* synthetic */ void w(int i) {
        this.zzi = i;
    }

    public final /* synthetic */ void x(int i) {
        this.zzd = i - 2;
    }

    public final /* synthetic */ void y(int i) {
        this.zzf = i - 2;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzk, "\u0000\u0007\u0000\u0001\u0001\u0007\u0007\u0000\u0000\u0000\u0001\f\u0002\u000b\u0003\f\u0004\f\u0005ဉ\u0000\u0006\u000b\u0007ဉ\u0001", new Object[]{"zza", QFTsJPDEnO.uqNMzzvtzxezpBS, "zze", "zzf", "zzg", "zzh", "zzi", "zzj"});
        }
        if (i2 == 3) {
            return new ctf();
        }
        if (i2 == 4) {
            return new btf(zzk);
        }
        if (i2 == 5) {
            return zzk;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzl;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (ctf.class) {
            try {
                dnfVar = zzl;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzk);
                    zzl = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
