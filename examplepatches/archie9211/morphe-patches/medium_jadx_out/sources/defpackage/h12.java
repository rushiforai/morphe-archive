package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h12 extends RuntimeException {
    public final x68 a;
    public final x68 b;
    public final j68 c;
    public final int d;

    public h12(x68 x68Var, x68 x68Var2, j68 j68Var, int i, Exception exc) {
        super(exc);
        this.a = x68Var;
        this.b = x68Var2;
        this.c = j68Var;
        this.d = i;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        List listQ;
        StringBuilder sb = new StringBuilder("\n            |Failed to execute op number ");
        sb.append(this.d);
        sb.append(":\n            |");
        nzb nzbVarF = vn7.F(new g12(this, null));
        if (nzbVarF.hasNext()) {
            Object next = nzbVarF.next();
            if (nzbVarF.hasNext()) {
                ArrayList arrayList = new ArrayList();
                arrayList.add(next);
                while (nzbVarF.hasNext()) {
                    arrayList.add(nzbVarF.next());
                }
                listQ = arrayList;
            } else {
                listQ = d46.Q(next);
            }
        } else {
            listQ = ey3.a;
        }
        sb.append(bu1.F0(bu1.h1(50, listQ), "\n", null, null, null, 62));
        sb.append("\n            ");
        return nuc.C(sb.toString());
    }
}
