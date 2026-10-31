package x4;

import java.util.ArrayList;
import z.c1;

/* loaded from: classes2.dex */
public final class e implements z4.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95077a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f95078b;

    public /* synthetic */ e(Object obj, int i5) {
        this.f95077a = i5;
        this.f95078b = obj;
    }

    @Override // z4.a
    public final void accept(Object obj) {
        switch (this.f95077a) {
            case 0:
                f fVar = (f) obj;
                if (fVar == null) {
                    fVar = new f(-3);
                }
                ((og.i) this.f95078b).m(fVar);
                return;
            default:
                f fVar2 = (f) obj;
                synchronized (g.f95083c) {
                    try {
                        c1 c1Var = g.f95084d;
                        ArrayList arrayList = (ArrayList) c1Var.get((String) this.f95078b);
                        if (arrayList == null) {
                            return;
                        }
                        c1Var.remove((String) this.f95078b);
                        for (int i5 = 0; i5 < arrayList.size(); i5++) {
                            ((z4.a) arrayList.get(i5)).accept(fVar2);
                        }
                        return;
                    } finally {
                    }
                }
        }
    }
}
