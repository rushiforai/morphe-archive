package defpackage;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r98 implements p98 {
    public final n6a a;
    public final m6a b;

    public r98(n6a n6aVar, m6a m6aVar) {
        n6aVar.getClass();
        m6aVar.getClass();
        this.a = n6aVar;
        this.b = m6aVar;
    }

    @Override // defpackage.p98
    public final String a(int i) throws IOException {
        otd otdVarC = c(i);
        List list = (List) otdVarC.a;
        String strF0 = bu1.F0((List) otdVarC.b, ".", null, null, null, 62);
        if (list.isEmpty()) {
            return strF0;
        }
        return bu1.F0(list, "/", null, null, null, 62) + '/' + strF0;
    }

    @Override // defpackage.p98
    public final boolean b(int i) {
        return ((Boolean) c(i).c).booleanValue();
    }

    public final otd c(int i) {
        LinkedList linkedList = new LinkedList();
        LinkedList linkedList2 = new LinkedList();
        boolean z = false;
        while (i != -1) {
            l6a l6aVar = (l6a) this.b.b.get(i);
            String str = (String) this.a.b.get(l6aVar.d);
            k6a k6aVar = l6aVar.e;
            k6aVar.getClass();
            int i2 = q98.a[k6aVar.ordinal()];
            if (i2 == 1) {
                linkedList2.addFirst(str);
            } else if (i2 == 2) {
                linkedList.addFirst(str);
            } else {
                if (i2 != 3) {
                    ygf.a();
                    return null;
                }
                linkedList2.addFirst(str);
                z = true;
            }
            i = l6aVar.c;
        }
        return new otd(linkedList, linkedList2, Boolean.valueOf(z));
    }

    @Override // defpackage.p98
    public final String getString(int i) {
        String str = (String) this.a.b.get(i);
        str.getClass();
        return str;
    }
}
