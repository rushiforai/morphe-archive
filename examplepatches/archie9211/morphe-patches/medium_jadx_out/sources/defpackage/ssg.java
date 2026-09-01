package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzale;
import java.io.ByteArrayInputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ssg extends ytf {
    private static final ssg zzc;
    private static volatile ouf zzd;
    private int zze;
    private duf zzf = puf.e;

    static {
        ssg ssgVar = new ssg();
        zzc = ssgVar;
        ytf.j(ssg.class, ssgVar);
    }

    public static rsg A() {
        return (rsg) zzc.o();
    }

    public static ssg v(ByteArrayInputStream byteArrayInputStream, ptf ptfVar) throws zzale {
        ytf ytfVarG = ytf.g(zzc, new atf(byteArrayInputStream), ptfVar);
        ytf.l(ytfVarG);
        return (ssg) ytfVarG;
    }

    public static ssg w(byte[] bArr, ptf ptfVar) {
        return (ssg) ytf.i(zzc, bArr, ptfVar);
    }

    public static void y(ssg ssgVar, qsg qsgVar) {
        duf dufVarE = ssgVar.zzf;
        if (!((puf) dufVarE).a) {
            puf pufVar = (puf) dufVarE;
            dufVarE = pufVar.e(pufVar.c << 1);
            ssgVar.zzf = dufVarE;
        }
        ((puf) dufVarE).add(qsgVar);
    }

    public final duf B() {
        return this.zzf;
    }

    @Override // defpackage.ytf
    public final Object d(int i) {
        ouf wtfVar;
        switch (osg.a[i - 1]) {
            case 1:
                return new ssg();
            case 2:
                return new rsg(zzc);
            case 3:
                return new ruf(zzc, "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u000b\u0002\u001b", new Object[]{"zze", "zzf", qsg.class});
            case 4:
                return zzc;
            case 5:
                ouf oufVar = zzd;
                if (oufVar != null) {
                    return oufVar;
                }
                synchronized (ssg.class) {
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

    public final int t() {
        return ((puf) this.zzf).size();
    }

    public final qsg u(int i) {
        return (qsg) ((puf) this.zzf).get(i);
    }

    public final int z() {
        return this.zze;
    }
}
