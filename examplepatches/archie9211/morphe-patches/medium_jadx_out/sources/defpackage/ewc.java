package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ewc extends fv7 {
    public final b38 b;
    public final y05 c;

    public ewc(b38 b38Var, y05 y05Var) {
        b38Var.getClass();
        y05Var.getClass();
        this.b = b38Var;
        this.c = y05Var;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Set c() {
        return ny3.a;
    }

    @Override // defpackage.fv7, defpackage.ev7
    public final Collection e(p83 p83Var, x45 x45Var) {
        p83Var.getClass();
        if (p83Var.a(p83.h)) {
            y05 y05Var = this.c;
            if (!y05Var.a.c() || !p83Var.a.contains(m83.a)) {
                b38 b38Var = this.b;
                Collection collectionK = b38Var.k(y05Var, x45Var);
                ArrayList arrayList = new ArrayList(collectionK.size());
                Iterator it2 = collectionK.iterator();
                while (it2.hasNext()) {
                    n98 n98VarG = ((y05) it2.next()).a.g();
                    if (((Boolean) x45Var.invoke(n98VarG)).booleanValue()) {
                        rv6 rv6Var = null;
                        if (!n98VarG.b) {
                            rv6 rv6VarX = b38Var.X(y05Var.a(n98VarG));
                            if (!((Boolean) mk7.z(rv6VarX.g, rv6.i[1])).booleanValue()) {
                                rv6Var = rv6VarX;
                            }
                        }
                        if (rv6Var != null) {
                            arrayList.add(rv6Var);
                        }
                    }
                }
                return arrayList;
            }
        }
        return ey3.a;
    }

    public final String toString() {
        return "subpackages of " + this.c + " from " + this.b;
    }
}
