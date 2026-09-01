package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e7c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ g7c d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e7c(g7c g7cVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = g7cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        g7c g7cVar = this.d;
        switch (i) {
            case 0:
                e7c e7cVar = new e7c(g7cVar, n92Var, 0);
                e7cVar.c = obj;
                return e7cVar;
            default:
                e7c e7cVar2 = new e7c(g7cVar, n92Var, 1);
                e7cVar2.c = obj;
                return e7cVar2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        t0c t0cVar = (t0c) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((e7c) create(t0cVar, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        boolean z;
        int i = this.b;
        g7c g7cVar = this.d;
        n92 n92Var = null;
        switch (i) {
            case 0:
                br7.v(obj);
                t0c t0cVar = (t0c) this.c;
                g7cVar.d.getClass();
                return t0c.a(t0cVar, null, bmd.a(), null, 5);
            default:
                br7.v(obj);
                t0c t0cVar2 = (t0c) this.c;
                v1a v1aVar = g7cVar.f;
                boolean zD = g7cVar.d(t0cVar2);
                Map mapB = t0cVar2.c;
                if (mapB != null) {
                    v1aVar.getClass();
                    z = false;
                    if (!v1aVar.f) {
                        ArrayList<w1a> arrayListE = v4.e(v1aVar.a);
                        ArrayList<f09> arrayList = new ArrayList();
                        for (w1a w1aVar : arrayListE) {
                            t1a t1aVar = (t1a) mapB.get(w1aVar.a);
                            f09 f09Var = t1aVar != null ? new f09(w1aVar, t1aVar) : null;
                            if (f09Var != null) {
                                arrayList.add(f09Var);
                            }
                        }
                        if (arrayList.isEmpty()) {
                            z = true;
                        } else {
                            for (f09 f09Var2 : arrayList) {
                                w1a w1aVar2 = (w1a) f09Var2.a;
                                t1a t1aVar2 = (t1a) f09Var2.b;
                                boolean zL = g76.L(v1aVar.a(), w1aVar2.a);
                                int i2 = w1aVar2.b;
                                if (zL) {
                                    if (i2 != t1aVar2.a || !g76.L((String) v1aVar.d.getValue(), t1aVar2.b)) {
                                    }
                                } else if (i2 != t1aVar2.a) {
                                }
                            }
                            z = true;
                        }
                    }
                    if (z) {
                        Log.d("FirebaseSessions", "Cold app start detected");
                    }
                } else {
                    Log.d("FirebaseSessions", "No process data map");
                    z = true;
                }
                boolean zC = g7cVar.c(t0cVar2);
                if (z) {
                    mapB = v1aVar.b(fy3.a);
                } else if (zC) {
                    mapB = v1aVar.b(mapB);
                }
                y0c y0cVar = z ? null : t0cVar2.a;
                if (!zD && !z) {
                    return zC ? t0c.a(t0cVar2, null, null, v1aVar.b(mapB), 3) : t0cVar2;
                }
                y0c y0cVarA = g7cVar.b.a(y0cVar);
                d1c d1cVar = g7cVar.c;
                vx0.c0(o7f.c(d1cVar.e), null, null, new uc0(d1cVar, y0cVarA, n92Var, 6), 3);
                v1aVar.f = true;
                return new t0c(y0cVarA, null, mapB);
        }
    }
}
