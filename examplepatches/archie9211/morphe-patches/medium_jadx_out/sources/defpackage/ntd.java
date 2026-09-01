package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ntd implements v72, nn0 {
    public final boolean a;
    public final ArrayList b = new ArrayList();
    public final s4c c;
    public final zu1 d;
    public final zu1 e;
    public final zu1 f;

    public ntd(tn0 tn0Var, t4c t4cVar) {
        this.a = t4cVar.e;
        this.c = t4cVar.a;
        zu1 zu1VarW = t4cVar.b.w();
        this.d = zu1VarW;
        zu1 zu1VarW2 = t4cVar.c.w();
        this.e = zu1VarW2;
        zu1 zu1VarW3 = t4cVar.d.w();
        this.f = zu1VarW3;
        tn0Var.d(zu1VarW);
        tn0Var.d(zu1VarW2);
        tn0Var.d(zu1VarW3);
        zu1VarW.a(this);
        zu1VarW2.a(this);
        zu1VarW3.a(this);
    }

    @Override // defpackage.nn0
    public final void a() {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.b;
            if (i >= arrayList.size()) {
                return;
            }
            ((nn0) arrayList.get(i)).a();
            i++;
        }
    }

    public final void d(nn0 nn0Var) {
        this.b.add(nn0Var);
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
    }
}
