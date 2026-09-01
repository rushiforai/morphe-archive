package defpackage;

import java.io.IOException;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hg3 extends ufd {
    public final /* synthetic */ int e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hg3(zva zvaVar) {
        super(ka1.v(new StringBuilder(), zvaVar.m, " writer"), true);
        this.e = 2;
        this.f = zvaVar;
    }

    private final long b() {
        eva evaVar = (eva) this.f;
        long jNanoTime = System.nanoTime();
        long j = (jNanoTime - evaVar.a) + 1;
        Iterator it2 = evaVar.d.iterator();
        it2.getClass();
        dva dvaVar = null;
        long j2 = Long.MAX_VALUE;
        int i = 0;
        dva dvaVar2 = null;
        dva dvaVar3 = null;
        int i2 = 0;
        while (it2.hasNext()) {
            dva dvaVar4 = (dva) it2.next();
            dvaVar4.getClass();
            synchronized (dvaVar4) {
                if (evaVar.a(dvaVar4, jNanoTime) > 0) {
                    i2++;
                } else {
                    long j3 = dvaVar4.q;
                    if (j3 < j) {
                        dvaVar2 = dvaVar4;
                        j = j3;
                    }
                    i++;
                    if (j3 < j2) {
                        dvaVar3 = dvaVar4;
                        j2 = j3;
                    }
                }
            }
        }
        if (dvaVar2 != null) {
            dvaVar = dvaVar2;
        } else if (i > 5) {
            j = j2;
            dvaVar = dvaVar3;
        } else {
            j = -1;
        }
        if (dvaVar == null) {
            if (dvaVar3 != null) {
                return (j2 + evaVar.a) - jNanoTime;
            }
            if (i2 > 0) {
                return evaVar.a;
            }
            return -1L;
        }
        synchronized (dvaVar) {
            if (!dvaVar.p.isEmpty()) {
                return 0L;
            }
            if (dvaVar.q != j) {
                return 0L;
            }
            dvaVar.j = true;
            evaVar.d.remove(dvaVar);
            ggf.c(dvaVar.e);
            if (evaVar.d.isEmpty()) {
                evaVar.b.a();
            }
            return 0L;
        }
    }

    @Override // defpackage.ufd
    public final long a() {
        switch (this.e) {
            case 0:
                lg3 lg3Var = (lg3) this.f;
                synchronized (lg3Var) {
                    if (lg3Var.m && !lg3Var.n) {
                        try {
                            lg3Var.U();
                        } catch (IOException unused) {
                            lg3Var.o = true;
                        }
                        try {
                            if (lg3Var.I()) {
                                lg3Var.R();
                                lg3Var.j = 0;
                            }
                        } catch (IOException unused2) {
                            lg3Var.p = true;
                            xua xuaVar = lg3Var.h;
                            if (xuaVar != null) {
                                egf.b(xuaVar);
                            }
                            lg3Var.h = new xua(new as0());
                        }
                    }
                    break;
                }
                return -1L;
            case 1:
                return b();
            default:
                zva zvaVar = (zva) this.f;
                try {
                    return zvaVar.j() ? 0L : -1L;
                } catch (IOException e) {
                    zva.c(zvaVar, e, 2);
                    return -1L;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hg3(int i, Object obj, String str) {
        super(str, true);
        this.e = i;
        this.f = obj;
    }
}
