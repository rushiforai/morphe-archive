package defpackage;

import java.lang.reflect.Type;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z04 implements ac6 {
    @Override // defpackage.ac6
    public final Object a(dc6 dc6Var, Type type, qlb qlbVar) {
        dc6Var.getClass();
        type.getClass();
        qlbVar.getClass();
        Object obj = null;
        if (!(dc6Var instanceof zc6)) {
            dc6Var = null;
        }
        if (dc6Var == null) {
            return null;
        }
        int iD = ((zc6) dc6Var).d();
        a14.Companion.getClass();
        Iterator<E> it2 = a14.getEntries().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            if (((a14) next).getValue() == iD) {
                obj = next;
                break;
            }
        }
        return (a14) obj;
    }
}
