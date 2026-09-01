package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class upg extends fnf {
    private static final upg zze;
    private static volatile mof zzf;
    private int zza;
    private snf zzd = qof.e;

    static {
        upg upgVar = new upg();
        zze = upgVar;
        fnf.l(upg.class, upgVar);
    }

    public static kpg A() {
        return (kpg) zze.h();
    }

    public static upg z(byte[] bArr, anf anfVar) {
        fnf fnfVarR = fnf.r(zze, bArr, bArr.length, anfVar);
        fnf.s(fnfVarR);
        return (upg) fnfVarR;
    }

    public final /* synthetic */ void B(int i) {
        this.zza = i;
    }

    public final void C(spg spgVar) {
        snf snfVarN = this.zzd;
        if (!((fmf) snfVarN).a) {
            int size = snfVarN.size();
            snfVarN = snfVarN.n(size + size);
            this.zzd = snfVarN;
        }
        snfVarN.add(spgVar);
    }

    @Override // defpackage.fnf
    public final Object t(int i) {
        mof dnfVar;
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new rof(zze, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"zza", "zzd", spg.class});
        }
        if (i2 == 3) {
            return new upg();
        }
        if (i2 == 4) {
            return new kpg(zze);
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
        synchronized (upg.class) {
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

    public final int v() {
        return this.zza;
    }

    public final snf w() {
        return this.zzd;
    }

    public final int x() {
        return this.zzd.size();
    }

    public final spg y(int i) {
        return (spg) this.zzd.get(i);
    }
}
