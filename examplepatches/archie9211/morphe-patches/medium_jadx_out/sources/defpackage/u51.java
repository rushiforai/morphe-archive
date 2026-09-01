package defpackage;

import androidx.work.impl.WorkDatabase;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class u51 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ WorkDatabase b;
    public final /* synthetic */ String c;
    public final /* synthetic */ m7f d;

    public /* synthetic */ u51(WorkDatabase workDatabase, String str, m7f m7fVar, int i) {
        this.a = i;
        this.b = workDatabase;
        this.c = str;
        this.d = m7fVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        m7f m7fVar = this.d;
        String str = this.c;
        WorkDatabase workDatabase = this.b;
        switch (i) {
            case 0:
                g8f g8fVarX = workDatabase.x();
                g8fVarX.getClass();
                str.getClass();
                Iterator it2 = ((List) n01.c0(g8fVarX.a, true, false, new nmc(str, 16))).iterator();
                while (it2.hasNext()) {
                    bgf.u(m7fVar, (String) it2.next());
                }
                break;
            default:
                g8f g8fVarX2 = workDatabase.x();
                g8fVarX2.getClass();
                Iterator it3 = ((List) n01.c0(g8fVarX2.a, true, false, new nmc(str, 21))).iterator();
                while (it3.hasNext()) {
                    bgf.u(m7fVar, (String) it3.next());
                }
                break;
        }
    }
}
