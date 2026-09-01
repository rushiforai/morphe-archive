package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jaf implements do4 {
    public final /* synthetic */ int a;
    public final /* synthetic */ kbf b;

    public /* synthetic */ jaf(kbf kbfVar, int i) {
        this.a = i;
        this.b = kbfVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        Object value;
        paf pafVar;
        int i = this.a;
        c1e c1eVar = c1e.a;
        kbf kbfVar = this.b;
        switch (i) {
            case 0:
                oie oieVar = (oie) obj;
                if (oieVar instanceof mie) {
                    vx0.c0(f76.F(kbfVar), null, null, new dbf(kbfVar, null, 1), 3);
                } else if (!(oieVar instanceof nie)) {
                    ygf.a();
                } else {
                    vx0.c0(f76.F(kbfVar), null, null, new dbf(kbfVar, null, 2), 3);
                }
                break;
            default:
                lk9 lk9Var = (lk9) obj;
                xpc xpcVar = kbfVar.h;
                if (lk9Var instanceof hk9) {
                    if (!((hk9) lk9Var).b) {
                        xpcVar.l(paf.PUBLIC);
                    } else {
                        xpcVar.l(paf.UNLISTED);
                    }
                    break;
                } else if (lk9Var instanceof ik9) {
                    do {
                        value = xpcVar.getValue();
                        paf pafVar2 = (paf) value;
                        pafVar = paf.SUBMISSIONS;
                        if (pafVar2 != pafVar) {
                            pafVar = paf.PUBLIC;
                        }
                    } while (!xpcVar.k(value, pafVar));
                } else if (!(lk9Var instanceof kk9) && !(lk9Var instanceof jk9)) {
                    ygf.a();
                    break;
                }
                break;
        }
        return null;
    }
}
