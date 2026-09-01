package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uvd implements Iterable, th6 {
    public static final a1a b = new a1a(17);
    public static final uvd c = new uvd(ey3.a);
    public final x70 a;

    public uvd(List list) {
        this.a = vx3.a;
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            oy oyVar = (oy) it2.next();
            oyVar.getClass();
            String strD = n1b.a.b(oy.class).d();
            strD.getClass();
            int iR = b.r(strD);
            int iD = this.a.d();
            if (iD != 0) {
                if (iD == 1) {
                    x70 x70Var = this.a;
                    try {
                        x70Var.getClass();
                        tt8 tt8Var = (tt8) x70Var;
                        int i = tt8Var.b;
                        if (i == iR) {
                            this.a = new tt8(iR, oyVar);
                        } else {
                            a80 a80Var = new a80();
                            a80Var.a = new Object[20];
                            a80Var.b = 0;
                            a80Var.f(i, tt8Var.a);
                            this.a = a80Var;
                        }
                    } catch (ClassCastException e) {
                        throw new IllegalStateException(d(x70Var, 1, "OneElementArrayMap"), e);
                    }
                }
                this.a.f(iR, oyVar);
            } else {
                x70 x70Var2 = this.a;
                if (!(x70Var2 instanceof vx3)) {
                    ygf.f(d(x70Var2, 0, "EmptyArrayMap"));
                    throw null;
                }
                this.a = new tt8(iR, oyVar);
            }
        }
    }

    public static String d(x70 x70Var, int i, String str) {
        StringBuilder sb = new StringBuilder("Race condition happened, the size of ArrayMap is " + i + " but it isn't an `" + str + '`');
        sb.append('\n');
        StringBuilder sb2 = new StringBuilder("Type: ");
        sb2.append(x70Var.getClass());
        sb.append(sb2.toString());
        sb.append('\n');
        StringBuilder sb3 = new StringBuilder();
        ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) b.b;
        sb3.append("[\n");
        ArrayList arrayList = new ArrayList(cu1.k0(x70Var, 10));
        int i2 = 0;
        for (Object obj : x70Var) {
            int i3 = i2 + 1;
            Object obj2 = null;
            if (i2 < 0) {
                d46.i0();
                throw null;
            }
            Iterator it2 = concurrentHashMap.entrySet().iterator();
            while (true) {
                if (it2.hasNext()) {
                    Object next = it2.next();
                    if (((Number) ((Map.Entry) next).getValue()).intValue() == i2) {
                        obj2 = next;
                        break;
                    }
                }
            }
            sb3.append("  " + ((Map.Entry) obj2) + '[' + i2 + "]: " + obj);
            sb3.append('\n');
            arrayList.add(sb3);
            i2 = i3;
        }
        sb3.append("]");
        sb3.append('\n');
        sb.append("Content: ".concat(sb3.toString()));
        sb.append('\n');
        return sb.toString();
    }

    public final boolean isEmpty() {
        return this.a.d() == 0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.a.iterator();
    }
}
