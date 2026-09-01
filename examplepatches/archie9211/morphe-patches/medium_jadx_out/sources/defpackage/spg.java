package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class spg extends fnf {
    private static final spg zzh;
    private static volatile mof zzi;
    private int zza;
    private epg zzd;
    private int zze;
    private int zzf;
    private int zzg;

    static {
        spg spgVar = new spg();
        zzh = spgVar;
        fnf.l(spg.class, spgVar);
    }

    public static ppg y() {
        return (ppg) zzh.h();
    }

    public final /* synthetic */ void A(int i) {
        this.zzf = i;
    }

    public final int B() {
        int i = this.zze;
        int i2 = i != 0 ? i != 1 ? i != 2 ? i != 3 ? 0 : 5 : 4 : 3 : 2;
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    public final int C() {
        int i = this.zzg;
        int i2 = 2;
        if (i != 0) {
            if (i == 1) {
                i2 = 3;
            } else if (i != 2) {
                i2 = 5;
                if (i != 3) {
                    i2 = i != 4 ? i != 5 ? 0 : 7 : 6;
                }
            } else {
                i2 = 4;
            }
        }
        if (i2 == 0) {
            return 1;
        }
        return i2;
    }

    public final void D(int i) {
        if (i != 1) {
            this.zze = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    public final void E(int i) {
        if (i != 1) {
            this.zzg = i - 2;
        } else {
            tnf.a();
            throw null;
        }
    }

    public final boolean v() {
        return (this.zza & 1) != 0;
    }

    public final epg w() {
        epg epgVar = this.zzd;
        return epgVar == null ? epg.y() : epgVar;
    }

    public final int x() {
        return this.zzf;
    }

    public final /* synthetic */ void z(epg epgVar) {
        this.zzd = epgVar;
        this.zza |= 1;
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zzh, "\u0000\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001ဉ\u0000\u0002\f\u0003\u000b\u0004\f", new Object[]{pUlNWdybf.kdxpNXoADzpkW, "zzd", "zze", "zzf", "zzg"});
        }
        if (i2 == 3) {
            return new spg();
        }
        if (i2 == 4) {
            return new ppg(zzh);
        }
        if (i2 == 5) {
            return zzh;
        }
        if (i2 != 6) {
            throw null;
        }
        mof mofVar = zzi;
        if (mofVar != null) {
            return mofVar;
        }
        synchronized (spg.class) {
            try {
                dnfVar = zzi;
                if (dnfVar == null) {
                    dnfVar = new dnf(zzh);
                    zzi = dnfVar;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return dnfVar;
    }
}
