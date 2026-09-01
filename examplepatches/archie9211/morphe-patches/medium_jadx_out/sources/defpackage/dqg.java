package defpackage;

import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.io.ByteArrayInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class dqg extends ytf {
    private static final dqg zzc;
    private static volatile ouf zzd;
    private int zze;
    private hsf zzf = hsf.b;
    private xsg zzg;

    static {
        dqg dqgVar = new dqg();
        zzc = dqgVar;
        ytf.j(dqg.class, dqgVar);
    }

    public static dqg t(ByteArrayInputStream byteArrayInputStream, ptf ptfVar) throws zzale {
        ytf ytfVarG = ytf.g(zzc, new atf(byteArrayInputStream), ptfVar);
        ytf.l(ytfVarG);
        return (dqg) ytfVarG;
    }

    public static /* synthetic */ void u(dqg dqgVar, rsf rsfVar) {
        rsfVar.getClass();
        dqgVar.zzf = rsfVar;
    }

    public static /* synthetic */ void v(dqg dqgVar, xsg xsgVar) {
        dqgVar.zzg = xsgVar;
        dqgVar.zze |= 1;
    }

    public static cqg w() {
        return (cqg) zzc.o();
    }

    public final hsf x() {
        return this.zzf;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (bqg.a[i - 1]) {
            case 1:
                return new dqg();
            case 2:
                return new cqg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0001\u0002\u0003\u0002\u0000\u0000\u0000\u0002\n\u0003ဉ\u0000", new Object[]{"zze", "zzf", aJzfoQ.qba});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (dqg.class) {
                    try {
                        wtfVar = zzd;
                        if (wtfVar == null) {
                            wtfVar = new wtf();
                            zzd = wtfVar;
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                    break;
                }
                return wtfVar;
            case 6:
                return (byte) 1;
            default:
                throw null;
        }
    }
}
