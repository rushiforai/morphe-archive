package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j22 implements zx8 {
    public final List a;
    public final String b;

    public j22(List list, String str) {
        this.a = list;
        this.b = str;
        list.size();
        bu1.q1(list).size();
    }

    @Override // defpackage.zx8
    public final boolean a(y05 y05Var) {
        y05Var.getClass();
        List list = this.a;
        if (list.isEmpty()) {
            return true;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            if (!hk7.y((zx8) it2.next(), y05Var)) {
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.zx8
    public final void b(y05 y05Var, ArrayList arrayList) {
        y05Var.getClass();
        for (zx8 zx8Var : this.a) {
            zx8Var.getClass();
            y05Var.getClass();
            zx8Var.b(y05Var, arrayList);
        }
    }

    @Override // defpackage.zx8
    public final Collection k(y05 y05Var, x45 x45Var) {
        y05Var.getClass();
        HashSet hashSet = new HashSet();
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            hashSet.addAll(((zx8) it2.next()).k(y05Var, x45Var));
        }
        return hashSet;
    }

    public final String toString() {
        return this.b;
    }
}
