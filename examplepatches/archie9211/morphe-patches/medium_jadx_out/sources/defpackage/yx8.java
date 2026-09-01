package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yx8 implements zx8 {
    public final ArrayList a;

    public yx8(ArrayList arrayList) {
        this.a = arrayList;
    }

    @Override // defpackage.zx8
    public final boolean a(y05 y05Var) {
        y05Var.getClass();
        ArrayList arrayList = this.a;
        if (arrayList.isEmpty()) {
            return true;
        }
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            if (g76.L(((xx8) ((wx8) it2.next())).f, y05Var)) {
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.zx8
    public final void b(y05 y05Var, ArrayList arrayList) {
        y05Var.getClass();
        for (Object obj : this.a) {
            if (g76.L(((xx8) ((wx8) obj)).f, y05Var)) {
                arrayList.add(obj);
            }
        }
    }

    @Override // defpackage.zx8
    public final Collection k(y05 y05Var, x45 x45Var) {
        y05Var.getClass();
        return szb.O0(new zh4(new srd(new j80(1, this.a), h06.B), true, new c22(y05Var, 1)));
    }
}
