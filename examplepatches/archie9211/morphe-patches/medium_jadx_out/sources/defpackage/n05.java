package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n05 {
    public final ArrayList a;
    public final ArrayList b;

    public n05(int i, String str, pm6 pm6Var) {
        str.getClass();
        pm6Var.getClass();
        this.a = new ArrayList(1);
        sz7.a.getClass();
        List listA = rz7.a();
        ArrayList arrayList = new ArrayList(cu1.k0(listA, 10));
        Iterator it2 = listA.iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            arrayList.add(new pg6());
        }
        this.b = arrayList;
    }

    public n05(int i) {
        switch (i) {
            case 1:
                this.a = new ArrayList(0);
                this.b = new ArrayList(0);
                break;
            default:
                this.a = new ArrayList();
                this.b = new ArrayList();
                break;
        }
    }
}
