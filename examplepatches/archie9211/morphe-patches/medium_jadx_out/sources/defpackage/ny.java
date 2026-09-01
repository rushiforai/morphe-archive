package defpackage;

import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ny implements ly {
    public final /* synthetic */ int a;
    public final Object b;

    public ny(ly[] lyVarArr) {
        this.a = 1;
        this.b = k80.Q0(lyVarArr);
    }

    @Override // defpackage.ly
    public final boolean g(y05 y05Var) {
        switch (this.a) {
            case 1:
                y05Var.getClass();
                Iterator it2 = ((List) this.b).iterator();
                while (it2.hasNext()) {
                    if (((ly) it2.next()).g(y05Var)) {
                        break;
                    }
                }
                break;
        }
        return rv8.D(this, y05Var);
    }

    @Override // defpackage.ly
    public final yx i(y05 y05Var) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return rv8.z(this, y05Var);
            case 1:
                y05Var.getClass();
                return (yx) szb.H0(szb.N0(new j80(1, (List) obj), new c22(y05Var, 0)));
            default:
                y05Var.getClass();
                if (y05Var.equals((y05) obj)) {
                    return ez3.a;
                }
                return null;
        }
    }

    @Override // defpackage.ly
    public final boolean isEmpty() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((List) obj).isEmpty();
            case 1:
                List list = (List) obj;
                if (!list.isEmpty()) {
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        if (!((ly) it2.next()).isEmpty()) {
                            return false;
                        }
                    }
                }
                return true;
            default:
                return false;
        }
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((List) obj).iterator();
            case 1:
                return new yh4(new ym4(new j80(1, (List) obj), xx.t, uzb.a));
            default:
                return dy3.a;
        }
    }

    public String toString() {
        switch (this.a) {
            case 0:
                return ((List) this.b).toString();
            default:
                return super.toString();
        }
    }

    public /* synthetic */ ny(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
