package defpackage;

import androidx.work.impl.yX.VrhD;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class ge6 implements m45 {
    public final /* synthetic */ int a;
    public final c38 b;

    public /* synthetic */ ge6(c38 c38Var, int i) {
        this.a = i;
        this.b = c38Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c38 c38Var = this.b;
        switch (i) {
            case 0:
                return new ie6(c38Var);
            case 1:
                a38 a38Var = c38Var.h;
                if (a38Var == null) {
                    String str = c38Var.getName().a;
                    str.getClass();
                    rd6.h(VrhD.POWupyDFOaTU, str, " were not set before querying module content");
                    return null;
                }
                List list = a38Var.a;
                c38Var.x0();
                list.contains(c38Var);
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    ((c38) it2.next()).getClass();
                }
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                Iterator it3 = list.iterator();
                while (it3.hasNext()) {
                    zx8 zx8Var = ((c38) it3.next()).i;
                    zx8Var.getClass();
                    arrayList.add(zx8Var);
                }
                return new j22(arrayList, "CompositeProvider@ModuleDescriptor for " + c38Var.getName());
            default:
                return c38Var.X(mnc.i).h;
        }
    }
}
