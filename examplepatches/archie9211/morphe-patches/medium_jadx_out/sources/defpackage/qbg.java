package defpackage;

import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qbg extends h5g {
    private static final qbg zzb;
    private int zzd;
    private int zzf;
    private fbg zzi;
    private boolean zzj;
    private boolean zzk;
    private odg zzl;
    private String zze = "";
    private o5g zzg = j5g.e;
    private q5g zzh = z7g.e;

    static {
        qbg qbgVar = new qbg();
        zzb = qbgVar;
        h5g.f(qbg.class, qbgVar);
    }

    public static mbg q() {
        return (mbg) zzb.k();
    }

    public static void r(qbg qbgVar, lbg lbgVar) {
        lbgVar.getClass();
        RandomAccess randomAccess = qbgVar.zzg;
        boolean z = ((e3g) randomAccess).a;
        RandomAccess randomAccess2 = randomAccess;
        if (!z) {
            j5g j5gVar = (j5g) randomAccess;
            int i = j5gVar.c;
            j5g j5gVarF = j5gVar.c(i + i);
            qbgVar.zzg = j5gVarF;
            randomAccess2 = j5gVarF;
        }
        ((j5g) randomAccess2).m(lbgVar.zza());
    }

    public static /* synthetic */ void s(qbg qbgVar, fbg fbgVar) {
        qbgVar.zzi = fbgVar;
        qbgVar.zzd |= 4;
    }

    public static /* synthetic */ void t(qbg qbgVar) {
        qbgVar.zzd |= 1;
        qbgVar.zze = "ProxyBillingBroadcastReceiver";
    }

    public static /* synthetic */ void u(qbg qbgVar, odg odgVar) {
        qbgVar.zzl = odgVar;
        qbgVar.zzd |= 32;
    }

    public static /* synthetic */ void v(qbg qbgVar, int i) {
        qbgVar.zzf = i - 1;
        qbgVar.zzd |= 2;
    }

    @Override // defpackage.h5g
    public final Object j(int i) {
        int i2 = i - 1;
        if (i2 == 0) {
            return (byte) 1;
        }
        if (i2 == 2) {
            return new b8g(zzb, "\u0004\b\u0000\u0001\u0001\b\b\u0000\u0002\u0000\u0001ဈ\u0000\u0002᠌\u0001\u0003ࠬ\u0004\u001b\u0005ဉ\u0002\u0006ဇ\u0003\u0007ဇ\u0004\bဉ\u0005", new Object[]{"zzd", "zze", "zzf", y2g.f, "zzg", y2g.e, "zzh", hdg.class, "zzi", "zzj", "zzk", "zzl"});
        }
        if (i2 == 3) {
            return new qbg();
        }
        if (i2 == 4) {
            return new mbg(zzb);
        }
        if (i2 == 5) {
            return zzb;
        }
        throw null;
    }
}
