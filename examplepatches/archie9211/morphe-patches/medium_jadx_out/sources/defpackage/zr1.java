package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zr1 extends jb6 {
    public static final n70 c = new n70(2);
    public final jb6 a;
    public final /* synthetic */ int b;

    public zr1(jb6 jb6Var, int i) {
        this.b = i;
        this.a = jb6Var;
    }

    @Override // defpackage.jb6
    public Object a(hd6 hd6Var) {
        Collection arrayList;
        switch (this.b) {
            case 0:
                arrayList = new ArrayList();
                break;
            default:
                arrayList = new LinkedHashSet();
                break;
        }
        hd6Var.f();
        while (hd6Var.hasNext()) {
            arrayList.add(this.a.a(hd6Var));
        }
        hd6Var.p();
        return arrayList;
    }

    @Override // defpackage.jb6
    public void e(zd6 zd6Var, Object obj) {
        zd6Var.f();
        Iterator it2 = ((Collection) obj).iterator();
        while (it2.hasNext()) {
            this.a.e(zd6Var, it2.next());
        }
        ((ud6) zd6Var).T(1, 2, ']');
    }

    public final String toString() {
        return this.a + ".collection()";
    }
}
