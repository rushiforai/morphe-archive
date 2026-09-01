package defpackage;

import android.os.Bundle;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class sc8 {
    public ga8 a;
    public boolean b;

    public abstract va8 a();

    public final ga8 b() {
        ga8 ga8Var = this.a;
        if (ga8Var != null) {
            return ga8Var;
        }
        ygf.f("You cannot access the Navigator's state until the Navigator is attached");
        return null;
    }

    public void d(List list, ob8 ob8Var, w6 w6Var) {
        yh4 yh4Var = new yh4(new zh4(new srd(new j80(1, list), new o8(this, ob8Var, w6Var, 27)), false, new dsb(7)));
        while (yh4Var.hasNext()) {
            b().h((ba8) yh4Var.next());
        }
    }

    public void e(ga8 ga8Var) {
        this.a = ga8Var;
        this.b = true;
    }

    public void f(ba8 ba8Var) {
        va8 va8Var = ba8Var.b;
        if (va8Var == null) {
            va8Var = null;
        }
        if (va8Var == null) {
            return;
        }
        nb8 nb8Var = new nb8();
        nb8Var.a = true;
        nb8Var.b = false;
        nb8Var.c = -1;
        nb8Var.d = false;
        nb8Var.e = false;
        c(va8Var, null, nb8Var.a(), null);
        b().d(ba8Var);
    }

    public Bundle h() {
        return null;
    }

    public void i(ba8 ba8Var, boolean z) {
        List list = (List) b().e.a.getValue();
        if (!list.contains(ba8Var)) {
            mm.g("popBackStack was called with ", ba8Var, " which does not exist in back stack ", list);
            return;
        }
        ListIterator listIterator = list.listIterator(list.size());
        ba8 ba8Var2 = null;
        while (j()) {
            ba8Var2 = (ba8) listIterator.previous();
            if (g76.L(ba8Var2, ba8Var)) {
                break;
            }
        }
        if (ba8Var2 != null) {
            b().e(ba8Var2, z);
        }
    }

    public boolean j() {
        return true;
    }

    public void g(Bundle bundle) {
    }

    public va8 c(va8 va8Var, Bundle bundle, ob8 ob8Var, w6 w6Var) {
        return va8Var;
    }
}
